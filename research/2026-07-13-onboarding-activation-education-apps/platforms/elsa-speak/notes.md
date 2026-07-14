# Elsa Speak — Onboarding Notes & Analysis

**Surface:** desktop web, `id.elsaspeak.com` (Indonesian, geo-redirected), logged-out. Captured 2026-07-13.
**Verify-first outcome (per PLAN must-fix #3):** Elsa is app-first; the web is marketing. However a **real web speaking-assessment widget** exists and was captured, plus marketing mockups of the app onboarding. Scores below reflect the observable web surface + what the mockups depict; the full in-app flow is noted as gated.
**Guardrail:** a Flash Sale subscription paywall is prominent — **not transacted**.
**Variant caveat:** one observed variant/session; geo = Indonesia.

## Scored against the six moments (0–2) — web surface + mockups

| # | Moment | Score | How Elsa does it (observable) |
|---|--------|:---:|---|
| 1 | Value framing / landing | **2** | Leads with the core promise (free speaking assessment) and *proves it* with a working web mic test. Fully localized (Indonesian). Paywall is loud, though. |
| 2 | Account creation | — (app) | Web has no guest content flow; the app handles account/onboarding. The web test runs with no signup (good), but funnels to download. |
| 3 | Personalization intake | **1** (mockups) | Depicted in mockups: coach pick, recommended lesson, IELTS vs Real-life paths. Not interactable on web. |
| 4 | Placement / advanced routing | **2** (partial) | The **pronunciation assessment itself is the placement** — speak a sentence, get scored ("Advanced 84%"), and content adapts. Assessment-led, like CodeSignal, but you experience it *before* any wall. |
| 5 | Path assignment | **1** (mockups) | Mockups show a "Terekomendasi" personalized lesson + path choice; the real assignment is in-app. |
| 6 | First-task guidance | **1** | The web test *is* a guided first task (sentence + audio model + record); clear record-state feedback. But mic fires with no priming. |
| ★ | First win (activation) | — | On web, "first win" = getting your pronunciation score. We triggered the mic but didn't complete a scored read (silent clip); the scored-result screen is shown only as a mockup. |

## Patterns worth synthesizing (why they work)

1. **Prove the core value *before* the wall — an embedded, working assessment.** Elsa's marketing page contains a real "speak this sentence → get scored" test. The user experiences the product's central magic (AI pronunciation scoring) with zero signup or download. For a 0-to-1 product, this "playable demo" pattern is a powerful acquisition + activation hook — and it doubles as placement. *Evidence: `03`.*

2. **Assessment-as-onboarding (like CodeSignal) but *un-gated*.** Where CodeSignal hides its assessment behind a signup wall, Elsa lets you take the assessment first and *then* asks you to sign up/download to keep your results. This is the better sequencing for our audience — the exact "let a real win land before the wall" principle, applied to a placement test. *Evidence: `02`, `03`.*

3. **Deep localization — the most audience-relevant finding of the five.** The entire experience (nav, value prop, feature claims, CTAs) is in Indonesian, on a geo-detected `id.` subdomain. For our low-tech-literacy Indonesian ESL learners, native-language onboarding is not a nicety — it is the difference between comprehension and abandonment (recall our dictionary/English-definition pain). Elsa models what full localization looks like end to end.

4. **Clear recording-state feedback.** The mic button's blue→green color change unambiguously signals "now recording," important for low-tech-literacy users who need obvious system-state cues.

## The cautionary contrast (what to weigh)
- **No permission priming.** The web mic fires the raw capture on click with no rationale-first screen. In this pre-granted browser profile no prompt even appeared, but on a real first-time device this is precisely the cold OS permission prompt that stranded our learners (our device-permission dead-end). Elsa is *weaker* than Duolingo here — a reminder that assessment-led speaking onboarding **must** pair with permission priming + a graceful "can't speak now" fallback (Duolingo's pattern), especially on mobile.
- **Paywall-forward.** The subscription push is aggressive; for our free 0-to-1 context, borrow the playable-assessment hook, not the immediate monetization.

## Where mobile would diverge (desktop-capture caveat)
- **This is the platform where our desktop-web view most understates reality:** Elsa's true onboarding is the **native app**, which we could not run. The web captures are the marketing surface + a web test; the app's coach-pick → scored-placement → personalized-plan flow is only seen as mockups (`02`). App-store listings would show more onboarding screens.
- On mobile the mic permission is an **OS-level** prompt (higher-stakes than a browser prompt) — reinforcing pattern-critique #1 above (priming matters most exactly where we can't see it here).

## Sources
- https://id.elsaspeak.com/ (localized marketing landing + paywall) — 2026-07-13
- https://id.elsaspeak.com/english-test/ (app-onboarding mockups + real web speaking assessment with mic) — 2026-07-13
