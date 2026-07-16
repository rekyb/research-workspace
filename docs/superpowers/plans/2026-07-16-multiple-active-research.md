# Multiple Concurrent Active Research — Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Let the workspace track several active research studies at once, with each terminal defaulting to its own current study, while a single active study behaves exactly as today.

**Architecture:** A two-layer model. Layer 1 is a committed **registry** (`.claude/.active-research`, now one study path per line). Layer 2 is a gitignored **per-terminal binding** (`.claude/.current-research/<session-id>`). A single **canonical resolution rule** (`.claude/references/active-research.md`) is referenced by every command instead of being re-inlined.

**Tech Stack:** Markdown command/skill definitions followed by Claude. No code, no test runner — each task is verified by reading the edited file back and grepping for the required/forbidden phrasing. "Both copies" always means `.agents/skills/<name>/SKILL.md` **and** `.claude/commands/<name>.md`.

## Global Constraints

- Registry `.claude/.active-research`: one folder path per line, no trailing slash; empty file = none; committed to git.
- Per-terminal binding dir `.claude/.current-research/`: gitignored, one file per session id, contents = one registry path.
- Session id = the UUID directory segment of the session scratchpad path (`…\<project>\<SESSION-UUID>\scratchpad`).
- Resolution priority (verbatim everywhere): (1) explicit `[folder]` arg; (2) this terminal's binding if still in registry; (3) sole registry entry (and adopt it); (4) else stop and ask. `new-research` treats zero active as normal.
- Every command edit must be applied to **both copies** in lockstep.
- Do not commit `.claude/.current-research/` contents.
- Preserve existing behavior for the single-active case.

---

### Task 1: Canonical resolution rule + gitignore

**Files:**
- Create: `.claude/references/active-research.md`
- Modify: `.gitignore`

- [ ] **Step 1: Write the canonical rule reference.** Create `.claude/references/active-research.md` documenting: the two-layer model (registry + per-terminal binding), how to derive the session id from the scratchpad path, the 4-step resolution rule verbatim, the stale-binding definition (a binding whose path is not in the registry is ignored and pruned), and how `new-research`/`close-research`/`focus-research` mutate each layer.

- [ ] **Step 2: Gitignore the binding dir.** Append to `.gitignore` under a new comment block:

```
# Per-terminal active-research binding (machine-local, ephemeral)
.claude/.current-research/
```

- [ ] **Step 3: Verify.** `grep -n "current-research" .gitignore` shows the line; read `.claude/references/active-research.md` back and confirm all four resolution steps are present and in order.

- [ ] **Step 4: Commit.** `git add .claude/references/active-research.md .gitignore` then commit `feat: add canonical active-research resolution rule + gitignore binding dir`.

---

### Task 2: `focus-research` command (new)

**Files:**
- Create: `.agents/skills/focus-research/SKILL.md`
- Create: `.claude/commands/focus-research.md`

**Interfaces:**
- Consumes: the registry format and resolution rule from Task 1.
- Produces: writes `.claude/.current-research/<session-id>` = `<folder>`.

- [ ] **Step 1: Write the SKILL.** Create `.agents/skills/focus-research/SKILL.md` with frontmatter (name, description "Point this terminal at one of the active research studies") and steps: (1) read `<folder>` arg; (2) confirm it is a line in `.claude/.active-research`, else STOP and tell the user to `new-research` or check `research-board`; (3) derive the session id from the scratchpad path; (4) write `.claude/.current-research/<session-id>` = `<folder>` (create the dir if absent); (5) report which study this terminal now targets and list the other active studies.

- [ ] **Step 2: Write the command mirror.** Create `.claude/commands/focus-research.md` matching the existing `.claude/commands/*.md` house format, same steps, referencing `.claude/references/active-research.md` for the rule.

- [ ] **Step 3: Verify.** Both files exist; each references `.claude/references/active-research.md`; both validate the folder against the registry.

- [ ] **Step 4: Commit.** `feat: add focus-research command to bind a terminal to an active study`.

---

