# Design: `/review-research` → findings-strengthening debate (and stakeholder review moves to `/draft-spec`)

- **Date:** 2026-07-16
- **Status:** Approved (brainstorm) — pending implementation plan
- **Author:** Claude (acting Senior UI/UX Designer)
- **Related:** [`2026-07-16-litreview-research-type-design.md`](./2026-07-16-litreview-research-type-design.md) (this spec updates one line in it)

## Problem

`/review-research` today conflates two different questions and asks both of the *raw
findings*: "is this research sound?" **and** "should we build it / is it feasible?"
(PM, Tech Lead, Head of Product → Sound/Reject, Low/High effort, Go/No-Go). The build
question has no artifact to judge at this stage — it belongs on a **spec**, not on raw
findings. The review is also not context-aware in a research sense; it is a
build-committee lens bolted onto every study regardless of type.

We want to split the two concerns:

- **`/review-research`** becomes a **research peer-review debate** — multiple personas
  debate the findings/papers and *strengthen* them (epistemics: are these findings true,
  well-grounded, and honestly calibrated?), context-aware by research `Type`.
- **PM / Tech Lead / Head of Product** relocate to **`/draft-spec`**, reviewing the
  drafted `SPEC.md`'s functional requirements (the build question, where a build artifact
  finally exists).

## Decisions (from brainstorm)

| Question | Decision |
|---|---|
| Debate structure | **Adversarial peer panel + moderator** — Skeptic/Methodologist + Domain Expert + Evidence Auditor, moderated by the Principal Researcher. |
| What the debate changes | **Record + apply strengthenings on approval** — append a debate record, then on explicit user yes apply the strengthenings into the findings (original wording preserved in the record). |
| Stakeholder scope | **Full move now** — wire PM/Tech/HoP into `/draft-spec` in this same spec. |
| Section name | **`## Peer Review`** (replaces `## Agent Review`). |
| Debate rounds | **One round** for v1 (a rebuttal round is a possible later add — YAGNI now). |

## Part 1 — New `/review-research`: the peer-review debate

### Personas (chained, then moderated)

Run as `general-purpose` subagents, each handed its persona spec + the ground truth
(`SYNTHESIS.md`, `README.md` goal/type, and the type's evidence). Chained so each reads
the prior personas and can agree/build/challenge:

1. **Skeptic / Methodologist** *(new: `.claude/personas/research-skeptic.md`)* — attacks
   each finding's validity: sample/N, confounds, over-generalization, cherry-picking,
   "could this be an artifact of X?"
2. **Domain Expert / Contextualist** *(new: `.claude/personas/domain-expert.md`)* — tests
   findings against known literature and context; names what is missing. Gets the **same
   scoped scholarly web-search exception** the Principal Researcher has in Mode B (real
   external evidence to challenge or corroborate, never the product under study, never a
   fabricated citation).
3. **Evidence Auditor / Steelman** *(new: `.claude/personas/evidence-auditor.md`)* —
   checks each claim's grounding and whether its **confidence label is honest**; also
   *steelmans* weak-but-important findings so a real signal is not discarded for a fixable
   flaw.
4. **Principal Researcher = moderator** *(new **Mode C** on the existing
   `.claude/personas/principal-researcher.md`)* — synthesizes the debate into a
   strengthened set.

### Type-aware debate focus

Anchored on `Type` + `Goal` (the command already reads both):

- **benchmark** — do observed patterns generalize? does the captured evidence actually
  support the "why it works" rationale?
- **usability** — signal vs noise at small N? is each severity rating justified?
  alternative explanations for the behavior?
- **litreview** — source quality, contradictions *between* papers, over-generalization,
  confidence calibration — classic peer review, debating the sources in
  `evidence.md`/`references.md` directly.

### Verdict (moderator, per finding)

- **Robust** — survives, well-grounded.
- **Strengthen** — with a specific action: narrow the claim / recalibrate confidence /
  add a caveat / get corroboration.
- **Unsupported** — drop, or demote to an open question.

Plus a confidence direction (↑ / ↓ / unchanged). This replaces the old
Go/Conditional/No-Go, which moves to spec time (Part 2).

**Note on confidence by type:** only **litreview** findings carry an explicit confidence
label, so there the "Strengthen" action can recalibrate it directly. For **benchmark**
and **usability**, "confidence Δ" is expressed as the strengthening itself — narrowing an
over-claim, adding a caveat, or flagging thin evidence — not as a numeric label change.
The moderator applies whichever form the finding supports.

### Flow

1. Locate active research + `SYNTHESIS.md`; read `Type` + `Goal` + the type's ground-truth
   evidence (as today). If `SYNTHESIS.md` is absent, STOP → run `/synth-findings` first.
2. Run the panel (Skeptic → Domain Expert → Evidence Auditor), chained.
3. **Principal Researcher Mode C** moderates → produces the `## Peer Review` section: a
   per-persona debate summary, a consolidated strengthened-findings table (Finding |
   verdict | confidence Δ | action), and a concrete action list.
4. **Checkpoint — do NOT write yet.** Present the block; get explicit approval.
5. On approval: (a) write `## Peer Review` into `SYNTHESIS.md` (replace a prior one, do
   not stack); (b) **apply the approved strengthenings into the findings** (confidence
   ↓/↑, claim narrowed, caveat added). The original wording of any changed finding is
   preserved verbatim inside the `## Peer Review` record, so nothing is silently lost.
6. Add a dated "peer review recorded" entry to the README log.

## Part 2 — `/draft-spec` gains the stakeholder review

- **Gate re-points:** the hard gate changes from "`## Agent Review` exists" → "**`## Peer
  Review` exists**" (research must be debated/strengthened first). For backward
  compatibility with already-closed studies, the gate accepts **either `## Peer Review`
  or legacy `## Agent Review`.**
- **New step — stakeholder review of the drafted SPEC** (PM → Tech Lead → HoP, chained),
  judging the **functional requirements**, not raw findings:
  - **PM** — per-FR product soundness: *Sound / Needs refinement / Reject*
  - **Tech Lead** — per-FR build effort *Low / Medium / High* + top feasibility risk
  - **HoP** — per-FR *Go / Conditional Go / No-Go* + sequencing
- **Sequence:** draft SPEC with user → **stakeholder review** (may cut a No-Go FR or
  reprioritize) → revise → **Principal Designer Mode S** (traceability/scope/flow, as
  today) → checkpoint → write. Verdicts recorded in the SPEC as a `## Stakeholder Review`
  section.
- **Fixes a now-broken assumption:** draft-spec today reads Go/No-Go *from the synthesis*.
  That call is now *produced here* at spec time. The "a No-Go feature must not become a
  Must" rule becomes an **output of the stakeholder step**, not a lookup into the
  synthesis.

## Part 3 — Persona spec rewrites

- **`product-manager.md`, `tech-lead.md`, `head-of-product.md`** — re-aim from "reviewers
  in the `/review-research` chain judging synthesized features" to "reviewers in the
  `/draft-spec` chain judging the SPEC's FRs." Verdict scales unchanged (they already fit
  a build decision); only the object-under-review and framing change. Update the
  reader-facing verdict **Legend** wording accordingly.
