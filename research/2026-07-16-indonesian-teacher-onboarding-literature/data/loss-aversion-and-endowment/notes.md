# Platform / Literature Notes: Loss Aversion & The Endowment Effect in Onboarding

## Source Overview
- **Category:** Behavioral Economics & HCI Empirical Research
- **Primary Targets:** Gamified learning apps, onboarding flows, psychological ownership mechanics.
- **Key DOIs:**
  - `10.1073/pnas.2202700119` (Litovsky, Loewenstein, Horn & Olivola, 2022, *PNAS* 119(34):e2202700119) — corrected 2026-07-17 from a prior miscitation ("Charpentier et al., `10.1073/pnas.2119102119`", which did not resolve)
  - `10.1089/g4h.2021.0130` (Patel et al., 2021, *Games for Health Journal*)
  - `10.28945/5549` (Silva et al., 2025, *Journal of Information Technology Education*)

## Empirical Evidence & Findings
1. **Endowment Effect for Noninstrumental Learning Progress:** Litovsky, Loewenstein, Horn & Olivola (2022) established that once individuals acquire intangible assets (like learning progress, earned points, or generated artifacts), they assign significant psychological ownership to them. The valuation of avoiding the loss of these intangible assets is higher than that of acquiring equivalent new assets. The often-cited ratio $\lambda \approx 2.2$ is illustrative and contested (2024 meta-analysis $\lambda \approx 1.955$, high heterogeneity; 2025 robustness challenge) — treat loss-framing as a *direction* (loss > gain), not a transferable magnitude.
2. **Loss Aversion Outperforms Gain-Framing in Gamified Trials:** Patel et al. (2021) conducted a behavioral gamification clinical/behavioral trial where participants were either incentivized via standard reward points (gain framing) or endowed with points upfront that they would lose upon missing daily targets (loss framing). The loss-framed cohort demonstrated statistically significant higher sustained engagement ($p < 0.001$) and completion adherence compared to the gain-framed cohort.
3. **Autonomy vs. Control in Adult Learning:** Silva et al. (2025) synthesized Self-Determination Theory (SDT) across adult online learning environments. Their findings show that while extrinsic loss-aversion prompts effectively drive *immediate completion and registration actions*, long-term intrinsic competency growth requires that rewards be framed as **informational competence recognition** rather than controlling surveillance.

## Key Takeaways for Android App Design
- Allow the user to complete `Module 1` or generate a usable classroom artifact (RPP/rubric) *before* any registration prompt is shown.
- At the exact moment of completion, trigger the signup modal with loss-aversion framing: *"Simpan progres Modul 1 Anda agar tidak hilang & klaim e-sertifikat Anda"* (Save your Module 1 progress so it isn't lost & claim your e-certificate).
- Avoid punishing or penalizing users for slow learning speed; protect their earned progress across sessions via guest token caching until they register.
