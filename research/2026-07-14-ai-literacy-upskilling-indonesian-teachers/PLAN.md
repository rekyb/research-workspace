# Research Plan: AI-Literacy Upskilling for Indonesian Teachers

- **Status:** Approved (Principal Researcher reviewed; user approved 2026-07-15) — capture in progress
- **Type:** benchmark
- **Goal it serves:** Ground the design of a mobile-first course + app that builds
  Indonesian teachers' *own* AI fluency first, then equips them to teach students the
  proper use of AI — by benchmarking how existing platforms solve each piece.

## Key research questions
Derived from the goal and the **personal-fluency-first** lead. Each maps to a design
decision we'll have to make.

1. **Onboarding & first win** — How does a non-technical teacher get from signup to a
   *first useful AI outcome*? What is the time-to-value, and what is that first win?
2. **Micro-learning & habit** — What is the unit/lesson structure and length, and
   which mechanics drive return (streaks, reminders, progress, cohort/social)?
3. **Personal fluency ("do it with your own material")** — How is prompting
   scaffolded? Are there worked examples? Is there a practice sandbox with guardrails
   where teachers apply AI to their *real* work?
4. **Critical evaluation & responsible use** — How and *where in the sequence* are
   verification, bias, hallucination, privacy, and **academic integrity** taught —
   front-loaded, or after the teacher has felt a first win?
5. **Classroom transfer** — What ready-to-use assets (lesson plans, discussion
   scripts, student activities, class AI-use policies) help a fluent teacher teach
   students?
6. **Credentialing & motivation** — What certificate / badge / PD-hour recognition is
   offered, and how is it surfaced to drive completion?
7. **Localization & context-fit** — How well would each fit the Indonesian teacher
   context (Bahasa Indonesia, mobile-first, low bandwidth, offline)?

## Capture conventions (all platforms)
Apply to every platform below unless noted.

- **Capture method (decided 2026-07-15):** account creation / sign-in is out of scope
  (safety guardrail). For login-gated products we capture **public surfaces only**
  (marketing, tool catalog, signup entry, demos, pricing) and **enrich with external
  sources** — news, reviews, walkthroughs, reputable articles — that describe the
  in-app experience. Every external source is cited in `notes.md` + `sources.md`;
  nothing is fabricated, and gated in-app detail is attributed to its source, not
  passed off as first-hand capture.

- **Mobile-first is the design target, so capture the core flows in a mobile
  viewport** (responsive/device emulation, ~390px wide) in addition to any desktop
  view. The core platforms are desktop-web course software; we are designing a
  mobile app, so how each flow *reflows to a phone* is itself evidence. Where a true
  mobile app exists (PMM, Ruangguru), the store listing + app screenshots are the
  mobile evidence. Note any flow that is desktop-only / breaks on mobile.
- **Account-blocked fallback:** if free signup is blocked (school-domain
  verification, waitlist, Indonesian phone/account), do **not** work around it —
  capture the public product tour / demo / marketing walkthrough as observable
  evidence and note the block in `notes.md`.
- **RQ→platform coverage matrix:** maintain the matrix at the end of this plan as
  capture proceeds, so "no RQ left empty" is *verifiable* at synth time, not just
  asserted.

## Per-platform capture plan

### MagicSchool AI  *(core)*
- **Flows/screens to capture:** signup/onboarding for a teacher; the tool picker /
  dashboard; running one tool end-to-end on a real teaching task (e.g. generate a
  lesson plan or quiz); any prompting scaffolds, tips; the **student-facing mode**
  (evidence for the "teach students" strand); any responsible-use / privacy prompts.
- **What we're looking for:** RQ1 (first win via a real artifact), RQ3 (prompting
  scaffolds, do-it-with-your-material), RQ4 (privacy/guardrail cues), **RQ5
  (student-facing mode as a classroom-transfer surface)**.
- **Risks:** requires a (free) educator account; ensure no student PII entered;
  guardrail: stay on free tier, never upgrade. If signup blocked → product-tour fallback.

### Khanmigo (Khan Academy)  *(core)*
- **Flows/screens to capture:** teacher onboarding; teacher-facing tools (lesson-plan,
  rubric, etc.); the guided-practice / worked-example interaction pattern; how it
  models "assist not answer"; any **student-facing tutoring** view (transfer surface).
- **What we're looking for:** RQ1, RQ3 (worked examples, guided practice), RQ4
  (how it models responsible AI behaviour), **RQ5 (student tools as a model for what
  teachers deliver to students)**.
- **Risks:** login required; likely free teacher access — do not pay; redact account
  PII. If signup blocked → product-tour fallback.

### Elements of AI  *(core)*
- **Flows/screens to capture:** course entry/onboarding; a full unit's structure
  (concept → exercise → feedback); how it sequences ethics/responsible-use; the
  completion certificate flow.
- **What we're looking for:** RQ2 (unit structure) and RQ4 (ethics sequencing) are
  its signature strengths — **prioritize these two in the deep capture.** RQ6
  (certificate) secondary. Note honestly: it is a *conceptual* course, not hands-on
  tool use on your own material, so it is **not** strong evidence for RQ3 (personal
  fluency); don't hunt for fluency it doesn't teach.
- **Risks:** free; account may be needed for exercises/certificate — no payment involved.

### Common Sense — AI Literacy  *(secondary)*
- **Flows/screens to capture:** the AI-literacy lesson collection; one lesson's
  structure (objective, activity, discussion, student handout); any teacher-facing
  "how to teach this" scaffolding.
