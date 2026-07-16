# `/review-research` Peer-Review Debate — Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Turn `/review-research` from a build-decision committee (PM/Tech Lead/HoP) into a context-aware research peer-review *debate* that strengthens findings, and relocate the PM/Tech Lead/HoP stakeholder review onto `/draft-spec` where a build artifact exists.

**Architecture:** Prose/prompt-engineering codebase — the "code" is markdown command files (`.claude/commands/`), persona specs (`.claude/personas/`), mirrored agent skills (`.agents/skills/*/SKILL.md`), and docs (`CLAUDE.md`/`GEMINI.md`/`README.md`). A new 4-role debate (3 new panel personas + a new Mode C on the Principal Researcher) replaces the stakeholder chain in `/review-research`. The three stakeholder personas are rewritten to judge a SPEC's functional requirements and wired into `/draft-spec`. The section `## Agent Review` is renamed `## Peer Review` across machinery (gates accept the legacy name; historical study files are left untouched).

**Tech Stack:** Markdown only. No build, no test runner. "Tests" are verification commands (Grep/Read/read-back). Source of design truth: `docs/superpowers/specs/2026-07-16-review-research-debate-design.md`.

## Global Constraints

- **Triple mirror:** every command-logic change lands in all three surfaces consistently — `.claude/commands/<x>.md`, `.agents/skills/<x>/SKILL.md`, and the docs (`CLAUDE.md`, `GEMINI.md`, `README.md`). The skill mirror omits the leading `/` on command names (e.g. `review-research`, not `/review-research`) — match the existing convention in each file.
- **Section rename is forward-only:** re-point every *machinery* reference `## Agent Review` → `## Peer Review`. Gates must **accept either** `## Peer Review` or legacy `## Agent Review`. **Never rewrite historical study outputs** under `research/*/` — their recorded `## Agent Review` sections stay verbatim.
- **Never fabricate** (workspace guardrail): every persona/command instruction must keep the "trace to the research folder, invent nothing" rule.
- **Prose rule (CORRECTED):** the em-dash-removal rule applies to **research outputs only** (`SYNTHESIS.md`, notes) per `principal-researcher.md`/CLAUDE.md — NOT to machinery. Persona specs, command files, and docs use em-dashes as established house style; match it. Do **not** run any "zero em-dashes" check on the files this plan touches, and ignore the em-dash verification substeps in Tasks A1/A2/A3 (they were based on the wrong assumption).
- **Commits are gated on the user's explicit go-ahead** (workspace rule: commit only when asked). When approved, use git identity name `Claude Code`, email `rekybongso@gmail.com`; conventional messages ending with the `Co-Authored-By: Claude Opus 4.8 (1M context) <noreply@anthropic.com>` trailer; commit on the current `feature/ux-research-expansion` branch; do not push. Each task below ends with a suggested commit the executor runs only after the user greenlights.
- **No live command runs required.** Do not execute `/review-research` or `/draft-spec` against a real study to "test" (it dispatches paid subagents). Verification is static: structure read-backs and Grep consistency checks.

---

## Phase A — `/review-research` becomes the debate

### Task A1: Create the three debate persona specs

**Files:**
- Create: `.claude/personas/research-skeptic.md`
- Create: `.claude/personas/domain-expert.md`
- Create: `.claude/personas/evidence-auditor.md`

**Interfaces:**
- Produces: three persona spec files, dispatched by name from the rewritten `/review-research` (Task A3) as `general-purpose` subagents, chained in this order (skeptic → domain-expert → evidence-auditor).
- Each mirrors the house style of existing personas (`product-manager.md`): a one-para role intro, a "Standing guardrails" list, a "What to judge" section, a per-type focus, and an "Output" section.

- [ ] **Step 1: Write `.claude/personas/research-skeptic.md`**

```markdown
# Persona: Skeptic / Methodologist — validity attack (debate seat 1)

The first voice in the `/review-research` peer-review debate. Its job is to make each
finding *earn* its place by attacking how it was arrived at. Never browses the product
under study; everything must trace to what is already in the research folder.

Standing guardrails (non-negotiable):

- **Never fabricate** findings, metrics, or sources. Ground every objection in the
  synthesis and its captured evidence (or in the plain absence of evidence).
- **Judge against the stated `## Goal`** (from the research README). Hold each finding to
  the bar the goal sets, not a generic one.
- Be **opinionated and specific**, and **cite each finding/feature by name**.
- Attack the *finding*, not the researcher. The aim is a stronger finding, not a body
  count.

## What to judge
For each finding in `SYNTHESIS.md`, name the biggest threat to its validity:
- **Sample / N** — is the evidence one screen, one session, one paper? Would it survive a
  second case?
- **Confounds & alternative explanations** — could something other than the stated cause
  produce the same observation?
- **Over-generalization** — does the claim reach further than the evidence (one platform,
  one context) supports?
- **Cherry-picking / survivorship** — is contrary evidence in the folder being ignored?
- **Causal overreach** — is a correlation or a marketing claim being read as a proven
  mechanism?
State, per finding, whether the threat is **fatal** (the finding cannot stand as written)
or **fixable** (name the fix: narrow it, caveat it, get a second case).

