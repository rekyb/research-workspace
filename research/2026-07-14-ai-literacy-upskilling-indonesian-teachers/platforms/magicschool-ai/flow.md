# MagicSchool AI: Core teacher flow (first useful artifact)

**Flow:** New teacher → signs up → picks a task-named tool → fills a short form with their own
class context → receives a drafted artifact → refines/exports.
**Entry point:** magicschool.ai → "Free for teachers". **Goal:** produce one real teaching
artifact (e.g., a lesson plan or quiz) with no prompt-engineering skill.

> ⚠ **Evidence basis.** Steps 1–2 are first-hand from public captures. Steps 3–6 are **behind
> the login wall** (not created by us) and are reconstructed from cited external
> reviews/walkthroughs (Unite.AI, Skywork, humai.blog). They are labelled *external* and are
> not passed off as first-hand capture.

1. **Land on the marketing site and self-select as a teacher.** The hero pushes an emotional
   first-win promise ("Find your 'wow!'"), and two CTAs, *Get in touch* (districts) and
   *Free for teachers* (individuals), split the audience immediately. *Evidence:*
   `screenshots/01-hero-positioning.png`.
   *Delight:* the free-for-teachers path is unmistakable and friction-light.

2. **Reach the Educator Sign-up screen.** "Free for teachers" opens
   `app.magicschool.ai/auth/signup`: email + password + a single terms/privacy checkbox, then
   *Sign up*. *Evidence:* signup screen observed first-hand (not committed as a still; a plain
   auth form). *Friction / capture boundary:* an account is required to go further. This is
   where our first-hand capture stops (guardrail: no account creation).

--- login wall (steps below are *external*, not first-hand) ---

3. **Arrive on the tool dashboard, a searchable grid of task-named tools.** Instead of a chat
   box, the teacher sees discrete tools labelled by job: *Lesson Plan, Rubric Generator,
   Multiple Choice Quiz, Worksheet Generator, IEP Generator, Text Rewriter, Report Card
   Comments, Professional Email, AI Tutor,* etc. *Evidence:* tool grid visible on the public
   homepage previews (`screenshots/03-teacher-tools-showcase.png`,
   `04-tools-and-ai-tutor.png`); dashboard behaviour ⟶ *external (Skywork, Unite.AI)*.
   *Delight:* the teacher recognizes their task, not a technology; activation barrier is low.

4. **Pick a tool and fill a short form.** Selecting e.g. *Lesson Plan Generator* opens a
   structured form (grade level, subject, topic, standards, extra notes): *"guided prompts,
   dropdown menus, and ready-made buttons … no blank box to stare at."* ⟶ *external
   (Skywork, Unite.AI)*. *Delight:* no prompt skill needed; the form carries the cognitive
   load. *Design tension:* the teacher succeeds without learning to prompt.

5. **Generate the first draft.** The tool returns a complete drafted artifact (lesson plan,
   quiz, differentiated passage) in seconds; reviewers cite ~**7+ hours/week** saved across
   planning, differentiation, assessment, and communication. ⟶ *external (Notie, Unite.AI)*.
   *This is the "wow" moment* the marketing promises: a usable artifact from one short form.

6. **Refine, translate, or export.** The teacher can iterate (re-level a passage to three
   reading levels, translate to another language via the *Raina* assistant), then copy/export,
   often into Google Docs/Classroom/Canvas (homepage integrations). ⟶ *external*.
   *Onward path:* from here the teacher can open a student-facing **Room** (see `notes.md`
   RQ5) or take a free **certification** course (RQ6).

**Where friction / dead-ends appear:** the only hard stop for a *browsing* teacher is the
signup wall at step 2 (expected). The bigger unknowns for our context are invisible on desktop
marketing: whether steps 3–6 hold up on a **low-bandwidth mobile phone** and whether the forms
and outputs work in **Bahasa Indonesia**, both unverified (see `notes.md` RQ7).
