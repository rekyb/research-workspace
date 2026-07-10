# Roadmap

Next-step options for the research workspace, captured after the type-aware
research spine (usability studies) landed on `feature/ux-research-expansion`.

- **Status of that branch:** pushed, working tree clean. PR not yet opened.
- **PR link GitHub is holding open:**
  `https://github.com/rekyb/research-workspace/pull/new/feature/ux-research-expansion`

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
  **Built** (2026-07-10): `.claude/commands/brief-feature.md`, gated by the Principal
  Designer **Mode R** (now wired, not stubbed). Not yet run against a real study.
- **Deeper benchmark lenses** — `heuristic-eval`, `a11y-audit`, `extract-tokens`.
- **`survey` / `abtest` research types** — wire them into the spine the same way
  usability was (a `--type` value + a method-specific plan command + type-aware
  synthesis template).
- ~~**Principal Designer Mode R** — the design-output review half of the persona.~~
  **Built** (2026-07-10) alongside `/brief-feature`; Mode P (pattern extraction,
  wired into `/close-research`) was already built.

## Recommended sequence
Open the PR now (option 1) so the work is reviewable and mergeable, then choose
between shipping a real study (2) or building the next slice (3) as fresh work.