## Per-type focus
- **benchmark** — does the observed pattern generalize beyond the single captured
  instance, or is it an artifact of that one product/screen?
- **usability** — signal vs noise at small N; could the behavior be a moderation or task
  artifact rather than a real usability problem?
- **litreview** — study quality behind each cited claim (sample, method, venue); is a
  single paper being treated as settled fact?

## Output
A per-finding list: finding named, the single biggest validity threat, and
**fatal / fixable (with the fix)**. You are first in the chain, so there are no prior
reviews to answer; the Domain Expert and Evidence Auditor read yours next.
```

- [ ] **Step 2: Write `.claude/personas/domain-expert.md`**

```markdown
# Persona: Domain Expert / Contextualist — outside knowledge (debate seat 2)

The second voice in the `/review-research` debate. Has read the Skeptic's review. Tests
each finding against what is already known in the field and in the study's real-world
context, and names what the study is missing. Never browses the product under study.

**Scoped scholarly web-search exception.** Like the Principal Researcher in Mode B, this
persona MAY use web search to find peer-reviewed papers, meta-analyses, or reputable
sources that corroborate or challenge a finding. This is the *only* browsing it does:
scholarly/authoritative sources, never the product under study, never to invent a new
product finding. Cite only sources actually retrieved, with a working URL; a short
accurate list beats a long invented one. Never fabricate a citation.

Standing guardrails (non-negotiable):

- **Never fabricate** findings, sources, or context. If you cannot verify a source, say so
  and do not cite it.
- **Judge against the stated `## Goal`** and the study's real context (audience, market,
  setting named in the README/synthesis).
- Be **opinionated and specific**, and **cite each finding/feature by name**.

## What to judge
For each finding, weighing the Skeptic's objections:
- **Consistency with known literature** — does the field corroborate or contradict this?
  A contradiction is a first-class flag, not a footnote.
- **Context fit** — does the finding hold for *this* study's audience/setting, or is it
  imported from a context that does not transfer?
- **What is missing** — the obvious comparison, segment, counter-example, or well-known
  result the study did not consider.
- **Corroboration opportunities** — where an external source would materially raise (or
  lower) confidence in a finding, name it.

## Per-type focus
- **benchmark** — is the "why it works" rationale consistent with established UX/learning
  research, or is it a plausible-sounding just-so story?
- **usability** — do the observed problems match known usability/heuristic patterns; is a
  well-documented cause being missed?
- **litreview** — contradictions *between* the cited papers; key sources or
  counter-evidence absent from `evidence.md`/`references.md`; whether the body of evidence
  is being read fairly.

## Output
A per-finding read: finding named, whether outside knowledge corroborates or challenges it
(with any retrieved citation + URL), and what is missing. Record any citation you rely on
so the moderator can log it in `references.md`. The Evidence Auditor reads yours next.
```

- [ ] **Step 3: Write `.claude/personas/evidence-auditor.md`**

```markdown
# Persona: Evidence Auditor / Steelman — grounding & calibration (debate seat 3)

The third voice in the `/review-research` debate. Has read the Skeptic's and the Domain
Expert's reviews. Two jobs: audit whether each claim is actually grounded and honestly
calibrated, and *steelman* weak-but-important findings so a real signal is not thrown out
for a fixable flaw. Never browses the product under study.

Standing guardrails (non-negotiable):

- **Never fabricate** evidence or citations. An ungrounded claim is flagged, not
  invented into groundedness.
- **Judge against the stated `## Goal`.**
- Be **opinionated and specific**, and **cite each finding/feature by name**.

## What to judge
For each finding:
- **Grounding** — does every claim trace to a real artifact (a screenshot filename,
  `flow.gif`, a session note, a cited source `[S#]`)? Point at the artifact or flag its
  absence.
- **Confidence honesty** — is the finding stated with a confidence its evidence earns?
  For **litreview**, is the explicit confidence label (High/Med/Low) correct given source
  count and quality? For **benchmark/usability**, is the *strength of wording* honest, or
  does thin evidence get asserted as fact?
- **Steelman** — for a finding the Skeptic wounded but that looks important and real,
  state the strongest defensible version: the narrower claim the evidence *does* support,
  so it survives in a defensible form rather than being cut wholesale.

## Per-type focus
- **benchmark** — separate what a static capture can actually show from what is inferred;
  flag rationale asserted beyond the screenshot.
- **usability** — is severity proportionate to the evidence (frequency × impact across
  participants), or inflated from a single session?
- **litreview** — does the confidence label match the source base; are refuted/weak claims
  kept out of the findings and confined to their own section?

