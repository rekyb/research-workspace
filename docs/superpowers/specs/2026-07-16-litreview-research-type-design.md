# Design: `litreview` research type

- **Date:** 2026-07-16
- **Status:** Approved (brainstorm) — pending implementation plan
- **Author:** Claude (acting Senior UI/UX Designer)

## Problem

The workspace is benchmark-heavy. Today it does two things well: desk
research/benchmarking of live products (Chrome capture → `platforms/`) and
usability-study planning/synthesis. But a lot of useful UX input comes from
**reading, not observing** — research journals, industry reports, government
data, and other documents. We already did this once informally: `AUDIENCE-CONTEXT.md`
(the Indonesian-teacher audience profile) came out of the `deep-research` harness
and lives, somewhat awkwardly, inside a benchmark study.

We want a **first-class, repeatable research type** for evidence synthesis from
documents, sitting alongside benchmark and usability on the same lifecycle spine.

## Decisions (from brainstorm)

| Question | Decision |
|---|---|
| Source inputs | **Mixed** — user provides anchor documents *and* I find additional sources to fill gaps. |
| Output shape | **Themes → design implications** (reuse the `AUDIENCE-CONTEXT.md` shape). |
| Rigor | **Full adversarial** — the method step reuses the `deep-research` harness (search → fetch → 3-vote verify). |
| Type name | **`litreview`** (the `--type` value / `Type:` line). |
| Approach | **Additive type + light CLAUDE.md reframe** (no restructure of benchmark/usability). |
| Principal Designer on close | **Keep** — harvests *evidence-based design principles* into `PATTERNS.md`, not UI patterns. Never forces UI patterns when the study has none; if there is nothing harvestable, it says so and adds nothing. |

## Approach

Add `litreview` as a third first-class type on the existing type-aware spine.
Benchmark and usability flows are untouched. A small `CLAUDE.md` reframe presents
the three types as peers so the workspace no longer reads as benchmark-plus-a-bolt-on.

Lifecycle mapping (one spine, new branch):

| Spine step | benchmark | litreview (new) |
|---|---|---|
| create | `/new-research --type benchmark` | `/new-research --type litreview` |
| instrument / fieldwork | Chrome capture → `platforms/` | **`/gather-evidence`** → `deep-research` over question + corpus |
| synthesize | `/synth-findings` (feature write-ups) | `/synth-findings` (themes → implications) |
| review | `/review-research` (peer-review debate) | same, type-aware — see [review-research-debate spec](./2026-07-16-review-research-debate-design.md) |
| close / publish / board | shared | shared, type-aware |

`/gather-evidence` is to litreview what capture is to benchmark: the one
method-specific step that produces the raw material `/synth-findings` reads. It is
expensive (multi-agent adversarial verification), so it runs **only after** the
`PLAN.md` gate is approved — the same discipline as benchmark capturing only after
plan approval.

## Folder scaffold

```
research/YYYY-MM-DD-<slug>/
├── README.md            # Type: litreview
├── PLAN.md              # research questions, provided corpus, search angles, inclusion criteria
├── sources.md           # every source S1..Sn, with provenance (provided | found) + date
├── corpus/              # user-supplied PDFs/reports — GITIGNORED (copyright/size/PII)
├── evidence.md          # VERIFIED evidence base: extracted claims, verdict, confidence, source IDs
└── SYNTHESIS.md         # themes → design implications (created at synth time)
```

- **`evidence.md`** is the litreview analogue of benchmark's `platforms/*/notes.md`
  — the distilled, fact-checked harness output that `/synth-findings` consumes. It
  records confirmed claims (with confidence + `[S#]` source IDs) and keeps refuted /
  weak claims in a separate section so they never leak into findings.
- **`corpus/`** holds the user's supplied documents locally but is **gitignored**, so
  copyrighted source PDFs are never committed. `sources.md` is the committed record of
  what was used and where it came from.

## New command: `/gather-evidence`

The instrument step. Behaviour:

1. Read the approved `PLAN.md` (research question(s), provided corpus list, search
   angles, inclusion criteria) and the `README.md` goal.
2. Read any documents in `corpus/` as anchor sources.
3. Build `deep-research` args from the research question + corpus context and run the
   `deep-research` workflow (fan-out search → fetch → 3-vote adversarial verify).
