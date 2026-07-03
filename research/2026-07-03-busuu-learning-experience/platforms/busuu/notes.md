# Busuu: observations & patterns

Analysis of the learning experience observed 2026-07-03 (logged-in free account,
English course, Beginner A1). For the blow-by-blow of the core lesson see `flow.md`;
this file captures the *patterns worth synthesizing*.

## The candidate pool (features observed)

More than three distinct learning-experience features surfaced. Listed so the
synthesis can pick the top 3 on merit rather than restating capture buckets:

1. **Bite-sized, multi-format lesson player**: 1-minute lessons alternating
   present → practise, with video-modelled native speech, audio at adjustable
   speed, fill-the-blank and matching exercises, and keyboard shortcuts.
   Evidence: `02`, `03`, `06`, `flow.gif`.
2. **Instant, instructional feedback**: every answer (right or wrong) returns the
   correct sentence, replayable audio, and a plain-language grammar rule, in a
   consistent panel. Wrong answers teach rather than penalise. Evidence: `04`, `05`,
   `07`.
3. **Community / Conversations (human correction by native speakers)**: Busuu's
   signature differentiator vs. purely automated apps: a feed of real learners'
   writing/speaking submissions you can correct, and your own work can be corrected
   by native speakers. Evidence: `12`, `13`, `14`.
4. **Spaced-repetition Review**: vocabulary bucketed by strength (Weak/Medium/
   Strong) with a "Review now" flow; grammar review "unlocks as you learn".
   Evidence: `15`.
5. **Motivation & retention stack**: Stars + Score per lesson, a daily-streak flame,
   **Today's challenges** (daily goals with progress), and a weekly **Blue League**
   peer leaderboard. Evidence: `08`, `10`, `11`.
6. **AI pronunciation (Speak)**: "instant, personalised feedback" on speaking;
   Premium Plus. Evidence: `16`.
7. **Freemium / paywall model**: pervasive upsells (see below); shapes the whole
   experience for a free user.

## Patterns worth synthesizing

- **"10 minutes a day" is the whole design thesis.** The tab title literally reads
  "Learn to speak a language in 10 minutes a day." Everything reinforces short,
  daily, low-friction sessions: 1-minute lessons, a 1-tap "Let's go!", keyboard
  shortcuts, and a daily-goals + streak layer that rewards *showing up* over
  marathon study. The product optimises for habit, not session length.

- **Feedback is a teaching surface, not a scoreboard.** The strongest UX pattern is
  that a wrong answer and a right answer get the *same* rich panel: correct form +
  replayable audio + a one-line grammar rule. This turns the moment of being graded
  into the moment of learning, and removes the "punished for guessing" feeling.
  Contrast with apps that only flash red/green.

- **Human-in-the-loop correction is the moat.** The Community/Conversations layer is
  what automated competitors can't easily copy: native speakers correct your real
  writing/speaking, and you build reciprocity by correcting others ("Give
  correction" / "Give feedback"). It scales 1:1 language feedback socially. The
  receiving side is asynchronous (you submit, corrections arrive later), so it is a
  retention *and* a re-engagement mechanism (a reason to come back = "someone
  corrected you").

- **Modelled speech everywhere.** New language is introduced by real people on video
  with replayable, speed-adjustable audio, not text alone. This front-loads
  listening and pronunciation exposure into even the earliest vocabulary steps.

- **Layered motivation, escalating social pressure.** The reward stack after one
  lesson escalates: personal (Stars/Score/words) → daily (challenges) → social
  (league). Each answers a different question: "did I do well?", "am I on track
  today?", "how do I compare?". The weekly league is time-boxed (resets), which
  manufactures urgency without permanent punishment, but carries a demotivation
  risk for learners stuck near the bottom.

- **Spaced repetition is framed as word *strength*, not intervals.** Bucketing vocab
  into Weak/Medium/Strong makes the invisible SRS state legible and gives the
  learner a tangible target ("turn red words green"), which is a friendlier mental
  model than review-due dates.

## Freemium / paywall friction (guardrail: never paid, never trialed)

Busuu is aggressively freemium and it materially shapes the free experience:

- **Two full-screen upsells fire immediately after finishing a lesson** ("Upgrade to
  Busuu Premium", then "Tired of distractions?") before returning to the path,
  interrupting the reward moment. Evidence: `09`.
- A persistent **"70% off Premium"** button sits in the top bar on every screen, plus
  in-path Premium cards and crown-locked lessons on the timeline.
- **Vocabulary Review is capped** ("2/2 FREE REVIEWS LEFT"). Evidence: `15`.
- **Speak** is **Premium Plus**; **Grammar Review** and many later lessons are gated.
  Evidence: `16`.
- These paywalled interiors were **not purchased or trialed** per the workspace
  guardrail; they are documented from their free entry points/upsells only.

## Gaps & caveats
- Studied a **single free account**; Premium/Premium Plus interiors (full Grammar
  Review, unlimited Vocabulary Review, Speak lessons, deeper AI feedback) are
  described from their entry points, not their interiors.
- The **Conversations receiving side** (native-speaker corrections arriving on your
  own submissions) is asynchronous and was not observed in-session; the *submission*
  and *correcting-others* sides were captured.
- `flow.gif` records the loop from the first practice exercise onward (the recorder's
  50-frame rolling buffer dropped the dashboard→lesson-entry opening); those opening
  steps are covered in `flow.md` and `01`.
- **PII redaction:** the account holder's name/avatar/email and all third-party
  names/avatars (Community feed, correction view, Blue League) were blurred before
  saving; verified in the captured images.

## Sources
- `https://www.busuu.com/dashboard`: course timeline / learning path.
- `https://www.busuu.com/dashboard/learning/course/...`: lesson player (vocabulary
  presentation, complete-the-sentence, match-the-pairs), instant feedback, finish
  screen, post-lesson upsells, Today's challenges, Blue League.
- `https://www.busuu.com/dashboard/social/discover`: Community, Discover feed of
  submissions + "Give correction".
- `https://www.busuu.com/dashboard/corrections/<id>`: give-correction / "Give
  feedback" view.
- `https://www.busuu.com/dashboard/grammar-review` and `/dashboard/review`: Review
  (Grammar + Vocabulary spaced-repetition, strength buckets, "2/2 free reviews").
- `https://www.busuu.com/dashboard/speak`: Speak (AI pronunciation, Premium Plus).