### Task 3: `new-research` supports multiple active

**Files:**
- Modify: `.agents/skills/new-research/SKILL.md` (step 1 guard; step 6 pointer write)
- Modify: `.claude/commands/new-research.md` (same)

- [ ] **Step 1: Remove the single-active block.** In both copies, change step 1 from "if an active study exists, STOP" to: read the registry; multiple active is allowed; only warn (do not stop) if the same topic slug already exists.

- [ ] **Step 2: Append + bind.** In both copies, change step 6 from "write the folder path into `.claude/.active-research`" to: **append** the new folder path as a new line in `.claude/.active-research` (do not overwrite existing lines), then write this terminal's binding `.claude/.current-research/<session-id>` = the new folder. Keep the existing `BOARD.md` refresh.

- [ ] **Step 3: Verify.** `grep -n "append\|STOP" .agents/skills/new-research/SKILL.md` shows the block removed and append language present; both copies match.

- [ ] **Step 4: Commit.** `feat(new-research): append to registry and bind terminal instead of blocking`.

---

### Task 4: `close-research` removes one registry line

**Files:**
- Modify: `.agents/skills/close-research/SKILL.md` (steps 1, 4, 5)
- Modify: `.claude/commands/close-research.md` (same)

- [ ] **Step 1: Resolve target via the rule.** In both copies, step 1: resolve which study to close per `.claude/references/active-research.md` (was: read the single pointer).

- [ ] **Step 2: Remove the line, not the file.** In both copies, step 4: change "empty `.claude/.active-research`" to "**remove the closed study's line** from `.claude/.active-research`, leaving other active studies intact," then delete this terminal's binding if it points at the closed study and prune any binding files now pointing outside the registry.

- [ ] **Step 3: Verify.** `grep -n "remove the closed study's line\|Empty" .agents/skills/close-research/SKILL.md` confirms the empty-file instruction is gone; both copies match.

- [ ] **Step 4: Commit.** `feat(close-research): remove one registry line and prune bindings`.

---

### Task 5: `research-board` renders all active studies

**Files:**
- Modify: `.agents/skills/research-board/SKILL.md` (steps 1–2)
- Modify: `.claude/commands/research-board.md` (same)

- [ ] **Step 1: Multi-row Active.** In both copies, step 1: read every line of `.claude/.active-research`; each is an Active row (was: single Active row). If the file is empty, the Active section says none.

- [ ] **Step 2: Housekeeping + annotation.** In both copies: optionally annotate this terminal's current focus (from its binding), and prune stale binding files (paths not in the registry) as a housekeeping step.

- [ ] **Step 3: Verify.** `grep -n "every line\|each is an Active row\|multi" .agents/skills/research-board/SKILL.md`; both copies match.

- [ ] **Step 4: Commit.** `feat(research-board): render the full active registry as multiple rows`.

---

### Task 6: Reader spine commands use the resolution rule

**Files (both copies each):**
- Modify: `.agents/skills/synth-findings/SKILL.md` + `.claude/commands/synth-findings.md`
- Modify: `.agents/skills/review-research/SKILL.md` + `.claude/commands/review-research.md`
- Modify: `.agents/skills/publish-research/SKILL.md` + `.claude/commands/publish-research.md`
- Modify: `.agents/skills/plan-usability/SKILL.md` + `.claude/commands/plan-usability.md`

- [ ] **Step 1: Swap the locate step.** In each file, replace "Read `.claude/.active-research` [for the folder path]" with "Resolve the target study per `.claude/references/active-research.md`." Keep each command's downstream checks (e.g. synth's `Type` read, review's `SYNTHESIS.md` existence, plan-usability's `Type: usability` check, publish's PII gate) unchanged.

- [ ] **Step 2: Verify.** `grep -rn "\.claude/\.active-research" .agents/skills/{synth-findings,review-research,publish-research,plan-usability} .claude/commands/{synth-findings,review-research,publish-research,plan-usability}.md` returns nothing (all now go through the rule).

- [ ] **Step 3: Commit.** `feat(spine): route reader commands through the shared resolution rule`.

