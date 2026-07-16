# Curriculum Map — AI-Literacy Upskilling for Indonesian Teachers

*A content/pedagogy companion to `SYNTHESIS.md`. This maps the eight benchmark features
(F1–F8) into a teachable course. It is the **content layer** — learning objectives,
sequence, activities, assessment — not the app/engineering spec.*

- **Version:** draft, 2026-07-15
- **Traceability:** the six-module skeleton is the design proposal from the course-design
  brief; every design decision inside it cites the `SYNTHESIS.md` finding that supports it
  (F1–F8). Choices with no benchmark backing are marked **[design judgment]**. Claims the
  benchmark flagged as unproven are marked **[to validate]**.
- **Learner:** a time-poor, uneven-digital-literacy Indonesian teacher who needs to feel
  competent using AI, then teach students to use it properly.
- **Format constraints (from the study):** mobile-first, micro-learning (units ≈ 8–12 min),
  Bahasa Indonesia, low-bandwidth / text-first, self-paced. [F7]

---

## 1. Exit competencies (design backwards from these)

Two strands. The course is complete when a teacher can do all six.

**Strand A — Personal fluency (do it myself)**
- **C1** Write and refine a prompt to get a useful result for a real teaching task.
- **C2** Critically evaluate an AI output (spot errors, bias, hallucination) and verify it.
- **C3** Integrate AI into ≥3 real workflows (planning, assessment, communication).

**Strand B — Classroom transfer (teach it)**
- **C4** Explain, in plain Bahasa, what AI is/isn't and why "proper use" matters.
- **C5** Facilitate an AI-literacy lesson and an academic-integrity discussion.
- **C6** Set a classroom AI-use policy and a task that uses AI *honestly*.

Strand A leads Strand B: a teacher cannot teach what they cannot do (the study's
personal-fluency-first lead).

---

## 2. Course spine & sequencing rationale

The order is not arbitrary; it encodes two benchmark findings.

1. **Fluency before pedagogy, and within fluency a "prompting ladder."** Modules climb
   the ladder the benchmark surfaced: **shield → minimize → teach** prompting, so the
   teacher succeeds first and *then* builds transferable skill. [F2] This is the biggest
   change from the original sketch, which treated prompting as a single topic.
2. **Ethics mid-course, after the first win — not first, not last.** Two platforms place
   responsible-use late (Elements of AI Ch. 6/6; Google course 4/5). We adopt "after the
   win" but, because our teacher *uses* AI from Module 2, we place it at **M5** (mid-course),
   not the finale. [F4]

```
M1 Orientation      fear down, ground rules      → primes C4
M2 First win        SHIELD: form-first artifact   → C1, C3 (start)     [aha moment]
M3 Don't trust it   MINIMIZE: verify + iterate    → C1, C2
M4 Weekly rhythm    TEACH: prompting as a skill   → C3, C1 (deepen)
M5 Using it properly ethics + integrity (lived)   → C4, primes C5
M6 Learner→teacher  classroom-transfer kit        → C5, C6
Capstone            teach one lesson for real     → C5, C6 (demonstrated)
```

---

## 3. The unit learning loop (the repeating engine) [F7]

Every unit (≈ 8–12 min) runs the same four beats. Consistency lowers cognitive load and
builds habit; the loop is grounded in cognitive-load + retrieval-practice evidence
(`references.md`).

