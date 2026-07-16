# Platform / Literature Notes: Deferred vs. Upfront Mobile App Onboarding

## Source Overview
- **Category:** Industry UX Benchmarks & Empirical Retention Studies
- **Primary Targets:** Mobile app onboarding funnels, activation rates, Day-1/Day-7/Day-30 retention across Android and iOS.
- **Key Sources:**
  - AppsFlyer / CXL / UXCam Mobile Onboarding Benchmark Reports (2024–2026)
  - Progressive Disclosure UX Studies (Nielsen Norman Group & LinkRunner benchmarks)

## Empirical Evidence & Findings
1. **Upfront Registration Wall Friction:** Industry benchmark analysis confirms that forcing a mandatory account registration screen immediately upon app opening ("wall-first onboarding") results in an average **drop-off rate between 25% and 40%** during the first session. On low-end Android devices with intermittent network connectivity, multi-field email signup forms suffer even higher abandonment rates due to cognitive load and password fatigue.
2. **Try-First / Progressive Disclosure Lifts Retention:** Apps that defer registration until the user reaches an initial "aha moment" (e.g., completing a first interaction or task) demonstrate up to a **35% increase in Day-7 (D7) and Day-30 (D30) retention**. By experiencing core product value first, users build trust and motivation that overcomes the subsequent friction of signing up.
3. **Frictionless Android Auth Methods:** Where registration is eventually triggered, providing 1-click **Google Sign-In** and **WhatsApp/SMS OTP** reduces form-completion time by ~70% compared to traditional email/password forms, directly reducing mid-funnel drop-off.

## Key Takeaways for Android App Design
- **Zero upfront walls:** Landing page must feature one single, high-contrast action (`Mulai Belajar`) asking for no credentials.
- **Progressive onboarding:** Collect only minimal context (`Jenjang & Subject`) via tap-friendly icon buttons, then immediately drop the user into Module 1.
- **Frictionless auth:** Provide 1-tap Google login and WhatsApp OTP when triggering the post-Module 1 save prompt.