---

### Task 7: `[folder]`-default commands use the resolution rule

**Files (both copies each):** `draft-spec`, `design-prototype`, `brief-feature`, `heuristic-eval`, `a11y-audit`, `extract-tokens`.

- [ ] **Step 1: Update the default.** In each file, where it says the target defaults to the active research when `[folder]` is omitted, change that default to "resolve per `.claude/references/active-research.md`." Preserve the lens commands' ability to target a **closed** study via an explicit `[folder]`.

- [ ] **Step 2: Verify.** `grep -rn "\.claude/\.active-research" .agents/skills/{draft-spec,design-prototype,brief-feature,heuristic-eval,a11y-audit,extract-tokens} .claude/commands/{draft-spec,design-prototype,brief-feature,heuristic-eval,a11y-audit,extract-tokens}.md` returns nothing.

- [ ] **Step 3: Commit.** `feat(lenses+design): route [folder]-default commands through the resolution rule`.

---

### Task 8: Top-level docs

**Files:** `CLAUDE.md` (lines ~80, ~175, workflow-commands table), `README.md`, `GEMINI.md`, `ROADMAP.md`.

- [ ] **Step 1: CLAUDE.md.** Rewrite the "currently active research is tracked in `.claude/.active-research`" paragraph (~L80) to describe the two-layer model and point to `.claude/references/active-research.md`. Change "Only one research is active at a time…" (~L175) to say multiple studies can be active, each terminal has a current one, and `close-research` removes one from the registry. Add a `focus-research` row to the workflow-commands table.

- [ ] **Step 2: README.md + GEMINI.md.** Mirror the same edits wherever they restate the active-pointer model or list the workflow commands.

- [ ] **Step 3: ROADMAP.md.** If it references single-active as a limitation, update or note that multi-active shipped.

- [ ] **Step 4: Verify.** `grep -rn "Only one research is active\|single active" CLAUDE.md README.md GEMINI.md` returns nothing stale; `grep -n "focus-research" CLAUDE.md` shows the new row.

- [ ] **Step 5: Commit.** `docs: describe two-layer active-research model and focus-research`.

---

### Task 9: Reconcile live state

**Files:** `.claude/.active-research`, `BOARD.md`.

- [ ] **Step 1: Fix the registry.** Set `.claude/.active-research` to the true active set — both currently-open studies, one per line:

```
research/2026-07-14-ai-literacy-upskilling-indonesian-teachers
research/2026-07-16-indonesian-teacher-onboarding-literature
```

- [ ] **Step 2: Bind this terminal.** Write `.claude/.current-research/<this-session-id>` to whichever study is being worked here (default: the AI-literacy study, matching the prior pointer).

- [ ] **Step 3: Regenerate the board.** Re-derive `BOARD.md`'s Active table from the registry so both studies appear as Active rows, and refresh `_Last updated:_`.

- [ ] **Step 4: Verify.** `.claude/.active-research` has two lines; `BOARD.md` Active section lists both; the binding file exists and is gitignored (`git status` does not show `.claude/.current-research/`).

- [ ] **Step 5: Commit.** `chore: reconcile active-research registry and board to the true active set`.

---

## Self-Review

- **Spec coverage:** Layer 1 registry → Tasks 1/3/4/5/9. Layer 2 binding → Tasks 1/2/9. Session-id derivation → Task 1 (defined), used in 2/3/9. Resolution rule → Task 1 (canonical), consumed in 3–7. `focus-research` → Task 2. Command changes → Tasks 3–7 (all 14 commands, both copies). `.gitignore` → Task 1. Docs → Task 8. Board/pointer reconciliation → Task 9. No spec section unmapped.
- **Placeholder scan:** No TBD/TODO; each task names exact files and a concrete verify grep.
- **Consistency:** "registry" = `.claude/.active-research`; "binding" = `.claude/.current-research/<session-id>`; "resolution rule" = `.claude/references/active-research.md` — used identically across all tasks. "Both copies" defined once in the header and reused.