## Output
A per-finding audit: finding named, grounded / thinly-grounded / ungrounded, whether its
confidence (or wording strength) is honest, and — where relevant — the steelmanned
narrower claim. You are last of the panel; the Principal Researcher (moderator) reads all
three reviews and synthesizes the strengthened set.
```

- [ ] **Step 4: Verify the three files exist and match house style**

Run: `ls .claude/personas/ | grep -E 'research-skeptic|domain-expert|evidence-auditor'`
Expected: all three filenames listed.
Run: `grep -L "Standing guardrails" .claude/personas/research-skeptic.md .claude/personas/domain-expert.md .claude/personas/evidence-auditor.md`
Expected: no output (every file contains the guardrails block).
Run: `grep -c "—" .claude/personas/research-skeptic.md .claude/personas/domain-expert.md .claude/personas/evidence-auditor.md`
Expected: `0` for each (no em-dashes in new content).

- [ ] **Step 5: Commit (on user go-ahead)**

```bash
git add .claude/personas/research-skeptic.md .claude/personas/domain-expert.md .claude/personas/evidence-auditor.md
git commit -m "feat(personas): add peer-review debate panel (skeptic, domain expert, evidence auditor)"
```

---

### Task A2: Add Mode C (peer-review moderation) to the Principal Researcher

**Files:**
- Modify: `.claude/personas/principal-researcher.md` (insert a new `## Mode C` block after Mode B, before the `## Prose rules` section)

**Interfaces:**
- Consumes: the three panel reviews (Task A1) + `SYNTHESIS.md` + README goal/type.
- Produces: the `## Peer Review` section content + a per-finding action list. The command (Task A3) applies approved strengthenings; the persona itself never edits findings silently.

- [ ] **Step 1: Read the current file to locate the insertion point**

