# Roadmap

Next-step options for the research workspace. Last reconciled **2026-07-13**.

- **Branch:** `feature/ux-research-expansion`, pushed and in sync with origin, **but
  the working tree is dirty** — uncommitted since the last push: the pattern library
  (`research/PATTERNS.md`, backfilled), the research board (`BOARD.md` +
  `/research-board`), the three benchmark lenses (`/heuristic-eval`, `/a11y-audit`,
  `/extract-tokens`), doc wiring, and the active `2026-07-13` onboarding study.
  Commit before opening the PR.
- **PR link GitHub is holding open:**
  `https://github.com/rekyb/research-workspace/pull/new/feature/ux-research-expansion`

## Shipped since this file was written
- **Pattern library** (2026-07-13) — `research/PATTERNS.md`, backfilled across the
  four closed studies by the Principal Designer (Mode P); grows on `/close-research`.
- **Research board** (2026-07-13) — `BOARD.md` + `/research-board`, auto-refreshed by
  `/new-research` and `/close-research`.
- **Benchmark analysis lenses** (2026-07-13) — `/heuristic-eval`, `/a11y-audit`,
  `/extract-tokens`: retrospective, captures-grounded passes writing to `lenses/`.

## 1. Open the PR (smallest step)
Open a pull request for `feature/ux-research-expansion` via the `gh` CLI, with a
description covering: the type-aware spine, the usability workflow, the guardrail
reword (desk research + primary-research planning & synthesis), and the note that
the end-to-end dry run exercised all four quality gates (they flag/reject, not
rubber-stamp). Alternative: merge the branch directly without a PR.

## 2. Run a *real* usability study
Everything in the usability lifecycle is rehearsed **except fielding** — the one
step that needs real human participants and never ran for real. A genuine first
run:

1. `/new-research "<flow> usability test" --type usability`
2. `/plan-usability` — design the `test-plan.md` instrument, pass its Principal
   Researcher methodology review
3. Field the sessions externally, bring back results (pseudonymized P01, P02…)
4. `/synth-findings` — severity-ranked findings
5. `/review-research` → `/close-research`

## 3. Build the next deferred slice
Scoped during the expansion but not built:

- ~~**`/brief-feature`** — the Canva stakeholder deck (Canva MCP is connected).~~
  **Built** (2026-07-10), gated by the Principal Designer **Mode R**. Not yet run
  against a real study.
- ~~**Deeper benchmark lenses** — `heuristic-eval`, `a11y-audit`, `extract-tokens`.~~
  **Built** (2026-07-13). Not yet run against a real study.
- ~~**Principal Designer Mode R** — the design-output review half of the persona.~~
  **Built** (2026-07-10) alongside `/brief-feature`.
- **`survey` / `abtest` research types** — the last unbuilt slice: wire them into the
  spine the same way usability was (a `--type` value + a method-specific plan command
  + a type-aware synthesis template). Turns the 2-type spine into 4.
- **`/prototype-feature`** *(new candidate)* — the design-output sibling of
  `/brief-feature`: turn a synthesis into an FR spec + an interactive HTML prototype
  bound to `prototype/design-system/`, gated by the Principal Designer. Already done
  once by hand (S1 activation); formalizing it closes the loop research → testable
  design → usability test.

## Recommended sequence
Commit the pending work and open the PR (option 1) so it's reviewable, then choose
fresh work: exercise the new lenses on the active `2026-07-13` onboarding study,
ship a real usability study (2), or build the next slice (3 — `survey` type or
`/prototype-feature`).
