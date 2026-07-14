# Research: Onboarding & Activation in Education Apps

- **Status:** Closed
- **Type:** benchmark
- **Started:** 2026-07-13
- **Closed:** 2026-07-13
- **Researcher:** Claude (acting Senior UI/UX Designer)

## Goal
Benchmark how best-in-class education apps design their **onboarding-to-activation**
flow, to inform the onboarding for a new 0-to-1 learning product. This is
**observation feeding a build decision**: the synthesis directly informs our own
onboarding design (planned model: *goal → level → profile → personalized path*).

The guiding question: *how do best-in-class ed apps calibrate a single onboarding
flow so a low-context novice feels guided while an advanced user isn't patronized —
and how much personalization do they extract before the user reaches their first
"win"?* We are designing for three user types at once: **low tech-literacy**,
**low-context** (first-time / no facilitator present), and **advanced** learners.

Grounded in prior internal v1 interviews (kept in gitignored working data, not
committed). The recurring problem shapes worth benchmarking against: the primary CTA
being mistaken for an ad/banner rather than an action; learners who arrive via a
class/program link being dropped into a full catalogue instead of their assigned
course; sign-up requiring an email many young/low-context users don't have;
duplicate accounts from lost sessions; device-level permission prompts (e.g.
microphone) that dead-end novices; and advanced learners disengaging because there's
no way to place into a harder tier.

## Scope
**In:** the onboarding arc from **first touch → first-task activation**, captured
across six moments — (1) value-framing / landing, (2) account creation, (3)
personalization intake, (4) path assignment, (5) first-task guidance, (6)
advanced-user accommodation. Mobile-first capture; desktop noted only where the
onboarding meaningfully differs.

**Emphasis:** the **landing / first-screen value-framing** moment is treated as a
first-class teardown — it directly informs our own landing-page design (the
"CTA-mistaken-for-an-ad" problem above).

**Out:** actually designing our own landing page or onboarding (a downstream step off
this synthesis — e.g. `/brief-feature` or a separate design task); post-activation
retention loops; pricing/paywalled tiers (we never transact — see Guardrails);
primary research (this is a 0-to-1 effort leaning on secondary research; internal
interviews already done).

## Confidentiality
Committed research files stay **product-agnostic**: no internal product/program/funder
names, no internal ticket IDs, no roadmap specifics. Internal grounding lives in the
gitignored `raw-data/` working dir only. `/publish-research` re-checks before any push.

## Platforms to benchmark
- [x] Duolingo — gold-standard onboarding; goal-setting + placement + low friction — **captured**
- [x] Khan Academy — course/path structure closest to ours; grade-level routing & class-code (assigned-course routing) — **captured**
- [x] Brilliant — strong placement + difficulty-tiering onboarding (advanced-user lens) — **captured**
- [x] CodeSignal — skill-assessment / placement onboarding — **captured as gated** (account-first; assessment behind wall, by user decision)
- [x] Elsa Speak — ESL + speaking + emerging-market learners — **captured** (web = marketing + a real web speaking test; app onboarding shown as mockups)

## Log
- 2026-07-13 — research created (type: benchmark).
- 2026-07-13 — plan approved (Principal Researcher passed w/ revisions); capture surface = desktop web (labeled), mobile divergence noted per platform.
- 2026-07-13 — all 5 platforms captured (flow.gif + stills + flow.md + notes.md each; sources logged). Ready for `/synth-findings`.
- 2026-07-13 — SYNTHESIS.md written (benchmark; 10 feature write-ups). Principal Researcher Mode B QA pass: verdict *ready*; 24 em-dashes cleaned, 10/10 rationales externally validated (`references.md`; 8 direct, 2 partial, 0 contradicted), 6 precision items flagged and all resolved by researcher. Ready for `/review-research`.
- 2026-07-13 — heuristic evaluation lens run (`lenses/heuristic-eval.md`): 5 platforms vs Nielsen's 10; 7 violations (3 major, 3 minor, 1 cosmetic) + 12 exemplary patterns.
- 2026-07-13 — agent review recorded (`SYNTHESIS.md` → `## Agent Review`): PM / Tech Lead / Head of Product, chained. Consolidated: 7 Go, 3 Conditional Go, 0 No-Go. Synthesis endorsed to drive the build.
- 2026-07-13 — dual-persona review added (`REVIEW.md`, Principal Researcher + Principal Designer; APPROVED); Stage-2/F5 architecture inconsistency fixed to match the build gates.
- 2026-07-13 — **research closed.** Principal Designer (Mode P) merged patterns into `research/PATTERNS.md`: 10 onboarding patterns added, 2 existing entries strengthened, pre-win-vs-post-win extraction tension flagged. Active pointer cleared.
- 2026-07-14 — **`SPEC.md` drafted** (forward spec off the reviewed synthesis): 13 functional requirements (11 Must / 1 Could / 1 Won't), 8 screens, Mermaid user-flow + IA, traceability matrix. FR-07 and FR-08 promoted to Must (grounded in prior internal onboarding research + the speaking-task first-win decision). Principal Designer Mode S verdict: **revise → all 4 required revisions resolved** (confidentiality genericization, boundary-node labeling, code-path landing, speaking-task assumption flag). Product-agnostic; no internal specifics committed.
- 2026-07-15 — **published** to GitHub via `/publish-research` (PR [#4](https://github.com/rekyb/research-workspace/pull/4)). PII gate passed: prose scanned clean of internal specifics; all 31 screenshots + 7 GIFs (51 sampled frames) visually reviewed — no account-holder or third-party PII; no paid transaction.