1. **Hook (≈30s)** — a relatable teacher pain in Bahasa ("Menghabiskan Minggu malam bikin
   soal?").
2. **Model (2–3 min)** — a worked example: show a good input and its result, narrated.
   Worked examples beat instructions for novices. [F1, F7]
3. **Do-it-with-your-own-material (3–5 min)** — the teacher does the same on *their* subject/
   grade and leaves with a real artifact. This is the retention + confidence driver. [F1]
4. **Reflect + micro-check (≈1 min)** — "Where will you use this next week?" plus a quiet
   "spot-the-flaw" check that builds the evaluation habit. [F4]

Units are **spaced** across days (not massed). *Note: spacing is a delivery decision — the
content must actually schedule revisits for it to hold.* [to validate]

---

## 4. Module-by-module map

Each module = a few units in the loop above. "Draws from" cites the benchmark findings.

### M1 · "AI tidak akan menggantikan Anda" (Orientation)
- **Objective:** replace fear with curiosity; establish data-privacy ground rules.
- **Content:** what AI is in one plain-Bahasa analogy; what it can/can't do; the one hard
  rule — **never paste student PII / personal data into AI**; "empowered, not threatened"
  framing.
- **Draws from:** F4 (fear-reduction + trust as adoption lever), F7 ("demystify" framing),
  F8 (M1 framing that motivates a risk-averse audience).
- **Artifact:** none (orientation). **Check:** a 3-item "myth vs fact" micro-quiz.
- **Context note:** lead with the privacy rule because our own tool will route teacher data
  through AI — model the behaviour we preach. [design judgment, reinforced by F4 trust]

### M2 · "10 menit pertama Anda kembali" (First win — SHIELD)
- **Objective (C1 start, C3 start):** produce one usable teaching artifact from the teacher's
  own class, with no prompting skill required.
- **Content:** pick one task-named tool (e.g., *Pembuat Rencana Pembelajaran* / lesson plan);
  fill a short structured form (jenjang, mapel, topik); get a first draft; light edit; save.
- **Draws from:** F1 (form-first "no blank box"), F2 (rung 1 = shield), F7 (the loop).
- **Artifact:** a real, usable lesson plan or quiz for *their* next class. **This is the
  aha module** — if it lands, retention holds.
- **Assessment:** did they produce a usable artifact? (formative = the artifact itself).
- **Context note:** forms and outputs must be pedagogically sound **in Bahasa**. [to validate —
  the study found zero first-hand evidence of good Bahasa output anywhere]

### M3 · "Jangan percaya buta" (Verify — MINIMIZE)
- **Objective (C1, C2):** improve a prompt to get a better result, and catch when AI is wrong.
- **Content:** move from form to a lightly-guided chat; show AI **confidently stating
  something false** on a real subject; teacher must spot and correct it; introduce
  "be specific / give context / iterate."
- **Draws from:** F2 (rung 2 = minimize prompting), F1→F2 transition, F4 (verification taught
  in-the-moment, not as a lecture).
- **Artifact:** a corrected/improved output + a personal "cara cek" (how-to-verify) checklist.
- **Assessment:** spot-the-error exercise (can they catch a planted mistake?).

### M4 · "AI dalam ritme mingguan Anda" (Workflows — TEACH)
- **Objective (C3, deepen C1):** use AI across ≥3 real workflows and write prompts
  deliberately.
- **Content:** differentiation for mixed-ability classes; parent/admin communication;
  translation (ID↔local languages/English); rubric-making. Prompting is now taught as a
  named skill ("pola prompt" / prompt patterns), not hidden.
- **Draws from:** F2 (rung 3 = teach prompting — the top of the ladder), F1 (multiple tools).
- **Artifact:** three workflow artifacts the teacher will actually use.
- **Context note:** the "teach" content is generic in the benchmark (Google AIE); we must
  **author teaching-specific, Bahasa prompt examples** — do not lift. [F2 caveat]

### M5 · "Menggunakan AI secara benar" (Responsible use)
- **Objective (C4, primes C5):** reason about bias, hallucination, privacy, and — the core
  fear — **academic integrity** ("kapan pakai AI itu curang?").
- **Content:** concrete classroom scenarios (not policy jargon); a **structured "Dilemma
  Discussion"** run by the teacher on "is using AI to write an essay cheating?"; how to
  redesign a task so it can't be trivially AI-completed.
- **Draws from:** F4 (ethics sequenced *here*, after the win), F6 (Dilemma Discussion format +
  the ready-made "Is It Plagiarism?" model), F3 (proper use modeled, not lectured).
- **Artifact:** a completed integrity-scenario judgment + one "AI-honest" version of an
  existing assignment.
- **Assessment:** scenario-based responsible-use judgment (not multiple-choice recall).
- **Context note:** the Common Sense lessons are US/English-first — **adapt to Kurikulum
  Merdeka and Bahasa**, don't lift. The "structured discussion improves values learning"
  claim is a **[hypothesis / to validate]** (flagged in `references.md`).

### M6 · "Dari pembelajar ke pengajar" (Classroom-transfer kit)
- **Objective (C5, C6):** run an AI-literacy lesson with students and set a class AI-use policy.
- **Content (the kit):** a ready-to-run AI-literacy lesson plan; an integrity discussion
  script; a student activity; a **class AI-use policy template**; and guidance to use an
  **answer-withholding / coaching AI mode** as the safe student surface (an AI that asks
  guiding questions instead of giving answers), inside a **bounded, teacher-observable**
  space.
- **Draws from:** F3 (Socratic, answer-withholding tutor — the "proper use" model; the active
  ingredient is *guidance*, not mere refusal), F5 (bounded student surface with oversight),
  F6 (grab-and-go 15–20 min lesson altitude).
- **Artifact:** a delivery-ready lesson + a filled-in class AI-use policy.
- **Context note:** F5's full "Rooms" mechanics are second-hand/heavy; at the **content**
  level we only need the *pedagogical pattern* ("bounded, observable, coaching-mode"), which
  is safe to teach regardless of the eventual product build. [F5 caveat]

### Capstone · "Ajarkan satu pelajaran" (Authentic assessment)
- **Objective:** demonstrate C5 + C6 — deliver one AI-literacy lesson to real students and
  report back (a photo, a short reflection, a sample of student work).
- **Why:** this is the only assessment that proves the client's actual outcome (students
  learning proper use). Competency-based: you graduate by *doing*.
