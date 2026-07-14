# /design-prototype Workflow Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add a new `/design-prototype` design-output step (command + mirrored skill) that turns a research study's synthesis/spec into a research-grounded HTML prototype published as a claude.ai Artifact, generated and audited against the Claude Design Prompt Pack's gates.

**Architecture:** Five documentation-style deliverables, no runtime code. (1) The prompt pack is extracted once from gitignored `raw-data/` to a committed reference. (2) A slash command and (3) a mirrored skill implement the workflow per the workspace's dual-registration convention. (4) A new Principal Designer "Mode T" reviews prototypes. (5) `CLAUDE.md` is wired to document the new step. Each file follows the exact conventions of its existing siblings (`draft-spec.md`, `draft-spec/SKILL.md`, `principal-designer.md`).

**Tech Stack:** Markdown only. Command frontmatter = `description` + `argument-hint`; skill frontmatter = `name` + `description`. The workflow, at runtime, uses the built-in `Artifact` tool for publishing and the `Agent` tool for dispatching the Principal Designer.

## Global Constraints

- **Dual-registration parity:** every spine step has BOTH a `.claude/commands/X.md` (frontmatter `description` + `argument-hint`; body uses `$ARGUMENTS`; command refs slashed like `/draft-spec`) AND a `.agents/skills/X/SKILL.md` (frontmatter `name` + `description` only; body uses the word "arguments"; command refs de-slashed like `draft-spec`; prose unwrapped, not hard-wrapped).
- **Non-fabrication:** the command must instruct: no invented screens, data, flows, or sources; every screen traces to a SPEC FR or synthesis finding; extrapolation is flagged as a stated assumption.
- **Confidentiality firewall:** committed files carry NO internal specifics (product / program / funder / real names). The extracted reference must be verified product-agnostic before commit.
- **Output is HTML Artifact only** — no `--format` flag; no Figma / code / design-sync output.
- **Precondition is a soft gate:** prefer `SPEC.md`, warn + offer `/draft-spec` if absent, proceed from a reviewed synthesis on override.
- **Open-question resolutions (verbatim):** default fidelity `hi` with a lo-fi nudge when no `SPEC.md`; token-source precedence `lenses/tokens.md` > tokens named in `SPEC.md` > minimal derived set; include a lightweight optional `--scope <moment>` arg.
- **Commit identity:** `git -c user.name="Claude Code" -c user.email="rekybongso@gmail.com"`. End every commit body with `Co-Authored-By: Claude Opus 4.8 (1M context) <noreply@anthropic.com>`.
- **Branch:** work stays on `feature/ux-research-expansion` (already checked out; not `main`).

---

### Task 1: Extract the prompt pack to a committed reference

**Files:**
- Create: `.claude/references/design-gates.md`
- Source (read-only, gitignored): `raw-data/onboarding-flow/claude-design-prompt-pack.md`

**Interfaces:**
- Produces: the committed file `.claude/references/design-gates.md` that Tasks 2 and 3 reference by path as the source of gate definitions (categories 0–13, the Definition of Done G1–G8).

- [ ] **Step 1: Copy the pack to the committed reference path**

The pack is pure methodology (no internal specifics), so it is copied verbatim. Prepend a one-line provenance header so the committed file explains itself.

```bash
mkdir -p .claude/references
{
  echo "<!-- Extracted verbatim from the Claude Design Prompt Pack for use by /design-prototype. Product-agnostic methodology; safe to commit. -->"
  echo
  cat raw-data/onboarding-flow/claude-design-prompt-pack.md
} > .claude/references/design-gates.md
```

- [ ] **Step 2: Verify it is product-agnostic (confidentiality gate)**

Run: `grep -niE 'edbot|solve education|digital heroes|lenovo|boeing|speechmakers|saljana|alliance|nadiana|raisa|aprita|shahfiq|velia|cindy|tfc' .claude/references/design-gates.md`
Expected: NO output (exit code 1). Any hit means the pack somehow carries an internal name — STOP, redact it, and re-check before committing.

- [ ] **Step 3: Verify structural completeness**

Run: `grep -cE '^## [0-9]+\.' .claude/references/design-gates.md`
Expected: `14` (categories 0 through 13).

