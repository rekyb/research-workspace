# Audience Context — Usage Behavior of Indonesian Teachers (SD–SMA)

- **What this is:** A standalone, cited profile of how our target user — Indonesian
  schoolteachers, elementary (SD) through senior-secondary (SMA) — actually behaves
  around devices, connectivity, and apps. It is **audience/context input** to the design,
  not a platform benchmark. It sits alongside `SYNTHESIS.md` (the benchmark findings)
  and directly feeds RQ7 (localization & context-fit) and the review's **F8 precondition**
  (credential/onboarding was a *Conditional Go on primary Indonesian-teacher research*).
- **Method:** Multi-source desk research (deep-research harness) — 21 sources fetched
  across 5 angles, 80 candidate claims extracted, 25 verified by 3-vote adversarial
  fact-checking (23 confirmed, 2 refuted). Compiled 2026-07-16.
- **Scope note:** This is *desk research on the audience* (public reports + peer-reviewed
  studies). It is **not** primary research with our own teachers — where noted, gaps
  remain that only primary research can close. No first-hand participant data.
- **Confidence labels** below are the harness's: `high` = multiple independent sources,
  unanimous verification; `medium` = corroborated but with a material caveat.

---

## TL;DR

Indonesian SD–SMA teachers are an overwhelmingly **mobile-first, Android-first,
smartphone-primary** population who live inside a **small set of high-frequency apps led
by WhatsApp**, and who already have a near-universal government PD app
(**Merdeka Mengajar / PMM**, now "Ruang GTK") they broadly accept. Their **general
digital confidence is real but uneven** — markedly lower for older and rural teachers —
and their **AI-specific literacy is genuinely nascent**: they self-rate AI knowledge far
below their teaching knowledge and name *lack of hands-on training* as the top barrier.
The clean design read: **mobile-first Android, built light, WhatsApp-adjacent,
practical/tool-specific (Canva, ChatGPT), with onboarding that assumes mixed confidence.**

---

## 1. Device & connectivity habits

### 1.1 The smartphone is the primary computer, and it is Android — `high`
Smartphone ownership is near-universal (**99.3%**) versus only **57.8%** for
laptop/desktop; Android dominates the mobile OS market (**77.6%** by StatCounter June
2026; **88.26%** of mobile web traffic, Dec 2023), with iOS a minority (~11–22%).
StatCounter's page-view method understates Android against the install base, so Android
dominance is, if anything, understated.
→ **Implication:** build **mobile-first for Android**; treat desktop as secondary.
*Sources: [S1], [S3], [S5].*

### 1.2 Mobile-saturated but not universally connected — `high`
~**356M** mobile connections (125% of population, 96.4% broadband) and **212M** internet
users (74.6% penetration) as of early 2025 — but **~72M people (25.4%) remain offline**,
disproportionately in **rural / 3T** regions, where the main barriers are limited
internet, lack of devices, and low teacher digital skills. (Multi-SIM behavior means
connections ≠ unique users.)
→ **Implication:** assume mobile broadband for most, but keep the app **low-bandwidth and
offline-tolerant** so rural teachers are not excluded.
*Sources: [S2], [S6], [S9].*

### 1.3 Rural teachers face an infrastructure ceiling, not just a skills gap — `high`
Limited technology infrastructure *significantly hampers* rural teachers' development of
Technological Knowledge — a hard, structural cap on tool adoption, separate from
willingness. Urban teachers consistently out-use rural ones.
→ **Implication:** offline/low-bandwidth support is an **equity requirement** for rural
reach, not a nice-to-have.
*Source: [S7].*

> ⚠️ **Known gap (for us specifically):** the *fine-grained* behaviors originally asked
> about — prepaid-quota management, WiFi-vs-mobile-data reliance, and **when/where** teachers
> use their phones (school vs home, time of day) — did **not** return well-sourced answers.
> The connectivity evidence is macro-level. Treat these as **open questions for primary
> research**, not assumptions.

## 2. App & platform habits

### 2.1 A small set of high-frequency apps, led by WhatsApp — `high`
Among internet users 16–64: **WhatsApp 90.9%**, Instagram 85.3%, Facebook 81.6%,
TikTok 73.5%, Telegram 61.3% (monthly use). WhatsApp is the clear anchor.
→ **Implication:** **WhatsApp-adjacent** distribution and onboarding meets teachers where
they already are.
*Caveat: this is general-population data (16–64), not teacher-specific. Source: [S3].*

