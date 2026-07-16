# Design: Multiple Concurrent Active Research

- **Date:** 2026-07-16
- **Status:** Draft, pending review
- **Author:** Claude (acting Senior UI/UX Designer), with the workspace owner
- **Problem owner:** workspace owner runs several research studies in parallel across
  multiple terminals and needs each to have its own active target.

## Problem

The workspace tracks the active study with a **single-line pointer**,
`.claude/.active-research`. Every spine command reads it to decide which study to act
on, `new-research` writes it (and blocks if a non-closed study already exists), and
`close-research` empties it.

This breaks the moment two terminals work two studies: whoever writes the pointer last
wins, and the other terminal silently acts on the wrong folder. The symptom is already
visible: `BOARD.md` lists two studies under **Active**, but the pointer names only one,
so the board and the pointer disagree.

The owner wants parallel research to be a **first-class, formalized** capability, not a
convention the agent has to remember.

## Goals

- Support **N concurrently active** studies.
- Each terminal has its own **current** study; commands default to it with no extra typing.
- Any command can still be aimed at a specific study explicitly.
- Backward compatible: a single active study behaves exactly as today.
- Durable per-terminal state that survives context compaction and `/clear`.
- Keep the board honest (Active reflects the true active set).

## Non-goals

- No locking / true concurrency control. These commands are LLM-followed and low-
  concurrency; additive registry edits are sufficient.
- No cross-machine sync of per-terminal focus (it is intentionally machine-local).

---

## Design: a two-layer active model

### Layer 1 — the registry (shared, committed)

`.claude/.active-research` changes from a single path to a **list of active study folder
paths, one per line**, no trailing slash. This is the source of truth for "what is open."

- One line = exactly today's behavior (backward compatible).
- Zero lines / empty file = no active research.
- Committed to git, as today.
- The board derives its **Active** table from this list.

Example:

```
research/2026-07-14-ai-literacy-upskilling-indonesian-teachers
research/2026-07-16-indonesian-teacher-onboarding-literature
```

### Layer 2 — the per-terminal current (local, not committed)

A new **gitignored** directory `.claude/.current-research/` holds one small file per
terminal:

- **Filename:** the terminal's Claude **session id**.
- **Contents:** one active study folder path (must be a line in the registry).

Example:

```
.claude/.current-research/85f4645a-a28d-449f-a4fd-a51e3bcee974
  → research/2026-07-14-ai-literacy-upskilling-indonesian-teachers
```

#### Deriving the session id

Every session is given a scratchpad path of the form:

```
…\<temp>\claude\<project-slug>\<SESSION-UUID>\scratchpad
```

The `<SESSION-UUID>` segment is the session id. A command derives it by reading its own
scratchpad path and taking the UUID directory name. No user input required; stable across
`/clear` within a terminal.

---

## The shared resolution rule (canonical)

Defined **once** and referenced by every command that needs a target study, to prevent
drift across files. To resolve "which study," in priority order:

1. **Explicit `[folder]` argument** → use it.
   - Spine commands: if the folder is not in the registry, warn (it may be closed).
   - Retrospective lens commands (`heuristic-eval`, `a11y-audit`, `extract-tokens`) may
     legitimately target a **closed** study, so a non-registry folder is allowed there.
2. **This terminal's binding** — read `.claude/.current-research/<session-id>`. If present
   and its path is still in the registry → use it.
3. **Exactly one active study** in the registry → use it, and **write** the binding file
   (adopt it for this terminal).
4. **Otherwise** (zero or several active, no argument, no binding) → **STOP**, print the
   active set, and ask which study to act on.
   - Exception: `new-research` treats zero active as normal and just proceeds.

**Stale binding:** a binding file whose path is not in the registry (study closed/removed)
is ignored by rule 2 and pruned opportunistically (see `close-research`, `research-board`).

---

## Command changes

### New command: `focus-research <folder>`

The explicit per-terminal re-bind for the hybrid model.

- Validate `<folder>` is a line in the registry (if not, tell the user to `new-research`
  or check the board).
- Write `.claude/.current-research/<session-id>` = `<folder>`.
- Report which study this terminal is now focused on.
- Ships as both `.agents/skills/focus-research/SKILL.md` and
  `.claude/commands/focus-research.md`, mirroring the existing dual definitions.

