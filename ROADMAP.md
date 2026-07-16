# Roadmap

Next-step options for the workspace. Last reconciled **2026-07-17**.

- **PRs #4 and #5:** Both **merged into `main`** (`#4` = `b06a393`, `#5` = `25be809`). The type-aware spine, the **multiple-active-studies** model, and the **peer-review debate** rework are all upstream in `main`.
- **Current Workspace State:**
  - **Unstaged cleanups:** 15 deleted legacy `prototype/...` files (old landing pages and design-system drafts) still pending a stage/commit.
  - **Active research studies:** Two untracked studies in `research/` (`2026-07-14-ai-literacy-upskilling-indonesian-teachers` and `2026-07-16-indonesian-teacher-onboarding-literature`) plus untracked `design/genggam-ai/` UX specs — none committed yet.
  - **`litreview` research type — design-only:** The design spec (`docs/superpowers/specs/2026-07-16-litreview-research-type-design.md`) exists, but the type is **not implemented**: no `/gather-evidence` command/skill, no `litreview` branch in `CLAUDE.md` / `GEMINI.md` / `/synth-findings`, and the `2026-07-16` study is typed `benchmark` (not `litreview`, using `platforms/` folders as evidence pillars). Nothing is scaffolded against the type yet.

## Shipped (the type-aware-spine chapter — done)
- **PR #4 Merged into `main`** — Full expansion of the UX-research workspace including the type-aware research spine, `/draft-spec`, `/design-prototype` workflow, benchmark analysis lenses, and published onboarding benchmark (`2026-07-13`).
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

### The engine chapter (PR #5, merged 2026-07-17)
- **Multiple concurrent active studies** — two-layer model: a multi-line
  `.claude/.active-research` registry + per-terminal
  `.claude/.current-research/<session-id>` bindings, resolved by the shared rule in
  `.claude/references/active-research.md`; new **`/focus-research`**. Retires the
  `.active-research-2` stopgap and ends the BOARD/pointer drift.
- **Peer-review debate** — `/review-research` becomes a moderated debate
  (Skeptic / Domain Expert / Evidence Auditor, Principal Researcher **Mode C**) that
  strengthens findings and records a `## Peer Review` section. The stakeholder review
  (PM / Tech Lead / Head of Product) moves to `/draft-spec`, whose hard gate now accepts
  `## Peer Review` (or legacy `## Agent Review`).

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

## Current Diagnostics & Architectural Suggestions (2026-07-16 Review)

From our workspace audit on 2026-07-16, four immediate technical debt and architectural stabilization items were identified:

1. **Multiple-Active Study Support & `BOARD.md` Drift:** ✅ *Resolved 2026-07-16; merged to `main` via PR #5 (`25be809`) on 2026-07-17.*
   - The workspace now formally supports several active studies via a two-layer model — a multi-line `.claude/.active-research` **registry** plus per-terminal `.claude/.current-research/<session-id>` bindings, resolved by the shared rule in `.claude/references/active-research.md`. The stopgap `.claude/.active-research-2` pointer is retired and both studies are registered cleanly. See `docs/superpowers/specs/2026-07-16-multiple-active-research-design.md`.
2. **Complete the `litreview` Research Type Implementation:** *(design-only — nothing implemented)*
   - The `litreview` design spec (`docs/superpowers/specs/2026-07-16-litreview-research-type-design.md`) exists, but the type is unbuilt end-to-end: no `/gather-evidence` command/skill, and `litreview` appears nowhere in `CLAUDE.md`, `GEMINI.md`, or `/synth-findings`. The `research/2026-07-16-indonesian-teacher-onboarding-literature` study that was meant to exercise it is typed **`benchmark`**, not `litreview` (it reuses `platforms/` folders as evidence pillars) — so no study is actually scaffolded against the type.
   - **Recommendation:** Build `/gather-evidence` in `.claude/commands/gather-evidence.md` and `.agents/skills/gather-evidence/SKILL.md`, add `litreview` branch logic to `CLAUDE.md`, `GEMINI.md`, and `/synth-findings`, and re-type the `2026-07-16` study to `litreview` once the type exists.
3. **Clean Up Working Tree & Stale Prototype Artifacts:**
   - There are 15 unstaged deletions (`prototype/...` landing pages and design-system drafts) and untracked `design/` experiment folders.
   - **Recommendation:** Cleanly stage the deletions and `.gitignore` or commit any experimental folders so `git status` remains pristine for research evidence commits.
4. **Accelerate Theme A (Engine vs. Content Decoupling):**
   - As more study types and studies accumulate, the coupling between core tooling (`.claude/`, `.agents/`) and data (`research/`) creates friction.
   - **Recommendation:** Prioritize extracting the R&D Toolkit engine into a portable plugin to allow fresh project installs without historical research baggage.

---

## Near-term (independent of the big themes)
- **Complete `litreview` & resolve active-study collision** (see Diagnostics above).
- **Stage/commit working tree cleanups** — remove stale `prototype/...` files and track `design/genggam-ai/` specs.
- **Run a *real* usability study** — the one lifecycle step never exercised for real
  (fielding needs live participants): `/new-research … --type usability` →
  `/plan-usability` → field externally (P01…) → `/synth-findings` → `/review-research`
  → `/close-research`.
- **Run `/design-prototype`** against the onboarding study to close the
  research → prototype loop for the first time.

## Recommended sequence
1. **Stabilize & Clean Up (`Immediate`):** ~~Resolve `.active-research-2` multi-study drift~~ (done — multi-active model shipped), cleanly stage `prototype/` deletions, track `design/` specs, and complete the missing `/gather-evidence` command/skill for `litreview`.
2. **Land Theme A (Engine vs. Content Decoupling):** Extract `.claude/` and `.agents/` into a portable R&D Toolkit plugin so fresh projects don't carry previous study data (`research/`).
3. **Expand Capability by Demand (Theme B):** Build **`/synth-data`** if real quantitative/qualitative data is waiting, or **`/plan-interview` + survey/abtest** to open generative discovery research.
4. **Exercise End-to-End on a Real Study:** Run a full usability study fielding or data synthesis pass through the new toolkit.