### 2.2 Messaging is an *evidenced* low-bandwidth PD vehicle — `high`
A peer-reviewed scoping review (43 documents) finds messaging apps support learning as an
"accessible, low-connectivity way of promoting interactivity," with **teacher professional
development** as a core theme, operating through **structured prompts** and **informal
communities of practice**.
→ **Implication:** WhatsApp integration for community/nudges is evidence-aligned — but lean
on **text and voice notes** (low-data), not heavy video.
*Caveat: evidence is global / COVID-era, not Indonesia-specific. Source: [S8].*

### 2.3 PMM (Merdeka Mengajar) is the incumbent to complement, not ignore — `medium`
The government's national teacher platform reached **~3.1M teachers across 350,000
schools** with **89.55% positive** sentiment (8,581 Play reviews).
→ **Implication:** our app should **complement / plug into** the surface teachers already
use for PD.
*Important nuance: adoption was effectively **mandatory** (tied to the e-Kinerja
performance evaluation), so the high numbers and positive sentiment **overstate voluntary
enthusiasm**; PMM has since been rebranded to "Ruang GTK." Sources: [S10], [S11].*

## 3. Digital & AI literacy (the adoption reality)

### 3.1 Basic digital self-efficacy is real but strongly age-linked — `high`
Only **57%** of a national sample (n=901, 28 provinces) scored "high" on computer
self-efficacy; confidence declines with age (mean **4.74** for teachers 20–30 vs **4.04**
for over-50). Older and rural teachers show reduced competency that slows
technology–pedagogy integration.
→ **Implication:** onboarding **cannot assume uniform confidence**; scaffold explicitly for
older/veteran teachers.
*Sources: [S12], [S7].*

### 3.2 AI literacy is nascent even among otherwise-competent teachers — `high`
SD teachers self-rate AI-technological (M=**2.58**) and AI-ethical (M=**2.65**) knowledge
far below their pedagogical (4.12) and content (4.05) knowledge; **>23%** of even
urban/advantaged teachers are unsure they have the knowledge to use AI; **85.3%** name
*lack of training* as the top barrier.
→ **Implication:** the app addresses a **real, self-recognized** AI-knowledge gap — lead
with capability-building, not persuasion.
*Caveat: self-assessed Likert ratings, not objective tests. Sources: [S4], [S13].*

### 3.3 They want practical, tool-specific, ready-to-use content — not theory — `high`
**88.2%** preferred hands-on workshops on specific AI tools; **75.4%** wanted ready-to-use
AI-integrated lesson plans (online courses/webinars ranked lower at 55.9%). Documented
Indonesian upskilling programs teach concrete tools — **Canva + ChatGPT** — via
socialization → hands-on → evaluation.
→ **Implication:** **task-based, tool-specific, resource-first** content; hand over
ready-to-use materials, not lectures.
*Sources: [S4], [S14].*

---

## 4. Design implications (consolidated)

1. **Mobile-first Android, built light** — offline-tolerant, low-bandwidth by default.
2. **WhatsApp-adjacent distribution & onboarding** — community/nudges via text + voice,
   not heavy video.
3. **Task-based, tool-specific, resource-first curriculum** — concrete tools (Canva,
   ChatGPT) + ready-to-use lesson assets over theory/webinars.
4. **Onboarding that scaffolds mixed confidence** — support older / rural / veteran
   teachers explicitly; do not assume uniform digital skill.
5. **Complement PMM / Ruang GTK** — but remember its adoption was mandate-driven, so
   voluntary engagement is a **harder bar we must earn**.

These reinforce choices already locked in `DESIGN-FOUNDATIONS.md` (mobile-first 360–390px
canvas, offline states, Bahasa-first) and give **external audience grounding** to the F8
precondition flagged in the `SYNTHESIS.md` review.

## 5. Refuted claims — do NOT build on these

Two plausible-sounding claims were **refuted** in adversarial verification (0-3):

- ❌ **"Teachers' digital readiness is already high, so skip the basics."** Do *not* assume
  you can jump straight to advanced/ethics content. *(Refuted; ref [S13].)*
- ❌ **"PMM's negative reviews are mainly technical/connectivity issues."** Do *not* assume
  app performance is the main friction point. *(Refuted; ref [S11].)*

## 6. Evidence gaps → candidates for primary research

These are the questions this desk research could **not** answer — and the ones most worth
putting to real teachers (they also satisfy the F8 "primary Indonesian-teacher research"
precondition):

1. **SD vs SMP vs SMA (and gender) differences** — the richest granular data (AI-TPACK,
   training preferences) is **elementary-only**; the full SD–SMA spread is unconfirmed.