4. Write **`sources.md`** (every source as `S1..Sn`, provenance = `provided | found`,
   date accessed) and **`evidence.md`** (confirmed claims with confidence + source IDs;
   refuted/weak claims in a separate section).
5. Update the README `## Log`.

Runs after the plan gate, never before.

## Synthesis format (litreview branch of `/synth-findings`)

`SYNTHESIS.md` reuses the `AUDIENCE-CONTEXT.md` shape:

```
## TL;DR
## Theme 1 — <name>
  - Finding (confidence: High) — cited [S3][S7]
  - Finding (confidence: Med)  — cited [S2]
## Theme 2 — ...
## Design implications (numbered)
## Refuted / weak claims
## Evidence gaps for primary research
## Sources table (S1..Sn)
```

Rules: every finding traces to a source in `evidence.md`; confidence labels are
honest; refuted claims are excluded from findings (surfaced only in their own
section); no generalization beyond what sources support; no fabricated sources or
findings.

## Quality gates (persona adaptations — inputs extend, specs unchanged)

- **Principal Researcher Mode A** (in `/new-research`): reviews the litreview `PLAN.md`
  — are the research questions answerable from literature? are search angles + inclusion
  criteria sound? is the provided corpus relevant and credible?
- **Principal Researcher Mode B** (in `/synth-findings`): adapted QA — every claim
  traces to a source, confidence labels honest, refuted claims excluded from findings,
  no over-generalization, source credibility checked. (For a study that *is* literature,
  the mode's usual "validate rationale against external research" becomes "validate each
  finding against its own cited evidence base.")
- **Principal Designer** (in `/close-research`): kept for litreview, but harvests
  **evidence-based design principles** into `PATTERNS.md` instead of UI patterns. It
  must **not force UI patterns where there are none** — a litreview study often has no
  interface to observe. If the synthesis yields no genuine, evidence-grounded principle,
  it records that plainly and adds nothing to `PATTERNS.md`; it never invents a pattern
  to fill the slot.

## Edits to existing commands

- **`/new-research`** — accept `--type litreview`; scaffold the tree above; draft the
  litreview `PLAN.md`; run Principal Researcher Mode A; on approval, direct the user to
  `/gather-evidence`.
- **`/synth-findings`** — add the litreview branch (read `evidence.md` + `sources.md`;
  themes → implications; Mode B adapted).
- **`/research-board`** — render litreview studies on the board.
- **`/publish-research`** — verify `corpus/` is gitignored before pushing
  (belt-and-suspenders with `.gitignore`).
- **`/brief-feature`, `/draft-spec`, `/design-prototype`** — already read `Type:`;
  litreview naturally feeds `/brief-feature`. They need only *tolerate* the new type; no
  new branch required for v1.

## Doc & config edits

- **`CLAUDE.md`** — intro "two kinds of research" → three; add a `litreview` row to the
  **Research types** table (instrument: `/gather-evidence` / deep-research; middle:
  `corpus/` + `evidence.md`; synthesis: themes → implications); add `/gather-evidence`
  to the **Workflow commands** table; add a short **Litreview sourcing standards**
  subsection (provided docs → gitignored `corpus/`; every source logged with provenance;
  verified via deep-research; honest confidence; no fabrication).
- **`.gitignore`** — add `research/*/corpus/`.

## Explicitly out of scope

- No changes to the benchmark or usability flows or their outputs.
- No changes to persona *specs* (only Mode A/B *inputs* extend to litreview).
- No `litreview`-specific branch in `/draft-spec` or `/design-prototype` for v1.
- No migration of the existing `AUDIENCE-CONTEXT.md` into a standalone litreview study
  (optional future cleanup, not part of this work).
- `survey` and `abtest` remain planned/unimplemented.

## Success criteria

- `/new-research --type litreview "<topic>"` scaffolds the tree, drafts a plan, passes
  the Mode A gate, and marks the study active.
- `/gather-evidence` produces a committed `sources.md` + `evidence.md` from a mixed
  corpus, with refuted claims quarantined.
- `/synth-findings` produces a themes → implications `SYNTHESIS.md` that passes Mode B.
- `/close-research` merges evidence-based principles into `PATTERNS.md`.
- Benchmark and usability studies behave exactly as before.
