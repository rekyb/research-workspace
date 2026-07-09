# Brand Voice — in-product copy & microcopy

> Load when writing UI strings (labels, errors, empty states, onboarding). Scope = **in-product UI copy** (fast path).
> For marketing / long-form / per-audience copy, the four pillars, terminology canon, proof points, and the
> approval checklist → **`design-system/copy.md`**.

## VOX · Voice
Clear, encouraging, intelligent, grounded. Human-centered, optimistic, credible — never corporate or hype.
Speak to the learner with "you"/"we". Emotional thread: **Mobility · Opportunity · Dignity**.

## VOX · Mechanics
- **VOX-01** Sentence case; active voice; short sentences (avg 12–15 words); use contractions ("you're", "don't").
- **VOX-02** "Learners" not "users"; "learning system" not "EdTech platform"; "showing up / consistency" not "engagement metrics".
- **VOX-03** Real strings only — no Lorem, no "Click here", no placeholders. English by default (i18n translates downstream).
- **VOX-04** No exclamation marks unless earning genuine celebration; no ALL CAPS (except logos/acronyms).
- **VOX-05** Capitalize GAIN. Never promise guaranteed outcomes — "designed for persistence", not "guaranteed job".
- **VOX-06** Explain jargon on first use ("gamification" gets a one-liner). No corporate jargon (synergy/leverage/disruptive/ecosystem).

## VOX · In-product strings (generic → Solve Education!)
| Generic (NO) | Solve Education! (YES) |
|---|---|
| "Welcome back" | "Pick up where you left off — 5 minutes today" |
| "Welcome to Solve Education!" | "You're a learner who shows up" (identity-first) |
| "Submit" | "I'm ready" / "Send it" (action-as-promise) |
| "Cancel" | "Not yet" / "Save for later" |
| "Loading…" | "Pulling your streak…" (contextual) |
| "Error" | "Couldn't reach the lesson — try again? (offline saves your progress)" |

- **VOX-07** Errors = cause + fix + recovery path (see FRM-05). Empty states = explain + next action, encouraging frame (FRM-09, via `StateView`).

## VOX · Behavioural seeds (every screen encodes ≥ 1)
1. **Identity-first** onboarding — "you are a learner who…", not "welcome to Solve Education!".
2. **Tiny habits** — 5-min default; never ask for more upfront.
3. **Quick wins** — first badge/unlock inside the first session.
4. **Social proof** — peer signals over platform announcements.
5. **Variable rewards** — surprise moments, never fully predictable.
6. **Commitment devices** — user-voiced promises ("I'll show up tomorrow") over UI nags.

## VOX · Anti-patterns (reject)
- SaaS defaults: "Welcome back" / "Let's get started" / "Powered by AI".
- Generic/robotic strings ("Submit", "Error", "Invalid input").
- Hype/guarantees ("revolutionary", "guaranteed job"); dark patterns ("Spots filling up!", "Limited time!").
- Deficit/stigmatizing language ("at-risk youth", "dropouts") → use "young people outside opportunity".
- Emoji as decoration/status; white text on yellow.
