# Brilliant — Heuristic Feature Audit

**Three features:** (1) AI conversational course recommender, (2) Koji in-lesson learning companion, (3) non-MCQ interactive practice.

**Prepared by:** Senior UX Researcher · **Date:** 2 July 2026
**Status:** Expert **heuristic audit** — *not* a validated user-research study. Read Section 1 before treating anything here as a finding.

---

## For the PM agent (read this first)

- This document is a **hypothesis generator and risk register**, not evidence. Every claim about *learning effectiveness* or *retention* is a hypothesis, labelled with a confidence tag.
- **Do not convert `[Needs verification]` items directly into shipped requirements.** Convert them into *decisions to make* or *tests to run* (Sections 4 of each feature + Section 6).
- The three features occupy **different points of the learning loop** — activation, mastery/monetisation, and the mastery loop itself. Do not scope "the AI feature" as one thing.
- Confidence tags map to build risk: `[High]` = safe to design against; `[Medium]` = design against but flag the assumption; `[Low]`/`[Needs verification]` = validate before committing scope.

### Confidence key
- `[High]` — directly observable in the provided screenshots, or stated on Brilliant's own pages.
- `[Medium]` — reasoned design intent, or a well-established principle applied to what is visible.
- `[Low]` — plausible but weakly supported inference.
- `[Needs verification]` — needs the live product, code, analytics, or user testing to confirm.

---

## 1. Evidentiary status & method

### What this is / is not
- Built from **six product screenshots** + **Brilliant's public help pages and launch materials**. It flags risks and generates hypotheses.
- **No participants. No task-success data. No retention/completion analytics. No A/B results.**
- This is a **single-product teardown** — *not* a competitive benchmark (no competitor set was scoped) and *not* a usability test (no users). Both are offered as follow-ups in Section 6. Keeping this distinction visible is deliberate: benchmarking is comparative/heuristic; usability testing measures task success on a product with real users.
- **Crawl reachability:** Brilliant's help centre and launch blog were reachable and are cited. The three in-product surfaces (recommender modal, Koji, the truck exercise) were **not** independently reachable by crawl (logged-in / partly Premium-gated), so their behaviour is read from screenshots + Brilliant's own descriptions — which are *claims*, not independent validation. Third-party reviews are labelled as such.

### Method used, and why
- **Method:** expert heuristic walkthrough blending **(a)** Nielsen's usability heuristics (interface friction) with **(b)** learning-science principles — feedback timing, desirable difficulty, the generation effect, the assistance dilemma / expertise-reversal effect, and near/far transfer.
- **Why this blend, not Nielsen alone:** Nielsen surfaces interface problems but is silent on whether a feature *teaches*. For an ed-tech product the pedagogical layer is the point; interface heuristics alone would miss the highest-severity risk (over-scaffolding that inflates completion but not learning). No single house framework is applied by default.
- **Why not a competitive matrix:** only one product and no comparison set/tasks were defined. A cross-product scorecard is a separate study (Section 6, Option B).
- **Why not SUS / task-success now:** no user access in this engagement. Those are the *validation instruments*, not available inputs.
- **This audit's own limits:** single evaluator, no inter-rater check, static screenshots (not the live build), no user data. A second evaluator + a live walkthrough would raise the confidence of every `[Medium]` below.

---

## 2. Feature 1 — AI conversational course recommender ("What do you want to learn? / Ask")

*Screenshots: `briliant3.png` (primary recommendation), `briliant2.png`/`briliant4.png` (clarifying question). Entry point visible top-right of `briliant1.png`.*

### 2.1 What it is
- A natural-language box ("Reply here…", magnifier icon, "Ask" button) that takes a free-text goal and returns a conversational recommendation. In the captured session the learner typed the ungrammatical "I dont know how to code where i should start?" and received: a prose framing ("learn how to think like a programmer… breaking problems into logical steps"), a **primary recommended lesson card** ("Taking the First Steps — Thinking in Code · Level 1") with a one-line rationale, a **secondary** suggestion ("Variables"), and a **follow-up question** ("general fundamentals, or… a specific language like Python?") with three chips: *Just the fundamentals / I want to learn Python / How AI works*. `[High]`
- **Positioning:** Brilliant's public copy describes "recommending next steps"; the older documented onboarding was a static persona picker (student/professional/hobbyist). This conversational surface appears newer and LLM-style; Brilliant does not name it as a distinct product in reachable docs. Feature name/scope `[Needs verification]`. Whether it shares Koji's model is plausible but `[Needs verification]`.