Run: `grep -n "^## Prose rules\|^## Mode B" .claude/personas/principal-researcher.md`
Expected: line numbers for `## Mode B` and `## Prose rules`. Insert the new block on the blank line just before `## Prose rules` (and after Mode B's `---` divider).

- [ ] **Step 2: Insert the Mode C block**

Insert this block immediately before the `## Prose rules` heading (keep the surrounding `---` dividers consistent with Mode A/B):

```markdown
## Mode C — Peer-review moderation (dispatched by `/review-research`)

Input: the three panel reviews (Skeptic, Domain Expert, Evidence Auditor), the finished
`SYNTHESIS.md`, the research `README.md` (goal + `Type`), and the type's evidence
(benchmark: `platforms/*/notes.md`; usability: `sessions/*`; litreview: `evidence.md` +
`references.md`).

You moderate the debate into a *strengthened* set. You do not run the panel (the command
dispatches them); you synthesize their reviews.

### C1. Adjudicate each finding
Reading all three panel reviews together, give each finding one verdict:
- **Robust** — survives the debate, well-grounded as written.
- **Strengthen** — valuable but flawed; name the **single concrete action**: narrow the
  claim / recalibrate confidence / add a caveat / get corroboration. Prefer the Evidence
  Auditor's steelmanned narrower claim over deletion where a real signal exists.
- **Unsupported** — not grounded enough to stand; drop it, or demote it to an open
  question in `## Gaps & caveats`.
Add a confidence direction (↑ / ↓ / unchanged). For **litreview** this maps to the
explicit confidence label; for **benchmark/usability** it is expressed as the wording
change (narrow / caveat / flag), since those findings carry no numeric label.

### C2. Produce the `## Peer Review` section (do NOT edit findings here)
Assemble one markdown section titled `## Peer Review` with a dated subheading and:
- one `###` subsection per panelist (Skeptic, Domain Expert, Evidence Auditor) — a tight
  summary of their strongest points, not a transcript;
- a `### Strengthened findings` table: Finding | Verdict | Confidence Δ | Action;
- a `### Actions to apply` list — the concrete edit per finding the command will apply on
  approval, each stored with the **original wording** it replaces, so nothing is lost;
- a `### Legend` defining Robust / Strengthen / Unsupported (canonical reader-facing key).

### C3. Guardrails
- **Never fabricate.** Every verdict traces to a panel point + the folder's evidence.
- **Never silently change substance.** You output *proposed* actions; the command applies
  them only after the user approves, and preserves each original wording in the record.
- If the Domain Expert cited external sources, fold them into `references.md` (create/extend
  it) so the strengthened findings are traceable.

Report back to the command: the per-finding verdicts, the actions to apply, and a one-line
readiness note (e.g. "3 Robust, 4 Strengthen, 1 Unsupported; apply on approval").
```

- [ ] **Step 3: Update the file's intro to mention three modes**

Find (near the top of the file):
```
It runs in one of **two modes**, named explicitly by the command that dispatches
it. Both modes share the prose rules in the last section.
```
Replace with:
```
It runs in one of **three modes**, named explicitly by the command that dispatches
it. Modes A and B share the prose rules in the last section; Mode C moderates the
`/review-research` peer-review debate.
```

- [ ] **Step 4: Verify**

Run: `grep -n "^## Mode C\|three modes\|## Prose rules" .claude/personas/principal-researcher.md`
Expected: `## Mode C` appears above `## Prose rules`; intro says "three modes".
Run: `grep -c "—" .claude/personas/principal-researcher.md`
Expected: unchanged or lower vs before your edit for the lines you added (do not introduce em-dashes in the new block; pre-existing ones elsewhere are out of scope for this task).

- [ ] **Step 5: Commit (on user go-ahead)**

```bash
git add .claude/personas/principal-researcher.md
git commit -m "feat(personas): add Principal Researcher Mode C (peer-review moderation)"
```

---

### Task A3: Rewrite `/review-research` as the debate (Claude command)

**Files:**
- Modify: `.claude/commands/review-research.md` (full rewrite of body + frontmatter description)

**Interfaces:**
- Consumes: the three panel personas (A1) + Principal Researcher Mode C (A2).
- Produces: writes `## Peer Review` into `SYNTHESIS.md`; applies approved strengthenings into findings with originals preserved. This section name is the gate `/draft-spec` reads (Task B2).

- [ ] **Step 1: Replace the frontmatter `description`**

Find:
```
description: Review the active research's SYNTHESIS.md through three stakeholder personas (Head of Product, PM, Tech Lead), then — on approval — append the verdict as an Agent Review section.
```
Replace with:
```
description: Run a research peer-review debate over the active SYNTHESIS.md (Skeptic, Domain Expert, Evidence Auditor, moderated by the Principal Researcher) that strengthens the findings, then on approval records a Peer Review section and applies the agreed strengthenings.
```

- [ ] **Step 2: Replace the command body (everything after the frontmatter) with the debate flow**

Replace the whole body below the frontmatter with:

```markdown
Run a research **peer-review debate** over the **active research's** synthesis to make the
findings stronger, then — only after the user approves — record it in `SYNTHESIS.md` under
`## Peer Review` and apply the agreed strengthenings.

This is a critique-and-strengthen step, not a capture step, and not a build decision (the
build call lives at `/draft-spec`). The panel judges the findings we synthesized; they do
not go browsing the product. Everything they say must trace to what is already in the
research folder or, for the Domain Expert, to a real retrieved scholarly source. **Do not
invent evidence, metrics, findings, or citations.**

## Steps

1. **Locate the research & its synthesis.** Read `.claude/.active-research` for the folder
   path. If missing/empty, STOP and tell the user to run `/new-research`. Check that
   `<folder>/SYNTHESIS.md` exists; if not, STOP and tell the user to run `/synth-findings`
   first — there is nothing to review yet.

2. **Gather the ground truth & note the type.** Read `SYNTHESIS.md` in full, the research
   `README.md` (for `## Goal` and `Type`), and the type's evidence — benchmark:
   `platforms/*/notes.md` and `flow.md`; usability: `test-plan.md` + `sessions/*`;
   litreview: `evidence.md` + `references.md` + `sources.md`. If the user passed a focus in
   `$ARGUMENTS`, weight the debate toward it but still cover the whole synthesis. If the
   README `## Goal` is vague or missing, STOP and ask the user to state it — the debate is
   only meaningful against an explicit goal.

   **Anchor the debate to the `Type` + `## Goal`.** The debate focus differs by type:
   - **benchmark** — do the observed patterns generalize? does the captured evidence
     actually support each "why it works" rationale?
   - **usability** — signal vs noise at small N; are severity ratings justified; are there
     alternative explanations for the behavior?
   - **litreview** — source quality, contradictions between papers, over-generalization,
     confidence calibration (classic peer review of the sources in `evidence.md`).

3. **Run the debate panel as chained subagents.** Dispatch each persona with the Agent tool
   (`general-purpose`), handing it its spec file plus the ground truth from step 2, and pass
   each later panelist the earlier reviews so they cross-talk. Order and specs:
   1. **Skeptic / Methodologist** — `.claude/personas/research-skeptic.md`. Biggest validity
      threat per finding; fatal or fixable.
   2. **Domain Expert / Contextualist** — `.claude/personas/domain-expert.md`. Corroborate
      or challenge against known literature/context (scoped scholarly web-search allowed);
      what is missing. Has read the Skeptic.
   3. **Evidence Auditor / Steelman** — `.claude/personas/evidence-auditor.md`. Grounding +
      confidence honesty; steelman weak-but-important findings. Has read both prior reviews.

4. **Moderate with the Principal Researcher (Mode C).** Dispatch the Principal Researcher
   (`general-purpose`) with `.claude/personas/principal-researcher.md`, the three panel
   reviews, `SYNTHESIS.md`, the `README.md` (goal + type), and the type's evidence. Tell it
   the **type** so it calibrates confidence correctly. It returns the `## Peer Review`
   section content (per-panelist summary, a `### Strengthened findings` table [Finding |
   Verdict | Confidence Δ | Action], a `### Actions to apply` list with each original
   wording preserved, and a `### Legend`) plus a one-line readiness note.

5. **Checkpoint — do NOT write yet.** Present the assembled `## Peer Review` block AND the
   list of concrete strengthening actions to the user. Ask for explicit approval to (a) save
   the section and (b) apply the actions into the findings. If they want changes, revise and
   re-present. Only proceed on a clear yes. The user may approve a subset of actions.

6. **On approval, write and apply.**
   a. Append `## Peer Review` to `SYNTHESIS.md`. If one already exists from a prior run,
      replace it (keep only the latest) rather than stacking.
   b. Apply each **approved** action into the relevant finding: recalibrate the confidence
      label (litreview), narrow an over-claim, add a caveat, or add a corroboration TODO.
      The original wording of every changed finding is already preserved verbatim in the
      `### Actions to apply` record, so nothing is lost. Move any **Unsupported** finding
      into `## Gaps & caveats` as an open question rather than deleting it outright.
   c. If the Domain Expert cited external sources, ensure they are recorded in
      `references.md` (create/extend it).

7. **Update the log** in the research `README.md` with a dated "peer review recorded" entry
   (verdict counts, actions applied).

8. **Report** to the user: the per-finding verdicts in one line each, which strengthenings
   were applied, the file(s) updated, and any finding ruled Unsupported.
```

- [ ] **Step 3: Verify no stakeholder-review remnants and correct section name**

Run: `grep -n "Agent Review\|Go / Conditional Go\|Head of Product\|Tech Lead\|Product Manager" .claude/commands/review-research.md`
Expected: no output (the stakeholder chain and old section name are fully gone).
Run: `grep -n "## Peer Review\|research-skeptic\|domain-expert\|evidence-auditor\|Mode C" .claude/commands/review-research.md`
Expected: all present.
Run: `grep -c "—" .claude/commands/review-research.md`
Expected: `0`.

- [ ] **Step 4: Commit (on user go-ahead)**

```bash
git add .claude/commands/review-research.md
git commit -m "feat(review-research): replace stakeholder gate with peer-review debate"
```

---

### Task A4: Mirror the debate into the agent skill

**Files:**
- Modify: `.agents/skills/review-research/SKILL.md`

**Interfaces:**
- Consumes: same personas as Task A3. Must stay logically identical to the Claude command, with the skill-mirror conventions (no leading `/` on command names; single-paragraph steps as in the existing file).

- [ ] **Step 1: Rewrite the SKILL body to match Task A3**

Port the Task A3 rewrite into `.agents/skills/review-research/SKILL.md`, preserving this file's existing formatting conventions (frontmatter `name`/`description`; numbered steps as single paragraphs). Update the frontmatter `description` to:
```
description: Run a research peer-review debate over the active SYNTHESIS.md (Skeptic, Domain Expert, Evidence Auditor, moderated by the Principal Researcher) that strengthens the findings, then on approval records a Peer Review section and applies the agreed strengthenings.
```
Replace the body's stakeholder chain (steps referencing PM/Tech Lead/Head of Product and `## Agent Review`) with the same 8-step debate flow authored in Task A3 Step 2, adapted to the skill's paragraph style and dropping leading slashes on command names (`new-research`, `synth-findings`, `draft-spec`).

- [ ] **Step 2: Verify parity with the Claude command**

Run: `grep -n "Agent Review\|Head of Product\|Product Manager\|Tech Lead" .agents/skills/review-research/SKILL.md`
Expected: no output.
Run: `grep -n "Peer Review\|research-skeptic\|domain-expert\|evidence-auditor" .agents/skills/review-research/SKILL.md`
Expected: all present.

- [ ] **Step 3: Commit (on user go-ahead)**

```bash
git add .agents/skills/review-research/SKILL.md
git commit -m "feat(review-research): mirror peer-review debate into agent skill"
```

---

## Phase B — Stakeholder review moves to `/draft-spec` + rename sweep

### Task B1: Re-aim the PM / Tech Lead / Head of Product personas at the SPEC

**Files:**
- Modify: `.claude/personas/product-manager.md`
- Modify: `.claude/personas/tech-lead.md`
- Modify: `.claude/personas/head-of-product.md`

**Interfaces:**
- Produces: three personas dispatched by `/draft-spec` (Task B2), chained PM → Tech Lead → HoP, judging the drafted `SPEC.md`'s functional requirements (FRs). Verdict scales unchanged; object-under-review changes from "synthesized features" to "FRs".

- [ ] **Step 1: Update `product-manager.md`**

Find:
```
The first reviewer in the `/review-research` chain. Judges the *features we
synthesized* from a product standpoint. Never browses; everything must trace to
what is already in the research folder.
```
Replace with:
```
The first reviewer in the `/draft-spec` stakeholder chain. Judges the drafted
`SPEC.md`'s **functional requirements (FRs)** from a product standpoint. Never browses;
everything must trace to the SPEC, the `SYNTHESIS.md` it derives from, and its evidence.
```
Then, in "What to judge", change the lead-in `For each feature in `SYNTHESIS.md`:` to
`For each functional requirement in `SPEC.md` (checking it against its synthesis source):`
and reword the bullets to speak of the requirement rather than the feature (e.g. "Is it the
**right requirement for the stated goal**?", "well-scoped and coherent, framed around a
**real user problem**?", "**Gaps and overlaps** across FRs?", "**Missing user segments**?",
"is the requirement's **acceptance criteria testable**?"). In "Output", change "the whole
synthesis" to "the whole spec" and note the Tech Lead and Head of Product read the PM's
review next.

- [ ] **Step 2: Update `tech-lead.md`**

Find:
```
The second reviewer in the `/review-research` chain. Has read the **PM's review**
and may agree with or push back on it. Judges how hard each synthesized feature is
to actually build. Never browses; everything must trace to the research folder.
```
Replace with:
```
The second reviewer in the `/draft-spec` stakeholder chain. Has read the **PM's review**
and may agree with or push back on it. Judges how hard each functional requirement in
`SPEC.md` is to actually build. Never browses; everything must trace to the SPEC and the
synthesis it derives from.
```
Then change "What to judge" lead-in `For each feature as described in `SYNTHESIS.md`:` to
`For each functional requirement in `SPEC.md`:` and reword its bullets to reference the FR
(keeping the complexity / dependencies / data-ML / infra / risk structure and the
"agree with or challenge the PM" bullet). Verdict scale (Low / Medium / High) unchanged.

- [ ] **Step 3: Update `head-of-product.md`**

Find:
```
The final reviewer in the `/review-research` chain. Has read **both the PM and the
Tech Lead reviews** and gives the executive take. Never browses; everything must
trace to the research folder.
```
Replace with:
```
The final reviewer in the `/draft-spec` stakeholder chain. Has read **both the PM and the
Tech Lead reviews** and gives the executive take on the drafted `SPEC.md`. Never browses;
everything must trace to the SPEC and the synthesis it derives from.
```
Then, in "The goal decides which call you make" and "What to judge", replace "feature"
with "functional requirement" throughout, keep the Go / Conditional Go / No-Go scale, and
keep the benchmark-only caveat (for a benchmark-only goal there is usually no spec to
review, so note the stakeholder review applies when a build is intended). In "Output",
change "per-feature executive call" to "per-FR executive call" and keep the one-paragraph
overall verdict + single most important next step.

- [ ] **Step 4: Verify**

Run: `grep -n "review-research" .claude/personas/product-manager.md .claude/personas/tech-lead.md .claude/personas/head-of-product.md`
Expected: no output (all three now reference `/draft-spec`).
Run: `grep -n "SPEC.md\|functional requirement\|draft-spec" .claude/personas/product-manager.md .claude/personas/tech-lead.md .claude/personas/head-of-product.md`
Expected: matches in all three.

- [ ] **Step 5: Commit (on user go-ahead)**

```bash
git add .claude/personas/product-manager.md .claude/personas/tech-lead.md .claude/personas/head-of-product.md
git commit -m "refactor(personas): re-aim PM/Tech Lead/HoP at the SPEC's requirements"
```

---

### Task B2: Wire the stakeholder review into `/draft-spec` (Claude command)

**Files:**
- Modify: `.claude/commands/draft-spec.md`

**Interfaces:**
- Consumes: the three re-aimed personas (B1); the `## Peer Review` gate written by `/review-research` (A3).
- Produces: a `## Stakeholder Review` section inside `SPEC.md`; the drafted, stakeholder-vetted spec that Principal Designer Mode S then checks.

- [ ] **Step 1: Re-point the hard gate to accept Peer Review (or legacy Agent Review)**

Find (step 2, lines ~32-36):
```
2. **Require a reviewed synthesis (hard gate).** Check that `SYNTHESIS.md` contains an
   `## Agent Review` section (written by `/review-research`). If it is **absent**,
   STOP and tell the user to run `/review-research` first — a spec commits design and
   engineering effort, so it builds only on findings stakeholders have signed off.
   Proceed only if the user explicitly overrides after being told.
```
Replace with:
```
2. **Require a reviewed synthesis (hard gate).** Check that `SYNTHESIS.md` contains a
   `## Peer Review` section (written by `/review-research`), or a legacy `## Agent Review`
   section from a study reviewed before the peer-review debate existed. If **neither** is
   present, STOP and tell the user to run `/review-research` first: a spec commits design
   and engineering effort, so it builds only on findings that have been debated and
   strengthened. Proceed only if the user explicitly overrides after being told.
```

- [ ] **Step 2: Update the two other in-body references to the old section name**

Find `its `## Agent Review` verdicts and any `## Gaps & caveats`` (step 3) →
replace `## Agent Review` with `## Peer Review (or legacy ## Agent Review)`.
Find the benchmark branch text `the `## Agent Review` calls (a No-Go feature must not become a requirement).` (step 3) →
replace with `the `## Peer Review` strengthening (drop Unsupported findings; do not build on findings the debate could not support). Go/No-Go is decided here, at spec time, by the stakeholder review in step 6 — not read from the synthesis.`

- [ ] **Step 3: Insert the new stakeholder-review step (new step 6), renumbering the rest**

The current steps 5-10 are: 5 Principal Designer (Mode S), 6 PII gate, 7 checkpoint,
8 docx, 9 log, 10 report. Insert a **new step 6 (stakeholder review) before the Principal
Designer step**, so the sequence becomes: draft (4) → stakeholder review (new 5) →
Principal Designer Mode S (6) → PII (7) → checkpoint (8) → docx (9) → log (10) → report
(11). Concretely: renumber current step 5 (Principal Designer) to step 6, and insert this
as the new step 5:

```markdown
5. **Stakeholder review of the drafted SPEC (build gate).** Dispatch three personas with
   the Agent tool (`general-purpose`), chained so each reads the prior, each judging the
   SPEC's **functional requirements** (not the raw synthesis):
   1. **Product Manager** — `.claude/personas/product-manager.md`. Per-FR product
      soundness: **Sound / Needs refinement / Reject**.
   2. **Tech Lead** — `.claude/personas/tech-lead.md`. Per-FR build effort **Low / Medium
      / High** + the top feasibility risk; has read the PM.
   3. **Head of Product** — `.claude/personas/head-of-product.md`. Per-FR **Go /
      Conditional Go / No-Go** + sequencing; decides last, having read both.
   Assemble a `## Stakeholder Review` section for the SPEC: one `###` per persona, a
   `### Consolidated verdict` table (FR | PM | Tech Lead | Head of Product), and a
   `### Legend` (PM soundness · Tech Lead effort · HoP call — same definitions as the
   personas' specs). **Revise the spec** in light of it: an FR marked **No-Go** must not
   remain a Must (drop it or move it to Won't with the reason); reprioritize per the
   verdicts. Then continue to the Principal Designer review.
```

Update the renumbered Principal Designer step (now 6) to hand the reviewer the SPEC's
`## Stakeholder Review` too, and to check that no **No-Go** FR survived as a requirement.

- [ ] **Step 4: Add the `## Stakeholder Review` section to the SPEC template**

In the `SPEC.md` template at the bottom, after the `## 7. Assumptions & open questions`
section, add:
```
## 8. Stakeholder Review
(Written by the /draft-spec stakeholder chain — PM, Tech Lead, Head of Product.)

### Product Manager
<per-FR soundness>
### Tech Lead
<per-FR build effort + top risk>
### Head of Product
<per-FR Go / Conditional Go / No-Go + sequencing>

### Consolidated verdict
| FR | PM | Tech Lead | Head of Product |
|---|---|---|---|
| FR-01 | … | … | … |

### Legend
- **PM soundness** — Sound / Needs refinement / Reject.
- **Tech Lead build effort** — Low / Medium / High (+ top risk).
- **Head of Product call** — Go / Conditional Go / No-Go.
```
Also update the template's `- **Derived from:**` line from `(reviewed <date of ## Agent Review>)` to `(reviewed <date of ## Peer Review>)`.

- [ ] **Step 5: Verify**

Run: `grep -n "## Agent Review" .claude/commands/draft-spec.md`
Expected: no output.
Run: `grep -n "## Peer Review\|## Stakeholder Review\|product-manager.md\|Conditional Go" .claude/commands/draft-spec.md`
Expected: gate references Peer Review (+ legacy note), stakeholder step present, all three personas referenced.

- [ ] **Step 6: Commit (on user go-ahead)**

```bash
git add .claude/commands/draft-spec.md
git commit -m "feat(draft-spec): add PM/Tech Lead/HoP stakeholder review of the spec; gate on Peer Review"
```

---

### Task B3: Mirror the `/draft-spec` change into the agent skill

**Files:**
- Modify: `.agents/skills/draft-spec/SKILL.md`

- [ ] **Step 1: Port the Task B2 changes** into `.agents/skills/draft-spec/SKILL.md`, preserving the skill's paragraph style and dropping leading slashes on command names. Specifically: re-point the hard gate (accept `## Peer Review` or legacy `## Agent Review`), update the two other `## Agent Review` mentions, insert the stakeholder-review step before the Principal Designer step, and add the `## 8. Stakeholder Review` block + `Derived from` date-source to the embedded template if this file carries one.

- [ ] **Step 2: Verify**

Run: `grep -n "## Agent Review" .agents/skills/draft-spec/SKILL.md`
Expected: no output.
Run: `grep -n "Peer Review\|Stakeholder Review\|Conditional Go" .agents/skills/draft-spec/SKILL.md`
Expected: all present.

- [ ] **Step 3: Commit (on user go-ahead)**

```bash
git add .agents/skills/draft-spec/SKILL.md
git commit -m "feat(draft-spec): mirror stakeholder review + Peer Review gate into agent skill"
```

---

### Task B4: Rename sweep on the remaining machinery (accept legacy)

**Files:**
- Modify: `.claude/commands/brief-feature.md`
- Modify: `.agents/skills/brief-feature/SKILL.md`
- Modify: `.agents/skills/close-research/SKILL.md`
- Modify: `.claude/personas/principal-designer.md`

**Interfaces:**
- These files only *read* the review section (they gate/warn on it or accept it as input). Each should reference `## Peer Review` and still tolerate a legacy `## Agent Review`.

- [ ] **Step 1: `brief-feature` (command + skill)**

In `.claude/commands/brief-feature.md`, find:
```
   **Prefer a reviewed synthesis.** If `SYNTHESIS.md` has no `## Agent Review`
```
Replace `## Agent Review` with `## Peer Review (or legacy ## Agent Review)`.
Apply the equivalent change in `.agents/skills/brief-feature/SKILL.md` (its line 16
references `## Agent Review section` in the same warning).

- [ ] **Step 2: `close-research` skill**

In `.agents/skills/close-research/SKILL.md`, find the warning referencing
`an `## Agent Review` section (the stakeholder critique from `review-research`)` and its
`If `## Agent Review` is missing` clause. Reword to: check for a `## Peer Review` section
(the peer-review debate from `review-research`), accepting a legacy `## Agent Review`; if
neither is present, warn that research is being closed without a recorded review. (Note:
`.claude/commands/close-research.md` does **not** reference the section — this is the
existing mirror drift; leave that command as-is unless it later needs the same warning.)

- [ ] **Step 3: `principal-designer.md`**

Find the three `## Agent Review` mentions (Mode R input at line ~120, Mode S input at line
~123, and the No-Go check at line ~134). Re-point each to `## Peer Review` and, where it is
an input the designer reads, add "(or legacy `## Agent Review`)". For the No-Go check
(line ~134), reword so it references the SPEC's `## Stakeholder Review` (where Go/No-Go now
lives) rather than the synthesis's review: "a requirement the SPEC's `## Stakeholder
Review` marked **No-Go** appearing as a Must".

- [ ] **Step 4: Verify the sweep left no machinery reference to the old name**

Run: `grep -rn "## Agent Review" .claude .agents CLAUDE.md GEMINI.md README.md | grep -v "legacy"`
Expected: no output (every remaining `## Agent Review` is only in an "accept legacy" clause).
Run: `grep -rn "Agent Review" research/ | wc -l`
Expected: a non-zero count — historical study files are intentionally untouched. Do NOT edit them.

- [ ] **Step 5: Commit (on user go-ahead)**

```bash
git add .claude/commands/brief-feature.md .agents/skills/brief-feature/SKILL.md .agents/skills/close-research/SKILL.md .claude/personas/principal-designer.md
git commit -m "refactor: re-point brief-feature/close-research/principal-designer to Peer Review (accept legacy)"
```

---

### Task B5: Update the docs (CLAUDE.md, GEMINI.md, README.md)

**Files:**
- Modify: `CLAUDE.md`
- Modify: `GEMINI.md`
- Modify: `README.md`

- [ ] **Step 1: `CLAUDE.md` — rewrite the stakeholder-personas paragraph**

Find (line ~104):
```
The three `/review-research` stakeholder personas live in the same directory —
```
Rewrite that paragraph so it says: `/review-research` runs a **research peer-review
debate** — three panel personas (`research-skeptic.md`, `domain-expert.md`,
`evidence-auditor.md`) dispatched chained and moderated by the Principal Researcher
(Mode C) — that strengthens the findings and records a `## Peer Review` section. The three
stakeholder personas (`product-manager.md`, `tech-lead.md`, `head-of-product.md`) now serve
`/draft-spec`, where they review the drafted SPEC's functional requirements (the build
decision) and record a `## Stakeholder Review` section.

- [ ] **Step 2: `CLAUDE.md` — update the Workflow-commands table rows**

Find the `/review-research` row (line ~167) and replace its description with:
```
Runs a research peer-review debate over `SYNTHESIS.md` (Skeptic, Domain Expert, Evidence Auditor, moderated by the Principal Researcher) that strengthens the findings and — on approval — records a `## Peer Review` section and applies the agreed strengthenings.
```
Find the `/draft-spec` row (line ~169) and update it to note the stakeholder review:
append to its description ` A PM/Tech Lead/Head of Product stakeholder review vets the SPEC's requirements (the build call) before the Principal Designer Mode S gate.` and change "Requires `/review-research` to have run." to reference the `## Peer Review` gate (accepts legacy `## Agent Review`).

- [ ] **Step 3: `GEMINI.md` — mirror the same edits**

Update section `### 5. Multi-Persona Stakeholder Review (`review-research`)` (line ~42):
rename it to a peer-review debate, swap the three personas for the panel + Mode C
moderator, and change `## Agent Review` (line ~45) to `## Peer Review` with the new Legend
(Robust / Strengthen / Unsupported). In the draft-spec section (lines ~59-62), re-point the
hard gate to `## Peer Review` (accept legacy) and add a stakeholder-review step referencing
PM/Tech Lead/HoP against the SPEC. Update the close-research line ~117 to check
`## Peer Review` (accept legacy).

- [ ] **Step 4: `README.md` — update the two `/review-research` table/prose mentions**

Update the `/review-research` row (line ~142) with the same peer-review-debate description
as CLAUDE.md. The prose at line ~132 ("stress-test with `/review-research`") is still
accurate; leave it or lightly reword to "strengthen with `/review-research`".

- [ ] **Step 5: Verify docs**

Run: `grep -n "## Agent Review" CLAUDE.md GEMINI.md README.md | grep -v legacy`
Expected: no output.
Run: `grep -n "peer-review\|Peer Review\|Stakeholder Review\|research-skeptic" CLAUDE.md GEMINI.md README.md`
Expected: present in all three.

- [ ] **Step 6: Commit (on user go-ahead)**

```bash
git add CLAUDE.md GEMINI.md README.md
git commit -m "docs: reframe review-research as peer-review debate; stakeholder review at draft-spec"
```

---

## Final verification (whole plan)

- [ ] **No machinery reference to the old section name remains unguarded**

Run: `grep -rn "## Agent Review" .claude .agents CLAUDE.md GEMINI.md README.md | grep -v legacy`
Expected: no output.

- [ ] **Historical study outputs untouched**

Run: `git status --short research/`
Expected: no modified files under `research/` from this work (the rename is forward-only).

- [ ] **Triple-mirror parity spot-check**

Run: `grep -rl "Peer Review" .claude/commands .agents/skills`
Expected: both `review-research` surfaces and both `draft-spec` surfaces appear.

- [ ] **Debate personas wired end to end**

Run: `grep -rl "research-skeptic\|domain-expert\|evidence-auditor" .claude/commands .agents/skills CLAUDE.md GEMINI.md`
Expected: the review-research command + skill, and CLAUDE.md/GEMINI.md, reference the panel.
