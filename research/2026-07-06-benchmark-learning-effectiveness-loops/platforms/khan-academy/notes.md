# Khan Academy: observations & analysis

Scope of this capture: the logged-in Algebra 1 course, traced deeply on one skill
("Evaluating expressions with one variable", Unit 1). Account provided is a **teacher**
account, so learner surfaces carried educator promos/controls that were ignored. All
claims below are grounded in the captured evidence (`01`–`08`, `flow.gif`); external
research that supports or challenges each point is cited as `[ref: …; see references.md]`.

---

## Q1: The learning loop

**Atomic loop:** present one problem → learner answers in a single field → **Check** →
immediate feedback → (if wrong) graduated hints + related video → retry → **Next
question**. A skill is a set of ~7 problems; finishing the set produces a mastery result.
*Evidence: `flow.gif`, `02`–`07`.*

**How "what to show next" is decided (observed, not claimed from source):**
- At course level, an **"UP NEXT FOR YOU!"** tile recommends the next skill, and the end
  screen nudges "Up next: Lesson 3". *Evidence: `01`, `07`.*
- Within a skill, the 7 problems are the same skill in varied surface forms (different
  numbers/variables: `p/2 − 5`, `4 − 2f`, `9/m + 4`, `6 + x`, `6h`, `9 − 8/S`). I did
  **not** observe within-set difficulty adaptation; the set looked fixed-variety, so I
  describe the loop as *mastery-gated*, not *difficulty-adaptive*. *Evidence: `flow.gif`.*

**Wrong-answer handling is the standout.** On a miss, Khan **withholds the answer** and
says "Not quite yet… give it another try". It offers a **graduated 4-step worked
solution** (revealed one "Show a step" at a time) and surfaces a **related instructional
video** right in the problem. This is productive struggle, not answer-reveal.
*Evidence: `03`, `04`.* [ref: Hattie & Timperley 2007 (effective feedback answers
"where to next"); Sweller 1988 (worked examples reduce cognitive load); Roediger &
Karpicke 2006 (the act of retrieval is itself learning); see references.md]

## Q2: Mastery / proficiency model

**Levels:** Not started → Attempted → Familiar → **Proficient** → **Mastered**, plus
Quiz and Unit-test nodes; the course advertises "18,200 possible mastery points".
*Evidence: `01`, `08`.*

**State change captured (the before/after the plan required):** the traced skill moved
from **Not started → "Familiar • 71%"** after one 7-problem set solved 5/7.
*Evidence: `08` (grid skill now orange), `07` (summary).*

**What moves a skill up = accuracy, not completion.** After the second wrong answer, a
modal stated: *"You can no longer reach 'Proficient' on this attempt… Start over is
available after two mistakes."* So the level you earn is capped by how cleanly you
solve, and Familiar (not Proficient) was awarded precisely because of the two misses.
*Evidence: `06`.* [ref: Corbett & Anderson 1995, Bayesian Knowledge Tracing estimates
latent mastery from the correct/incorrect stream, gating advancement; Bloom 1984,
mastery learning as the bar; see references.md]

**Mastery decay / spaced re-practice:** Khan re-tests skills over time, but this is
time-delayed and **not observable in a single session**; flagged, not claimed.
[ref: Cepeda et al. 2006, spacing; see references.md]

## Q3: Efficacy signals to the learner (and is there a baseline?)

**Signals shown:** per-skill mastery level + %, mastery points, course-mastery %, the
colored unit grid, progress dots, and the "you improved your skills" summary.
*Evidence: `01`, `07`, `08`.*

**Baseline finding (a primary question, answered):** there is **no forced diagnostic**
that sets a measured starting point. Everything begins at "Not started" and improvement
is shown as **mastery-state accrual from zero** (coverage + proficiency), not as a
**pre/post gain score**. An optional **"Get ready for Algebra 1"** prerequisite course
and a **Course Challenge / Unit tests** let a learner test out or remediate, which is a
light, opt-in baseline mechanism, but not a mandatory pre-test. *Evidence: `01`
("Get ready for Algebra 1" pointer, mastery legend with Quiz/Unit-test nodes).*
**Implication:** Khan answers "are you improving?" as "how much of the skill graph have
you reached Proficient/Mastered on", which is defensible but is **not** the normalized
pre/post learning-gain that efficacy research treats as the gold standard.
[ref: Hake 1998, normalized gain needs a pre-test baseline; Murphy/SRI 2014, the
flagship Khan study is implementation/correlational, not a causal gain trial;
Barnett & Ceci 2002, near-transfer platform mastery ≠ far transfer; see references.md]

## Q4: Engagement loop (each mechanic tagged)

Tagging rule: **learning-tied** = earning it requires a correct / mastery-advancing
action; **activity-tied** = time/attempts/presence earn it regardless of correctness.