### 2.2 Heuristic assessment (weakness first)
- **WEAKNESS — it commits before it diagnoses.** It delivers a specific primary recommendation *and then* asks the disambiguating question. For a diagnostic recommender the ordering is backwards: it anchors the learner on an answer produced before the constraint that should shape it was elicited. A Python-intending learner has already been pointed at a non-Python lesson; the chips risk reading as decorative. `[Medium]` (ordering observable; anchoring harm is the hypothesis).
- **Mixed metaphor — search vs chat.** Magnifier icon + "Ask" button + "Reply here…" blend three mental models (search / question / conversation). It tolerated a full sentence well, but users may not know whether to type keywords or prose. `[Medium]`
- **Chip-axis inconsistency.** "Just the fundamentals" and "I want to learn Python" are depth/language choices; "How AI works" is a topic on a different axis. Mixing axes in one row muddies the choice. `[Low]`
- **What works — recommendation transparency.** The card gives a plain-language *why* ("the perfect starting point to learn the logic behind coding before you… worry about typing complex syntax") and names the destination. Telling the learner why, not just what, is a genuine strength. `[High]` present; `[Medium]` that it meaningfully builds trust.
- **Personalisation depth unverified.** If every cold-start learner gets "Taking the First Steps," the "smart/personalised" framing over-promises. `[Needs verification]`
- **Handoff destination unknown.** Deep-link into the first activity vs. a course landing page (extra click) materially changes the activation payoff. `[Needs verification]`

### 2.3 Learning-loop rationale — mechanism + tradeoff
- **Loop targeted:** the *activation* front of the loop (trigger → first action), **not** the return trigger.
- **Mechanism `[Medium]`:** self-directed STEM's largest early drop-off is "I don't know where to start." Converting a vague goal into one concrete next lesson collapses that paralysis and shortens time-to-first-lesson. External reviews echo the problem it addresses (Brilliant is self-driven; subscriptions "go unused" without structure).
- **Category caution `[Medium]`:** this is an **acquisition/activation lever, not a retention lever**. Attributing *retention* gains to it would be a misassignment — it helps people *enter* the loop, not *return* to it.
- **Counter-risk `[Medium]`:** surfacing many tempting options can increase course-hopping, which reviews call the enemy of completion ("the compounding only kicks in if you finish things"). More choice ≠ more learning.

### 2.4 What would validate this
- First-lesson funnel: % of recommender users who start the recommended lesson in-session vs. persona-picker baseline (tests the activation claim).
- 5–8 moderated first-run sessions with true novices: does "recommend-then-ask" cause anchoring? Do users read the box as conversational?
- Recommendation-diversity check: feed varied goals; log whether outputs meaningfully differ (tests personalisation).

---

## 3. Feature 2 — Koji, the in-lesson AI learning companion

*Screenshot: `briliant6.png` (opening narration + text/voice input).*