- **What we're looking for:** RQ5 (classroom-transfer assets — the "teach it" strand).
- **Risks:** mostly open/free; capture representative lessons only (no need to log in).

### Google AI Essentials  *(secondary)*
- **Flows/screens to capture:** course landing + **public syllabus/module list** and
  the **credential/certificate framing** (the reliably-observable surfaces); the
  in-lesson bite-sized format only if reachable without enrollment.
- **What we're looking for:** RQ6 (credential framing) — primary; RQ2 (bite-sized
  format) — best-effort, likely gated behind enrollment, so lean on the public
  syllabus and don't over-promise lesson-level detail.
- **Risks:** hosted on Coursera — ⚠ enrollment may push a paid/"audit" path. Guardrail:
  capture the free/audit and syllabus views only; **never** start a paid trial or pay.

### Platform Merdeka Mengajar (PMM)  *(secondary — context anchor, time-boxed)*
- **Flows/screens to capture:** public landing / Play Store listing (store
  screenshots = mobile evidence); any publicly viewable training ("Pelatihan
  Mandiri") structure; how PD-hours/certificates are framed; overall IA and language.
- **What we're looking for:** RQ6 (PD-hour recognition — the key Indonesian adoption
  lever), RQ7 (the local baseline teachers already know).
- **Marked context-only where gated.** Core content is likely behind `belajar.id`
  govt login we don't have. **Fallback if gated:** Play Store listing + screenshots,
  official docs, and reputable press/secondary sources — cited, treated as context,
  not passed off as first-hand capture.
- **Time-box:** a single free-surface pass; capture landing/store/public docs, stop
  at the gate, move on. Do **not** attempt to obtain credentials.

### Ruangguru  *(secondary — context anchor, time-boxed)*
- **Flows/screens to capture:** public landing / app listing (store screenshots =
  mobile evidence); onboarding entry; engagement/motivation mechanics visible without
  purchase; Bahasa UX patterns.
- **What we're looking for:** RQ2 (local engagement mechanics), RQ7 (Bahasa,
  mobile-first patterns Indonesian teachers/students already expect).
- **Marked context-only where gated.** Much content is paid. **Fallback if gated:**
  public store listing + screenshots and marketing surfaces, cited as context.
- **Time-box:** a single free-surface pass; never subscribe or pay; capture what's
  public and move on.

## Success criteria (what "done" looks like)
- Each of the 3 **core** platforms has: numbered screenshots of its onboarding + core
  loop **including a mobile-viewport capture of the core flow**, a `flow.gif`, a
  written `flow.md`, and a `notes.md` tying observations to the RQs.
- Each **secondary** platform has at least: representative screenshots + a `notes.md`
  answering the specific RQ(s) it was chosen for (a full flow GIF is optional if the
  surface is static/gated).
- The RQ→platform coverage matrix below is filled in as capture proceeds; every RQ
  (1–7) has evidence from ≥1 platform. **RQ6-local (PD-hour recognition) and RQ7
  (context-fit) may be satisfied by "context-only" evidence** (store listings,
  official docs, cited press) where the Indonesian apps are gated — this asymmetry is
  deliberate, consistent with the personal-fluency-first weighting.
- All captures are PII-safe (no account holders' or third parties' names/faces/emails)
  and no paid flow was ever entered; gated surfaces are explicitly noted, not faked.

## RQ → platform coverage matrix
Tick as evidence is captured. (● core = deep, ○ secondary = targeted, — not expected.)

| RQ | MagicSchool | Khanmigo | Elements of AI | Common Sense | Google AIE | PMM | Ruangguru |
|----|:--:|:--:|:--:|:--:|:--:|:--:|:--:|
| RQ1 first win | ● | ● | ○ | — | — | — | — |
| RQ2 micro-learning/habit | ○ | ○ | ● | ○ | ○ | — | ○ |
| RQ3 personal fluency | ● | ● | — | — | — | — | — |
| RQ4 responsible use | ○ | ○ | ● | ○ | ○ | — | — |
| RQ5 classroom transfer | ● | ● | — | ● | — | — | — |
| RQ6 credential/motivation | — | — | ○ | — | ● | ○(local) | ○ |
| RQ7 context-fit (ID) | — | — | — | — | — | ○(context) | ○(context) |

## Principal Researcher review
**Mode A critique (2026-07-15).** Verdict: *Plan needs revision* — fundamentally
sound (tight RQ→design mapping, right tiering instinct, honest risk handling, concrete
success criteria) with three must-fixes, now applied:
1. **Mobile-first capture** was unspecified for desktop-web core platforms → added the
   *Capture conventions* block requiring mobile-viewport capture of core flows.
2. **RQ5 (classroom transfer) rested on one secondary pass** → routed to the core
   platforms too (MagicSchool student-facing mode, Khanmigo student tools).
3. **Gated localization RQs were listed as equal** → RQ6-local and RQ7 now marked
   *context-only where gated*, with explicit store-listing/docs/press fallbacks; PMM
   and Ruangguru time-boxed to a single free-surface pass.

Non-blocking recs folded in: Elements of AI framed honestly (strong on RQ2/RQ4, not
RQ3); Google AIE leans on public syllabus + credential; account-blocked product-tour
fallback added; RQ→platform coverage matrix added for synth-time verification.

_Status after revision: ready for user approval._
