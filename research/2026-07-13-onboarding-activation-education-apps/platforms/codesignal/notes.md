# CodeSignal (Learn) — Onboarding Notes & Analysis

**Surface:** desktop web, logged-out. Captured 2026-07-13.
**Capture limitation (important):** CodeSignal Learn gates its onboarding — including the signature **AI skill-assessment placement (Cosmo)** — behind full account creation. Per user decision (2026-07-13) we documented the gate rather than creating an account, because Duolingo and Brilliant already provide two strong, distinct advanced-routing exemplars. So the scores below cover the **observable logged-out surface only**; the assessment is noted as gated, not evaluated.
**Variant caveat:** one observed variant/session.

## Scored against the six moments (0–2) — logged-out surface only

| # | Moment | Score | How CodeSignal does it (observable) |
|---|--------|:---:|---|
| 1 | Value framing / landing | **1** | Catalogue-first ("Turn screen time into skills time", Cosmo). Clear, but the primary CTA jumps straight to signup — no low-commitment taste. |
| 2 | Account creation | **0** | **Heaviest upfront wall of the five.** Full name + email + password form (plus SSO/Apple/Google/Facebook) demanded before any content or assessment. No guest path. |
| 3 | Personalization intake | — (gated) | The assessment/intake is behind the wall; not observable. |
| 4 | Placement / advanced routing | — (gated) | CodeSignal's signature AI-assessment placement (Cosmo) is account-gated; **not captured**. |
| 5 | Path assignment | **1** | Catalogue is **topic-collection organized** (Generative AI, Interview Prep, Learn to Code, Data Science…), browsable logged-out; the personalized path is gated. |
| 6 | First-task guidance | — (gated) | Not observable. |
| ★ | First win (activation) | — | Behind the account wall; not reached. |

## Patterns worth synthesizing (from the observable surface)

1. **The account-first anti-pattern, in its strongest form — a clear cautionary data point.** CodeSignal demands a full name/email/password form before any value is shown. For our low-tech-literacy, low-context, often email-less learners this is the highest-friction possible entry — the exact failure mode we're designing against. It reinforces the synthesis line: **whatever placement/assessment sophistication a platform has is wasted if it sits behind a cold registration wall.** (CodeSignal reportedly has excellent assessment-led placement; we couldn't reach it precisely because the wall blocks it — which *is* the lesson.)

2. **Topic-collection catalogue organization (vs. Khan's grade organization).** For a mixed-audience product, collections by *goal/topic* (Interview Prep, Learn to Code, Data Science) is an alternative to grade bands — worth noting as a catalogue-structuring option, though it still leaves the "which is mine?" burden without routing.

3. **Assessment-led placement (inferred, not observed).** CodeSignal's model — an adaptive skill assessment that places you into a path — is the purest "test-first" alternative to Duolingo's self-select and Brilliant's problem-recognition. We could not capture it; noting it as a known pattern to revisit only if the user provides access.

## The takeaway for our product
- CodeSignal is the **cautionary bookend** to Duolingo: same category (skill placement) but the opposite onboarding philosophy (wall-first vs. try-first). Its inclusion sharpens the synthesis contrast even though its interior was gated.
- **Do not replicate the wall-first entry.** If we build assessment-led placement, it must live *inside* a guest session (Duolingo's model), not behind a signup form.

## Where mobile would diverge (desktop-capture caveat)
- CodeSignal Learn is heavily promoted as a mobile app ("Turn screen time into skills time", app-store badges on the catalogue); the mobile app onboarding may differ from this web signup wall and may lead with the assessment. Not captured. Worth flagging that our desktop-web view may understate the mobile-app experience for this platform specifically.

## Sources
- https://codesignal.com/learn/course-paths (catalogue, logged-out) — 2026-07-13
- https://identity.codesignal.com/auth/signup (account-creation wall reached via "Start learning") — 2026-07-13
