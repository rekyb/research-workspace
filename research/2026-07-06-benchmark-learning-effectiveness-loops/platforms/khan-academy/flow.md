# Khan Academy: Core learning-loop flow (Algebra 1, "Evaluating expressions")

**Summary (entry point → goal):** From the Algebra 1 course page a learner opens a
single skill's practice set and works a question → answer → feedback → hint loop until
the 7-problem set is done, at which point the skill's **mastery level** updates (here:
*Not started → Familiar 71%*) and energy points are awarded. The loop is the same
whether the answer is right or wrong; what differs is the feedback and whether the
attempt still qualifies for a higher mastery level.

Evidence: `flow.gif` (core loop recording, overlays on) + screenshots `01`–`08`.

---

1. **Enter the course.** The learner lands on the Algebra 1 course page. The screen
   shows the mastery legend (Mastered / Proficient / Familiar / Attempted / Not started,
   plus Quiz and Unit test icons), "Course mastery: 0%", the unit skill grid, an "UP
   NEXT FOR YOU!" recommendation on Unit 1, a top engagement bar ("0 week streak",
   "Level 1", a "0/1 skill" level-up meter), and a "Not feeling ready? Get ready for
   Algebra 1" pointer. *Evidence: `01-course-overview.png`, `08-mastery-grid-after.png`.*

2. **Open the recommended skill.** The learner clicks the highlighted "UP NEXT FOR YOU"
   box. The app opens the exercise "Evaluating expressions with one variable" with a
   "Ready to practice? Okay, show us what you can do!" splash and the standard CCSS
   tags. *Evidence: `flow.gif` open.* (Friction, teacher-account only: a Khanmigo
   educator promo popup overlaps the splash and must be dismissed.)

3. **Read the first question.** The screen shows a single problem ("Evaluate p/2 − 5
   when p = 14"), one answer field, and a bottom bar: a hint icon, a "Do 7 problems"
   label with 7 progress dots, Skip, and Check. *Evidence: `02-exercise-question.png`
   (a later question in the same set), `flow.gif`.*

4. **Answer incorrectly (to observe remediation).** The learner types a wrong value and
   clicks Check. The screen does **not** reveal the answer. A "Not quite yet… Give it
   another try!" toast appears with a "Show a step" button; Check becomes "Try again"
   and Skip becomes "Hints". The attempted progress dot fills grey (struggled), not a
   green check. *Evidence: `03-incorrect-feedback.png`, `flow.gif`.*

5. **Request a hint.** The learner clicks "Show a step". A graduated worked solution
   appears one step at a time ("1 / 4 — Let's substitute 14 for p"), with a "+ Get
   another hint (1/4)" control to reveal each next step, and a "Related content"
   instructional **video** ("Evaluating an expression with one variable", 2:00) surfaced
   right there as a fallback. *Evidence: `04-graduated-hint-and-video.png`, `flow.gif`.*

6. **Answer correctly.** The learner enters the right value and re-checks. A green-check
   toast appears. Wording distinguishes the path: a corrected answer reads "You improved
   your answer! Keep it up!"; a first-try-correct answer reads "Nice work! You got it.
   Onward!" and marks that dot with a green check. Check becomes "Next question".
   *Evidence: `05-correct-feedback.png`, `flow.gif`.*

7. **Hit the mastery gate (after a second miss).** On the second wrong answer in the
   set, a modal interrupts: "Would you like to start over? You can no longer reach
   'Proficient' on this attempt. You can keep going or start over. Start over is
   available after two mistakes." The learner can Keep going or Start over. This makes
   explicit that the mastery **level** is gated on accuracy, not completion.
   *Evidence: `06-mastery-gate-modal.png`.*

8. **Finish the set.** The learner completes all 7 problems (dots fill: green check for
   clean solves, grey for struggled). The last question's button becomes "Show summary".
   *Evidence: `flow.gif` end; progress bar "7 of 7".*

9. **See the mastery result + reward.** The summary screen shows the skill moved from
   *Not started* to **"Familiar • 71%"** (not Proficient, because of the two misses), a
   "🔥 Awesome! You improved your skills! 🔥" banner, "5/7 correct • 475 energy pts",
   the updated Unit 1 grid (first skill now orange = Familiar), "Course mastery: 0%",
   and an "Up next: Lesson 3" recommendation. *Evidence: `07-skill-summary-mastery.png`,
   `08-mastery-grid-after.png`.*

---

**Where friction / delight / dead-ends appear**
- *Delight:* the answer is never handed over on a miss; graduated hints + an embedded
  video keep the learner working the problem (productive struggle), and the summary's
  reward framing ("you improved your skills", energy points) lands right after effort.
- *Delight (rigor):* the "can no longer reach Proficient… after two mistakes" gate ties
  the visible mastery level to real accuracy, so the progress signal means something.
- *Friction:* the logged-in account is a **teacher** account, so educator promos
  (Khanmigo) and "Assign / Share with…" controls intrude on the learner surface and had
  to be dismissed/ignored. A pure learner account would be cleaner.
- *Friction (nuance):* reaching only *Familiar* did **not** advance the weekly "Level up"
  meter ("0/1 skill" unchanged), so the engagement meter and the mastery level are on
  slightly different scales, which a learner could find confusing.
- *Not observable in one session:* mastery **decay** / spaced re-practice (Khan re-tests
  skills over time) is time-delayed and could not be seen in a single sitting.
