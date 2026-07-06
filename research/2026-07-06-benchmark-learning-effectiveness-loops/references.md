# External Academic Evidence Base — Learning-Effectiveness Loops

**What this file is.** An external, peer-reviewed evidence base assembled to *validate or
challenge* the findings of our platform-benchmarking study (Khan Academy first). The study
looks at three loops: (1) the **learning loop** — present → practice → feedback →
mastery/retention; (2) the **engagement loop** — streaks, points, goals, rewards that bring
users back; and (3) **efficacy measurement** — how you actually know a learner got smarter,
not just more engaged.

**How to use it.** Each entry below is a foundational or highly-cited empirical source, grouped
so a cluster can back (or push back on) a specific observation from the benchmark. Every source
was retrieved via web search/fetch during compilation and carries a working URL. Where a claim
could only be *partially* verified, it is flagged inline. Nothing here is cited from memory alone.

**Verification note.** All URLs below resolved during compilation. Two primary PDFs
(the SRI Khan Academy report and the Ryan & Deci 2000 SDT PDF) downloaded as valid multi-MB
PDF files but could not be machine-parsed for text; their bibliographic details were
cross-confirmed from the publisher/landing pages (SRI.com and the CMU ACT-R publications
page respectively). These are flagged as "verified via landing page."

---

## A. Learning-loop mechanics

- **Bloom, B. S. (1984). "The 2 Sigma Problem: The Search for Methods of Group Instruction as Effective as One-to-One Tutoring."** *Educational Researcher*, 13(6), 4–16.
  Finding: students tutored 1:1 under mastery learning scored ~2 standard deviations above conventional-class peers (≈98th percentile); ~90% of tutored and ~70% of mastery-learning students reached a level only the top 20% of conventional students reached.
  URL: https://journals.sagepub.com/doi/10.3102/0013189X013006004
  Supports: **learning loop** (mastery + corrective feedback as the ceiling to design toward); frames why adaptive/mastery practice is the goal and sets the efficacy bar.

- **Roediger, H. L., & Karpicke, J. D. (2006). "Test-Enhanced Learning: Taking Memory Tests Improves Long-Term Retention."** *Psychological Science*, 17(3), 249–255.
  Finding: repeated retrieval (testing) beat repeated study for long-term retention — restudy won at a 5-min delay, but testing produced substantially higher recall at 2 days and 1 week. The "testing effect."
  URL: https://journals.sagepub.com/doi/abs/10.1111/j.1467-9280.2006.01693.x
  Supports: **learning loop** (practice/quizzing is itself a learning event, not just measurement) — validates practice-heavy designs over re-watch/re-read.

- **Cepeda, N. J., Pashler, H., Vul, E., Wixted, J. T., & Rohrer, D. (2006). "Distributed Practice in Verbal Recall Tasks: A Review and Quantitative Synthesis."** *Psychological Bulletin*, 132(3), 354–380.
  Finding: meta-analysis of 317 experiments (839 assessments) — spaced practice reliably beats massed practice, and the optimal inter-study gap grows with the target retention interval.
  URL: https://pubmed.ncbi.nlm.nih.gov/16719566/ (open PDF: https://augmentingcognition.com/assets/Cepeda2006.pdf)
  Supports: **learning loop + retention** (spacing/review scheduling, the basis for spaced-repetition mechanics); challenges "cram in one session" engagement designs.

- **Ericsson, K. A., Krampe, R. Th., & Tesch-Römer, C. (1993). "The Role of Deliberate Practice in the Acquisition of Expert Performance."** *Psychological Review*, 100(3), 363–406.
  Finding: expert performance is strongly associated with accumulated *deliberate* practice — effortful, goal-directed activity with feedback at the edge of current ability — not just time or talent. (Note: magnitude later contested; see Macnamara et al. 2019 re-analysis, same theme, below reference URL.)
  URL: https://www.scirp.org/reference/referencespapers?referenceid=1787135 ; critical re-analysis: https://royalsocietypublishing.org/doi/full/10.1098/rsos.190327
  Supports: **learning loop** (practice must be targeted + feedback-rich, not mere repetition); a caution that "hours on platform" ≠ deliberate practice.

