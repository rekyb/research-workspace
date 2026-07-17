# Research Plan: Certificate of Completion vs Badges as Gamification for Teacher EdTech (Indonesia)

- **Status:** Approved (Principal Researcher Mode A passed after revision; user approved 2026-07-17)
- **Type:** benchmark _(method: literature review + light platform benchmark)_
- **Goal it serves:** Decide which gamification mechanic(s) an edtech product for Indonesian
  teachers should adopt, by understanding the effect of completion certificates vs badges
  and shortlisting other simple gamification tools.

## Key research questions
1. **Effect of certificates of completion** — what do published studies say about how
   completion certificates affect learner motivation, course completion, and *perceived
   value/credential worth*, especially for adults / professionals / teachers?
2. **Effect of digital badges** — same, for achievement/micro-credential badges: effect on
   engagement, completion, and sense of competence/status.
3. **Certificate vs badge, head-to-head** — where the literature or platform practice lets
   us compare, which mechanic wins on which outcome (extrinsic credential value vs intrinsic
   progress motivation), and for which learner type?
4. **The Indonesian teacher context** — how do teacher-specific incentives (PD hours, civil-
   service credit, government certification like PMM) and Indonesia-specific factors (mobile-
   first, connectivity, extrinsic-credential culture, language) change which mechanic fits?
5. **Other simple gamification tools** — beyond certs and badges, which lightweight mechanics
   (progress bars, streaks, points/XP, levels, leaderboards, checklists, unlockables) are
   (a) supported by evidence and (b) realistic/simple to implement for this audience?
6. **Implementation patterns** — how do real platforms actually present certificates and
   badges (placement, trigger, framing, shareability)? What good/poor patterns recur?

## Method A — Literature review (primary evidence for effects)
The *effect* questions (Q1–Q5) are answered chiefly from published research, since they are
causal/motivational claims that observing a UI cannot establish. The review runs as five
search threads so each question has a dedicated evidence base, not a single generic sweep.

- **Thread 1 — Certificates of completion (Q1):** completion-certificate motivation/
  completion effects for adults/professionals/teachers; credential value and its limits.
- **Thread 2 — Digital / open badges (Q2, Q3):** open-badge and achievement-badge studies on
  engagement, completion, competence/status; and any direct cert-vs-badge comparisons.
- **Thread 3 — Reward theory (Q3):** self-determination-theory (SDT) and overjustification
  treatments of extrinsic vs intrinsic rewards, the mechanism behind "which mechanic, for whom."
- **Thread 4 — Indonesia / SEA / LMIC teacher context (Q4):** Indonesian & SEA teacher-PD,
  civil-service/PD credit and certification culture (incl. PMM/PPG), mobile-first & connectivity
  constraints, extrinsic-credential norms. This thread is run *explicitly*, not as a hoped-for
  by-product of the others.
- **Thread 5 — Other simple gamification mechanics (Q5):** per-mechanic effect evidence for
  each candidate tool — progress bars / goal-gradient, streaks, points/XP, levels,
  leaderboards, checklists, unlockables — so each shortlisted tool carries its own evidence
  note rather than resting on the Duolingo UI + assertion.

Rules across all threads:
- **Search approach:** structured web + scholarly search (deep-research fan-out). Every
  scholarly source logged in `references.md` (author, year, title, venue, 1-line finding,
  URL, and which question it supports/challenges); every URL also in `sources.md`.
- **Rigor:** cite only sources actually retrieved with a working URL. Corroborate *and*
  challenge, note where evidence is thin, mixed, or contradicts a popular assumption
  (e.g. badges can *undermine* intrinsic motivation under some conditions). No fabrication.
- **Western-vs-local labelling (required):** every effect finding is labelled by whether it
  rests on **Western/general** evidence or on **Indonesia/SEA/LMIC** evidence. Where local
  evidence is absent, the finding is flagged as *inferred/transferred*, never silently
  generalized to the Indonesian teacher.
- **Bias watch:** vendor/marketing claims about gamification are flagged as such, not treated
  as evidence of effect.

## Method B — Light platform benchmark (grounds the implementation patterns, Q6)
A *light* capture of how each mechanic is presented in the wild, to ground the recommendations
in real UI. Not a full teardown, 2–4 key screens per platform.

### Indonesian teacher edtech — Platform Merdeka Mengajar (PMM) _(primary; confirm Ruangguru as backup)_
- **Flows/screens to capture:** the training-module completion → certificate flow (how a
  *Sertifikat* is earned, shown, downloaded), and any badge/points/progress elements.