Run: `grep -c 'G[1-8]' .claude/references/design-gates.md`
Expected: a non-zero count (the Definition of Done gates G1–G8 are present).

- [ ] **Step 4: Commit**

```bash
git add .claude/references/design-gates.md
git -c user.name="Claude Code" -c user.email="rekybongso@gmail.com" commit -m "$(cat <<'EOF'
feat: extract design prompt pack to committed reference

Committed, product-agnostic copy of the Claude Design Prompt Pack so
/design-prototype can cite gate definitions without depending on
gitignored raw-data/.

Co-Authored-By: Claude Opus 4.8 (1M context) <noreply@anthropic.com>
EOF
)"
```

---

### Task 2: Create the `/design-prototype` command

**Files:**
- Create: `.claude/commands/design-prototype.md`

**Interfaces:**
- Consumes: `.claude/references/design-gates.md` (Task 1) — cited as the gate source.
- Produces: the command definition. Task 3 mirrors this content into a skill; Task 5 references the command name `/design-prototype` in `CLAUDE.md`.

- [ ] **Step 1: Write the command file**

Create `.claude/commands/design-prototype.md` with exactly this content:

````markdown
---
description: Turn a reviewed synthesis (ideally via its SPEC.md) into a clickable, self-contained HTML prototype published as a claude.ai Artifact, generated and audited against the design gates. Gated by the Principal Designer (Mode T).
argument-hint: [optional study folder] [--fidelity lo|hi] [--gate name,…] [--scope moment]
---