### 3.1 What it is
- **Koji** is Brilliant's in-course AI tutor — a green character shown as speech bubbles beside the lesson, plus a "How can I help?" text/voice input (mic visible; voice layer is ElevenLabs per third-party coverage). In the captured coding lesson Koji opens with orienting bubbles ("You know how to move the truck around." / "Let's add a new command: delivering packages." / "Drive forward and deliver the package."). Mute + flag controls present. `[High]` observed; voice-provider detail `[Medium]`/third-party.
- **Stated design (Brilliant's own launch + help pages):** Koji "asks instead of tells… never, ever just hands you the answer"; it can **see and manipulate the lesson's interactive components** (highlight, annotate, pose an intermediate interactive question); it "offers more help when you're learning a new topic, and steps back when it's time to test your knowledge"; by default it speaks at the start of each page — "not reading the instructions aloud, but noticing… what changed… before you try." Brilliant claims it is "exceedingly unlikely to make a math mistake" because it is wired into their interactive infrastructure. `[High]` these are Brilliant's *stated claims*; `[Needs verification]` that behaviour matches at scale.
- **Access model:** free users get a limited Koji preview, then it is **Premium-gated**; Brilliant frames Koji as Premium's primary value. `[High]`

> **Correction to a naive screenshot read.** The three greyed bubbles *look* like passive narration ("Koji tells rather than elicits"). Brilliant's documented behaviour is the opposite — those opening bubbles are the intentional start-of-page "noticing," and Socratic elicitation triggers as the learner works or asks. A "Koji just narrates" critique would therefore be **wrong**; the real risks are tuning and accuracy (below). `[Medium]`

### 3.2 Heuristic assessment (weakness first)
- **WEAKNESS — the central risk is help-titration, and it's unverifiable from outside.** "Ask, don't tell" and "fade as mastery grows" are correct in principle (they protect the generation effect and dodge the assistance dilemma / expertise-reversal effect). But the value hinges on whether fading is tuned right for weak vs. strong learners. Too much help too early breeds dependence and inflates in-lesson success while degrading retention; too little frustrates. Brilliant *asserts* the good behaviour; nothing observable confirms the tuning. **Highest-leverage thing to test.** `[Medium]` as risk; `[Needs verification]` on their tuning.
- **WEAKNESS — accuracy is guarded for math, unclear for code.** The math-correctness claim rests on Koji reading Brilliant's interactive math components. Our screenshots are a **coding** lesson; whether coding guidance has the same guardrails or is more exposed to LLM error is unconfirmed. Voice raises the stakes — a spoken wrong hint feels authoritative (a point third-party coverage also raises). `[Needs verification]`
- **Screen contention on smaller viewports.** In the captured frame Koji fills a large panel and the lesson is pushed off-screen right. Companion vs. task competing for space raises split-attention load during problem-solving — though this may be a capture-crop artifact, not the responsive layout. `[Medium]` / `[Needs verification]`
- **Low-contrast past bubbles** may fall below WCAG contrast; unverified against actual values. `[Low]` / `[Needs verification]`
- **What works:** (a) a proactive first line lowers the barrier to asking — sound, since the learners who most need help are least likely to request it; (b) an in-context tutor that *acts on the lesson surface* (not a detached chatbot) is a real differentiator; (c) voice + multilingual input lowers friction and widens access for younger/non-native learners. `[High]` exist; `[Medium]` on impact.
- **Ethics/audience note.** Koji targets ~age 10+, described as COPPA-compliant with safety filtering and zero-data-retention arrangements with model providers. Relevant if your analogue serves minors — verify independently, not from marketing. `[Needs verification]`

### 3.3 Learning-loop rationale — mechanism + tradeoff
- **Loop targeted:** the **mastery loop** (attempt → feedback → correction → retrieval), operating *during* practice and *at the moment of failure* — not just activation.
- **Mechanism `[Medium]`:** the dominant churn moment in self-paced learning is getting stuck with no recourse. An in-place tutor that unblocks *without answering* keeps the learner inside the attempt→feedback loop instead of bouncing; the fading behaviour is designed to hand cognition back as competence grows, which builds durable retrieval rather than momentary success.
- **Tradeoff — the loop and the paywall are the same lever.** Koji is the primary Premium upsell; free users hit a wall after a preview. So Koji "drives the loop" fully **only for paying users**; free users experience the loop deliberately interrupted to drive conversion. The strategic crux for a competitor analysis: is the companion *a learning feature that converts* or *a conversion feature dressed as pedagogy*? Honest answer: both — where you draw that line should be an explicit product decision, not an inherited assumption. `[Medium]`
- **Counter-risk `[Medium]` / `[Needs verification]`:** if tuning is even slightly too generous, Koji manufactures a *feeling* of progress (lessons cleared with heavy help) that doesn't survive to unaided retrieval — a loop that spins without compounding. Only outcome data separates real mastery from assisted completion.

### 3.4 What would validate this
- **Assisted vs. unaided retrieval:** delayed re-test for heavy vs. light Koji users on the same material (the core mastery question).
- **Stuck-point recovery:** instrument wrong-answer events; measure whether a Koji interaction restores forward progress vs. abandonment, and how hint depth escalates.
- **Free→Premium timing:** where the Koji wall lands in the loop, and its effect on both conversion *and* free-user retention (they can trade off).
- **Coding-accuracy audit:** expert review of Koji's *coding* hints, separate from the math claim.

---

## 4. Feature 3 — Non-MCQ interactive practice (block-sequencing, "Thinking in Code")

*Screenshot: `briliant5.png` (truck block-coding exercise, empty program state).*

### 4.1 What it is
- A direct-manipulation exercise: a task prompt ("Drive forward and deliver the package."), a **visual world** (truck on a road/grid, trees, a "Solitary ST" sign, a "1 left" delivery counter), **two numbered empty slots** forming a program, **two draggable command blocks** ("drive forward", "deliver package"), a **disabled-until-filled "Check"** button, and a **"Start over"** reset. Block-based / drag-to-sequence programming (Scratch/Blockly lineage) — the antithesis of multiple-choice. `[High]`
- **Positioning:** consistent with Brilliant's core "learn by doing / 100% active learning, no passive videos." The block scaffold is explicitly framed (in the recommender copy) as learning "the logic behind coding before you… worry about typing complex syntax." `[High]`

### 4.2 Heuristic assessment (weakness first)
- **WEAKNESS — the whole value rides on failure feedback, which is invisible here.** Non-MCQ beats a good MCQ **only if** the richer answer space is exploited on a wrong answer — e.g. running the truck and showing *where* it failed, not a binary "incorrect." The captured frame is pre-submission; what "Check" does on a wrong sequence is unknown and is **the most important thing to test** about this feature. A non-MCQ that merely says "wrong" is *worse* than an MCQ with explanations. `[Medium]` principle; `[Needs verification]` actual feedback.
- **WEAKNESS — the transfer gap.** Block sequencing teaches control flow and decomposition but not syntax; the jump to writing real code is a known weak point of block-based pedagogy. Brilliant clearly knows this (blocks are positioned as a pre-syntax stage), but "does it transfer?" remains open, not solved. `[Medium]`
- **Drag-mechanic discoverability** for first-timers can't be judged from a static frame; often needs a first-run affordance. `[Needs verification]`
- **Minor labelling:** "Solitary ST" and "1 left" aren't self-evident out of context. Low stakes. `[Low]`
- **What works (with the tradeoff named):** direct manipulation + a visible world state + a cheap, prominent "Start over" is textbook active learning and low-cost experimentation — inviting more attempts per session. Dashed drop-zones signal affordance well; disabling "Check" until filled is sensible error prevention. The tradeoff is the transfer question above — "more interactive" ≠ "more learning." `[High]` exist; `[Medium]` on impact.

### 4.3 Learning-loop rationale — mechanism + tradeoff
- **Loop targeted:** this feature **is** the mastery loop rather than a feeder — build → Check → observe world-state feedback → correct → retry. The loop is directly legible in the UI (slots, Check, Start over). `[Medium–High]` as mechanism.
- **Reps mechanism `[Medium]`:** a visible, low-cost reset lowers the cost of failure → raises willingness to experiment → raises attempts-per-session (the "reps" side of skill acquisition). Brilliant wraps this practice loop in a **separate retention layer** visible elsewhere in the screenshots — daily "keys" (the "2-keys" counter; free = 2 lessons/day), leagues ("HYDROGEN LEAGUE"), streak/energy counters — i.e. a Duolingo-style return-trigger the recommender lacks.
- **Tradeoff `[Medium]`:** the loop **compounds only if** failure feedback is rich (see 4.2) and difficulty ramps beyond trivial warm-ups (this frame is a 2-block warm-up by design). A tight loop around shallow feedback produces engagement without learning.

### 4.4 What would validate this
- **Feedback-quality teardown:** capture the wrong-answer state — does it localise the failure in the world, or just gate? Decides whether the non-MCQ investment pays off.
- **First-attempt success + retry behaviour:** instrument attempts-to-correct and Start-over usage; productive struggle vs. flailing look different in the data.
- **Transfer probe:** for learners who finish the block track, measure performance on a first *typed-syntax* task (tests the block→code bridge directly).

---

## 5. Cross-cutting observations

- **One shared, fatal evidence gap.** Every effectiveness/retention claim across all three features is a hypothesis. This audit is a prioritised test list, not results.
- **The three features sit at different points of the loop — don't flatten them.** Recommender = *activation* (front); Koji = *mastery + monetisation* (middle, gated); interactive practice = *the mastery loop itself*, wrapped in a separate gamified retention layer.
- **The retention engine is NOT the AI.** The observable return-triggers are the gamification layer (keys, leagues, streaks), not the recommender or Koji. If the interest is retention, the AI features are the wrong place to look first; if it's activation and unblocking, they're the right place.
- **Monetisation is entangled with pedagogy in Koji.** The strongest learning feature is also the paywall. Any "build an AI tutor" decision should separate the *learning* claim from the *conversion* claim explicitly.
- **Prioritisation, highest-leverage first (all `[Needs verification]`):** (1) Koji's help-titration + assisted-vs-unaided retention; (2) interactive-practice failure-feedback quality; (3) recommender activation lift + anchoring risk.

---

## 6. If you want to turn this into real research (scoping options)

**Option A — Usability test of the three flows** (on your analogue once built, or on Brilliant as reference).
- RQ (singular): "Where do novices stall in each flow, and does the AI help move them forward?"
- Method: 6–8 moderated task sessions, think-aloud. **Why not a survey:** stall points and misunderstanding are behavioural, not self-reportable.
- Recruit: true novices matching Brilliant's stated 10+/adult-beginner audience. **Validity risk:** small *n* → directional, not rate-accurate.

**Option B — Competitive benchmark** vs. Duolingo / Khan / Codecademy / Math Academy.
- RQ: "How does our activation + unblocking compare on the same first-hour tasks?"
- Method: comparative task-based heuristic walkthrough, fixed task set, ≥2 evaluators (report inter-rater agreement). **Why not a feature matrix:** a matrix counts features; a task benchmark measures the experience. Distinct from usability-testing your own product.

**Option C — Learning-outcome study** (expensive, decisive).
- RQ: "Does the Koji-assisted path produce better *unaided* retention than the unassisted path?"
- Method: controlled pre/post with a delayed retention test. **Why:** the only design that separates real mastery from assisted completion.

---

## 7. Open questions / `[Needs verification]` register

| # | Question | Feature | What would resolve it |
|---|----------|---------|----------------------|
| 1 | Does the recommender deep-link into the first activity or a course landing page? | F1 | Live walkthrough of the "Taking the First Steps" card |
| 2 | Are recommendations meaningfully personalised, or largely one default? | F1 | Diversity check across varied goal inputs |
| 3 | Is the recommender its own system or shared with Koji? | F1 | Product/eng confirmation |
| 4 | Is Koji's help-titration tuned correctly across learner strengths? | F2 | Assisted-vs-unaided delayed retrieval test |
| 5 | Are Koji's **coding** hints accuracy-guarded like its math hints? | F2 | Expert coding-hint accuracy audit |
| 6 | Does the responsive layout crowd the lesson with Koji on small screens? | F2 | Live test at mobile/tablet widths |
| 7 | Where does the free→Premium Koji wall land, and its effect on free-user retention? | F2 | Funnel + cohort analysis |
| 8 | On a wrong sequence, does "Check" localise the failure or just gate? | F3 | Capture the wrong-answer state |
| 9 | Is there a first-run affordance teaching the drag mechanic? | F3 | First-run walkthrough with a novice |
| 10 | Does block-sequencing transfer to typed-syntax coding? | F3 | Transfer probe after the block track |

---

## 8. Screenshot placement guide (for the human doc)

| File | Shows | Place in |
|------|-------|----------|
| `briliant1.png` | Learning Paths page; recommender entry point (top-right); course tiles; keys/streak counters | Optional opener / §2 entry point |
| `briliant3.png` | Recommender — **primary recommendation** ("Taking the First Steps") | §2, first image |
| `briliant2.png` *(or `briliant4.png` — near-identical; use one)* | Recommender — **clarifying question + chips** + user message | §2, second image |
| `briliant6.png` | **Koji** companion — opening bubbles, mic input | §3 |
| `briliant5.png` | **Non-MCQ** truck block-coding exercise | §4 |

*Note: `briliant4.png` duplicates `briliant2.png`.*

---

## 9. Sources

**Brilliant's own statements (reachable; these are claims, not independent validation):** Help Center — *How does Koji work*, *Free vs Premium*, *Pricing & Plans*; Brilliant blog — *"A world-class tutor in every home"*; brilliant.org `/ai`, `/courses`.
**Third-party (labelled as such, used for corroboration):** e-student, learnopoly, beginnersinai, chatgate, completeaitraining reviews; press coverage of the Koji launch.
**Primary (UI state only, not behaviour):** the six product screenshots provided.