- **Draws from:** the whole Strand B; authentic-assessment principle. [design judgment]

---

## 5. Assessment & credentialing plan [F8]

- **Formative:** each unit's produced artifact *is* the check ("did you make a real, usable
  thing?"), plus spot-the-flaw checks for C2.
- **Summative:** the **capstone** (deliver a real lesson) — authentic, performance-based.
- **Credential:** a laddered completion certificate + per-module badges, framed as
  **competence recognition tied to professional-development hours** (the lever Indonesian
  teachers already know from PMM) — **not** a controlling reward. [F8, corrected per Deci et
  al. 1999 in `references.md`]
- **Motivation caveat:** if we add points/streaks, reward **return/consistency**, not answer
  *speed* — Ruangguru's Starchamps rewards speed, the anti-pattern to avoid. [F8]
- **[to validate]:** whether official PD-hour recognition is attainable (PMM/Kemendikdasmen)
  is unconfirmed and materially changes the credential's pull.

---

## 6. Cross-cutting localization & context requirements

Applies to all modules; these are content requirements, not nice-to-haves.

- **Bahasa-first, plain language** — local analogies for "prompt," "hallucination," etc.;
  no translated English jargon. [F7, F8]
- **Anchor to the Indonesian schooling structure** — onboarding and examples segmented by
  **jenjang / mapel**, mirroring the pattern teachers expect. [F8, first-hand from Ruangguru]
- **Kurikulum Merdeka alignment** — examples, tasks, and the transfer kit map to the national
  curriculum, not a Western one. [F6 caveat]
- **Low-bandwidth / text-first** — favour text + light exercises over heavy video so units
  load and complete on typical devices/connections. [F7]

---

## 7. Traceability matrix (module → findings)

| Module | Primary findings | Competencies |
|---|---|---|
| M1 Orientation | F4, F7, F8 | C4 (prime) |
| M2 First win (shield) | **F1**, F2, F7 | C1, C3 |
| M3 Verify (minimize) | **F2**, F1, F4 | C1, C2 |
| M4 Workflows (teach) | **F2**, F1 | C3, C1 |
| M5 Using it properly | **F4**, F6, F3 | C4, C5 (prime) |
| M6 Learner→teacher | **F3**, F5, F6 | C5, C6 |
| Capstone | Strand B (all) | C5, C6 |
| Loop / credential (all) | **F7**, **F8** | — |

Every module traces to ≥1 benchmark finding; no module introduces scope the synthesis did
not support (the module *skeleton* is the design proposal, populated and sequenced by the
findings).

---

## 8. Open content risks / to validate before authoring at scale

Carried forward from `SYNTHESIS.md` Gaps & the stakeholder review — these are *content*
risks, distinct from the app/engineering risks in the Agent Review.

1. **Bahasa pedagogical quality** — no first-hand evidence that AI produces sound Bahasa
   teaching content; validate before building M2–M4 exemplars around it. **[to validate]**
2. **Localization, not translation** — M5/M6 transfer content must be re-authored to
   Kurikulum Merdeka + Bahasa, not lifted from US/English sources. **[F6 caveat]**
3. **Values-learning via Dilemma Discussion** is a design hypothesis, not a proven method.
   **[to validate]**
4. **PD-hour recognition** for the credential is unconfirmed; primary Indonesian-teacher
   research should settle which framing drives completion. **[F8, to validate]**
5. **Spacing** only holds if the schedule actually revisits earlier units. **[design decision]**

---

## 9. Per-module exercises & pulse checks

**Principle: the exercise *is* the check.** Each module's practice exercise runs as beat 4
of the unit loop (§3) and doubles as the module's pulse signal, one instrument, two jobs. So
we do not add a separate quiz *and* a survey. Frequent low-stakes retrieval is well-supported
(Roediger & Karpicke, `references.md`), but **format must follow the learning target**:
recognition (MCQ) proves *knowledge*, not a *skill* or a *judgment*. [F7]

