# Duolingo: simple-gamification core-loop flow

**Summary (entry → goal):** A new learner enters the app and, before finishing a single
lesson, is surrounded by lightweight gamification: **streak, gems, hearts, XP, a daily-quest
progress bar, a locked leaderboard, and a leveled lesson path.** Captured in a fresh
**anonymous guest session** (no account), so there is no personal or third-party data on
screen. This is what "simple gamification tools" look like when they are the *core loop*, not
an add-on.

1. **Learner starts a course.** An onboarding modal asks **"How much French do you know?"**
   with self-rated options (I'm new / I know some words / basic conversations). Low-stakes
   entry, no signup required yet.
   *Evidence: `screenshots/01-onboarding-placement.png`, start of `flow.gif`.*

2. **Learner reaches the Learn dashboard.** The whole gamification stack is visible at once:
   - top HUD: **streak** (flame), **gems** (500), **hearts** (5);
   - right rail: **"Unlock Leaderboards! Complete 3 more lessons to start competing"** (the
     leaderboard is **locked / teased**, a pre-reward state), and **"Daily Quests → Earn 10 XP"**
     with a **progress bar (0/10)**;
   - center: a **leveled lesson path** with a START node, locked star nodes, and a treasure
     chest (levels, checkpoints, unlockables);
   - a soft **"Create a profile to save your progress"** nudge (account creation is optional,
     not forced).
   *Evidence: `screenshots/02-gamification-dashboard.png`.*
   **Delight:** progress and reward are legible instantly, and competition is *earned* (you
   unlock leaderboards after 3 lessons) rather than imposed.

3. **Learner opens Quests.** "Complete quests to earn rewards! Quests refresh every day." The
   **Daily Quest** shows the same XP progress bar plus a **countdown ("17 HOURS")**; **"More
   quests unlock soon"** is locked; and **"Monthly challenges… Complete each month's challenge
   to earn exclusive badges"** ties **badges** to challenges.
   *Evidence: `screenshots/03-quests-and-badges.png`, end of `flow.gif`.*

**Where the motivational mechanics live:** steps 2–3. Duolingo stacks *many simple mechanics*
(progress bar, XP, streak, levels, quests, time-boxing, locked/teased rewards, and
badge-per-challenge) so the reward loop runs continuously, independent of any terminal
certificate.