- **Hattie, J., & Timperley, H. (2007). "The Power of Feedback."** *Review of Educational Research*, 77(1), 81–112.
  Finding: feedback is among the strongest influences on achievement but is *variable* in effect — the most effective feedback answers "Where am I going? / How am I going? / Where to next?" and targets the task/process/self-regulation levels rather than praising the person.
  URL: https://journals.sagepub.com/doi/abs/10.3102/003465430298487 (open PDF: https://open-publishing.org/wp-content/uploads/2024/02/Hattie-PowerFeedback-2007.pdf)
  Supports: **learning loop — feedback stage** (design of hints/explanations after practice); warns that not all feedback helps (praise/scores can even hurt).

- **Sweller, J. (1988). "Cognitive Load During Problem Solving: Effects on Learning."** *Cognitive Science*, 12(2), 257–285.
  Finding: conventional problem solving imposes high working-memory (cognitive) load that crowds out schema acquisition; worked examples/scaffolding free capacity for learning. Foundation of Cognitive Load Theory and the worked-example effect.
  URL: https://onlinelibrary.wiley.com/doi/10.1207/s15516709cog1202_4
  Supports: **learning loop — present/scaffold stage** (worked examples, fading, step-by-step guidance for novices); challenges "throw learners straight into hard problems."

## B. Measuring genuine learning (efficacy)

- **Hake, R. R. (1998). "Interactive-Engagement Versus Traditional Methods: A Six-Thousand-Student Survey of Mechanics Test Data for Introductory Physics Courses."** *American Journal of Physics*, 66(1), 64–74.
  Finding: across 62 courses (N=6,542) using pre/post concept tests, normalized gain ⟨g⟩ = (post−pre)/(100−pre) cleanly separated interactive-engagement courses (⟨g⟩≈0.48) from traditional ones (⟨g⟩≈0.23). Established **normalized learning gain** as a course-comparable efficacy metric.
  URL: https://pubs.aip.org/aapt/ajp/article-abstract/66/1/64/1055076 (open PDF: https://www.jgravesedu.com/wp-content/uploads/2019/11/Hake-1998-Normalized-gain.pdf)
  Supports: **efficacy measurement** (pre/post + normalized gain is the practical way to claim "they learned"); the metric our platform should instrument.

- **Corbett, A. T., & Anderson, J. R. (1995). "Knowledge Tracing: Modeling the Acquisition of Procedural Knowledge."** *User Modeling and User-Adapted Interaction*, 4(4), 253–278.
  Finding: introduced **Bayesian Knowledge Tracing** — models the latent probability a learner has mastered each skill from their stream of correct/incorrect responses (params: prior, learn, guess, slip), enabling mastery-based advancement in tutoring systems.
  URL: http://act-r.psy.cmu.edu/?post_type=publications&p=14344 (citation verified via CMU ACT-R landing page)
  Supports: **efficacy measurement + learning loop** (per-skill mastery estimation drives "mastery," adaptive review, and progress bars grounded in actual proficiency).

- **Murphy, R., Gallagher, L., Krumm, A., Mislevy, J., & Hafter, A. (2014). "Research on the Use of Khan Academy in Schools."** SRI International (funded by the Bill & Melinda Gates Foundation).
  Finding: two-year study across 9 sites / 20 schools / 70+ teachers on Khan Academy as a *supplemental* classroom tool. Largely an **implementation** study (not a controlled efficacy trial); 85% of teachers reported positive perceived impact, but rated it far more effective for advanced students (74%) than struggling ones (25%). Positive associations with test scores were correlational, not causal.
  URL: https://www.sri.com/publication/education-learning-pubs/digital-learning-pubs/research-on-the-use-of-khan-academy-in-schools-implementation-report/ (report PDF: https://s3.amazonaws.com/KA-share/impact/khan-academy-implementation-report-2014-04-15.pdf — PDF downloaded/valid; citation verified via SRI landing page)
  Supports & **challenges**: **efficacy measurement** — the flagship Khan study is implementation-focused and correlational, so it is weak causal evidence of learning gains; a caution about over-claiming from vendor/adoption studies.

- **Barnett, S. M., & Ceci, S. J. (2002). "When and Where Do We Apply What We Learn? A Taxonomy for Far Transfer."** *Psychological Bulletin*, 128(4), 612–637.
  Finding: provides a 9-dimension taxonomy separating *near* transfer (similar contexts) from *far* transfer (different content, context, modality, time). Argues far transfer is hard and rarely demonstrated, and that studies must specify the transfer distance being claimed.
  URL: https://pubmed.ncbi.nlm.nih.gov/12081085/ (open PDF: https://rapunselshair.pbworks.com/f/barnett_2002.pdf)
  Supports & **challenges**: **efficacy measurement** — passing platform items (near) does not prove real-world/far transfer; efficacy claims must state which transfer they measured.