### 9.1 Format-to-target matrix
| Target | Best exercise formats | Weak fit |
|---|---|---|
| Know a concept | MCQ (misconception distractors), true/false, sorting | — |
| Judge / evaluate | Sorting/categorization, spot-the-error / critique, "which output is better + why", scenario judgment | MCQ (too shallow) |
| Apply / create a skill | Authentic "do-it-with-your-material" task; before→after prompt rewrite | MCQ/sorting (can't prove C1/C3) |
| Facilitate / teach | Performance task (assemble + deliver the kit) | any auto-graded quiz |

**Sorting** is the workhorse for the judgment modules: higher-order than MCQ, still
auto-gradable and mobile-friendly (drag/tap-to-bucket).

### 9.2 Per-module exercise + pulse
| Module | Target | Exercise format(s) | Doubles as pulse — the one thing to prove | 🚩 Red flag |
|---|---|---|---|---|
| **M1** Orientation | concept | MCQ myth-vs-fact + **sorting** "safe to paste / never paste" | Fear ↓ (1-tap sentiment pre/post); privacy rule understood | <90% pass privacy sort → re-teach |
| **M2** First win | skill (C1/C3) | **Authentic artifact task** (make the real thing); optional 20-sec tool→task match | Produced a usable artifact + confidence "bisa saya ulangi?" (1–5) | Drop-off or "won't use" → activation/relevance fail (critical module) |
| **M3** Verify | judgment (C2) | **Spot-the-error** + **sorting** outputs into trust/verify/reject | Caught the planted mistake? | Low catch-rate → will trust AI blindly |
| **M4** Workflows | skill (C3) | Authentic multi-workflow tasks + **before→after prompt rewrite**; ordering to sequence a workflow | ≥3 distinct workflows used; prompt improved | Only 1 workflow → fluency is tool-bound |
| **M5** Using it properly | judgment (C4) | **Scenario sorting** "cheating / not cheating / depends" + short rationale + Dilemma Discussion | Defensible integrity judgment; ready to discuss with students | Black-and-white / no reasoning → judgment not formed |
| **M6** Learner→teacher | perform (C5/C6) | **Performance task** (assemble lesson + fill policy); self-checklist | Kit complete + readiness "siap mengajar?" (1–5) | Kit done, readiness <4 → transfer gap |
| **Capstone** | perform | Deliver a real lesson; reflection (+ optional student check) | Actually taught it | Not delivered → real outcome missed |

Pattern: **MCQ/sorting cluster in the concept & judgment modules (M1, M3, M5); the skill
modules (M2, M4, M6) run on authentic tasks** — mirroring the benchmark (Elements of AI, a
concept course, uses inline exercises + peer essays; MagicSchool, a tool, has no quizzes).

### 9.3 Reusable pulse kit (same 4 signals every module → comparable)
1. **Completion** (funnel). 2. **Artifact produced** (Y/N + quality spot-check on a sample).
3. **Confidence** — 1-tap "bisa saya lakukan sendiri lagi?" (1–5). 4. **Transfer intent** —
"akan Anda pakai minggu ini?" (ya/tidak).

### 9.4 Aggregate pulses (watch across teachers, not per-teacher)
- **Completion funnel** — module-to-module drop-off; **M2→M3 is the expected cliff** (watch it first).
- **Weekly "masih dipakai?"** — one push/week; the real transfer/habit signal (behaviour, not intent).
- *(Optional)* 1–2 week retention micro-check — re-ask one M3 spot-the-flaw item; did evaluation stick?

### 9.5 Guardrails
- **The authentic artifact stays the summative;** MCQ/sorting are the formative retrieval
  layer. If a quiz becomes the grade, we train recognition and the capstone exposes the gap.
- **Auto-gradable, short, Bahasa.** MCQ/sorting need no grading infra; avoid open
  constructed-response as default (auto-grading Bahasa free text hits the unverified
  Bahasa-quality risk, §8.1).
- **Targets/thresholds are [to validate]** — calibrate the "good-looks-like" bars against the
  first cohort's baseline, don't hard-code them.

---

*Next options: `/draft-spec` would turn this into a build-ready `SPEC.md` (functional
requirements, flows, IA) under the Principal Designer gate; or `/design-prototype` for a
clickable HTML prototype of a module. This map is the content foundation for either.*
