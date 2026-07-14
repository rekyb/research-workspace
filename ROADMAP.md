# Roadmap

Next-step options for the workspace. Last reconciled **2026-07-15**.

- **Branch:** `feature/ux-research-expansion`, committed and pushed, **in sync with
  origin** (working tree clean apart from a new, unpublished study scaffold).
- **PR:** open at **[#4](https://github.com/rekyb/research-workspace/pull/4)** —
  "Type-aware research spine + /design-prototype workflow + onboarding benchmark
  study". Awaiting review/merge into `main`.

## Shipped (the type-aware-spine chapter — done)
- **Type-aware research spine** — one lifecycle (create → design/capture → synthesize
  → review → close → publish) branching on `--type` (`benchmark`, `usability`).
- **Pattern library** (2026-07-13) — `research/PATTERNS.md`, grown by the Principal
  Designer (Mode P) on `/close-research`.
- **Research board** (2026-07-13) — `BOARD.md` + `/research-board`.
- **Benchmark analysis lenses** (2026-07-13) — `/heuristic-eval`, `/a11y-audit`,
  `/extract-tokens`.
- **`/draft-spec`** (2026-07-14) — build-ready `SPEC.md` off a reviewed synthesis;
  Principal Designer **Mode S**.
- **`/design-prototype`** (2026-07-14) — clickable HTML prototype published as a
  claude.ai Artifact, audited against the design gates; Principal Designer **Mode T**.
  `--fidelity lo|hi` + à-la-carte `--gate`.
- **Onboarding & activation benchmark study** (2026-07-15) — 5-platform benchmark
  published to GitHub (PII gate passed on all 38 captures).

---

## North star — from "research workspace" to **R&D Toolkit**

Today the toolkit is strong on the *back half* of the research arc: **secondary
research** (benchmarking), **evaluative** primary-research planning (usability =
testing something that exists), and **design outputs** (brief / spec / prototype).

The next chapter widens it to a **portable R&D Toolkit** covering the full arc —
**discover → synthesize → design → validate** — that works from *your own data*, not
only observed products, and installs into any project as a plugin. Themes A and B below
map the active ideas; theme C is complementary leverage.

> **Set aside:** a standalone user-flow / IA drafter (an earlier idea) is **not**
> planned — `/draft-spec` already emits both a Mermaid user flow and an IA, so a
> separate drafter would duplicate that source of truth.

## A. Portability & packaging *(user idea 1 — the enabler)*

Repackage the workspace as an installable **Claude Code plugin** ("R&D Toolkit").
The real work is **separating the engine from the content**:

- **Engine (ships in the plugin):** `.claude/commands/`, `.agents/skills/`,
  `.claude/personas/`, `.claude/scripts/`, `.claude/references/`, and the CLAUDE.md /
  GEMINI.md operating guides.
- **Content (stays in the consuming project):** `research/`, `.active-research`,
  `BOARD.md`, `research/PATTERNS.md` — per-project state, never bundled.
- Add a plugin/marketplace **manifest**, semantic **versioning**, and per-`--type`
  **scaffold templates** so `/new-research` works in a fresh project with no research
  history.
- Decide the **rename/scope**: "R&D Toolkit" only earns the name if it spans product /
  market / technical R&D, not just UX. Keep the UX-designer voice as the default
  persona, but make the guardrails and personas configurable per install.

*Do this split first — every capability below then ships cleanly and installs anywhere.*

## B. Primary-research expansion *(user idea 3 + the generative gap)*

Fill the *front half* of the arc. Surveys and A/B tests are already stubbed as planned
`--type`s; formalize them and add generative + data capabilities:

- **`survey` type** — `/plan-survey` instrument (non-leading items, scale design,
  screening/branching, target-n) + a survey-synthesis template. Principal Researcher
  methodology gate, like `/plan-usability`.
- **`abtest` type** — `/plan-abtest`: hypothesis, variants, **primary vs guardrail
  metrics**, a real **power / sample-size / duration** calc, and a read-out template.
- **`/plan-interview`** *(new — closes the biggest gap)* — a generative discovery
  interview guide. The toolkit can plan *evaluative* research (usability) but nothing
  *generative*; this is the missing front door.
- **`/synth-data`** *(user idea 3c — highest-leverage new capability)* — synthesize
  from *raw data the user brings*, not captures:
  - **Quantitative** — ingest CSV / event logs / survey exports; via **pandas** compute
    funnels, cohorts, drop-off, significance → an evidence-graded synthesis.
  - **Qualitative** — interview / transcript synthesis: thematic coding, affinity
    clustering, verbatim evidence (pseudonymized).
  - Strong PII posture: pseudonymize participants (P01…), redact identifiers on ingest,
    keep raw data in the gitignored working dir — same guardrail as capture PII.
- **Persona / JTBD synthesis** *(new)* — derive personas and jobs-to-be-done from that
  primary data as a first-class synthesis output.

## C. Compounding knowledge & loop closure *(complementary leverage)*

- **Instrumentation planner** *(new candidate)* — turn each synthesis's "how to
  validate" field into a concrete event / funnel / metric measurement plan.
- **Cross-study search / index** — semantic search over every `SYNTHESIS.md` +
  `PATTERNS.md`, so accumulated research compounds instead of scattering.
- **Close the design→test loop** — run a **usability study on the `/design-prototype`
  output itself** (the generated prototype becomes the study stimulus): research →
  design → test → iterate, entirely inside the toolkit.
- **Competitive-matrix lens** *(candidate)* — a multi-competitor positioning / feature
  matrix, broader than the current single-feature benchmark teardown.
- **Unified report export** *(candidate)* — one deliverable combining synthesis +
  lenses + spec for a stakeholder handoff.

---

## Near-term (independent of the big themes)
- **Merge PR #4** into `main` (review or direct merge).
- **Run a *real* usability study** — the one lifecycle step never exercised for real
  (fielding needs live participants): `/new-research … --type usability` →
  `/plan-usability` → field externally (P01…) → `/synth-findings` → `/review-research`
  → `/close-research`.
- **Run `/design-prototype`** against the onboarding study to close the
  research → prototype loop for the first time.

## Recommended sequence
1. Merge PR #4.
2. Land **Theme A** (engine/content split + plugin packaging) — it de-risks and
   accelerates everything after it.
3. Then pick a capability slice by demand: **`/synth-data`** (B) if you have real data
   waiting, or **`/plan-interview` + survey/abtest** (B) to open generative research.
4. Exercise it end-to-end on a real study (usability fielding, or data synthesis).
