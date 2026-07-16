# References — External Validation of Feature Rationales

Peer-reviewed / authoritative sources retrieved during the Principal Researcher
Mode B QA pass (2026-07-13) to corroborate or challenge each feature's stated
rationale in `SYNTHESIS.md`. Every URL below was retrieved via web search during
this pass; none is fabricated. Each entry notes the finding and whether it
**supports**, **partially supports**, or **challenges** the rationale.

---

## Feature 1 — Deferred, "try-first" registration

- **Kahneman, D., Knetsch, J. L., & Thaler, R. H. (1991).** "Anomalies: The
  Endowment Effect, Loss Aversion, and Status Quo Bias." *Journal of Economic
  Perspectives*, 5(1), 193–206.
  https://www.aeaweb.org/articles?id=10.1257/jep.5.1.193
  - Finding: people demand far more to give up something they already hold than
    they would pay to acquire it (endowment effect / loss aversion).
  - **Supports** the rationale that reframing the eventual signup as "save the
    progress you already made" converts loss aversion into a reason to register.
    Note: this validates the *framing* mechanism, not the specific drop-off
    numbers, which the feature's own A/B plan still needs to measure.

## Feature 2 — Landing value-framing with a single unambiguous CTA

- **Hick, W. E. (1952).** "On the Rate of Gain of Information." *Quarterly Journal
  of Experimental Psychology*, 4(1), 11–26.
  https://journals.sagepub.com/doi/10.1080/17470215208416600
  - Finding: choice reaction time rises logarithmically with the number of
    alternatives presented.
  - **Supports** the rationale that a single high-contrast CTA with no competing
    elements speeds the decision of what to do next; more competing controls
    lengthen and complicate the choice.

## Feature 3 — Optional, positively-framed placement fork

- **Ryan, R. M., & Deci, E. L. (2000).** "Self-Determination Theory and the
  Facilitation of Intrinsic Motivation, Social Development, and Well-Being."
  *American Psychologist*, 55(1), 68–78.
  https://selfdeterminationtheory.org/SDT/documents/2000_RyanDeci_SDT.pdf
  - Finding: autonomy (volition, an internal locus of control) is a core driver
    of intrinsic motivation and engagement.
  - **Supports** the rationale that offering placement as an opt-in choice rather
    than an imposed test preserves autonomy, and that recommending a foundation
    course while still permitting the jump keeps control with the learner.

## Feature 4 — Level selection by recognition, not by label

- **Standing, L. (1973).** "Learning 10,000 Pictures." *Quarterly Journal of
  Experimental Psychology*, 25(2), 207–222.
  https://www.tandfonline.com/doi/abs/10.1080/14640747308400340
  - Finding: recognition memory is far more capacious and reliable than recall,
    and pictorial material is recognized better than verbal.
  - **Partially supports** the rationale. It backs the general recognition-over-
    recall principle (recognizing a worked problem is easier than recalling and
    self-labelling a level) and the value of pictorial cues. It does **not**
    directly test the stronger applied claim that recognition-based *placement is
    more accurate*, which the feature's own validation plan (recognition vs.
    label selector against a diagnostic) is designed to measure.

## Feature 5 — Assessment-as-onboarding, delivered before the wall

- **Roediger, H. L., & Karpicke, J. D. (2006).** "Test-Enhanced Learning: Taking
  Memory Tests Improves Long-Term Retention." *Psychological Science*, 17(3),
  249–255. https://journals.sagepub.com/doi/10.1111/j.1467-9280.2006.01693.x
  - Finding: retrieval practice (taking a test) itself improves later retention
    more than re-studying (the testing effect).
  - **Partially supports** the rationale. It backs the sub-claim that an
    assessment is not dead time but genuine learning, so "assessment as
    onboarding" is productive. It does **not** speak to the feature's core
    *conversion* claim (that placing the assessment before the signup wall lifts
    activation and acquisition); that is a UX/marketing sequencing hypothesis the
    feature's A/B plan must test.

