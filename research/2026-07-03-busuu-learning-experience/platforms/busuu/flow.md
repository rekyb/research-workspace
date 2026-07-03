# Busuu: core learning flow (written companion to `flow.gif`)

**One-line summary:** Entry point = the course timeline ("Complete English", A1). Goal =
complete one bite-sized lesson end-to-end and see the reward loop. The path is:
**dashboard → open a 1-minute lesson → watch/read new vocabulary → practise it with
instant-feedback exercises → finish for Stars + Score → get pushed through upsells,
daily challenges and a peer league → land back on an updated dashboard.**

Observed 2026-07-03 on a logged-in free account (English course, Beginner A1). All
captures are redacted of personal data. The GIF records the loop from the first
practice exercise onward; this document covers the whole flow including the entry
steps the GIF's rolling buffer did not retain.

---

1. **Open the course.** The learner lands on the **course timeline**: a vertical
   "learning path" of numbered lessons grouped into chapters (Chapter 1:
   Introductions), each lesson a node with an illustration, a title, and a
   completion tick. A progress bar shows the chapter is 14% done and the next
   lesson ("Introducing yourself · Say your name") is highlighted as the next step.
   *Screen shows:* the path, chapter progress, and a persistent "70% off Premium"
   button. Evidence: `01-course-timeline-learning-path.png`.

2. **Preview the lesson.** Clicking the highlighted lesson pops a small tooltip that
   states the **lesson type and time cost** ("VOCABULARY · 1 MIN") with a single
   **"Let's go!"** button. This sets a low-effort expectation (one minute) before
   any commitment. *Delight:* the explicit "1 MIN" framing lowers the barrier to
   starting. Evidence: `flow.gif` (opening), described here.

