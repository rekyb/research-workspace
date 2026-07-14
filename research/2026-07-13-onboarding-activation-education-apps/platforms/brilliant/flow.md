# Brilliant — Onboarding Flow (desktop web)

**Surface:** desktop web (`brilliant.org`), captured 2026-07-13 (logged-out). Desktop-labeled; see `notes.md` for mobile divergence.
**Entry point → goal:** landing → mascot-guided personalization questionnaire (motivation, tutor voice, subject, **level**, start point, daily goal, schedule) → account wall to "discover your learning plan" → (paywall + first lesson, gated).
**One-line summary:** Brilliant runs the *longest, most personalized* intake of the five — a talking-mascot tutor ("Koji") walks you through ~10 steps, the standout being a **level self-selection where each option is an actual math problem** (not an abstract label), and an **adaptive start-point recommendation** that respects an advanced pick while nudging foundations; registration is walled *after* the full questionnaire, framed as unlocking your plan.

Evidence: `flow.gif` (full flow); stills in `screenshots/`.

---

## Steps

1. **Landing / value framing + role split.** "A world-class tutor for every home / Your personal tutor for math and coding. Built by top learning experts from MIT and Harvard." A product visual shows the interactive "learn by doing" coding puzzle. Primary green **"I'm a learner"** vs secondary **"I'm a parent or teacher."** (A cookie acknowledgment banner with only a "Got It" button was dismissed — no reject option offered.) → `01-landing-role-split.png`

2. **Mascot introduction.** "Hi, I'm Koji! I'll be your personal tutor." A green blob mascot establishes a guide persona (same character-led pattern as Duolingo's Duo). Continue. *(In `flow.gif`.)*

3. **Motivation intake.** A 3-segment progress bar appears. "What motivates you to learn?" — icon cards: Excelling in school / Professional growth / Staying sharp / Helping my child learn. → `02-motivation-intake.png`

4. **Tutor-voice personalization.** "How do you want me to sound? (Turn up your volume if you can't hear me.)" — cards **Melodic / Deep** that play a voice sample and set Koji's AI voice. A distinctive, delightful step that makes the "personal tutor" tangible and primes the audio feature. → `03-tutor-voice-personalization.png`

5. **Reassurance interstitial.** "I'm here to help if you ever get stuck." — Koji beside a worked expression `(x+4)(x+2)`, pre-empting learner anxiety. *(In `flow.gif`.)*

6. **Subject selection.** "What do you want to learn first?" with the anxiety-reducer "You can make progress in both subjects later on." — cards **Math** and **Computer Science & Coding**. → `04-subject-select.png`

7. **Credibility interstitial.** "Built by the best minds in education" with team photos — reinforcing authority mid-flow. *(In `flow.gif`.)*

8. **Level self-selection — by problem, not by label (the standout).** "What level of math are you currently at?" — four cards, each **triple-encoded**: a *worked problem sample* + a *topic name* + a *first-person capability statement*:
   - **Arithmetic** — "I want to start from the basics." (`5 × ½`)
   - **Basic Algebra** — "I can use variables and solve equations." (`x − 8 = 10`)
   - **Algebra** — "I can make and interpret graphs of equations." (parabola)
   - **Calculus** — "I understand derivatives and integrals." (shaded integral)
   The user recognizes the math they can do rather than self-rating with vocabulary. Language-independent and more accurate than abstract levels. (We picked Calculus.) → `05-level-self-select-by-problem.png`

9. **Adaptive start-point recommendation.** "And where do you want to start? Strong foundations are important for Calculus." — offers **Advanced Algebra (RECOMMENDED)** and **Calculus**. Even after an advanced self-pick, Brilliant recommends a foundation course *but lets the user jump straight to Calculus* — respecting autonomy while nudging mastery. → `06-start-point-recommended.png`

10. **Daily-goal + schedule commitment.** "What's your daily learning goal?" (timer-icon tiers) and "How will learning fit into your day?" (time-of-day: morning / day / evening / night) — habit-formation intake tied to reminders. *(In `flow.gif`.)*

11. **Account wall.** "Create a free profile to **discover your learning plan**" — **Continue with Google** (primary) or **Email** + Sign up, with inline ToS/Privacy agreement. Registration is walled *after* the full questionnaire, framed as unlocking the plan you just built (loss-aversion on invested effort). **We do not create accounts, so capture stops here** — the actual first lesson and Brilliant's subscription paywall sit beyond this. → `07-signup-wall-discover-plan.png`

---

## Where friction / delight / dead-ends appear
- **Delight:** the tutor-voice choice, the problem-based level selector, and Koji's continuous narration are standout, memorable touches.
- **Personalization depth:** the richest intake of the five (~10 steps) — great for a tailored plan, but long; a user who just wants to start must invest before any content.
- **Friction / gate:** account creation *and* a subscription paywall sit between the questionnaire and the first real lesson, so the "first win" is the most deferred of the five.
- **Note:** the whole flow is a personalization funnel whose payoff (the plan) is itself the registration hook.