2. **Actual real-world AI-tool usage** (ChatGPT/Gemini) — adoption rates, frequency, use
   cases. Evidence covers the *knowledge gap* and *stated preferences*, not measured use.
3. **Concrete data-cost & time/place behavior** — prepaid-quota habits, WiFi-vs-data
   reliance, school-vs-home and time-of-day usage.
4. **Discovery/adoption pathways** — the relative weight of peer/**MGMP-KKG** working
   groups vs official mandates in how teachers find and adopt new tools.

---

## Sources

Retrieved 2026-07-16 via deep-research. Quality: `primary` = peer-reviewed study / primary
dataset; `secondary` = reputable report or news synthesizing primary data.

| ID | Source | URL | Type |
|----|--------|-----|------|
| S1 | StatCounter — Mobile OS market share, Indonesia (June 2026) | https://gs.statcounter.com/os-market-share/mobile/indonesia | primary |
| S2 | DataReportal — Digital 2025: Indonesia (We Are Social / Meltwater) | https://datareportal.com/reports/digital-2025-indonesia | secondary |
| S3 | We Are Social / DataReportal — Digital 2024: Indonesia (PDF) | https://wearesocial.com/id/wp-content/uploads/sites/19/2024/02/Digital_2024_Indonesia.pdf | primary |
| S4 | Frontiers in Education (2026) — AI-TPACK challenges & needs, Indonesian SD teachers (n=468) | https://www.frontiersin.org/journals/education/articles/10.3389/feduc.2026.1769204/full | primary |
| S5 | (see S3) — mobile web-traffic OS split | https://wearesocial.com/id/wp-content/uploads/sites/19/2024/02/Digital_2024_Indonesia.pdf | primary |
| S6 | DataReportal — Digital in Indonesia (landing/overview) | https://datareportal.com/digital-in-indonesia | secondary |
| S7 | Jurnal Basicedu (Jan 2026) — SLR: rural EFL teachers, TPACK, infrastructure & age | https://jbasic.org/index.php/basicedu/article/view/10862 | primary |
| S8 | Technology, Pedagogy and Education (2023) — scoping review: messaging apps for learning/TPD | https://www.tandfonline.com/doi/full/10.1080/1475939X.2023.2201590 | primary |
| S9 | Maliki Interdisciplinary Journal — digital-education barriers in 3T regions | https://urj.uin-malang.ac.id/index.php/mij/article/download/16179/5025 | secondary |
| S10 | GovInsider — PMM adoption (3.1M teachers, 350k schools) | https://govinsider.asia/intl-en/article/indonesian-education-platform-makes-teachers-agents-of-transformation | secondary |
| S11 | ResearchGate (2025) — Sentiment analysis of PMM Google Play reviews (n=8,581) | https://www.researchgate.net/publication/389575643_Teachers_in_the_Digital_Age_Sentiment_Analysis_of_the_Merdeka_Mengajar_Platform_in_the_Indonesian_Curriculum_Policy | primary |
| S12 | Suprapto et al. (2022, PMC9679748) — teacher computer self-efficacy, n=901, 28 provinces | https://www.ncbi.nlm.nih.gov/pmc/articles/PMC9679748/ | primary |
| S13 | Cogent Education (Dec 2025) — Greater Jakarta teachers & AI readiness (n=382) | https://www.tandfonline.com/doi/full/10.1080/23311886.2025.2593596 | primary |
| S14 | Jurnal Medika (2026) — SMP teacher upskilling via Canva + ChatGPT (community-service) | https://jmedika.com/index.php/medika/article/view/590 | primary |

### Overall caveats
- **Time-sensitivity:** platform/connectivity stats are current (Digital 2024/2025,
  StatCounter June 2026), but the underlying GWI app-usage fieldwork is Q3 2023, so
  app-share figures are ~1–2 years old (rankings are stable).
- **Population-scope mismatches:** the richest AI-TPACK and preference data ([S4]) is
  **SD/elementary-only**; the Canva+ChatGPT program ([S14]) is **SMP-only** and from a
  low-tier community-service journal; the messaging-TPD review ([S8]) is **global**, not
  Indonesia-specific; app-usage rankings ([S3]) are **general-population**, not teacher-specific.
- **Source-quality:** StatCounter measures web page-views (proxy, not install base);
  DataReportal connection counts reflect multi-SIM behavior (connections ≠ users); PMM
  adoption is government self-reported and was mandate-linked; AI-literacy scores are
  self-assessed, not tested.
