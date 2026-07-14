# Duolingo — Onboarding Flow (desktop web)

**Surface:** desktop web (`duolingo.com`), captured 2026-07-13. Labeled desktop because the automation renders a fixed ~1280px viewport; see `notes.md` for where mobile diverges.
**Entry point → goal:** cold landing page → first-lesson-ready personalized path, with account creation **deferred to the very end**.
**One-line summary:** Duolingo front-loads *zero commitment* — you pick a language and answer a short, mascot-guided questionnaire (reason, level, daily goal) before ever seeing a sign-up field; an optional placement test lets advanced users test out, and the account wall only appears *after* you land in the product, framed as "save your progress."

Evidence: full flow in `flow.gif`; key stills in `screenshots/` (referenced as `NN-…png`).

---

## Steps

1. **Landing / value framing.** The user arrives at a near-empty page: one headline ("The free, fun, and effective way to learn a language!"), the Duo mascot, and two buttons — a dominant green **GET STARTED** and a low-emphasis **I ALREADY HAVE AN ACCOUNT**. The screen shows a single, unambiguous primary action and asks for nothing. → `01-landing-value-framing.png`

2. **Course selection ("I want to learn…").** Clicking GET STARTED goes to `/register`, but there is **no account form** — instead a grid of course cards, each a **flag icon + language name + social-proof learner count** ("Spanish · 41.9M learners"). The user taps a language (Spanish). The screen responds by advancing to a mascot intro. Icon-forward and low-text. → `02-course-select-i-want-to-learn.png`

3. **Mascot introduction.** Duo the owl appears with an animated speech bubble ("Hi there!… Let's get this party started"). The CONTINUE button is disabled until the line finishes typing. The user clicks CONTINUE. This establishes a guide persona before any question is asked. *(In `flow.gif`.)*

4. **Attribution ("How did you hear about Duolingo?").** A progress bar and a back arrow now appear at the top — signalling a short, reversible sequence. Duo asks how the user found Duolingo; options are **brand-icon cards** (YouTube, Google Search, TV, …). The user selects one and clicks CONTINUE. *(In `flow.gif`; step named `welcomeStep=hdyhau` in the URL.)*

5. **Motivation ("Why are you learning Spanish?").** Duo asks the user's reason; options pair a **playful icon with a short label** — "Support my education", "Just for fun", plus work/travel below. The user picks one and continues. This is the first genuinely personalizing question. → `03-intake-why-learning.png`

6. **Proficiency self-select ("How much Spanish do you know?").** The pivotal calibration question. Options are a **self-rated ladder** rendered as signal-strength bars: "I'm new to Spanish" (1 bar) → "I know some common words" (2) → … → "I can discuss most topics in detail" (4 bars). It is a *choice, not a test* — no one is quizzed against their will. The user selects the top level (advanced). → `04-proficiency-self-select.png`

7. **Benefit reinforcement ("Here's what you can achieve!").** A brief informational screen tailored to the reason chosen ("Develop a learning habit — smart reminders, fun challenges, and more"). CONTINUE is enabled without a selection. *(In `flow.gif`.)*

8. **Daily-goal commitment ("What's your daily learning goal?").** A ladder of time tiers, each pairing a **concrete number with an identity label**: 5 min/day (Casual), 10 (Regular), 15 (Serious), 20 (Intense). The user picks "Regular". → `05-daily-goal-tiers.png`

9. **Habit projection ("That's 50 words in your first week!").** A motivational payoff screen that projects the outcome of the chosen goal, building anticipation before commitment. → `06-habit-projection-50-words.png`

10. **Notification permission priming.** Duo first states the *rationale* — "I'll remind you to practice so it becomes a habit!" — and *then* the native browser permission dialog ("www.duolingo.com wants to Show notifications / BLOCK / ALLOW") fires **in-context, immediately after**. The user declines (BLOCK) and continues; the flow is unaffected. → `07-notification-permission-primer.png`

11. **Path fork ("Now let's find the best place to start!").** The screen offers **two side-by-side choices**: **"Start from scratch — Take the easiest lesson of the Spanish course"** (for novices) and **"Find my level — Let Duo recommend where you should start learning"** (compass icon; the advanced test-out). One screen serves both novice and advanced. The user picks "Find my level". → `08-choose-path-fork.png`

12. **Personalized placement acknowledgement.** Duo reflects the user's self-rating back: "Since you can discuss most topics in detail in Spanish, you should start with **Section 4**." The advanced self-report is immediately honored with a concrete, further-along placement. → `09-placement-result-section4.png`

13. **Placement test — speaking item + graceful skip.** The test opens with a "Speak this sentence" (mic) task. Rather than force microphone access, the screen offers **"CAN'T SPEAK NOW"**; using it marks the item complete with no penalty and disables speaking tasks for 15 minutes ("Microphone is off. They will be back in 15 minutes."). → `10-placement-speaking-mic-skip.png`

14. **Placement test — multiple-choice items.** Subsequent items are translation multiple-choice ("factory" → poder / venezolano / **fábrica**), with **numbered (keyboard-selectable) options**, a SKIP button, and CHECK. Correct answers get instant positive feedback ("Nice!", green check). → `11-placement-multiple-choice-feedback.png`

15. **Exit-intent retention.** Attempting to leave the placement test mid-way triggers a modal — a teary Duo and "Wait, don't go! You'll lose your progress if you quit now," with an emphasized **KEEP LEARNING** and a de-emphasized **END SESSION**. (Loss-aversion + emotional framing.) *(In `flow.gif`.)*

16. **Landing in the product + the deferred sign-up wall.** Ending the session drops the user onto the **`/learn` home**: a labeled+icon left nav (Learn, Leaderboards, Quests, Shop, Profile, More), a top-right stats bar (streak, gems, hearts), a **gated feature teaser** ("Unlock Leaderboards! Complete 3 more lessons to start competing"), Daily Quests, and — only now — a persistent bottom banner: **"Create a profile to save your progress!"** The account wall appears *after* the user has already invested effort, framed as protecting that investment. *(Observed live on `/learn`; documented in `notes.md`. Not saved as a still — it fell outside the flow.gif's rolling 50-frame buffer and the guest session masks re-capture.)*

---

## Where friction / delight / dead-ends appear
- **Delight:** the mascot guide, the "50 words in your first week" projection, instant "Nice!" feedback, and the reflected-back placement ("…you should start with Section 4") all create momentum.
- **Friction removed:** no email/password until the end; the speaking task's "can't speak now" escape hatch; the reversible progress bar.
- **Potential friction:** the questionnaire is ~8 screens before the first lesson — long if a user just wants to start (mitigated by the progress bar and one-tap answers).
- **Dead-end avoided:** the mic task, which in our own product stranded users, here has a built-in skip + temporary disable.