### Changed: `new-research`

- **Remove** the "block if an active study exists" guard (step 1). Multiple active is now
  allowed.
- After scaffolding, **append** the new folder path to the registry (do not overwrite).
- **Write** the per-terminal binding to the new study.
- Refresh `BOARD.md` (unchanged mechanism, now multi-row Active).

### Changed: `close-research`

- Resolve the target study via the resolution rule (not "read the single pointer").
- **Remove that study's line** from the registry (instead of emptying the whole file).
- **Delete** this terminal's binding if it points at the closed study, and prune any other
  binding files that now point outside the registry.
- Refresh `BOARD.md`.

### Changed: `research-board`

- **Active** section becomes a **multi-row table** — one row per registry line.
- Optionally annotate which study this terminal is currently focused on.
- Prune stale binding files (paths no longer in the registry) as a housekeeping step.

### Changed: reader commands

Replace each command's "read `.claude/.active-research`" step with "resolve the target
study per the shared resolution rule":

- `synth-findings`, `review-research`, `publish-research`
- `draft-spec`, `design-prototype`, `brief-feature` (already accept `[folder]`; just
  update the *default* to the resolution rule)
- `heuristic-eval`, `a11y-audit`, `extract-tokens` (already accept `[folder]`; same)

Each command exists in two copies (`.agents/skills/*/SKILL.md` and
`.claude/commands/*.md`); both must be edited in lockstep.

---

## Supporting changes

- **`.gitignore`** — add `.claude/.current-research/` (per-terminal, ephemeral, machine-
  local). Keep `.claude/.active-research` committed.
- **`CLAUDE.md`** — rewrite the "currently active research is tracked in
  `.claude/.active-research`" paragraph to describe the two-layer model and the resolution
  rule; add `focus-research` to the workflow-commands table; note multiple-active is
  supported (update "Only one research is active at a time. Run `close-research` before…").
- **`README.md`, `GEMINI.md`** — mirror the CLAUDE.md changes where they restate the
  pointer/active-research model.
- **Canonical rule location** — write the resolution rule into a single reference
  (`.claude/references/active-research.md`) and have each command point to it, rather than
  re-inlining the four steps in 20+ files.

---

## Walkthrough (two terminals)

1. Terminal A: `new-research "X"` → registry gains `X`; `.current-research/<A-id>` = X.
2. Terminal B: `focus-research <onboarding-lit>` → `.current-research/<B-id>` = onboarding.
3. Terminal A: `synth-findings` (no arg) → rule 2 reads A's binding → synthesizes X.
4. Terminal B: `synth-findings` (no arg) → rule 2 reads B's binding → synthesizes onboarding.
5. Terminal A: `close-research` → removes X from registry, deletes A's binding.
6. If B were bound to X, B's next command sees a stale binding, reports X closed, and
   falls back to rule 3/4.

## Edge cases

| Case | Behavior |
|---|---|
| Single active study | Rules 2/3 make it transparent — identical to today. |
| Terminal with no binding, several active | Rule 4 asks which study. |
| Explicit `[folder]` on a closed study (lens command) | Allowed; lenses run on closed studies. |
| Explicit `[folder]` on a closed study (spine command) | Warn; likely user error. |
| Two terminals `new-research` near-simultaneously | Both append; additive, no data loss. |
| Stale binding (study closed elsewhere) | Ignored by rule 2; pruned by board/close. |
| `/clear` in a terminal | Session id persists → binding still resolves. |

## Risks & mitigations

- **Session id not derivable** in some harness variant → resolution degrades gracefully to
  rules 3/4 (adopt-sole or ask); never targets the wrong study silently.
- **Drift across the 20+ command files** → mitigated by the single canonical rule reference.
- **Registry hand-edited to a bad path** → commands validate paths against real folders and
  warn; board prunes.

## Rollout

1. Add the canonical rule reference + `.gitignore` line.
2. Migrate the registry format (the current single line is already valid).
3. Add `focus-research`; update `new-research`, `close-research`, `research-board`.
4. Update reader commands (both copies each).
5. Update `CLAUDE.md` / `README.md` / `GEMINI.md`.
6. Reconcile the current board/pointer disagreement as the first live use.