## C. Engagement loop and its risks

- **Ryan, R. M., & Deci, E. L. (2000). "Self-Determination Theory and the Facilitation of Intrinsic Motivation, Social Development, and Well-Being."** *American Psychologist*, 55(1), 68–78.
  Finding: durable motivation rests on three basic psychological needs — **autonomy, competence, relatedness**. Intrinsic motivation (doing it for its own interest) is more self-sustaining than extrinsic; contexts that support the three needs foster it, controlling ones erode it.
  URL: https://selfdeterminationtheory.org/SDT/documents/2000_RyanDeci_SDT.pdf (PDF downloaded/valid; citation verified via landing page https://pubmed.ncbi.nlm.nih.gov/11392867/)
  Supports & **challenges**: **engagement loop** — points/streaks are extrinsic; SDT says design for competence + autonomy (meaningful choice, optimal challenge) or engagement won't outlast the rewards.

- **Deci, E. L., Koestner, R., & Ryan, R. M. (1999). "A Meta-Analytic Review of Experiments Examining the Effects of Extrinsic Rewards on Intrinsic Motivation."** *Psychological Bulletin*, 125(6), 627–668.
  Finding: meta-analysis of 128 experiments — tangible, expected, engagement/completion/performance-contingent rewards *significantly undermined* free-choice intrinsic motivation (d ≈ −0.28 to −0.40). The **overjustification effect**, quantified.
  URL: https://home.ubalt.edu/tmitch/642/articles%20syllabus/Deci%20Koestner%20Ryan%20meta%20IM%20psy%20bull%2099.pdf
  **Challenges**: **engagement loop** — the central risk: XP/badges/reward-for-doing can crowd out the very interest that keeps learners coming back once rewards stop.

- **Lepper, M. R., Greene, D., & Nisbett, R. E. (1973). "Undermining Children's Intrinsic Interest with Extrinsic Reward: A Test of the 'Overjustification' Hypothesis."** *Journal of Personality and Social Psychology*, 28(1), 129–137.
  Finding: children who expected a reward for an already-enjoyed drawing activity later chose to do it less than children who got no reward or an unexpected one — the original demonstration of the overjustification effect.
  URL: https://web.mit.edu/curhan/www/docs/Articles/15341_Readings/Motivation/Lepper_et_al_Undermining_Childrens_Intrinsic_Interest.pdf
  **Challenges**: **engagement loop** — foundational caution that *expected* extrinsic rewards for an intrinsically interesting task backfire.

- **Hamari, J., Koivisto, J., & Sarsa, H. (2014). "Does Gamification Work? — A Literature Review of Empirical Studies on Gamification."** *Proc. 47th Hawaii International Conference on System Sciences (HICSS)*, 3025–3034.
  Finding: review of 24 empirical studies — gamification generally produces positive effects, but they are **highly context- and user-dependent**, several outcomes are only perceptual/self-report, and some studies show null or negative effects.
  URL: https://dl.acm.org/doi/10.1109/HICSS.2014.377 (open PDF: http://creativegames.org.uk/modules/Gamification/Hamari_etal_Does_gamification_work-2014.pdf)
  Supports & **challenges**: **engagement loop** — gamification can lift engagement but is not a guaranteed or context-free win; measure it, don't assume it.

- **Sailer, M., & Homner, L. (2020). "The Gamification of Learning: A Meta-Analysis."** *Educational Psychology Review*, 32(1), 77–112.
  Finding: small but significant positive effects of gamification on cognitive (g=0.49), motivational (g=0.36), and behavioral (g=0.25) learning outcomes; the cognitive effect held under high-rigor studies while motivational/behavioral effects were less stable.
  URL: https://link.springer.com/article/10.1007/s10648-019-09498-w (record: https://eric.ed.gov/?id=EJ1245270)
  Supports: **engagement loop → learning** — best evidence that gamification *can* modestly aid actual learning, not just engagement; effect sizes are small, so treat as a lever, not a guarantee.