- **What we're looking for:** how the most-used Indonesian teacher platform frames completion
  certificates as the reward, and whether any badge-like mechanics sit alongside them.
- **Risks:** likely requires government SSO login (**PII + possible capture block**); may be
  region-gated. If login-gated, capture only public/marketing pages and note the gap. No login
  with real teacher credentials, no PII committed.

### Global teacher-PD platform — Coursera + Google for Education / Teacher Center
- **Note on Coursera's role:** Coursera is a generic MOOC, not teacher-PD-specific, so it
  stands in for **"paid credential framing,"** not for teacher PD as such. Pair it with
  **Google for Education / Teacher Center** (free certificates + badges, actually aimed at
  teachers) so the teacher-PD signal is not weak.
- **Flows/screens to capture:** course-completion certificate presentation (and the paywall
  boundary) on Coursera; the certification/badge path on Google Teacher Center; any
  specialization badge/credential UI on either.
- **What we're looking for:** how certificates are positioned as paid credentials vs free
  learning, and how "achievement" is shown before it is earned.
- **Risks:** **certificate issuance is behind a paywall — do NOT purchase or start a paid
  trial.** Capture only what is observable for free; note the gated parts (per Guardrails).

### Gamification-heavy edtech — Duolingo _(primary; Kahoot!/Quizizz as backup)_
- **Flows/screens to capture:** the badge/achievement screen, streak, XP/leaderboard, and
  progress mechanics as a contrast to certificate-centric platforms.
- **What we're looking for:** how "simple gamification tools" (Q5) are presented when they are
  the core loop rather than an add-on, patterns we could borrow.
- **Risks:** logged-in state shows PII + third-party names on leaderboards, **redact before
  capture** (avatars, names, email, leaderboard name cells) per Capture standards.

## Success criteria (what "done" looks like)
- Q1–Q5 each answered from `references.md`, corroborating and (where they exist) challenging
  findings, not vendor claims. **Target ≥2 cited sources each**; where 2 *direct* sources
  genuinely do not exist (certificate-effect and Indonesia-specific evidence are the likely
  thin spots), permit **adjacent evidence + an explicit lowered-confidence flag** rather than
  padding coverage or manufacturing sources.
- A clear, evidence-backed **cert-vs-badge comparison** stating which mechanic suits which
  outcome/learner, with the **Indonesian-teacher context evidence-backed or explicitly flagged
  as inferred/transferred** (never silently generalized from Western evidence).
- A shortlist of **≥3 other simple gamification tools**, each with its own evidence note
  (from Thread 5) and a fit-for-this-audience assessment.
- **≥3 platforms** benchmarked with redacted, committable captures grounding Q6, including at
  least one capture of the **pre-completion / locked reward state** (how a cert or badge is
  teased before it is earned — where the motivational mechanic actually lives). An honest note
  stands in wherever a flow was paywalled/login-gated and could not be captured.
- No paywalled transactions, no un-redacted PII, every source logged.

## Principal Researcher review
**Mode A — 2026-07-17. Verdict: Plan needs revision → revised.** The reviewer confirmed the
method architecture is sound (effect claims correctly assigned to the literature, benchmark
kept light for implementation only) and risk handling is solid (paywall, PII, login gates all
anticipated). Three must-fixes were raised and applied:
1. **Q5 under-planned on evidence** → added **Thread 5**, a dedicated per-mechanic effect
   search (progress bars/goal-gradient, streaks, points/XP, levels, leaderboards, checklists)
   so each shortlisted tool carries its own evidence, not UI + assertion.
2. **Indonesia context risked staying generic** → added **Thread 4** (explicit Indonesia/SEA/
   LMIC teacher-PD & certification search) and a **Western-vs-local labelling rule**; success
   criteria now require the Indonesia context to be evidence-backed or flagged as inferred.
3. **Rigid ≥2-source rule vs thin evidence** → success criteria now allow adjacent evidence +
   a lowered-confidence flag where 2 direct sources don't exist (Q1 certs, Q4 Indonesia).

Non-blocking notes also folded in: Coursera re-scoped as "paid credential framing" and paired
with Google Teacher Center for the teacher-PD signal; a **pre-completion / locked reward
state** capture added to success criteria.

_Status: revised and **user-approved 2026-07-17**. Capture underway — literature review first, then light platform benchmark._
