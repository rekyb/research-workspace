# Synthesis: Onboarding & Activation in Education Apps

## Overview

**Goal.** Benchmark how best-in-class education apps design their onboarding-to-activation
flow, to inform the onboarding for a new 0-to-1 learning product serving three user types
at once: **low tech-literacy**, **low-context** (first-time, no facilitator present), and
**advanced** learners. Guiding question: *how do the best apps calibrate one flow so a
low-context novice feels guided while an advanced user is not patronized, and how much
personalization do they extract before the user reaches their first "win"?*

**Platforms studied (desktop web, logged-out, 2026-07-13).** Duolingo, Khan Academy,
Brilliant, CodeSignal, Elsa Speak. Each was torn down across six onboarding moments
(value framing, account creation, personalization intake, placement/advanced routing,
path assignment, first-task guidance) plus a defined activation endpoint. Captures are
desktop web; per-platform notes flag where the mobile/native-app experience diverges.

**Headline takeaways.**

1. **Registration timing is the biggest differentiator, and it is a spectrum.** From
   *try-first* (Duolingo lets you finish a lesson before any account) to *wall-first*
   (CodeSignal demands a full name/email/password form before anything). For low-context,
   often email-less learners, earlier value and later walls win.
2. **The novice-vs-advanced tension is solved the same way everywhere: never force a
   test.** Placement is offered as an *optional, positively-framed choice* or as
   *recognition* (pick the problem you can do), so a novice never feels examined and an
   advanced user never starts at zero.
3. **Low-literacy support is a consistent toolkit:** a guide character, icon-first
   low-text choices, progress bars, and permission priming. The best apps use all of it;
   the weakest skip priming and strand users at a system prompt.
4. **The strongest single pattern for *our* audience is "prove the value before the wall,"**
   whether that is Duolingo's guest-first flow (a real lesson is reachable before any
   account) or Elsa's embedded, un-gated speaking test. The corollary anti-pattern
   (CodeSignal) shows that even a reportedly strong placement mechanic is wasted when it
   sits behind a cold registration form.

**The calibrated answer this synthesis points to:** a guest-first flow that opens with a
single clear CTA, runs a short icon-first intake, offers an *optional* recognition-based
placement (novice and advanced from one screen), routes the user to a concrete first task
with a guide character and primed permissions, lets a real win land, and only then walls
registration behind "save your progress," fully localized.

---

## Feature 1: Deferred, "try-first" registration

**Short description.** Where the account wall sits relative to the first taste of value.
The five platforms span a full spectrum, and the placement strongly predicts fit for a
low-context, email-scarce audience.

**Key findings.** Duolingo defers registration entirely: the whole language pick,
questionnaire, and placement run in a guest session, and the account ask appears only
*after* the user reaches the product home, framed as saving progress. (In our capture the
guest session reached personalization, placement, and the `/learn` home; the first lesson
itself sits just beyond where we stopped, see Gaps.)

![Duolingo opens with one CTA and asks for nothing](platforms/duolingo/screenshots/01-landing-value-framing.png)

Brilliant sits in the middle: it runs its full personalization questionnaire first, then
walls registration to "discover your learning plan" (loss-aversion on invested effort).

![Brilliant walls registration after the questionnaire, framed as unlocking your plan](platforms/brilliant/screenshots/07-signup-wall-discover-plan.png)

Khan is wall-first with a lighter pre-step (role then age gate), and CodeSignal is the
extreme: clicking "Start learning" jumps straight to a full name/email/password form with
no value shown first.

![CodeSignal demands a full account form before any content](platforms/codesignal/screenshots/01-signup-gate-create-account.png)

**Why this feature works (rationale).** Every field asked before value is delivered is a
drop-off point. A guest session lets motivation build before commitment is required, and
reframing the eventual signup as "save what you already made" converts loss-aversion into
a reason to register rather than a barrier to entry. This directly addresses email-less
and low-context learners who stall at a cold account wall and who accumulate duplicate or
abandoned accounts when forced to register up front. [ref: Kahneman, Knetsch & Thaler 1991
on loss aversion / the endowment effect; see references.md]

**How to validate this feature in the future.** Prototype two entry variants (guest-first
vs. account-first) and A/B test **activation rate** (reached first task) and **account-
creation rate** among first-time, low-context users. Instrument time-to-first-task and
drop-off per screen. Target metric: guest-first should lift activation without materially
lowering eventual registration.

---

## Feature 2: Landing value-framing with a single unambiguous CTA

**Short description.** The first screen's job is to make one action obvious and ask for
nothing. This is the moment where a primary CTA can be mistaken for an ad if it competes
with other elements.

**Key findings.** Duolingo's landing is near-empty: one benefit headline, one dominant
primary CTA ("Get started"), and a de-emphasized "I already have an account." Nothing else
competes for the tap.

![One benefit line, one dominant CTA, one secondary link](platforms/duolingo/screenshots/01-landing-value-framing.png)

Khan instead leads with a role chooser as the primary action (Student / Family / Teacher),
which front-loads an identity decision before any value.

