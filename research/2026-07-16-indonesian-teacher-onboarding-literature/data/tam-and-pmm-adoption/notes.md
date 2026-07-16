# Platform / Literature Notes: TAM & PMM Adoption Among Indonesian Teachers

## Source Overview
- **Category:** Empirical Academic Literature (Technology Acceptance Model / TAM)
- **Primary Targets:** Platform Merdeka Mengajar (PMM), junior high (SMP) and national teacher cohorts across Indonesia.
- **Key DOIs:**
  - `10.19109/intelektualita.v13i1.21095` (Megawati et al., 2024, *Jurnal Intelektualita*)
  - `10.32550/wdstp587` (Kurniawati, 2025, *Jurnal Teknodik*)
  - `10.23887/jppp.v9i2.92738` (Utomo & Lestari, 2025, *Jurnal Penelitian dan Pengembangan Pendidikan*)

## Empirical Evidence & Findings
1. **Perceived Ease of Use (PEOU) Dominates Adoption:** Megawati et al. (2024) ran a structural TAM regression on Indonesian teachers and found that **Perceived Ease of Use** has the strongest direct path coefficient toward attitude and sustained usage intention ($p < 0.01$). If a digital tool requires complex multi-step navigation or high initial cognitive overhead (e.g., multi-page signup gates), Indonesian teachers abandon it regardless of its theoretical usefulness.
2. **Infrastructure & Mobile Simplicity:** Kurniawati (2025) evaluated PMM across 38 provinces. Findings show that uneven internet stability across regions makes lightweight, mobile-first design mandatory. Teachers heavily prefer bite-sized (5 to 15 minute) asynchronous modules over heavy synchronous or text-dense setups.
3. **Recognized Credentials as Extrinsic Motivators:** Utomo & Lestari (2025) used TAM/UMEGA models to show that PMM adoption significantly enhances self-reported and measured teaching competence. The critical adoption lever is the linkage between completing self-paced modules and earning **official professional development certificates (`Sertifikasi` / `Jam Pelatihan`)**. When completion yields a verified credential recognized by institutional leaders, completion rates lift substantially.

## Key Takeaways for Android App Design
- Never ask for complex PII during onboarding; keep the entry interface clean, icon-first, and low-text (`Jenjang: PAUD/SD/SMP/SMA`).
- Frame the initial app usage around quick, bite-sized tasks (`Modul 1` completion under 10 minutes).
- Tie account registration explicitly to claiming a verified competence certificate (`Sertifikat Kompetensi`).