Produce the **clickable prototype** for a synthesized research study: a single
self-contained HTML page/flow, published as a **claude.ai Artifact**, that realizes
*what we learned* as *something you can click through*. This is the third design-output
step — where `/brief-feature` makes the stakeholder *narrative* ("should we build
this") and `/draft-spec` makes the maker's *definition* ("here is what to build"),
`/design-prototype` makes the *artifact* ("here is what it looks and feels like"), for
a stakeholder to react to or a designer to build from.

It is an **optional, additive** step (like the benchmark lenses and `/draft-spec`), run
only when the user asks — not part of the required spine. The prototype is published to
the user's Artifacts gallery at `claude.ai/code/artifacts`: default-private, shareable
when they choose, and updated in place at the same URL on later passes.

This is a synthesis-to-deliverable step, not a capture step. **Every screen must trace
back to a SPEC requirement or a synthesis finding and its evidence — do not invent
screens, flows, data, or sources** (same non-fabrication guardrail as the rest of the
workspace). Where the prototype must extrapolate beyond what the research supports, say
so explicitly as a flagged **assumption**, exactly as the lenses flag inference.

The gate definitions this command runs live in `.claude/references/design-gates.md`
(the Claude Design Prompt Pack): 14 categories (0–13) and the Definition of Done
(G1–G8). Read it when running a gate.

## Arguments

- **Study folder** (optional positional) — defaults to the active research.
- **`--fidelity lo|hi`** (default `hi`) — `hi` = full tokens, colour, type, motion,
  and the complete core spine incl. the DoD audit. `lo` = grayscale wireframe,
  structure only, reduced gate set (skips colour/motion/delight/pixel-polish).
- **`--gate <name,…>`** (a.k.a. `--deepen`) — run one or more named gate passes against
  the *existing* artifact and redeploy the same URL, instead of a full default run.
- **`--scope <moment>`** (optional) — prototype only one slice of the flow (e.g.
  `landing`) rather than the full arc. Defaults to the full arc.

## Fidelity

| | lo-fi | hi-fi (default) |
|---|---|---|
| Look | Grayscale wireframe, structure only | Full tokens, colour, type, motion |
| Goal | Cheap structural exploration | Pixel-perfect, shareable |
| Auto-runs | context-lock → screens → states → copy → structural a11y → DoD (structure subset) | context-lock → tokens → screens → states → copy → a11y → responsive → DoD G1–G8 audit |
| Skips | colour / motion / delight / pixel-polish | nothing in the core spine |

## À-la-carte gate registry

Named passes for `--gate`. Each operates on the current artifact and redeploys the same
URL. (Categories 0 context-lock, 2 screen-generation, and 4 wiring are not standalone
passes — they live in the core spine.)

| Gate | Pack § | Pass |
|---|---|---|
| `tokens` | 1 | Extract/harden the token set (prefers `lenses/tokens.md` if present) |
| `consistency` | 3 | Cross-screen audit + hardcode/terminology/drift sweep, then fix |
| `states` | 6 | Full loading / empty / error / partial / success pass |
| `copy` | 7 | Rewrite every string to be specific + load-bearing |
| `pixel` | 8 | Spacing / type / edge polish to the grid |
| `a11y` | 9 | WCAG 2.2 AA audit + fixes (contrast, targets, keyboard, focus) |
| `responsive` | 10 | 375 / 768 / 1440 proof, no overflow |
| `qa` | 11 | Full DoD G1–G8 gate table, pass/fail + evidence |
| `friction` | 5 | Skeptical-user friction walk; redesign the top frictions |
| `critique` | 12 | Structured critique (first impression, hierarchy, consistency) |
| `delight` | 13 | Signature moments + personality (hi-fi only) |

The **Definition of Done (G1–G8)** is the acceptance contract, not just a gate: G1
tokens-only, G2 interactive states, G3 data states, G4 no dead-ends, G5 WCAG AA, G6
responsive 375/768/1440, G7 specific copy, G8 real data shape. Any default hi-fi run
ends with the `qa` gate table, and the Principal Designer (Mode T) will not pass a
prototype that fails a gate unless the failure is declared.

## Steps

1. **Locate the study & its synthesis.** If `$ARGUMENTS` names a study folder, use it;
   otherwise read `.claude/.active-research` for the folder path. If neither resolves,
   STOP and tell the user to pass a study folder or run `/new-research`. Confirm
   `<folder>/SYNTHESIS.md` exists — if not, STOP and tell the user to run
   `/synth-findings` first (there is nothing to prototype yet).

2. **À-la-carte fast path.** If `--gate`/`--deepen` is present, skip to running those
   named passes (registry above) against the study's existing prototype Artifact,
   redeploying the same file path → same URL. If no prototype exists yet, tell the user
   to run a default `/design-prototype` first, then STOP.

3. **Soft gate on the spec.** If `<folder>/SPEC.md` exists, use it as the source of the
   screen list, user flow, IA, and per-screen states. If it is **absent**, warn the
   user that screens will be derived from `SYNTHESIS.md` with weaker traceability, offer
   to run `/draft-spec` first, and suggest `--fidelity lo` for a cheap first pass.
   Proceed only on the user's yes.

4. **Read the ground truth & note the type.** Read `SPEC.md` (if present) and
   `SYNTHESIS.md` in full, plus the research `README.md` for the `Type`, the stated
   `## Goal`, and the study's user types. Note the requested `--fidelity`, `--scope`,
   and which evidence the research cites (so the prototype can point at real captures).

5. **Context-lock (gates §0.1).** Restate, one line each: the token source (precedence:
   `lenses/tokens.md` from `/extract-tokens` > tokens named in `SPEC.md` > a minimal
   derived set), the reference screens, the personas/user types, and the Definition of
   Done. If any is missing, ask — do not guess.

6. **Generate the prototype (gates §1–2, 5–7).** Build the flow's screens grounded in
   the SPEC/synthesis: tokens-only, all states (§6), specific load-bearing copy (§7),
   the target flow (§5). Self-contained HTML — inline all CSS/JS, embed any capture
   stills as `data:` URIs (Artifacts block external hosts). No invented screens or data;
   flag every extrapolation as an assumption. Honour `--scope` if set.

7. **Self-audit against the DoD (gates §11.1, §9, §10).** Produce a G1–G8 gate table
   (pass/fail + evidence); fix fails. A hi-fi run includes a11y (§9) and responsive
   (§10); a lo-fi run runs the structure subset only and says so.

8. **Principal Designer review — Mode T.** Dispatch the Principal Designer as a subagent
   (Agent tool, `general-purpose`) in **Mode T**, handing it
   `.claude/personas/principal-designer.md`, the drafted prototype HTML, the gate table,
   `SYNTHESIS.md`, `SPEC.md` (if present), and the `README.md` (goal + type). It judges
   traceability, gate compliance, flow completeness, fidelity honesty, and PII-safety,
   returning **ready / revise / reject**. Revise to address its points, re-run if it
   said *reject*. Relay the verdict to the user.

9. **PII / guardrail gate.** Re-check the prototype carries zero internal specifics
   (product / program / funder / real names) and no un-redacted PII, and that it does
   not impersonate any real organisation (generic-branded only). Never invent evidence
   to fill a gap. Publishing to claude.ai is outward-facing — treat it like
   `/brief-feature` and `/publish-research`.

10. **Checkpoint — get explicit approval to publish.** Present the review-cleared
    prototype and confirm the user wants it published to claude.ai. Only on a clear yes,
    write the HTML to the session scratchpad and publish it with the **Artifact** tool
    (title = study topic + "Prototype"; a stable favicon). Report the returned
    `claude.ai/code/artifacts` URL. Reuse the same file path on later passes so updates
    redeploy the same URL.

11. **Update the log** in the study `README.md` with a dated "prototype drafted" entry
    (fidelity, screen count, gates passed/failed, Principal Designer Mode T verdict,
    Artifact URL).

12. **Report** to the user: the Artifact URL, the screen count, the DoD gate table, the
    Principal Designer's verdict and what was addressed, any assumptions flagged, and any
    PII items caught.
````

- [ ] **Step 2: Verify frontmatter and convention parity**

Run: `sed -n '1,4p' .claude/commands/design-prototype.md`
Expected: opening `---`, a `description:` line, an `argument-hint:` line, closing `---`.

Run: `grep -c '\$ARGUMENTS' .claude/commands/design-prototype.md`
Expected: `1` (uses the `$ARGUMENTS` convention like other commands).

Run: `grep -c '/draft-spec\|/synth-findings\|/new-research\|/extract-tokens' .claude/commands/design-prototype.md`
Expected: a non-zero count (command refs are slashed in the command file).

- [ ] **Step 3: Commit**

```bash
git add .claude/commands/design-prototype.md
git -c user.name="Claude Code" -c user.email="rekybongso@gmail.com" commit -m "$(cat <<'EOF'
feat: add /design-prototype command

New design-output step: synthesis/spec -> clickable HTML prototype
published as a claude.ai Artifact, generated and audited against the
design gates, gated by the Principal Designer (Mode T).

Co-Authored-By: Claude Opus 4.8 (1M context) <noreply@anthropic.com>
EOF
)"
```

---

### Task 3: Create the mirrored `design-prototype` skill

**Files:**
- Create: `.agents/skills/design-prototype/SKILL.md`

**Interfaces:**
- Consumes: the command content from Task 2 (mirrored into skill style) and `.claude/references/design-gates.md` (Task 1).
- Produces: the skill half of the dual registration. No later task depends on it beyond the parity check in Task 6.

- [ ] **Step 1: Write the skill file**

Create `.agents/skills/design-prototype/SKILL.md` with exactly this content (skill style: `name` + `description` frontmatter only; the word "arguments" instead of `$ARGUMENTS`; command refs de-slashed):

````markdown
---
name: design-prototype
description: Turn a reviewed synthesis (ideally via its SPEC.md) into a clickable, self-contained HTML prototype published as a claude.ai Artifact, generated and audited against the design gates. Gated by the Principal Designer (Mode T).
---

Produce the **clickable prototype** for a synthesized research study: a single
self-contained HTML page/flow, published as a **claude.ai Artifact**, that realizes *what we learned* as *something you can click through*. This is the third design-output step — where `brief-feature` makes the stakeholder *narrative* ("should we build this") and `draft-spec` makes the maker's *definition* ("here is what to build"), `design-prototype` makes the *artifact* ("here is what it looks and feels like"), for a stakeholder to react to or a designer to build from.

It is an **optional, additive** step (like the benchmark lenses and `draft-spec`), run only when the user asks — not part of the required spine. The prototype is published to the user's Artifacts gallery at `claude.ai/code/artifacts`: default-private, shareable when they choose, and updated in place at the same URL on later passes.

This is a synthesis-to-deliverable step, not a capture step. **Every screen must trace back to a SPEC requirement or a synthesis finding and its evidence — do not invent screens, flows, data, or sources** (same non-fabrication guardrail as the rest of the workspace). Where the prototype must extrapolate beyond what the research supports, say so explicitly as a flagged **assumption**, exactly as the lenses flag inference.

The gate definitions this skill runs live in `.claude/references/design-gates.md` (the Claude Design Prompt Pack): 14 categories (0–13) and the Definition of Done (G1–G8). Read it when running a gate.

## Arguments

- **Study folder** (optional positional) — defaults to the active research.
- **`--fidelity lo|hi`** (default `hi`) — `hi` = full tokens, colour, type, motion, and the complete core spine incl. the DoD audit. `lo` = grayscale wireframe, structure only, reduced gate set (skips colour/motion/delight/pixel-polish).
- **`--gate <name,…>`** (a.k.a. `--deepen`) — run one or more named gate passes against the *existing* artifact and redeploy the same URL, instead of a full default run.
- **`--scope <moment>`** (optional) — prototype only one slice of the flow (e.g. `landing`) rather than the full arc. Defaults to the full arc.

## Fidelity

| | lo-fi | hi-fi (default) |
|---|---|---|
| Look | Grayscale wireframe, structure only | Full tokens, colour, type, motion |
| Goal | Cheap structural exploration | Pixel-perfect, shareable |
| Auto-runs | context-lock → screens → states → copy → structural a11y → DoD (structure subset) | context-lock → tokens → screens → states → copy → a11y → responsive → DoD G1–G8 audit |
| Skips | colour / motion / delight / pixel-polish | nothing in the core spine |

## À-la-carte gate registry

Named passes for `--gate`. Each operates on the current artifact and redeploys the same URL. (Categories 0 context-lock, 2 screen-generation, and 4 wiring are not standalone passes — they live in the core spine.)

| Gate | Pack § | Pass |
|---|---|---|
| `tokens` | 1 | Extract/harden the token set (prefers `lenses/tokens.md` if present) |
| `consistency` | 3 | Cross-screen audit + hardcode/terminology/drift sweep, then fix |
| `states` | 6 | Full loading / empty / error / partial / success pass |
| `copy` | 7 | Rewrite every string to be specific + load-bearing |
| `pixel` | 8 | Spacing / type / edge polish to the grid |
| `a11y` | 9 | WCAG 2.2 AA audit + fixes (contrast, targets, keyboard, focus) |
| `responsive` | 10 | 375 / 768 / 1440 proof, no overflow |
| `qa` | 11 | Full DoD G1–G8 gate table, pass/fail + evidence |
| `friction` | 5 | Skeptical-user friction walk; redesign the top frictions |
| `critique` | 12 | Structured critique (first impression, hierarchy, consistency) |
| `delight` | 13 | Signature moments + personality (hi-fi only) |

The **Definition of Done (G1–G8)** is the acceptance contract, not just a gate: G1 tokens-only, G2 interactive states, G3 data states, G4 no dead-ends, G5 WCAG AA, G6 responsive 375/768/1440, G7 specific copy, G8 real data shape. Any default hi-fi run ends with the `qa` gate table, and the Principal Designer (Mode T) will not pass a prototype that fails a gate unless the failure is declared.

## Steps

1. **Locate the study & its synthesis.** If arguments name a study folder, use it; otherwise read `.claude/.active-research` for the folder path. If neither resolves, STOP and tell the user to pass a study folder or run `new-research`. Confirm `<folder>/SYNTHESIS.md` exists — if not, STOP and tell the user to run `synth-findings` first (there is nothing to prototype yet).

2. **À-la-carte fast path.** If `--gate`/`--deepen` is present, skip to running those named passes (registry above) against the study's existing prototype Artifact, redeploying the same file path → same URL. If no prototype exists yet, tell the user to run a default `design-prototype` first, then STOP.

3. **Soft gate on the spec.** If `<folder>/SPEC.md` exists, use it as the source of the screen list, user flow, IA, and per-screen states. If it is **absent**, warn the user that screens will be derived from `SYNTHESIS.md` with weaker traceability, offer to run `draft-spec` first, and suggest `--fidelity lo` for a cheap first pass. Proceed only on the user's yes.

4. **Read the ground truth & note the type.** Read `SPEC.md` (if present) and `SYNTHESIS.md` in full, plus the research `README.md` for the `Type`, the stated `## Goal`, and the study's user types. Note the requested `--fidelity`, `--scope`, and which evidence the research cites (so the prototype can point at real captures).

5. **Context-lock (gates §0.1).** Restate, one line each: the token source (precedence: `lenses/tokens.md` from `extract-tokens` > tokens named in `SPEC.md` > a minimal derived set), the reference screens, the personas/user types, and the Definition of Done. If any is missing, ask — do not guess.

6. **Generate the prototype (gates §1–2, 5–7).** Build the flow's screens grounded in the SPEC/synthesis: tokens-only, all states (§6), specific load-bearing copy (§7), the target flow (§5). Self-contained HTML — inline all CSS/JS, embed any capture stills as `data:` URIs (Artifacts block external hosts). No invented screens or data; flag every extrapolation as an assumption. Honour `--scope` if set.

7. **Self-audit against the DoD (gates §11.1, §9, §10).** Produce a G1–G8 gate table (pass/fail + evidence); fix fails. A hi-fi run includes a11y (§9) and responsive (§10); a lo-fi run runs the structure subset only and says so.

8. **Principal Designer review — Mode T.** Dispatch the Principal Designer as a subagent (Agent tool, `general-purpose`) in **Mode T**, handing it `.claude/personas/principal-designer.md`, the drafted prototype HTML, the gate table, `SYNTHESIS.md`, `SPEC.md` (if present), and the `README.md` (goal + type). It judges traceability, gate compliance, flow completeness, fidelity honesty, and PII-safety, returning **ready / revise / reject**. Revise to address its points, re-run if it said *reject*. Relay the verdict to the user.

9. **PII / guardrail gate.** Re-check the prototype carries zero internal specifics (product / program / funder / real names) and no un-redacted PII, and that it does not impersonate any real organisation (generic-branded only). Never invent evidence to fill a gap. Publishing to claude.ai is outward-facing — treat it like `brief-feature` and `publish-research`.

10. **Checkpoint — get explicit approval to publish.** Present the review-cleared prototype and confirm the user wants it published to claude.ai. Only on a clear yes, write the HTML to the session scratchpad and publish it with the **Artifact** tool (title = study topic + "Prototype"; a stable favicon). Report the returned `claude.ai/code/artifacts` URL. Reuse the same file path on later passes so updates redeploy the same URL.

11. **Update the log** in the study `README.md` with a dated "prototype drafted" entry (fidelity, screen count, gates passed/failed, Principal Designer Mode T verdict, Artifact URL).

12. **Report** to the user: the Artifact URL, the screen count, the DoD gate table, the Principal Designer's verdict and what was addressed, any assumptions flagged, and any PII items caught.
````

- [ ] **Step 2: Verify skill frontmatter and de-slashing**

Run: `sed -n '1,4p' .agents/skills/design-prototype/SKILL.md`
Expected: opening `---`, a `name: design-prototype` line, a `description:` line, closing `---` (NO `argument-hint`).

Run: `grep -c '\$ARGUMENTS' .agents/skills/design-prototype/SKILL.md`
Expected: `0` (skills say "arguments", not `$ARGUMENTS`).

Run: `grep -c '/draft-spec\|/synth-findings\|/new-research' .agents/skills/design-prototype/SKILL.md`
Expected: `0` (command refs are de-slashed in the skill file).

- [ ] **Step 3: Commit**

```bash
git add .agents/skills/design-prototype/SKILL.md
git -c user.name="Claude Code" -c user.email="rekybongso@gmail.com" commit -m "$(cat <<'EOF'
feat: add design-prototype skill (mirror of command)

Skill-format mirror of /design-prototype completing the dual
registration for the new spine step.

Co-Authored-By: Claude Opus 4.8 (1M context) <noreply@anthropic.com>
EOF
)"
```

---

### Task 4: Add Principal Designer Mode T (prototype review)

**Files:**
- Modify: `.claude/personas/principal-designer.md` (append after line 158, the end of Mode S)

**Interfaces:**
- Consumes: nothing new.
- Produces: the "Mode T" section that Task 2 step 8 and Task 3 step 8 dispatch. Task 5 references Mode T in `CLAUDE.md`.

- [ ] **Step 1: Append the Mode T section**

Append the following to the end of `.claude/personas/principal-designer.md` (after the existing Mode S closing line). Mirror Mode S's shape exactly — 5 ordered criteria, ready/revise/reject verdict, the "never silently rewrite" closer:

````markdown

---

## Mode T — Prototype review (dispatched by `/design-prototype`)

Reviews the clickable HTML prototype produced by `/design-prototype` — the
self-contained Artifact that realizes a study's synthesis/spec as something you can
click through — **before** it is published to claude.ai. You judge the drafted
prototype against the study's `SYNTHESIS.md`, its `SPEC.md` (if one exists), and
`README.md` (goal + type). You do not open a browser, do not publish, and do not browse
the benchmarked platforms.

Input: the drafted prototype HTML, the run's Definition-of-Done gate table, the study's
`SYNTHESIS.md`, its `SPEC.md` (if present), and its `README.md` (for `TYPE` + the stated
`## Goal`).

Judge the prototype on, in order:

1. **Traceability — nothing invented.** Every screen maps to a `SPEC.md` functional
   requirement or a synthesis finding and its evidence. Flag any screen, component, or
   data value with no basis in the research. This is the same non-fabrication guardrail
   the whole workspace runs on; extrapolation must be a flagged assumption, not
   presented as fact.
2. **Gate compliance — the declared table is honest.** The Definition-of-Done gate table
   (G1–G8) must match what the HTML actually does; no silent fails. Flag any gate marked
   pass that the markup contradicts (e.g. a hardcoded colour against G1, a dead-end
   against G4, a missing error/empty state against G3).
3. **Flow completeness.** The prototype has a clear entry → goal path with no dead-ends;
   error, empty, and loading states are present and reachable, not just the happy path.
4. **Fidelity honesty.** A `--fidelity lo` run is an honest grayscale wireframe (not
   dressed up as hi-fi), and a hi-fi run actually carries tokens, states, a11y, and
   responsive behaviour — it does not claim polish it lacks.
5. **PII-safety for an external surface.** Since the prototype publishes to claude.ai,
   spot-check that no internal specifics (product / program / funder names), real
   people's names, avatars, emails, or account data ride along, and that it does not
   impersonate a real organisation (generic-branded only).

Return a **verdict — ready / revise / reject** — with specific, screen-referenced
reasons:
- **ready** — publish it as drafted.
- **revise** — publish only after the listed fixes (list them precisely).
- **reject** — the prototype invents screens, misdeclares its gates, or leaves the flow
  incomplete; say what must change before it is redrafted.

Never silently rewrite the prototype's substance — flag issues for the command to
resolve, exactly as Mode P never quietly flips a pattern's guidance.
````

- [ ] **Step 2: Verify the mode was added and parity holds**

Run: `grep -c '^## Mode [PRST] ' .claude/personas/principal-designer.md`
Expected: `4` (Modes P, R, S, T all present).

Run: `grep -c 'ready / revise / reject' .claude/personas/principal-designer.md`
Expected: `3` (Modes R, S, and now T each carry the verdict scale).

- [ ] **Step 3: Commit**

```bash
git add .claude/personas/principal-designer.md
git -c user.name="Claude Code" -c user.email="rekybongso@gmail.com" commit -m "$(cat <<'EOF'
feat: add Principal Designer Mode T (prototype review)

Mode T judges /design-prototype output for traceability, gate
compliance, flow completeness, fidelity honesty, and PII-safety.

Co-Authored-By: Claude Opus 4.8 (1M context) <noreply@anthropic.com>
EOF
)"
```

---

### Task 5: Wire `/design-prototype` into CLAUDE.md

**Files:**
- Modify: `CLAUDE.md` (three locations: the design-output prose in "Research types", the Principal Designer section, and the workflow-command table)

**Interfaces:**
- Consumes: the command name `/design-prototype` (Task 2), Mode T (Task 4), the reference path (Task 1).
- Produces: the documentation that makes the step discoverable. Terminal task.

- [ ] **Step 1: Read the three target locations to anchor the edits**

Run: `grep -n 'draft-spec\|design-output\|Mode R.*Mode S\|Principal Designer (pattern-library owner)' CLAUDE.md`
Expected: line numbers for the design-output prose, the Principal Designer section, and the workflow table row for `/draft-spec`. Use these to place the three edits below.

- [ ] **Step 2: Add the design-output prose entry**

In the "Research types" section, find the two-bullet list of optional design-output steps (the `/brief-feature` and `/draft-spec` bullets). Add a third bullet immediately after the `/draft-spec` bullet:

```markdown
- `/design-prototype` — a clickable **HTML prototype** published as a claude.ai
  Artifact (the *artifact*: "here is what it looks and feels like"). Generated and
  audited against the design gates, gated by the Principal Designer (Mode T). Prefers a
  `SPEC.md` but will run from a reviewed synthesis; supports `--fidelity lo|hi` and
  à-la-carte `--gate` passes that update the same Artifact.
```

- [ ] **Step 3: Extend the Principal Designer section to name Mode T**

Find the Principal Designer paragraph that lists "Mode R" and "Mode S" review points. Add a third list item after the Mode S item:

```markdown
- **Mode T** (`/design-prototype`) — judges the drafted HTML prototype for
  traceability (no invented screens), gate compliance (the DoD table is honest), flow
  completeness, fidelity honesty, and PII-safety. Returns ready / revise / reject.
```

- [ ] **Step 4: Add the workflow-command table row**

In the "Workflow commands" table, add a row immediately after the `/draft-spec` row:

```markdown
| `/design-prototype [folder]` | *(optional)* Turns a synthesized study into a clickable **HTML prototype** published as a claude.ai Artifact, generated and audited against the design gates (`.claude/references/design-gates.md`). Type-aware, gated by the Principal Designer (Mode T). Prefers a `SPEC.md`; supports `--fidelity lo\|hi` and à-la-carte `--gate` passes. Defaults to the active research. |
```

- [ ] **Step 5: Verify all three edits landed**

Run: `grep -c 'design-prototype' CLAUDE.md`
Expected: `3` (prose bullet, PD Mode T item, table row).

Run: `grep -c 'Mode T' CLAUDE.md`
Expected: `1` (the Principal Designer section item; the table row cites "(Mode T)" too — if the count is `2`, that is also acceptable, both references are intended).

- [ ] **Step 6: Commit**

```bash
git add CLAUDE.md
git -c user.name="Claude Code" -c user.email="rekybongso@gmail.com" commit -m "$(cat <<'EOF'
docs: wire /design-prototype into CLAUDE.md

Document the new design-output step in the design-output prose, the
Principal Designer section (Mode T), and the workflow-command table.

Co-Authored-By: Claude Opus 4.8 (1M context) <noreply@anthropic.com>
EOF
)"
```

---

## Self-Review

**Spec coverage** — every spec deliverable maps to a task:
- Extract pack → committed reference → Task 1 ✓
- `.claude/commands/design-prototype.md` → Task 2 ✓
- `.agents/skills/design-prototype/SKILL.md` → Task 3 ✓
- Principal Designer Mode T → Task 4 ✓
- CLAUDE.md wiring (table + prose + PD section) → Task 5 ✓
- Flexibility axes (fidelity, à-la-carte gates) → Tasks 2 & 3 (Fidelity table + gate registry) ✓
- Soft gate on SPEC.md → Tasks 2 & 3 step 3 ✓
- DoD as acceptance contract → Tasks 2 & 3 (gate registry note) + Task 4 criterion 2 ✓
- Open-question resolutions (hi default + lo nudge, token precedence, `--scope`) → Global Constraints + Tasks 2/3 steps 3 & 5 ✓
- Confidentiality firewall → Task 1 step 2 (verification) + Global Constraints ✓

**Placeholder scan** — no TBD/TODO; every file's full content is inlined verbatim; every verification step has an exact command + expected output. ✓

**Type consistency** — the command and skill are content-identical except for the documented style differences (frontmatter, `$ARGUMENTS` vs "arguments", slashed vs de-slashed refs). Gate names (`tokens`, `consistency`, `states`, `copy`, `pixel`, `a11y`, `responsive`, `qa`, `friction`, `critique`, `delight`) are identical across both files and the spec. Mode name "Mode T" is consistent across Tasks 2, 3, 4, 5 and the persona file. ✓

**Note on TDD:** these are documentation deliverables with no runtime code path, so each task's "test" is a structural verification (grep/sed checks on frontmatter, conventions, and cross-references) rather than a unit test — the honest analogue for prose-file work.