3. **Meet new vocabulary.** The lesson opens on a **"Look, something new!"** card:
   a short **video of a native speaker** saying the target phrase (e.g. "What's your
   name?", "My name's Lisa.", "I'm David."), an **audio scrubber with a 1× speed
   control**, and a bookmark icon to save the word. A top progress bar tracks
   position in the lesson. The learner presses **Continue** to advance.
   *Screen shows:* modelled language in context (video + text + replayable audio).
   Evidence: `02-vocab-presentation-video-audio.png`, `flow.gif`.

4. **Practise it immediately (fill-in).** The next card is a **"Complete the
   sentence"** exercise: the same speaker clip plus a sentence with a blank
   (`____ your name?`) and two word tiles to choose from ("Was" / "What's"). Each
   tile carries a **keyboard shortcut number** (1, 2) for fast, mouse-free answering.
   Evidence: `03-complete-the-sentence-exercise.png`, `flow.gif`.

5. **Get corrected on a wrong answer.** Choosing the wrong tile ("Was") turns it
   **red** in the sentence and slides up an instructional feedback panel: a heading
   ("Practice makes perfect"), the **correct answer with a replayable audio button**
   ("What's your name?"), and a **plain-language rule** ("We use 'What's your name?'
   to ask someone for their name"). A single **Continue** moves on. *Key design
   point:* wrong answers teach, they do not just mark. Evidence:
   `04-incorrect-answer-feedback.png`, `flow.gif`.

6. **Get reinforced on a right answer.** Choosing correctly turns the tile **green**
   and shows the same panel shape with **varied praise copy** ("Great job!", later
   "Well done", "You did it", "Amazing work") plus the full correct sentence, its
   audio, and the grammar rule. On some correct answers a **confetti burst**
   animates. The consistent panel means right and wrong answers are taught the same
   way. Evidence: `05-correct-answer-feedback.png`, `flow.gif`.

7. **Switch exercise format (matching).** Partway through, the format changes to
   **"Match the pairs"**: four tiles (sentence halves: "My name…", "What's your…",
   "is Paul.", "name?") to connect into correct pairs. Matched pairs turn green; a
   final panel ("You did it") gives a **consolidated grammar recap** covering all the
   phrases at once. This variety keeps the short lesson from feeling repetitive.
   Evidence: `06-match-the-pairs-exercise.png`, `07-match-complete-grammar-recap.png`,
   `flow.gif`.

8. **Finish the lesson (reward).** Completing the last exercise opens a **lesson-
   complete screen**: a celebratory illustration, a personalised greeting ("Well
   done, <name>!", redacted), and two result tiles (**Stars +10** and **Score 80%**)
   plus a **Vocabulary +3** words-learned counter. Evidence:
   `08-lesson-complete-stars-score.png`, `flow.gif`.

9. **Hit the paywall (friction).** Before returning to the path, the learner is
   pushed through **two consecutive full-screen upsells**: "Upgrade to Busuu Premium",
   then "Tired of distractions? Ads keep learning free…" with **"Get 70% off"**.
   Each has a small skip ("Continue" / "Not now"). *Friction:* the reward moment is
   immediately interrupted by monetisation. Evidence:
   `09-post-lesson-premium-upsell.png`, `flow.gif`.

10. **See daily goals.** Next is **"Today's challenges"**, a daily-goals card set:
    "Earn 20 stars" (complete ✓), "Complete 3 lessons" (2/3), "Score over 80% in 2
    lessons" (1/2), each with a progress bar. This reframes the single lesson as
    progress toward a day's targets. Evidence: `10-todays-challenges.png`, `flow.gif`.

11. **Enter the peer league.** Then a **"Welcome to the Blue League!"** leaderboard:
    a ranked table of ~20+ learners by weekly XP/stars, with the learner's own row
    highlighted (peers' names/avatars redacted). This adds time-boxed social
    competition on top of personal goals. Evidence: `11-blue-league-leaderboard.png`,
    `flow.gif`.

12. **Land back on an updated path.** Finally the learner returns to the course
    timeline, now showing the just-finished lesson with a **completion tick** and the
    chapter progress advanced **14% → 28%**, with the next lesson highlighted, closing
    the loop and teeing up the next session. Evidence: `flow.gif` (final frames),
    `01-course-timeline-learning-path.png`.

---

## Adjacent flows (candidate features captured outside the single lesson)

- **Community / Conversations (Busuu's differentiator).** The **Community** tab opens
  a hub ("Connect with other learners and exchange feedback with native speakers")
  with **Discover / Friends / Community corrections** tabs and a feed of other
  learners' **writing and speaking submissions**, each with a **"Give correction"**
  button and a "Speaks / Learns" language pair. Opening one shows the prompt, the
  submitter, their attempt (e.g. "Hep are you"), and a **"Give feedback"** action:
  the human-correction mechanic. (Submissions can be sent to native speakers for
  correction; the receiving side is asynchronous.) Evidence:
  `12-community-hub-native-speakers.png`, `13-community-give-correction-feed.png`,
  `14-give-correction-view.png`.

- **Review (spaced repetition).** The **Review** tab has **Grammar** and **Vocabulary**
  sub-tabs. Vocabulary Review shows **"Your vocabulary"** bucketed by strength
  (**Weak / Medium / Strong words**) with a **"Review now"** action, and is
  freemium-limited ("2/2 FREE REVIEWS LEFT"). Grammar Review "unlocks as you learn".
  Evidence: `15-vocabulary-review-srs-strength.png`.

- **Speak (AI pronunciation).** The **Speak** tab is a **Premium Plus** surface
  ("Improve pronunciation · Get instant, personalised feedback") with a free preview
  and an upgrade gate. Evidence: `16-speak-pronunciation-premium.png`.

## Where friction / delight / dead-ends appear
- **Delight:** the "1 MIN" lesson framing; instant, *instructional* feedback on every
  answer (rule + audio, not just right/wrong); varied praise + confetti; the tight
  finish → challenges → league reward stack.
- **Friction:** two back-to-back paywall interstitials interrupt the post-lesson
  reward moment; Vocabulary Review is capped at 2 free runs; Grammar Review, Speak,
  and most later content sit behind Premium / Premium Plus.
- **Dead-ends (for a free user):** Grammar Review (locked/empty), full Vocabulary
  Review beyond 2 runs, and Speak lessons. All convert to upgrade prompts.
