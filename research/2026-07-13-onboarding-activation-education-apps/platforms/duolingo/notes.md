# Duolingo — Onboarding Notes & Analysis

**Surface:** desktop web, `duolingo.com` → `/register` → `/welcome` → `/onboarding/placement` → `/learn`. Captured 2026-07-13 (logged-out / guest).
**Variant caveat:** Duolingo A/B-tests onboarding heavily; this is one observed variant in one session/region. Step names taken from the `welcomeStep=` URL parameter.

## Scored against the six moments (0–2)

| # | Moment | Score | How Duolingo does it |
|---|--------|:---:|---|
| 1 | Value framing / landing | **2** | One headline, one dominant CTA, zero ask. "Free" is the lead benefit. CTA is unambiguous (contrast with our "Start Now read as an ad" problem). |
| 2 | Account creation | **2** | **Fully deferred.** No email/password until *after* landing in the product. Guest progress is real; the wall is framed as "save your progress." |
| 3 | Personalization intake | **2** | 3 substantive questions (reason, level, daily goal) + attribution, all one-tap icon cards. Mascot-guided; progress bar bounds it. |
| 4 | Placement / advanced routing | **2** | Self-rated proficiency ladder (signal-bars) **plus** an optional "Find my level" placement test. Novice and advanced served from one screen. |
| 5 | Path assignment | **2** | Self-report → concrete placement ("start with Section 4"); optional test refines it. User never sees a raw catalogue. |
| 6 | First-task guidance | **2** | Mascot narration throughout; permission priming before the OS prompt; numbered/keyboard-selectable answers; graceful mic skip. |
| ★ | First win (activation) | — | Defined as *first lesson completed*. Not reached in capture (we diverted into placement to document advanced routing, then exited). Taps to reach the path from landing: ~9 (GET STARTED → language → 3× CONTINUE past mascot/attribution → reason → level → benefit → goal → notif → path fork). |

## Patterns worth synthesizing (why they work)

1. **Deferred registration ("try before you sign up").** The entire personalization + first content happens in a guest session; the account wall lands *after* investment, framed as loss-aversion ("save your progress"). Directly answers our email-free / duplicate-account pains: the signup ask is delayed until the user is motivated to keep what they built. *Evidence: `01`, step 16.*

2. **Placement as an optional, positively-framed fork — not a gate.** The single most transferable pattern for our novice-vs-advanced tension. "Start from scratch" and "Find my level" sit side by side; a novice is never tested, an advanced user is never forced to start at zero. The self-rated **signal-bar ladder** does the coarse routing for free (language-independent, low-literacy-safe); the optional test refines it. *Evidence: `04`, `08`, `09`.*

3. **Permission priming = rationale *then* prompt.** Duo says *why* ("I'll remind you to practice so it becomes a habit!") the instant *before* the native dialog fires, in context. This is the exact fix for our device-permission dead-end: never trigger a raw system prompt cold. *Evidence: `07`.*

4. **Graceful degradation on the speaking/mic task.** A "CAN'T SPEAK NOW" escape hatch + a 15-minute auto-disable means a mic-less or low-tech-literacy user is never blocked or repeatedly nagged. *Evidence: `10`.*

5. **Character-guided, icon-first, low-text intake.** Every question is a mascot line + tappable icon cards (flags, brand logos, emoji, signal bars). Minimal reading load → strong for low-literacy / ESL users. Social proof ("41.9M learners") is embedded in the choice itself. *Evidence: `02`, `03`.*

6. **Momentum scaffolding.** Progress bar + back arrow (finite, reversible), benefit reinforcement, outcome projection ("50 words in your first week"), instant "Nice!" feedback, and reflected-back answers ("…you should start with Section 4") keep the user moving and feeling understood.

7. **Feature-gating as forward motivation.** Leaderboards are visibly locked with a concrete unlock condition ("Complete 3 more lessons") — sets a near-term goal rather than overwhelming a new user with everything at once.

## Where mobile would diverge (desktop-capture caveat)
- The **native mobile app** is Duolingo's primary surface; its onboarding is the same *logic* (reason → level → goal → path) but with full-screen single-question steps, larger touch targets, and the notification/mic prompts as **OS-level** dialogs (not browser). Our own product is mobile-first, so the *priming-before-OS-prompt* pattern (#3) matters even more there.
- On mobile the left-nav becomes a bottom tab bar; the sign-up wall is a bottom sheet rather than a banner.
- Screen-stacking is vertical; the side-by-side "Start from scratch / Find my level" fork becomes stacked cards.

## Sources
- https://www.duolingo.com/ (landing) — accessed 2026-07-13
- https://www.duolingo.com/register (course select + welcome questionnaire) — 2026-07-13
- https://www.duolingo.com/onboarding/placement/4 (placement test) — 2026-07-13
- https://www.duolingo.com/learn (product home + sign-up wall) — 2026-07-13
