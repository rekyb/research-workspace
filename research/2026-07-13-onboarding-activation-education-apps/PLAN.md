# Research Plan: Onboarding & Activation in Education Apps

- **Status:** ✅ Approved (user, 2026-07-13) — capture in progress
- **Type:** benchmark
- **Goal it serves:** Benchmark best-in-class ed-app onboarding to inform a 0-to-1 product's onboarding, serving low-tech-literacy, low-context, and advanced learners in one flow.

## Key research questions
1. **Value framing** — How does each app justify itself and get the user to act *before* asking for anything? What makes the first CTA read as an action, not an ad?
2. **Account friction** — How little can a user commit before starting? (guest mode, deferred sign-up, email-free, social, session resume). Where is the sign-up wall placed relative to the first "win"?
3. **Personalization intake** — What does each app ask (goal, motivation, reason, self-rated level) and *how* (single-select cards, sliders, avatars)? How many taps to get through it?
4. **Placement & advanced routing** — How does each app detect skill and route an advanced user past the basics (placement test, self-select, adaptive first question) without making a novice feel tested?
5. **Path assignment** — How does intake become a concrete first course/lesson/path? How is "this is *your* path" communicated so users aren't dropped into a full catalogue?
6. **First-task guidance & low-literacy support** — How do novices get to their first win? (coach-marks, progressive disclosure, worked example, permission priming, iconography over text, localization).
7. **The calibration question** — Across all six moments, where does each app trade *speed* against *personalization depth*, and how does it serve novice and advanced users from one flow?

## Comparison framework (applied to every platform)
Each teardown is captured across the same **six onboarding moments** and given a light **0–2 score per moment** (0 = absent/poor, 1 = present/adequate, 2 = exemplary), so the synthesis compares like-for-like rather than narrating each in isolation. The score is a comparison aid, not a verdict — the evidence is what matters.

| # | Moment | What we capture |
|---|--------|-----------------|
| 1 | Value framing / landing | First screen(s) before sign-up; value prop; primary CTA clarity |
| 2 | Account creation | Guest/deferred/email-free/social options; where the wall sits |
| 3 | Personalization intake | Questions asked, input pattern, tap count, motivational framing |
| 4 | Placement / advanced routing | Placement test vs self-select vs adaptive; skip-ahead affordance |
| 5 | Path assignment | How intake → concrete first path; "this is yours" signalling |
| 6 | First-task guidance | Walkthrough style, empty states, permission priming, low-literacy aids |
| ★ | **First win (activation endpoint)** | The marked point where the user gets their first real "win" — defined per platform below. We record **taps-to-first-win** alongside taps-through-intake, so the "how much personalization before the win" question is measurable. |

**Per-platform activation endpoint (the "first win"):**
- **Duolingo** — first lesson completed (the celebratory end-of-lesson screen).
- **Khan Academy** — first exercise/video activity opened and a question answered.
- **Elsa Speak** — first pronunciation attempt recorded and scored.
- **Brilliant** — first interactive lesson step completed.
- **CodeSignal** — first practice/assessment task submitted and evaluated.

**Two user-type lenses tracked at every moment** (not just Moment 6): for each screen note (a) what a **low-tech-literacy / low-context novice** would rely on (iconography over text, worked example, no assumed prior context) and (b) how an **advanced** user is offered a shortcut past it. The novice lens is thinnest by default, so foreground it explicitly on Duolingo (zero-text first lesson) and Elsa (localization, permission priming).

## Per-platform capture plan

### Duolingo
- **Flows/screens to capture:** Launch → pre-signup value/goal screens → "I already know some…" placement path vs. start-from-zero → first lesson → the deferred sign-up wall (appears after first lesson).
- **What we're looking for:** The delayed-registration pattern; motivation/goal intake; the placement-test off-ramp for advanced users; how the first lesson teaches with zero text reliance.
- **Risks:** A/B-tested onboarding (flow may vary by session/region — note the variant seen); some screens gated behind starting; no payment needed for core onboarding.

### Khan Academy
- **Flows/screens to capture:** (a) **Organic path** — Launch → account creation → learner/teacher/parent role split → grade & subject selection → course home / "your path" landing → first activity entry. (b) **Linked/assigned-entry path (required)** — "join a class with a code" flow: what a learner sees when they enter via a class code and whether they land on their assigned course/assignment vs the full catalogue.
- **What we're looking for:** Role-based branching; grade-level routing; **how a code/link entry routes a learner to *their* assigned content** (the closest analogue to program-code routing — our biggest catalogue-vs-assigned-course pain point); how a large catalogue is narrowed to "your" starting point; course-mastery framing.
- **Risks:** Sign-up may require email/Google; capture only public/observable, redact any account PII; possible age-gate. The class-code flow may need a valid code — capture the code-entry screen and the "no code / browse instead" branch even if we can't complete a real join.