| Mechanic | Evidence | Tag | Note |
|---|---|---|---|
| Mastery level + % + mastery points | `07`,`08` | **Learning-tied** | Only correct, low-error solving advances the level (see the two-mistake gate). |
| Colored mastery grid (unit map) | `01`,`08` | **Learning-tied** | The color *is* the proficiency state; visual progress = real progress. |
| "Level up" weekly meter ("0/1 skill") | `01` | **Learning-tied** | Advances only when a skill is levelled up; reaching only Familiar did **not** tick it. |
| Energy points ("475") | `07` | **Mixed, leans activity** | Awarded for working the set; the amount reflects correctness (5/7), but points still accrue for effort. |
| Weekly **streak** ("0 week streak") | `01` | **Activity-tied** | Earned by showing up, independent of getting answers right. |
| "UP NEXT FOR YOU" / "Up next: Lesson 3" | `01`,`07` | n/a (nudge) | Next-step routing that pulls into the next rep. |
| Reward framing ("🔥 you improved your skills!") | `07` | n/a (affect) | Positive reinforcement placed right after effort. |

## Q5: Where the loops reinforce vs. risk diluting each other

**Reinforce (the strong part):** Khan ties its headline engagement rewards to
demonstrated learning. The "Level up" meter and mastery level only move on accurate
work, and the two-mistake gate stops a learner from "grinding" to Proficient. The
mastery grid turns real proficiency into the thing you visibly collect. Productive
struggle (hints, not answers) keeps learning, not clicking, at the centre.
*Evidence: `06`, `04`, `08`.*

**Risk (watch-outs):** the **streak** and, partly, **energy points** are activity-tied,
so they can reward presence over mastery. And the **two-scale mismatch** (finishing a
skill to *Familiar* advanced mastery but **not** the weekly "Level up" meter) could read
as "I did the work but the game says 0", which risks demotivation or gaming toward the
easier signal. [ref: Deci, Koestner & Ryan 1999, tangible/contingent rewards can crowd
out intrinsic motivation; Champaign et al. 2014, time-on-task can correlate *negatively*
with learning; so activity-tied rewards must not become the success metric; see references.md]

---

## Top 3 features that serve the learning loop AND double as the engagement loop
*(requested deliverable, ranked)*

1. **Mastery levels + mastery-points grid.** *Learning loop:* per-skill levels
   (Familiar/Proficient/Mastered), driven by accuracy (an estimate inferred from the
   correct/incorrect stream; Khan's internal algorithm was not inspectable), tell the
   learner and the system what is actually learned and what to practise next. *Engagement
   loop:* the same levels are a collectible, colour-filling map with points and a
   "level up" goal, so the progress bar people chase **is** the proficiency signal. This
   is the best dual-purpose mechanic because engagement and learning are the *same*
   object, not bolted together. *Evidence: `01`, `06`, `07`, `08`.*
   [ref: Corbett & Anderson 1995; Bloom 1984; see references.md]

2. **Graduated hints + embedded "related video" bailout.** *Learning loop:* scaffolds
   productive struggle, revealing a worked solution one step at a time and offering the
   teaching video exactly when the learner is stuck, instead of handing over the answer.
   *Engagement loop:* it is the main anti-quit mechanic, it keeps a stuck learner moving
   inside the session rather than bouncing. *Evidence: `03`, `04`.*
   [ref: Sweller 1988; Hattie & Timperley 2007; see references.md]

3. **End-of-set mastery summary with reward framing.** *Learning loop:* consolidates the
   result ("Familiar • 71%", 5/7 correct) so the learner knows what they gained and where
   they landed on the mastery scale. *Engagement loop:* delivers the reward beat
   ("🔥 you improved your skills!", energy points) and a next-step nudge ("Up next:
   Lesson 3") that pulls into the next rep. *Evidence: `07`.*
   [ref: Deci/Koestner/Ryan 1999 (keep the reward tied to real gain); Kivetz et al. 2006
   (next-step/goal-gradient pull); see references.md]

Honourable mention: the **two-mistake "can no longer reach Proficient" gate** (`06`) is
the single clearest example of engagement being subordinated to real learning, worth
adopting as a principle even if not as the exact UX.

---

## Build-relevant takeaway (adopt / adapt / avoid)

- **Adopt:** (a) a **mastery-state model** (per-skill levels driven by accuracy, not
  completion) as the core efficacy signal and the primary progress UI; (b) **productive
  struggle** (graduated hints + on-demand video, answer withheld); (c) **accuracy-gated
  leveling** so the visible level means real proficiency.
- **Adapt:** (a) keep streaks/energy points as engagement wrappers **but bind them more
  tightly to demonstrated learning** so activity alone can't win; (b) **reconcile the
  engagement meter and the mastery scale** into one number to avoid the "did the work,
  says 0" confusion; (c) add a **real pre/post diagnostic** to report a normalized
  learning gain, which Khan lacks and which would be a genuine differentiator for
  *proving* upskilling. [ref: Hake 1998; see references.md]
- **Avoid:** (a) making **streaks/points the headline success metric**; (b) treating
  **coverage/completion as a proxy for learning** (the thing efficacy research warns
  against). [ref: Champaign et al. 2014; Barnett & Ceci 2002; see references.md]

## Caveats / limits of this capture
- Single skill, single session, one course; no within-set adaptivity or decay observed.
- Teacher account: some learner mechanics (e.g., coach/class goals) may differ for a
  standalone learner; energy-point exact formula not reverse-engineered (reported as
  observed totals only).