- **`principal-researcher.md`** — add **Mode C — Peer-review moderation** (dispatched by
  `/review-research`): run/synthesize the panel; honor never-fabricate and
  never-silently-edit (strengthenings applied only post-approval, originals preserved in
  the record).
- **New personas:** `research-skeptic.md`, `domain-expert.md`, `evidence-auditor.md` —
  each with standing guardrails (never fabricate; judge against the stated `## Goal`;
  opinionated + specific; cite each finding by name), a per-type focus, and its debate
  role.

## Part 4 — Triple-mirror + cross-reference updates

The workspace mirrors command logic in **three surfaces**; every change here must land in
all three, consistently:

1. **`.claude/commands/`** — `review-research.md`, `draft-spec.md`; plus any command that
   references `## Agent Review` (`brief-feature.md`).
2. **`.agents/skills/*/SKILL.md`** — `review-research`, `draft-spec`, `brief-feature`,
   `close-research` (its skill references `Agent Review` even though the matching command
   does not — the mirrors have **already drifted**; reconcile while here).
3. **Docs** — `CLAUDE.md`, `GEMINI.md` (Antigravity), `README.md`: rewrite the "three
   `/review-research` stakeholder personas" paragraph (they now serve `/draft-spec`); note
   `/review-research` is a Principal-Researcher-moderated peer-review debate (Mode C);
   update the `/review-research` and `/draft-spec` rows in the Workflow-commands table.

Also:
- **`principal-designer.md`** references `## Agent Review` (Mode S input) → re-point to
  `## Peer Review` (accept legacy).
- **Grep sweep:** re-point every machinery reference to `## Agent Review` → `## Peer
  Review` (accept legacy in gates). **Do NOT rewrite historical study outputs** — past
  studies' `SYNTHESIS.md`/`SPEC.md`/`README.md` keep their recorded `## Agent Review`
  sections as-is; the rename is forward-going, and gates read legacy sections fine.
- **Litreview spec:** update its lifecycle table line
  `review | /review-research (PM/Tech/HoP) | same, type-aware` to reflect the debate model
  (`/review-research` = peer-review debate; stakeholder review happens at `/draft-spec`).

## Out of scope

- The debate stays **one round** (no rebuttal round) for v1.
- No changes to `/brief-feature` or `/design-prototype` review gates beyond tolerating the
  renamed section (accept legacy `## Agent Review`).
- No rewriting of historical study outputs.
- Benchmark/usability capture and synthesis formats unchanged.

## Success criteria

- `/review-research` runs the 4-role panel, produces a `## Peer Review` section with
  per-finding Robust/Strengthen/Unsupported + confidence Δ, and — on approval — applies
  strengthenings into the findings with originals preserved.
- The debate focus visibly differs by `Type` (benchmark vs usability vs litreview).
- `/draft-spec` gates on `## Peer Review` (or legacy `## Agent Review`), runs the PM/Tech
  Lead/HoP review on the SPEC's FRs, records a `## Stakeholder Review`, then Principal
  Designer Mode S.
- No machinery reference to `## Agent Review` remains un-repointed across all three
  mirrors; historical study files are untouched; gates still accept legacy sections.