- **Kivetz, R., Urminsky, O., & Zheng, Y. (2006). "The Goal-Gradient Hypothesis Resurrected: Purchase Acceleration, Illusionary Goal Progress, and Customer Retention."** *Journal of Marketing Research*, 43(1), 39–58.
  Finding: people accelerate effort as they near a reward (goal-gradient); an *illusory* head start ("endowed progress," e.g. 12-stamp card with 2 pre-filled) speeds completion and raises retention. The mechanism behind progress bars and streak/reward proximity.
  URL: https://journals.sagepub.com/doi/abs/10.1509/jmkr.43.1.39 (open PDF: https://home.uchicago.edu/ourminsky/Goal-Gradient_Illusionary_Goal_Progress.pdf)
  Supports: **engagement loop** — evidence base for streaks, progress bars, and endowed-progress mechanics that drive return visits.

- **Lally, P., van Jaarsveld, C. H. M., Potts, H. W. W., & Wardle, J. (2010). "How Are Habits Formed: Modelling Habit Formation in the Real World."** *European Journal of Social Psychology*, 40(6), 998–1009.
  Finding: daily repetition in a stable context builds automaticity following an asymptotic curve; median time to reach 95% automaticity was **66 days** (range 18–254), and missing a single day did not derail formation.
  URL: https://onlinelibrary.wiley.com/doi/abs/10.1002/ejsp.674
  Supports: **engagement loop — habit** (rationale for daily-cue designs and streaks) but tempers streak anxiety: one missed day is not catastrophic, and habits take weeks-to-months.

- **Champaign, J., Colvin, K. F., Liu, A., Fredericks, C., Pritchard, D. E., et al. (2014). "Correlating skill and improvement in 2 MOOCs with a student's time on tasks."** *Proc. First ACM Conference on Learning @ Scale (L@S '14)*, 11–20.
  Finding: in two large MOOCs, time-on-task showed **negative** correlations with skill and skill gain — likely because struggling students spend more time — illustrating that raw engagement/time metrics can move opposite to learning.
  URL: https://dl.acm.org/doi/10.1145/2556325.2566250
  **Challenges**: **efficacy vs engagement** — a concrete example that "more time/engagement" does not imply "more learning"; flagged as *partially verified* (details drawn from search summaries and the ACM record; PDF/full text not independently fetched).

## Key tensions to watch (test the benchmark's observations against these)

1. **Engagement can rise while learning stays flat (or falls).** Time-on-task, sessions, and streaks are not proxies for learning (Champaign et al. 2014; Barnett & Ceci 2002). Any "it works" claim needs a pre/post learning measure (Hake 1998), not just usage.
2. **Extrinsic rewards can crowd out intrinsic motivation.** Points/badges/streak rewards risk the overjustification effect once rewards stop (Deci, Koestner & Ryan 1999; Lepper et al. 1973). Watch whether the platform builds *competence + autonomy* (SDT) or only external carrots.
3. **Gamification effects are real but small and context-dependent.** Do not assume a mechanic that worked elsewhere will transfer (Hamari et al. 2014; Sailer & Homner 2020). Instrument and A/B-test each one.
4. **Practice quality > practice quantity.** Deliberate, feedback-rich, appropriately-scaffolded, spaced practice is what drives gains (Ericsson 1993; Sweller 1988; Cepeda 2006; Hattie & Timperley 2007) — a platform can show lots of "practice" that isn't deliberate.
5. **Mastery is the bar, and it must be measured, not asserted.** Bloom's 2-sigma and Bayesian Knowledge Tracing define mastery-based progression; progress bars should reflect *estimated proficiency*, not items-viewed (Bloom 1984; Corbett & Anderson 1995).
6. **Near ≠ far transfer.** Doing well on platform items may not mean the skill transfers to real tasks/tests (Barnett & Ceci 2002). Be explicit about which transfer any efficacy claim covers.
7. **Streaks: motivating but double-edged.** Goal-gradient/endowed-progress genuinely drive return behavior (Kivetz et al. 2006), and habits take ~2+ months to form (Lally 2010) — but streak-loss anxiety and reward-contingency can undercut intrinsic interest (tension #2).
8. **Beware vendor/adoption evidence.** The flagship Khan Academy study is implementation-focused and correlational (Murphy et al. 2014); teacher perception and adoption are not causal proof of learning gains.
