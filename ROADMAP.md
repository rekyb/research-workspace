# Roadmap

Next-step options for the research workspace. Last reconciled **2026-07-15**.

- **Branch:** `feature/ux-research-expansion`, committed and pushed, **in sync with
  origin** (working tree clean).
- **PR:** open at **[#4](https://github.com/rekyb/research-workspace/pull/4)** —
  "Type-aware research spine + /design-prototype workflow + onboarding benchmark
  study". Awaiting review/merge into `main`.

## Shipped since this file was written
- **Pattern library** (2026-07-13) — `research/PATTERNS.md`, backfilled across the
  closed studies by the Principal Designer (Mode P); grows on `/close-research`.
- **Research board** (2026-07-13) — `BOARD.md` + `/research-board`, auto-refreshed by
  `/new-research` and `/close-research`.
- **Benchmark analysis lenses** (2026-07-13) — `/heuristic-eval`, `/a11y-audit`,
  `/extract-tokens`: retrospective, captures-grounded passes writing to `lenses/`.
- **`/draft-spec`** (2026-07-14) — build-ready `SPEC.md` (functional requirements,
  Mermaid user flow + IA, screen list, traceability) off a reviewed synthesis; gated
  by the Principal Designer **Mode S**. Run once against the onboarding study.
- **`/design-prototype`** (2026-07-14) — the formalized prototype step (see option 3,
  formerly `/prototype-feature`): turns a synthesized study into a clickable,
  self-contained HTML prototype published as a claude.ai Artifact, generated and
  audited against the design gates (`.claude/references/design-gates.md`); gated by the
  Principal Designer **Mode T**. Supports `--fidelity lo|hi` and à-la-carte `--gate`.
- **Onboarding & activation benchmark study** (2026-07-15) — 5-platform benchmark
  published to GitHub (PII gate passed on all 38 captures).

## 1. Open the PR (smallest step) — ✅ done
PR **[#4](https://github.com/rekyb/research-workspace/pull/4)** is open against `main`,
covering the type-aware spine, the usability workflow, the design-output steps
(`/brief-feature`, `/draft-spec`, `/design-prototype`), the benchmark lenses, and the
published onboarding study. Next: review and merge (or merge directly).

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
- ~~**`/draft-spec`** — build-ready `SPEC.md` off a reviewed synthesis.~~ **Built**
  (2026-07-14), gated by the Principal Designer **Mode S**.
- ~~**`/prototype-feature`** — turn a synthesis into an FR spec + interactive HTML
  prototype, gated by the Principal Designer.~~ **Built** (2026-07-14) as
  **`/design-prototype`**: a clickable, self-contained HTML prototype published as a
  claude.ai Artifact and audited against the design gates, gated by **Mode T**. Closes
  the loop research → testable design → usability test. Not yet run against a real study.
- **`survey` / `abtest` research types** — the last unbuilt slice: wire them into the
  spine the same way usability was (a `--type` value + a method-specific plan command
  + a type-aware synthesis template). Turns the 2-type spine into 4.

## Recommended sequence
PR #4 is open (option 1 done). Next: review/merge it, then choose fresh work — run
`/design-prototype` against the onboarding study to close the research → prototype
loop, ship a real usability study (2), or build the last slice (3 — the `survey` /
`abtest` research types).