![Khan's landing leads with a role/sign-up chooser](platforms/khan-academy/screenshots/01-landing-role-split.png)

Elsa proves value on the page itself, embedding a working "speak this sentence" test (see
Feature 5), and Brilliant pairs a credibility line ("built by experts from MIT and
Harvard") with a live interactive product visual.

**Why this feature works (rationale).** A single high-contrast CTA with no competing
elements removes ambiguity about what to do next, which is critical for low-context and
low-tech-literacy users who will not hunt for the right control. When the first screen
asks for a decision (role) or competes with promos, the intended action loses salience and
can read as marketing rather than a button to press. [ref: Hick 1952 on choice reaction
time; see references.md]

**How to validate this feature in the future.** First-click / five-second test with
low-context users on candidate landing designs: can users state what the app is and
identify the primary action within five seconds, and where do they click first? Compare a
single-CTA layout against a role-split layout for first-action success rate.

---

## Feature 3: Optional, positively-framed placement fork

**Short description.** A single screen that lets a novice and an advanced user each choose
their path, with placement offered as an opt-in help rather than an imposed test. This
feature and Feature 4 are two facets of one placement moment: Feature 3 is the *framing and
optionality*, Feature 4 is the *selection mechanic*.

**Key findings.** Duolingo presents two choices side by side: "Start from scratch — take
the easiest lesson" and "Find my level — let Duo recommend where you should start." The
placement test is an optional, positively-framed fork, not a gate.

![Novice and advanced served from one screen: start from scratch vs. find my level](platforms/duolingo/screenshots/08-choose-path-fork.png)

Brilliant goes further with adaptive respect for autonomy: after an advanced self-pick
(Calculus) it *recommends* a foundation course but still lets the user jump straight to the
hard content.

![Brilliant recommends foundations after an advanced pick, but allows the jump](platforms/brilliant/screenshots/06-start-point-recommended.png)

**Why this feature works (rationale).** Framing placement as "let me help you find the
right start" removes the social threat of a test, so a novice is not intimidated and an
advanced user is not forced to sit through basics. Offering both paths on one screen means
a single flow serves the full ability range without branching the UI. Recommending
foundations while permitting the jump nudges mastery without removing control. [ref: Ryan &
Deci 2000, self-determination theory / autonomy support; see references.md]

**How to validate this feature in the future.** Usability test with both a self-identified
beginner and an advanced learner: does each reach an appropriately-leveled first task
without confusion or a feeling of being tested? Measure mis-placement (user overrides the
suggested start) and post-task confidence (SEQ).

---

## Feature 4: Level selection by recognition, not by label

**Short description.** Instead of asking users to self-rate as "beginner/intermediate/
advanced," the best placement screens ask users to *recognize* their level from concrete
examples. (This is the *mechanic* that pairs with Feature 3's *framing*.)

**Key findings.** Brilliant's level selector shows an actual worked problem on each card,
escalating in difficulty, with a topic name and a first-person capability statement:
"Arithmetic — I want to start from the basics" (`5 × ½`) up to "Calculus — I understand
derivatives and integrals" (a shaded integral). The user recognizes the math they can do.

![Each level is a real problem plus a plain-language "I can…" statement](platforms/brilliant/screenshots/05-level-self-select-by-problem.png)

Duolingo achieves a lighter version with a self-rated ladder rendered as signal-strength
bars, from "I'm new" (one bar) to "I can discuss most topics in detail" (four bars). The
icon encodes level independently of the words.

![Signal-bar self-rating encodes level visually](platforms/duolingo/screenshots/04-proficiency-self-select.png)

**Why this feature works (rationale).** Recognition is more inclusive than abstract
self-assessment, and likely more accurate: a low-literacy or non-native learner can
identify a math problem or a signal-bar level without parsing level vocabulary, an advanced
learner instantly spots their tier, and a novice is not shamed by jargon. It triple-encodes
the choice (example + name + statement) so at least one cue lands for every user type.
Recognition-memory research supports the inclusivity and ease claim; that recognition-based
*placement* is more accurate than label self-rating is a hypothesis this feature's
validation plan is designed to confirm. [ref: Standing 1973, recognition-memory
superiority; see references.md]

**How to validate this feature in the future.** Compare placement accuracy of a
problem-recognition selector vs. an abstract label selector: have users self-place, then
administer a short diagnostic, and measure agreement between chosen level and diagnostic
result across literacy and language backgrounds.

---

## Feature 5: Assessment-as-onboarding, delivered before the wall

**Short description.** Using a real skill assessment as the onboarding itself, so the
placement mechanic doubles as a "playable demo" of the product's core value, and crucially,
delivering it *before* any signup.

**Key findings.** Elsa embeds a genuinely working speaking test on its marketing page: a
sentence to pronounce, an audio model to hear, and a mic to record. The user reaches the
core interaction (speaking into a real assessment) with no signup or download. Pronunciation
scoring is what Elsa advertises the test performs; in our capture the mic fired on a silent
clip and the AI score itself appeared only as a marketing mockup, so the scoring was
observed as claimed, not as a returned result.

![Elsa's un-gated web speaking assessment: sentence, audio model, record button](platforms/elsa-speak/screenshots/03-web-speaking-assessment.png)

CodeSignal is the cautionary inverse: its signature AI skill-assessment placement is
identical in spirit but sits entirely behind a mandatory account form, so a prospective
learner never reaches it.

![CodeSignal's assessment is locked behind account creation](platforms/codesignal/screenshots/01-signup-gate-create-account.png)

**Why this feature works (rationale).** An assessment that is also a demo lets users feel
competence and see the product's value in the first minute, which is a powerful activation
and acquisition hook, and it produces the placement signal for free. Sequencing it before
the wall (Elsa) versus behind it (CodeSignal) is the difference between "try then commit"
and "commit to try": the former fits a hesitant, low-commitment audience far better. The
testing-effect literature supports only that a real assessment is genuine learning rather
than dead time; the stronger claim that sequencing it *before* the wall lifts activation
rests on the Elsa-vs-CodeSignal contrast and the A/B test proposed below, not on that
literature. [ref: Roediger & Karpicke 2006, the testing effect; see references.md]

**How to validate this feature in the future.** Prototype an un-gated first-task
assessment and measure completion rate and downstream signup among users who complete it
vs. those shown a signup wall first. For speaking specifically, pair with permission
priming (Feature 7) before testing on real devices.

---

## Feature 6: Code-first linked entry that routes to assigned content

**Short description.** A dedicated, distraction-free entry where a learner who arrives via
a class or program link enters a code and is routed straight to their assigned content,
bypassing the full catalogue.

**Key findings.** Khan's `/join` page is a single-task screen: "Join your class on Khan
Academy" with a segmented, fixed-length code input and nothing else: no nav, no catalogue.
A valid code routes the learner to their assigned class; an invalid code is rejected inline.

![A chrome-free page with one task and a segmented code input](platforms/khan-academy/screenshots/04-classcode-entry.png)

By contrast, an un-routed learner faces the full catalogue organized by grade and must
self-locate, the exact "which course is mine?" burden the code path removes.

![Without a code, the learner self-navigates a long grade-organized catalogue](platforms/khan-academy/screenshots/06-catalogue-grade-organized.png)

**Why this feature works (rationale).** For learners who join through a facilitator, teacher,
or program link, a code-first entry collapses the hardest navigation problem (finding the
right course among many) into a single deterministic step. Stripping the page of all other
UI keeps a low-context user focused on the one action, and a segmented input makes the code
format self-evident and reduces entry errors. [ref: Hick 1952 on choice reduction and
Sweller 1988 on cognitive load; see references.md]

**How to validate this feature in the future.** Usability test the code-entry flow with
first-time learners handed a link/code: task success (reached assigned content) and error
rate on code entry. Compare against the current experience where linked learners land in a
general catalogue, measuring how many reach the correct course unaided.

---

## Feature 7: Permission priming with a graceful fallback

**Short description.** Explaining *why* a device permission is needed immediately before
the system prompt fires, and always providing an escape hatch when the permission or
hardware is unavailable.

**Key findings.** Duolingo is the gold standard: the mascot says "I'll remind you to
practice so it becomes a habit" and *then* the browser notification prompt appears in
context, right after the rationale.

![Rationale first, then the native permission prompt, in context](platforms/duolingo/screenshots/07-notification-permission-primer.png)

Its speaking tasks also degrade gracefully: a "can't speak now" escape hatch marks the item
done with no penalty and temporarily disables speaking tasks, so a mic-less user is never
blocked.

![A "can't speak now" fallback keeps a mic-less user moving](platforms/duolingo/screenshots/10-placement-speaking-mic-skip.png)

Elsa is the cautionary opposite: its web speaking test fires the mic capture on click with
no rationale-first screen. (On this pre-granted browser profile no prompt appeared, but on
a first-time device this is the cold OS prompt that strands users.)

![Elsa fires the mic on click with no priming; state shown only by color change](platforms/elsa-speak/screenshots/04-mic-recording-active.png)

**Why this feature works (rationale).** Users deny permissions they do not understand, and
a cold system prompt (especially the OS-level mic prompt on mobile) is a common dead-end for
low-tech-literacy learners who cannot recover a blocked-permission state on their own.
Priming raises grant rates by supplying context, and a no-penalty fallback ensures a denied
or missing permission never halts the flow. [ref: Felt et al. 2012, "How to Ask for
Permission" (contextual/runtime requests); see references.md]

**How to validate this feature in the future.** On real mobile devices, A/B the primed vs.
raw permission prompt and measure grant rate and task-abandonment at the permission step.
Usability-test the speaking fallback with learners on shared or mic-less devices to confirm
they can complete onboarding without granting the mic.

---

## Feature 8: Character-guided, icon-first, low-text intake

**Short description.** A guide character narrates the onboarding while every question is
answered by tapping an icon card rather than reading and typing, minimizing reading load.

**Key findings.** All three character-led platforms use a mascot as a friendly guide
(Duolingo's Duo, Brilliant's Koji, "Hi, I'm Koji! I'll be your personal tutor," and
CodeSignal's Cosmo), and pose each question as a short prompt with pictorial choices.

![Every intake question is a short prompt plus icon cards](platforms/duolingo/screenshots/03-intake-why-learning.png)

![Brilliant's motivation intake: icon cards, mascot-guided](platforms/brilliant/screenshots/02-motivation-intake.png)

Brilliant extends personalization to the guide itself, letting the user choose the tutor's
voice, making the AI tutor feel chosen and owned.

**Why this feature works (rationale).** A guide character lowers cognitive load and adds
warmth, turning a form into a conversation, which reassures first-time and low-context users
that they are being led. Icon-first, low-text choices reduce the reading and typing burden
that blocks low-literacy and non-native learners, and personalizing the guide creates early
ownership that motivates completion. [ref: Lester et al. 1997 (persona effect) and Sweller
1988 (cognitive load); see references.md]

**How to validate this feature in the future.** Usability test with low-literacy learners:
can they complete the intake without assistance, and does the guide character reduce
hesitation at each step (measure time-per-step and requests for help)? Compare icon-card
questions against text-radio equivalents for completion rate.

---

## Feature 9: Momentum and motivation scaffolding

**Short description.** Small structural devices woven through the flow that make it feel
short, reversible, and worth finishing: progress bars, outcome projections, positive
feedback, and gentle re-engagement.

**Key findings.** Duolingo brackets its questionnaire with a progress bar and a back arrow
(finite and reversible), reinforces value with an outcome projection ("That's 50 words in
your first week!"), gives instant positive feedback on placement answers ("Nice!"), and
even deploys an exit-intent retention modal if the user tries to quit mid-placement.

![An outcome projection reframes the goal as a concrete payoff](platforms/duolingo/screenshots/06-habit-projection-50-words.png)

Brilliant threads credibility and reassurance interstitials between questions ("Built by the
best minds in education," "You can make progress in both subjects later on"). Both apps also
tease locked features with a concrete unlock condition ("complete 3 more lessons to start
competing") to set a near-term goal rather than overwhelming a new user.

**Why this feature works (rationale).** A visible, bounded progress indicator reduces the
anxiety of an open-ended form, and reversibility lowers the stakes of each choice. Outcome
projections and instant positive feedback supply motivation to continue, and teasing a
gated feature with a clear condition converts overwhelm into a single next goal. Together
they sustain a low-context user through a multi-step flow. [ref: Kivetz, Urminsky & Zheng
2006 (goal-gradient) and Nunes & Drèze 2006 (endowed progress); see references.md]

**How to validate this feature in the future.** Instrument step-level drop-off with and
without a progress bar and outcome-projection screens; measure completion of the full
intake. Test whether the feature-unlock teaser increases return-for-second-session rate.

---

## Feature 10: Deep localization of the onboarding

**Short description.** Delivering the entire onboarding (value proposition, intake,
feature claims, CTAs) in the learner's native language, detected automatically.

**Key findings.** Elsa geo-redirects to a fully localized site (Indonesian, on an `id.`
subdomain): the value proposition, feature descriptions, and CTAs are all in the learner's
language, not just the course content.

![The entire onboarding surface is localized, not just the lessons](platforms/elsa-speak/screenshots/01-landing-localized-value-framing-paywall.png)

**Why this feature works (rationale).** For learners studying a foreign language with low
proficiency, native-language *chrome* (instructions, buttons, value framing) is the
difference between comprehension and abandonment: a learner who cannot yet read the target
language must still understand what to do. Localizing only the content while leaving the
interface in English recreates the exact comprehension wall these learners face. [ref: L2
reading cognitive-load and UI-translation eye-tracking studies; see references.md]

**How to validate this feature in the future.** Comprehension test the onboarding in native
language vs. English-interface with the target learner population: task success and
self-reported understanding at each step. Prioritize localizing interface strings and error
messages, not just lesson content.

---

## Feature 11: Humanizing touches that build trust

> **Provenance (read first).** Unlike Features 1–10, this feature is **not** from our
> first-party, logged-out teardown of the five education apps: those apps show no
> humanizing/founder touch on their public surfaces, and the pattern lives mostly *after*
> signup, which our guardrails (no account creation, no paid access) prevent us reaching.
> It was added on 2026-07-15 from a practitioner-study lead (the ["1,460 onboarding flows"
> study](https://www.youtube.com/watch?v=Qsq-Sj_rojU)) and is grounded in **public case
> studies / teardowns**, cited inline and logged in `sources.md`. Treat it as a
> cross-industry hypothesis to validate, not an observed education-app finding.

**Short description.** Signals of a *real human* behind the product, a founder's note, a
personal welcome, a named human guide, used to convert a cold signup into a relationship.
Distinct from Feature 8's cartoon mascot: this is human presence and authorship, not a
character.

**Key findings.** *What the user sees:* in the strongest public example, Superhuman's
onboarding is led by a real, named specialist rather than a bot, and the broader pattern
appears as founder's notes and personal welcome messages signed by a human. *What the user
does:* engages in a short personal exchange (a discovery conversation about their workflow),
and in Superhuman's case verbally commits to a usage goal, then receives personal follow-up.
*What the system does:* routes new users to a human-led or human-authored welcome so the
*relationship*, not only the UI, carries activation. The reported impact is large but
context-specific: per First Round Review's Superhuman Onboarding Playbook, the founder
personally onboarded hundreds of early customers, and after human-led onboarding **over 65%
of new customers fully transitioned their email (more than double the self-serve rate), with
a ~2× uplift in referrals** ([First Round Review](https://review.firstround.com/superhuman-onboarding-playbook/)).
The 1,460-flow study separately reports that personalization correlates with materially
higher retention. *(Cross-industry, post-signup, high-touch B2B; not education-specific and
not first-party-observed, see Provenance.)*

**Why this feature works (rationale).** People respond socially to human cues even when they
know a machine is involved, so a visible human, a name, a note, a face, converts a
transactional signup into a reciprocal relationship, raising trust and commitment in a way a
faceless form cannot. [ref: Nass, Steuer & Tauber 1994, "Computers are Social Actors"; see
references.md] **Honest caveat:** the headline conversion numbers are industry case-study
data from a high-price, high-touch B2B product, not peer-reviewed evidence, and 1:1 human
onboarding does not scale to a low-cost, high-volume, low-context education audience. What
plausibly transfers is a *scalable* humanizing touch (a signed founder's note, a named human
voice at the wall), which is the hypothesis to test, not the white-glove model itself.

**How to validate this feature in the future.** A/B the cheapest scalable form first, a short
signed founder's note (or a named human voice) at the save-progress wall or first session,
versus no human touch. Measure self-reported trust, activation rate, and D1/D7 return with our
low-context audience. Only escalate toward higher-touch humanization if the lightweight
version moves trust and retention.

---

## Feature 12: Contextual, just-in-time education

> **Provenance (read first).** Added 2026-07-15 from the same [practitioner
> study](https://www.youtube.com/watch?v=Qsq-Sj_rojU). Its clearest *education-app*
> instance (Duolingo's in-lesson tooltips) is documented in a public teardown and is
> logged-out-observable; the checklist / progressive-disclosure examples (Slack, plus SaaS
> setup-checklist benchmarks) are cross-industry and drawn from public teardowns cited inline.
> Not part of the original
> first-party five-app teardown; validate before building.

**Short description.** Teaching the product *in context as the user acts*, one benefit-framed
tooltip at the moment of need, plus an interactive setup checklist, instead of front-loading
a multi-screen tutorial before the user has done anything.

**Key findings.** *What the user sees:* in Duolingo (an education app), tapping a word inside
a lesson reveals its meaning, and tooltips surface *during* a lesson to highlight the specific
element that is relevant right then, rather than a tutorial up front
([UserGuiding Duolingo teardown](https://userguiding.com/blog/duolingo-onboarding-ux)). In
Slack, the Slackbot teaches one feature at a time via progressive disclosure, and tooltip copy
is benefit-framed ("get around Slack faster," not "search messages")
([UserOnboarding Academy](https://useronboarding.academy/post/contextual-onboarding)). *What
the user does:* acts first (starts a lesson, sends a message) and learns each feature exactly
when it becomes
relevant, and works down a checklist of first tasks. *What the system does:* withholds
instruction until a contextual trigger fires, and tracks checklist completion, showing bounded
progress. The consolidated best practice from these teardowns: keep contextual tours short
(≤~7 tooltips), copy benefit-framed and brief, with a visible progress indicator
([Appcues](https://www.appcues.com/blog/feature-adoption-tooltips)).

**Why this feature works (rationale).** A front-loaded tutorial imposes extraneous cognitive
load before the user has any schema to attach it to, so it is largely forgotten; delivering one
lesson at the point of need keeps load low and relevance high. [ref: Sweller 1988, cognitive
load; see references.md] An interactive setup checklist exploits the drive to close open loops
and the endowed-progress effect to pull users through first-run tasks. [ref: Zeigarnik 1927;
Nunes & Drèze 2006; see references.md] Benefit-framed tooltip copy (Slack) sells the *outcome*
of a feature rather than naming it, the same principle as Feature 2's value-framing.
**Scope note:** contextual education lives mostly in the *post-activation learning home*, which
this study's onboarding arc treats as a boundary (out of scope for the pre-win flow). So this
feature primarily informs the first-session-and-beyond surface adjacent to the wall, not the
minimal routing intake.

**How to validate this feature in the future.** A/B an interactive setup checklist plus
in-context tooltips (≤7, benefit-framed) in the first session against a front-loaded tutorial.
Measure feature adoption, checklist-completion rate, time-to-second-task, and return-for-second-
session. For our low-literacy audience, additionally test tooltip comprehension (icon + short
localized copy) so the contextual teaching does not itself become a reading barrier.

---

## Gaps & caveats

- **Desktop-web capture; mobile/native not fully observed.** All captures are desktop web at
  a fixed ~1280px viewport (true mobile emulation was unavailable through the tooling). The
  onboarding *logic* is consistent across breakpoints, but touch-target sizing, vertical
  stacking, OS-level permission prompts, and native-app-only steps were not directly
  observed. This matters most for **Elsa** (true onboarding is app-only; we captured the
  marketing site plus a real web speaking test and app mockups) and to a lesser degree for
  Duolingo and Brilliant (native apps mirror the web logic). Per-platform notes flag the
  specific divergences.
- **CodeSignal's assessment interior is unseen.** Its signature skill-assessment placement is
  behind mandatory account creation; by decision we documented the gate rather than creating
  an account, so CodeSignal contributes a cautionary account-first data point but not an
  evaluated placement flow.
- **Single observed variant per platform.** Onboarding is heavily A/B-tested across all five;
  each teardown reflects one session/region and should not be read as the platform's only
  flow. Step order and copy may differ for other users.
- **No transactions; some flows sit behind paywalls.** Brilliant's first lesson and Elsa's
  full plan sit behind subscription paywalls we did not cross, so the *first-task activation*
  endpoint was reached cleanly only in the guest-friendly flows.
- **Activation endpoint reached unevenly.** Duolingo's placement and first-lesson entry were
  observed; for the wall-first and paywalled platforms the first true "win" was not reached,
  so cross-platform time-to-first-win is directional, not measured.
- **Advanced-user lens is well covered; the low-tech-literacy lens leans on inference.**
  Problem-recognition placement, icon-first intake, permission priming, and localization are
  strong evidence for the low-literacy case, but confirming they *work* for that population
  requires the usability tests proposed under each feature.
- **Features 11–12 are secondary-sourced, not first-party.** F11 (humanizing touches) and
  F12 (contextual education) were added 2026-07-15 from a practitioner-study lead and are
  grounded in public case studies / teardowns (plus one logged-out education instance for
  F12), because the patterns live mostly post-signup where our no-account / no-pay guardrails
  block first-party capture. They carry louder caveats than F1–F10 and each has a first-party
  validation step. F11's conversion evidence in particular comes from a high-touch B2B context
  that may not transfer to this audience.

---

## Principal Researcher QA — 2026-07-13

**Readiness verdict: Ready for `/review-research` once the flagged items are resolved.** The
synthesis is well structured and evidence-grounded: all 10 features carry the five required
fields in order, every embedded image path resolves to a real file on disk, and each "how to
validate" is a concrete, testable experiment. The flags below are precision and
attribution fixes, not structural rework; none invalidates a feature.

- **Structure & paths.** 10/10 features have the five required fields in order. All 20
  embedded screenshot paths verified present under `platforms/*/screenshots/`. No broken
  links. All validation steps are concrete.
- **Prose pass.** 24 em-dashes removed and replaced with the correct punctuation across the
  title, headings, and body (SYNTHESIS.md). 4 em-dashes were intentionally kept because they
  sit inside quoted on-screen UI copy (Duolingo's "Start from scratch"/"Find my level" cards
  and Brilliant's "Arithmetic"/"Calculus" level labels), which the prose rule preserves as
  verbatim evidence. No AI-slop rewrites were required; the prose was already clean. No
  finding, number, attribution, or citation was changed.
- **External validation.** 10/10 feature rationales checked against retrieved, cited
  literature (logged in `references.md`). 8 directly supported (F1, F2, F3, F6, F7, F8, F9,
  F10); 2 partially supported (F4, F5) where the principle holds but the specific applied /
  conversion claim is untested and correctly left to each feature's own validation plan.
  None contradicted. Inline `[ref: …]` tags added to every rationale.
- **Flagged for resolution (6 inline callouts):**
  1. **Overview headline 4 / Feature 5** — "excellent placement" (CodeSignal) asserts quality
     for an assessment that was never observed (gated; "reportedly" excellent in notes).
  2. **Feature 1** — "first lesson run in a guest session" overstates the capture; the first
     lesson was not completed (flow diverted to placement, then exited to `/learn`).
  3. **Feature 5** — "scored by its AI … speak, get scored" overstates Elsa; the mic fired on
     a silent clip, no score returned, and the scored result is shown only as a mockup.
  4. **Feature 5** — literature qualifier: the testing effect (Roediger & Karpicke 2006)
     supports "assessment is real learning" but not the before-the-wall conversion claim.
  5. **Feature 4** — literature qualifier: Standing 1973 supports recognition-over-recall but
     not the stronger "recognition placement is more accurate" claim (hypothesis, not result).
  6. **Features 3 & 4 overlap** — same placement moment; cross-reference as framing vs.
     mechanic rather than two independent features.
- **Overall:** Substance is sound and honestly caveated (the Gaps section already flags the
  gated/paywalled/uneven-activation limits). Resolve the six inline callouts (mostly softening
  three unobserved-quality/observation overclaims) before `/review-research`.

### Resolution (researcher, 2026-07-13)
All 6 flagged items resolved in place; the inline `> [Principal Researcher]` callouts were
removed once addressed:
1. Overview headline 4 — "excellent placement" softened to "a reportedly strong placement
   mechanic"; "Duolingo's playable first lesson" reworded to "guest-first flow (a real lesson
   is reachable before any account)".
2. Feature 1 — dropped "and first lesson"; now states the guest session reached
   personalization, placement, and the `/learn` home, with the first lesson noted as beyond
   the capture (per Gaps).
3. Feature 5 (key findings) — removed "scored by its AI"/"speak, get scored"; now states the
   sentence/audio/mic mechanic was observed and the AI score appeared only as a mockup.
4. Feature 5 (rationale) — added the qualifier that the testing-effect literature supports
   only "assessment is real learning," while the before-the-wall conversion claim rests on the
   Elsa-vs-CodeSignal contrast and the A/B plan.
5. Feature 4 (rationale) — softened "more accurate" to "likely more accurate," with the
   accuracy claim explicitly framed as a hypothesis for the validation plan.
6. Features 3 & 4 — cross-referenced as two facets of one placement moment (F3 = framing/
   optionality, F4 = selection mechanic).

**Status: ready for `/review-research`.**

### Addendum — F11 & F12 QA (2026-07-15)

Two features (F11 Humanizing touches, F12 Contextual just-in-time education) were added after the
original review from a practitioner-study lead ([the "1,460 onboarding flows"
study](https://www.youtube.com/watch?v=Qsq-Sj_rojU)), grounded in public teardowns / case studies
(secondary evidence) per an explicit user decision, because the patterns live post-signup where
guardrails block first-party capture. A Principal Researcher Mode B pass over **only these two**:

- **Structure:** both carry the five required fields in order; the see/do/system logic is present.
- **Provenance:** the secondary, cross-industry, post-signup nature is disclosed clearly and not
  overclaimed as observed education-app evidence; F11's high-touch-B2B caveat is adequate.
- **External validation:** Nass et al. 1994 (F11) and Sweller 1988 / Nunes & Drèze 2006 /
  Zeigarnik 1927 (F12) are real and correctly matched; F11's peer-reviewed-anchor vs.
  industry-metric split is handled honestly; no fabricated or stretched citation.
- **Verdict: revise (light) → resolved.** Two precision fixes applied: (A) removed an em-dash in
  the F11 provenance prose; (B) dropped the uncited Notion example so every F12 example stays
  grounded.

**Not yet done for F11/F12:** F1–F10 carry the full chained stakeholder `## Agent Review` below;
F11/F12 have passed only this Principal Researcher QA. Before FR-14/FR-15 are committed they should
go through `/review-research` (PM / Tech Lead / Head of Product) and the Principal Designer Mode S
gate, like the rest.

---

## Agent Review

### Review — 2026-07-15 (goal: benchmark feeding a build decision) — full synthesis F1–F12

This supersedes the 2026-07-13 review, extending it to the two features added 2026-07-15: **F11 (Humanizing touches)** and **F12 (Contextual, just-in-time education)**, both **secondary-sourced** (public teardowns / case studies, not first-party captures — see each feature's Provenance block and the F11/F12 QA addendum). F1–F10 were unchanged; all three personas affirmed their prior verdicts and concentrated fresh scrutiny on F11/F12. Chained PM → Tech Lead → Head of Product.

### Product Manager — soundness
Both new features are legitimate patterns with a product-fit gap for our audience, and both belong as **post-MVP experiments, not build commitments**. **F11:** its only quantified evidence is Superhuman — high-touch, high-price B2B, founder onboarding hundreds 1:1 — the opposite of a low-cost, high-volume, low-context education product; 1:1 does not scale. The buildable residue is a signed founder's note / named human voice at the save-progress wall (a cheap A/B that pairs with F1), but it's held back because the trust deficit it fixes isn't among this study's grounding pains, it overlaps F8's mascot warmth, and a note leans on reading and on caring who the founder is — weak levers for low-literacy/low-context users. **F12:** well-evidenced (Sweller; Duolingo's in-lesson tooltips; benefit-framed copy echoing F2) but it straddles the scope line: the in-scope half is the anti-pattern "don't front-load a multi-screen tutorial before the first task" (reinforcing guest-first/win-first); the out-of-scope half (setup checklist + post-win tooltip tours) is a post-activation learning-home workstream that must not be smuggled into the minimal routing intake — and a tooltip is itself reading, a literacy barrier for our audience. F1–F10 carried forward. **Top concern:** both new features sit at/beyond the activation boundary and rest on a single, education-non-analogous, B2B-heavy lead; sequence them as cheaply-validated post-MVP experiments, don't pull relationship/teaching surfaces into the 0-to-1 spine.

### Tech Lead — build effort & feasibility (read the PM review)
On feasibility the two are near-opposites. **F11 is Low — pure content, no infra:** a string plus a slot in F1's registration wall (S7), no state/service/ML/targeting; it can't exist without F1, so it's a rider on that workstream, not its own. White-glove 1:1 isn't an engineering estimate (human labour + scheduling) and is rejected. Its only real cost is **localizing free-text warm prose per locale** (the hardest copy to translate sincerely — EN/ID today) plus owning a **named-human identity** (PII/content governance). **F12 splits:** (i) *not* front-loading a tutorial is a **free constraint** (negative work, ship now); (ii) the interactive checklist + tooltip engine is a real **Medium** post-activation workstream — per-user task state (needs F1 account infra), tooltip targeting + per-tooltip dismissal persistence + i18n, usually **bought, not built**. Its top risk: tooltip targeting is anchored to a **mobile DOM we never observed** (all captures desktop-web ~1280px; the product is mobile-first; anchoring is most fragile across breakpoints) — build it later, buy-vs-build, on the real UI. Neither feature adds infra beyond the F1 account-merge and F10 i18n already mandated. F1–F10 effort ratings affirmed unchanged (see the sequencing in the prior review: infra first — guest/account-merge, i18n, DS primitives — then F2+F1, F3+F4, F8-icon + F9-bar, F6 if links primary, F7, F5 last).

### Head of Product — final call (read both)
The MVP's job is unchanged: **prove value before the wall, extract the minimum to route, defer the rest.** Neither new feature — secondary-sourced from a non-analogous B2B lead, sitting at/past the activation boundary — earns a place in the pre-win MVP; only the sliver that fits inside that job cheaply survives. **F11 — Conditional Go:** admit only the scalable signed-note/named-voice at F1's wall, as a **post-MVP A/B**; reject white-glove; **condition** — it must lift self-reported trust and D1/D7 return for our audience before any build beyond a copy slot (scope it as content; mind per-locale warm-prose localization and the named-human identity). **F12 — split:** **Go** on (i) the free "no front-loaded tutorial" constraint (adopt in MVP, the one in-scope, education-observed piece); **No-Go / defer** on (ii) the checklist + tooltip engine — quarantine as a separate post-activation buy-vs-build workstream (blind mobile targeting + literacy-barrier risk). **Net entering the MVP from F11/F12: only F12's free constraint.** F1–F10 calls re-affirmed, no reversals; the synthesis remains fit to drive the build precisely because it is honestly caveated. The two prerequisites to resource first remain the pre-win-vs-post-win extraction decision and the guest-to-registered account-merge — which F11/F12 now also depend on.

### Consolidated verdict

| Feature | PM | Tech Lead | Head of Product |
|---|---|---|---|
| F1 — Deferred "try-first" registration | Sound | Medium | **Go** |
| F2 — Single-CTA landing | Sound | Low | **Go** |
| F3 — Optional placement fork | Sound | Low–Medium | **Go** |
| F4 — Recognition-based level selection | Sound | Low | **Go** |
| F5 — Assessment-as-onboarding before the wall | Needs refinement | High | **Conditional Go** — decouple from ML scoring; ship after F7; own workstream |
| F6 — Code-first linked entry | Sound | Medium | **Conditional Go** — confirm program/facilitator links are a primary acquisition channel |
| F7 — Permission priming + fallback | Sound | Medium | **Go** |
| F8 — Character-guided, icon-first intake | Sound | Low (icon-first) | **Go** — build icon-first; defer the guide character |
| F9 — Momentum & motivation scaffolding | Needs refinement | Low–Medium | **Conditional Go** — build the progress bar now; defer the trigger-driven pieces |
| F10 — Deep localization | Sound | Medium | **Go** — as a day-one i18n architecture decision |
| F11 — Humanizing touches | Needs refinement | Low (scalable note only) | **Conditional Go** — signed note/named voice at F1's wall as a post-MVP A/B; white-glove rejected; condition: proven to lift trust/return for our audience |
| F12 — Contextual just-in-time education | Needs refinement | (i) ~free / (ii) Medium | **Go on (i)** the "no front-loaded tutorial" constraint; **No-Go on (ii)** the checklist/tooltip engine — defer to a separate post-activation workstream |

### Legend
- **PM soundness** — *Sound* (right feature for the goal, well-scoped and coherent, ship/validate as-is) · *Needs refinement* (valuable but has scope, framing, or evidence gaps to resolve before committing) · *Reject* (not the right feature for the goal).
- **Tech Lead build effort** — *Low* (authored content/config or standard components; no novel infra or ML) · *Medium* (non-trivial but well-trodden engineering: state, routing, aggregation; no major new risk surface) · *High* (a major workstream: novel infra, a security surface, or recurring ML/inference cost plus eval).
- **Head of Product call** — *Go* (build it; clear impact and fit) · *Conditional Go* (pursue once the stated condition is met) · *No-Go* (do not build now).

**Verdict summary:** 8 Go, 3 Conditional Go, 1 split (F12: Go on the constraint / No-Go on the engine). No feature adds infrastructure beyond the F1 account-merge and F10 i18n already mandated. F11 and F12 are endorsed as *direction*, not MVP scope — only F12's free "don't front-load a tutorial" constraint enters the MVP.