### Elsa Speak
- **Verify-first (capture feasibility gate):** Elsa is mobile-app-first. **Before committing capture effort, confirm the *web* onboarding (elsaspeak.com / web app) actually reaches level/goal intake + mic-priming.** If it does, capture it as the mobile-analogous flow. **If the onboarding is gated to the native app**, fall back to documenting the observable substitute — app-store listing screens, marketing-site onboarding walkthrough, and any public product-tour video/screens — and note the limitation explicitly in `notes.md` so the platform doesn't silently fail on its most method-specific contribution.
- **Flows/screens to capture (if web reachable):** Launch → value framing → level/goal intake → **mic-permission priming** → first speaking assessment → personalized plan reveal.
- **What we're looking for:** Permission-priming pattern (our device-level mic dead-end); pronunciation placement; how an assessment is framed as helpful not judgmental; ESL/emerging-market localization cues.
- **Risks:** Onboarding may be app-only (see verify-first above); speaking assessment may push a paid plan early (never transact — capture the free-observable portion, note the paywall in notes.md); mic access is a browser/device prompt — capture the priming screen even if we don't grant.

### Brilliant
- **Flows/screens to capture:** Launch → interest/goal selection → self-rated level or diagnostic → personalized path preview → first interactive lesson → sign-up wall placement.
- **What we're looking for:** Interest-first personalization; how difficulty tiering is offered up-front (advanced-user lens); "learn by doing" first-task design; path-preview-before-commit.
- **Risks:** Strong paywall on full paths — capture onboarding + path preview only, never start a trial; note where the wall lands.

### CodeSignal
- **Flows/screens to capture:** Launch → goal/track selection (Learn track) → skill assessment / placement → personalized starting unit → first practice task.
- **What we're looking for:** Assessment-led placement as the core mechanic (strongest advanced-user routing); how a skill result maps to a starting point; balancing an intimidating "assessment" with novice reassurance.
- **Risks:** Product spans hiring vs learning — scope to the **learner** onboarding, not recruiter; possible account wall; paid tiers (never transact).

## Capture standards (per CLAUDE.md)
- **A/B variance (standing caveat):** onboarding is A/B-tested across all five platforms, not just Duolingo. Each capture reflects **one observed variant** in one session/region — label the variant where visible and do not over-generalize a single session's flow in the synthesis.
- **Capture surface (decided 2026-07-13):** the browser automation renders a fixed ~1280px **desktop-web** viewport — true mobile emulation isn't available through these tools. All captures are **desktop web, labeled as such**; in each `notes.md` we flag where the **mobile experience would diverge** (touch targets, vertical stacking, native-app-only steps). The onboarding *logic* (question sequence, placement mechanic, deferred sign-up, path routing, CTA framing) is identical across breakpoints, so the research substance holds.
- Per platform: numbered `screenshots/`, a `flow.gif` of the core onboarding flow, a prose `flow.md`, and analytical `notes.md`; every URL logged in `sources.md`.
- **No transactions, ever.** At any paywall/trial/checkout: stop, capture what's free, note the gate in `notes.md`, tell the user.
- **Redact before capture** where a logged-in session is used (names, avatars, emails, third-party names on any social/leaderboard surface).

## Confidentiality (repo safety)
- All committed research prose stays **product-agnostic** — no internal product/program/funder names, internal ticket IDs, or roadmap specifics. Internal grounding stays in gitignored `raw-data/`.
- These teardowns are of **public competitor products**; the only PII risk is our own account data if we log in — redact per capture standards. `/publish-research` re-checks before push.

## Success criteria (what "done" looks like)
- All five platforms captured across the same six moments **plus the activation endpoint**, with screenshots + flow.gif + flow.md + notes.md each. A moment blocked by a legitimate paywall/app-gate counts as done **if the gate is captured and documented** — a documented gate is evidence, not a failure.
- Each of the seven research questions answerable from the evidence, with the novice-vs-advanced calibration explicitly contrasted across platforms, and taps-through-intake vs taps-to-first-win recorded per platform.
- The linked/class-code entry path captured (Khan primary; noted on others if surfaced).
- Enough grounded pattern evidence to feed a SYNTHESIS of onboarding features (incl. a landing/value-framing feature) our team can design against.

## Principal Researcher review
**Verdict (Mode A, 2026-07-13):** *Needs revision → addressed.* Framework and goal-traceability judged sound; three must-fixes raised and all resolved in this revision:
1. **First-win endpoint defined per platform** + taps-to-first-win added to the framework (was: activation was an unmarked phase, breaking the core personalization-before-win metric).
2. **Linked/class-code entry path added** as a required Khan capture (was: only organic self-select paths captured → our biggest routing pain point would get zero evidence).
3. **Elsa web-capture verify-first + app-only fallback added** (was: assumed a capturable web onboarding on a mobile-app-first product).
Should-considers also folded in: standing A/B-variance caveat, 0–2 per-moment scoring rubric, dual novice/advanced lens tracked at every moment, softened success criterion for documented gates.

**User approval (2026-07-13):** Plan approved; capture may begin.

**Login approach (agreed):** Logged-out/guest capture first on every platform. Where a key onboarding step is genuinely gated, stop and do a **Google login handoff** — Claude drives to the sign-in wall, the **user completes the Google auth step themselves** (credentials never handled by Claude), then capture resumes. Once logged in, redact account PII (avatar/name/email) by role/position before every capture and verify in the saved image. Decide per platform as walls are hit; start order: Duolingo (logged-out baseline) → Khan (class-code routing) → Brilliant → CodeSignal → Elsa (web-capture verify-first).
