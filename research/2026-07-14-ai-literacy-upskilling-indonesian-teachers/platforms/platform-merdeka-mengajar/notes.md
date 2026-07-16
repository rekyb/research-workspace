# Platform Merdeka Mengajar (PMM): Observations & Patterns

**Platform type:** Indonesia's **national government** teacher platform (Kemendikdasmen), for
implementing *Kurikulum Merdeka*. Android app + web.
**Tier:** Secondary, **context anchor for RQ7 (context-fit) and RQ6 (PD-hour recognition)**.
**Capture status:** ⚠ **Context-only, no first-hand capture.** The web app
(`guru.kemendikbud.go.id`) returned an error/blocked page for us and the app requires a
government **`belajar.id`** login we do not have and must not obtain (guardrail). All detail below
is from cited external sources (Kemendikbud help centre, press, Play Store listing), attributed as
*external* and not passed off as first-hand observation. **Date:** 2026-07-15.

---

## Why it's in the study (even though gated)
PMM is **the baseline every Indonesian teacher already knows**, the existing mental model for
"teacher professional development in a mobile app." Any product we design lands in a market where
PMM has set expectations for how PD, certificates, and teaching tools look and feel. It is our
*context anchor*, not a feature benchmark.

## What PMM is (⟶ external)
Three stated functions: **help teachers teach, learn, and create** ("mengajar, belajar,
berkarya"). Core features:
- **Perangkat Ajar:** teaching tools: modules, projects, textbooks to use in class.
- **Pelatihan Mandiri:** **self-paced training modules (~5 hours each)**, structured for deep
  understanding, on topics like Kurikulum Merdeka and Profil Pelajar Pancasila. **Completion is
  recognized (certificates), tied to teacher professional-development expectations.**
- **Video Inspirasi:** inspiration videos.
- **Bukti Karya:** a portfolio where teachers publish evidence of their work.
- **Komunitas:** community.
- **Asesmen Murid:** assessment toolkit to measure student outcomes.
Login is via the government **`belajar.id`** account; access via the "Merdeka Mengajar" Android
app or the web.

## Patterns / implications for our design
1. **PD-hour recognition is the native adoption lever (RQ6).** PMM already trains teachers in
   ~5-hour self-paced modules with recognized completion. Our course should **speak this
   language**: frame its certificate in terms Indonesian teachers already value (PD hours /
   recognized training), rather than inventing a new credential concept. This corroborates our
   thesis's emphasis on extrinsic, professionally-recognized motivation.
2. **Mobile-first + self-paced modules is the expected format (RQ7).** The dominant teacher-PD
   experience in Indonesia is already a **smartphone app with short self-paced modules**, strong
   support for our mobile-first, micro-learning design direction; teachers are habituated to it.
3. **"Berkarya" / Bukti Karya (portfolio) suggests teachers value showing their work.** A
   share-your-artifact surface (our "do-it-with-your-material" outputs) fits an existing behaviour.
4. **Distribution channel, not competitor.** The most realistic path to Indonesian teachers may be
   *through* or *alongside* PMM's ecosystem rather than around it. Worth flagging for strategy.

## Gaps / caveats
- **No first-hand evidence:** screens, onboarding, and the certificate flow were not observable to
  us; all claims are externally sourced and should be validated with a logged-in Indonesian teacher
  or official documentation before being treated as firm.
- Whether/how PMM addresses **AI literacy** specifically is unconfirmed; its current focus is
  Kurikulum Merdeka implementation, not AI. That gap is itself relevant: there may be **no incumbent
  AI-literacy offering** inside the platform teachers already use.

## Sources (all external)
- Kemendikbud PMM help, web version: https://pusatinformasi.guru.kemdikbud.go.id/hc/id/articles/6928331547289-Platform-Merdeka-Mengajar-Versi-Situs-Web
- "Cara Mengakses PMM": https://pusatinformasi.kampusmerdeka.kemdikbud.go.id/hc/en-us/articles/8874800097177-Cara-Mengakses-Platform-Merdeka-Mengajar
- Merdeka Mengajar, Google Play listing: https://play.google.com/store/apps/details?id=id.belajar.app
- PMM Guru panduan lengkap 2025: https://kab-pegununganbintang.kpu.go.id/blog/read/8797_pmm-guru-panduan-lengkap-platform-merdeka-mengajar-2025-dan-cara-menggunakan-fitur-terbaru
- Indonesia Baik, cara akses PMM: https://www.indonesiabaik.id/infografis/cara-akses-platform-merdeka-mengajar