## Feature 6 — Code-first linked entry that routes to assigned content

- **Hick, W. E. (1952).** *Quarterly Journal of Experimental Psychology*, 4(1),
  11–26. https://journals.sagepub.com/doi/10.1080/17470215208416600
  - **Supports** collapsing the "which course is mine?" catalogue search into a
    single deterministic code step: fewer alternatives, faster and less
    error-prone decision.
- **Sweller, J. (1988).** "Cognitive Load During Problem Solving: Effects on
  Learning." *Cognitive Science*, 12(2), 257–285.
  https://onlinelibrary.wiley.com/doi/10.1207/s15516709cog1202_4
  - **Supports** stripping the join page to a single task: removing extraneous
    UI lowers extraneous cognitive load and keeps a low-context user focused on
    the one action. (The segmented fixed-length input is the applied form of
    chunking; Miller's 1956 chunking principle is the classic basis.)

## Feature 7 — Permission priming with a graceful fallback

- **Felt, A. P., Egelman, S., Finifter, M., Akhawe, D., & Wagner, D. (2012).**
  "How to Ask for Permission." *7th USENIX Workshop on Hot Topics in Security
  (HotSec '12).*
  https://www.usenix.org/conference/hotsec12/workshop-program/presentation/felt
  - Finding: granting permissions at runtime, in context, gives users the
    information to infer *why* access is needed, improving comprehension and
    reducing habituation to warnings.
  - **Supports** the rationale directly: priming with a rationale immediately
    before the system prompt (rather than a cold up-front prompt) raises the
    chance a user understands and grants the permission.

## Feature 8 — Character-guided, icon-first, low-text intake

- **Lester, J. C., et al. (1997).** "The Persona Effect: Affective Impact of
  Animated Pedagogical Agents." *CHI '97.*
  https://www.semanticscholar.org/paper/The-persona-effect:-affective-impact-of-animated-Lester-Converse/4bf061f85d1495448f83b5e3bb6ec7e30bfe818d
  - Finding: the presence of a lifelike guide character has a strong positive
    effect on learners' perception of their experience (the "persona effect").
  - **Supports** the rationale that a mascot guide lowers hesitation and adds
    warmth for first-time learners.
- **Sweller, J. (1988).** *Cognitive Science*, 12(2), 257–285.
  https://onlinelibrary.wiley.com/doi/10.1207/s15516709cog1202_4
  - **Supports** the icon-first, low-text claim: reducing reading and typing
    burden lowers extraneous cognitive load, which matters most for low-literacy
    and non-native learners.

## Feature 9 — Momentum and motivation scaffolding

- **Kivetz, R., Urminsky, O., & Zheng, Y. (2006).** "The Goal-Gradient Hypothesis
  Resurrected: Purchase Acceleration, Illusionary Goal Progress, and Customer
  Retention." *Journal of Marketing Research*, 43(1), 39–58.
  https://journals.sagepub.com/doi/abs/10.1509/jmkr.43.1.39
  - Finding: people accelerate effort as they near a visible goal, and illusory
    progress toward it further increases persistence.
  - **Supports** the rationale that a bounded, visible progress bar plus a
    near-term unlock condition sustains a user through a multi-step flow.
- **Nunes, J. C., & Drèze, X. (2006).** "The Endowed Progress Effect: How
  Artificial Advancement Increases Effort." *Journal of Consumer Research*,
  32(4), 504–512.
  https://academic.oup.com/jcr/article-abstract/32/4/504/1787425
  - **Supports** the same mechanism: reframing a task as already-begun-and-
    incomplete raises completion rate and speed.

## Feature 10 — Deep localization of the onboarding

- **"You Can Stand Under My Umbrella: Cognitive Load in Second-Language
  Reading."** *PMC* (open access).
  https://www.ncbi.nlm.nih.gov/pmc/articles/PMC12382749/
  - Finding: reading non-native-language text raises cognitive load and produces
    processing disfluency.
  - **Supports** the rationale that a learner who cannot yet read the target
    language needs native-language interface *chrome* to comprehend and act.
- **"The impact of translation modality on user experience: an eye-tracking
  study of the Microsoft Word user interface."** *PMC* (open access).
  https://pmc.ncbi.nlm.nih.gov/articles/PMC8550651/
  - **Supports** that interface language and translation quality materially
    affect usability, i.e. localizing UI strings (not only content) matters.

## Feature 11 — Humanizing touches that build trust (added 2026-07-15)

- **Nass, C., Steuer, J., & Tauber, E. R. (1994).** "Computers are Social Actors."
  *Proceedings of CHI '94*, 72–78. ACM.
  https://dl.acm.org/doi/10.1145/191666.191703
  - Finding: people apply social rules and responses to computers, and respond to
    social cues (personality, human presence) even when they know the source is a
    machine (the "computers are social actors" / media-equation paradigm).
  - **Supports** the rationale that a visible *human* signal (a founder's note, a
    named human guide) triggers a social/relational response that a faceless form
    does not, raising trust and reciprocity.
  - **Provenance caveat (important):** the strong conversion figures cited for this
    feature (Superhuman: >65% full transition, ~2× self-serve; 2× referral uplift)
    are **industry case-study data, not peer-reviewed**, and come from a **high-touch,
    high-price B2B** context (First Round Review, Superhuman Onboarding Playbook,
    logged in sources.md). Whether a *scalable* humanizing touch (a signed note, not
    1:1 onboarding) transfers to a low-cost, high-volume, low-context education
    audience is a hypothesis, not a settled result — see the feature's validation plan.

## Feature 12 — Contextual, just-in-time education (added 2026-07-15)

- **Sweller, J. (1988).** *Cognitive Science*, 12(2), 257–285. (Reused from F6/F8.)
  https://onlinelibrary.wiley.com/doi/10.1207/s15516709cog1202_4
  - **Supports** teaching in context over front-loading: a multi-screen tutorial
    shown before the user has acted imposes extraneous cognitive load with no schema
    to attach it to; one lesson delivered at the point of need keeps load low and
    relevance high.
- **Nunes, J. C., & Drèze, X. (2006).** *Journal of Consumer Research*, 32(4),
  504–512. (Reused from F9.)
  https://academic.oup.com/jcr/article-abstract/32/4/504/1787425
  - **Supports** the interactive-checklist mechanic: framing first-run setup as an
    already-begun, incomplete list raises completion (the endowed-progress effect).
- **Zeigarnik, B. (1927).** "Das Behalten erledigter und unerledigter Handlungen"
  ("On the retention of completed and uncompleted tasks"). *Psychologische Forschung*,
  9, 1–85. *(Classic source; no open-access primary retrieved — cited as the origin of
  the completion-drive claim, corroborated by the modern checklist-completion evidence
  logged in sources.md.)*
  - **Supports** the checklist mechanic: unfinished tasks stay in working memory and
    create a drive to close the loop, which an incomplete setup checklist exploits.

---

### Summary

- Directly supported by the literature: F1, F2, F3, F6, F7, F8, F9, F10, F12 (9).
- Partially supported (principle holds; the specific applied/conversion claim is
  untested and left to the feature's own validation plan): F4, F5, F11 (3). F11 is a
  special case: its psychological anchor (social response to human cues, Nass 1994) is
  peer-reviewed, but its headline conversion metrics are industry case-study data from a
  non-analogous high-touch context.
- Contradicted by the literature: none.
- **Provenance note for F11–F12:** unlike F1–F10 (first-party desk-research captures of
  the five education apps, logged-out), F11 and F12 were added from a practitioner-study
  lead (the "1,460 onboarding flows" video) and are grounded in **public teardowns and
  case studies** plus one education-app instance (Duolingo in-lesson tooltips, F12), per
  the 2026-07-15 secondary-evidence decision. Their SYNTHESIS entries flag this, and both
  carry a first-party / usability validation step.
