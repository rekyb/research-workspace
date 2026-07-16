# Khanmigo: Core flows (teacher assistant + Socratic tutor)

Two flows matter here: the **teacher** flow (free; our RQ1/RQ3 interest) and the **learner
Socratic** flow (paid; our RQ4/RQ5 interest). Both in-app surfaces are gated, so steps past
sign-in are reconstructed from cited external sources and labelled *external*.

## A. Teacher flow: from sign-up to a finished rubric
**Entry:** khanmigo.ai → "For teachers: Sign up for free". **Goal:** a usable teaching artifact
(e.g., a rubric) with minimal prompting.

1. **Self-select as a teacher.** The homepage splits Teachers / Districts / Writing, each with a
   distinct CTA; the teacher promise is "Knock something off your to-do list in minutes."
   *Evidence:* `screenshots/01-audiences-and-press.png`.
2. **See the teacher value + tool set.** "Experience the best AI for teachers … keeping your
   work and student data private and secure," with tool cards (Exit tickets, Lesson plan).
   *Evidence:* `screenshots/02-for-teachers-tools.png`.
3. **Sign up free / sign in.** "Sign up for free" leads to Khan Academy auth. *Capture boundary:*
   an account is required to proceed (guardrail: not created).

--- login wall (steps *external*) ---

4. **Open the chat / pick an activity.** In the Khanmigo chat window the teacher chooses from
   25+ activities (lesson plan, rubric, exit ticket, discussion prompts, groupings, hooks…).
   ⟶ *external (Khan support, Butte TMI).*
5. **Answer a few guided questions.** e.g., Rubric Generator: give an assignment overview, pick
   categories and a 3/4/5-point scale; Khanmigo suggests performance indicators. "Get good
   results quickly with minimal prompting." ⟶ *external.*
6. **Receive + refine the artifact.** A standards-aligned rubric/lesson is produced (a teacher
   quote cites ~1 hour → 15 minutes). Output ties to Khan Academy's content library and can
   pull an on-demand summary of recent student work. ⟶ *external.*

## B. Learner Socratic flow: the "proper use" model (paid; *external*)
**Entry:** "Get Khanmigo" (learner/parent, paid). **Goal:** the student *works out* the answer.

1. Student opens a tutor session ("Tutor Me: Math and Science") and asks for help, e.g.
   *"Can you help solve 9(x-4) = -18?"* *Evidence (marketing mockup):*
   `screenshots/04-for-parents-tutor.png`.
2. Khanmigo **does not give the answer**: it replies *"Let's solve it together,"* asks guiding
   questions, and coaches the student step by step. This "challenge you without giving direct
   answers" behaviour is the core design. ⟶ *external + homepage copy.*
3. The student reaches the answer themselves; teachers/parents report students asking *more*
   questions than usual (Washington Post pull-quote).

**Friction / boundaries:** teacher tier is free and now internationally available (Microsoft
partnership, 44 countries), a low barrier; the **learner tier is paid** (~US$4/mo), a real
barrier for Indonesian families and the reason the *teacher-mediated* path fits our context
better. Mobile/Bahasa behaviour is unverified in these desktop captures.
