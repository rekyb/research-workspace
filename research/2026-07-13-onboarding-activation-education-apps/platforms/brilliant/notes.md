# Brilliant — Onboarding Notes & Analysis

**Surface:** desktop web, logged-out. Captured 2026-07-13. `brilliant.org` → `/welcome/?cta_persona=learner` → `/signup`.
**Variant caveat:** one observed variant/session.
**Capture note:** `flow.gif` is 3.6 MB (marginally over the ~3 MB guideline; no lossless GIF tooling available on this machine — optimize at publish time if needed).

## Scored against the six moments (0–2)

| # | Moment | Score | How Brilliant does it |
|---|--------|:---:|---|
| 1 | Value framing / landing | **2** | "A world-class tutor for every home" + credibility ("MIT and Harvard") + a live interactive product visual. Clear learner/parent role split. |
| 2 | Account creation | **1** | Walled **after** the full questionnaire (not before like Khan, not after first lesson like Duolingo). Framed as "discover your learning plan." Google/email + ToS. |
| 3 | Personalization intake | **2** | The deepest of the five: motivation, tutor voice, subject, level, start point, daily goal, schedule (~10 steps), mascot-guided, icon-first. |
| 4 | Placement / advanced routing | **2** | **Two-stage:** (a) level self-select where each option is a *worked problem*; (b) an adaptive start-point recommendation that respects an advanced pick while nudging foundations. |
| 5 | Path assignment | **2** (inferred) | Intake → a recommended course/plan ("discover your learning plan"); the concrete plan is gated behind the account. |
| 6 | First-task guidance | n/a | Gated behind account + paywall; not observable logged-out. |
| ★ | First win (activation) | — | Most deferred of the five — behind both an account wall and a subscription paywall. Not reached. |

## Patterns worth synthesizing (why they work)

1. **Level selection by *worked problem*, not by label — the standout, and directly serves all three of our user types.** Each level card shows an actual problem (`5 × ½` → integral) plus a topic name plus a first-person "I can…" statement. A low-literacy or non-native user recognizes the *math* without reading a level description; an advanced user instantly spots their tier; a novice isn't shamed by jargon. This is a more accurate and more inclusive alternative to Duolingo's signal-bar self-rating — steal it for any skill-placement step. *Evidence: `05`.*

2. **Adaptive routing that respects autonomy.** After an advanced self-pick, Brilliant *recommends* a foundation course (marked RECOMMENDED) but still lets the user jump straight to the hard content. This threads the needle: guidance for those who want it, no forced backtracking for the confident. *Evidence: `06`.*

3. **Personalizing the *tutor*, not just the content.** Choosing Koji's voice (Melodic/Deep) and meeting the mascot before any question makes the AI tutor feel *chosen and owned*, and primes the audio/voice feature. A cheap step with outsized emotional payoff. *Evidence: `03`.*

4. **Anxiety-reducers woven through the flow.** "You can make progress in both subjects later on" (choice isn't final), "I'm here to help if you ever get stuck" (support exists), and continuous mascot narration lower the stakes of each decision — valuable for low-context, first-time learners.

5. **Value/credibility interstitials between questions.** "Built by the best minds in education," "We have everything you need" — brief reinforcement screens sustain motivation across a long questionnaire and justify the effort being asked.

## The cautionary contrast (what to weigh)
- **Depth vs. time-to-value.** Brilliant's ~10-step intake produces a very tailored plan but pushes the first real "win" behind the longest funnel of the five *plus* an account wall *plus* a paywall. For our low-tech-literacy / low-context learners (who disengage quickly — recall "Start Now felt like an ad"), this much upfront investment before any payoff is risky. The lesson: **borrow Brilliant's level-by-problem selector and autonomy-respecting routing, but keep the funnel short and let a real win land before the wall** (Duolingo's instinct).
- Brilliant validates the advanced-user half of our goal strongly; it is the weakest of the five on *time-to-first-win* for a low-context novice.

## Where mobile would diverge (desktop-capture caveat)
- On mobile the questionnaire is one full-screen question per step (Brilliant's app mirrors this closely); the desktop centered-card layout already resembles mobile, so this flow travels well.
- The tutor-voice step depends on audio autoplay, which mobile browsers/OS often block until interaction — the "turn up your volume" hint matters more on mobile.
- Role-split and level cards stack vertically; the 4-up level selector becomes a 2×2 or vertical list.

## Sources
- https://brilliant.org/ (landing + role split) — 2026-07-13
- https://brilliant.org/welcome/?cta_persona=learner (mascot + personalization questionnaire: motivation, voice, subject, level, start point, daily goal, schedule) — 2026-07-13
- https://brilliant.org/signup/?cta_persona=learner (account wall — "discover your learning plan") — 2026-07-13
