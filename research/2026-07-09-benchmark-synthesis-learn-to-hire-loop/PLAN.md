# Research Plan: Benchmark Synthesis For The Learn-To-Hire Loop

- **Status:** Draft (pending Principal Researcher review + user approval)
- **Goal it serves:** Turn existing benchmark findings and artifacts into a decision-ready synthesis for solve.education's learn-to-hire loop, consumed by Head of Product, UI/UX, and developers.

## Key Research Questions
- Which benchmarked UX patterns most directly strengthen the learn-to-hire loop: activation, learning momentum, stuck-point recovery, mastery signaling, retention, and career-readiness evidence?
- Which patterns are supported by direct artifact evidence, which are researcher inference, and which need validation before build investment?
- What should solve.education adapt, avoid, or test from Brilliant, DataCamp, Busuu, and Khan Academy?
- What are the stakeholder-specific implications for Head of Product, UI/UX, and developers?
- What experiments or instrumentation would validate whether these patterns improve real learner progress rather than hollow engagement?

## Synthesis Inputs
- `raw-data/benchmark-findings.csv` as the canonical feature list and objective.
- Existing platform syntheses and notes under `research/`.
- Screenshots and flow GIFs as visual proof.
- Existing learning-science references where already present, especially in the Khan Academy study.

## CSV Reconciliation
- Treat every row in `raw-data/benchmark-findings.csv` as an input that must be accounted for.
- Create a reconciliation table during synthesis with:
  - CSV row number
  - Platform
  - Feature
  - Destination pattern or insight
  - Evidence artifacts used
  - Disposition: included, merged into another pattern, downgraded, or excluded
  - Rationale if downgraded or excluded
- Confirm the CSV objective is answered explicitly in the final executive summary.

## Evidence Review Plan

### Brilliant
- **Artifacts to review:** `notes.md`, smart search screenshots, Koji screenshots, non-MCQ practice screenshots.
- **What we're looking for:** guided start, AI learning companion, active practice, activation vs mastery-loop contribution, and monetization or over-scaffolding risks.
- **Evidence states to tag:** directly visible screenshot behavior, Brilliant-stated claims, third-party claims, and unvalidated hypotheses.
- **Risks:** product behavior was partly inferred from static screenshots and public claims; avoid overstating effectiveness.

### DataCamp
- **Artifacts to review:** existing `SYNTHESIS.md`, platform notes, flow GIF, screenshots `01` through `08`.
- **What we're looking for:** zero-setup learn-by-doing, split-screen coding, progressive hints, AI tutor positioning, XP/streak/leaderboard/AI recap.
- **Evidence states to tag:** captured flow, directly visible UI, paywalled or unobserved AI surfaces, and implementation-risk implications.
- **Risks:** AI tutor interaction was not fully observed; separate verified hint mechanics from AI claims.

### Busuu
- **Artifacts to review:** existing `SYNTHESIS.md`, flow notes, platform notes, flow GIF, screenshots `01` through `16`.
- **What we're looking for:** instructional feedback, bite-sized lesson loop, human correction, social reciprocity, motivation stack, and SRS runner-up.
- **Evidence states to tag:** observed learner-side correction flow vs unobserved receiving side.
- **Risks:** community-correction quality and time-to-correction are not proven by screenshots.

### Khan Academy
- **Artifacts to review:** existing `SYNTHESIS.md`, flow notes, platform notes, flow GIF, screenshots `01` through `08`, and `references.md`.
- **What we're looking for:** mastery-state model, accuracy-gated leveling, graduated hints, summary loop, and measurement gap around true upskilling.
- **Evidence states to tag:** observed mastery-state behavior vs inferred internal algorithm.
- **Risks:** avoid claiming formal knowledge tracing if only rules/points behavior was observed.

## Image Fetching And Annotation Plan
- Use the Drive URLs provided in `raw-data/benchmark-findings.csv` as first-class evidence links.
- Extract all image and folder links from the `Screenshots` and `Artifacts` columns.
- For each CSV row, build an evidence manifest with:
  - Platform
  - Feature
  - Drive screenshot links
  - Drive artifact folder link
  - Matching local artifact path, where available
  - Annotation title
  - Annotation callouts
  - Evidence status: fetched, local equivalent used, linked only, or inaccessible
- Prefer local artifact files when they already match the Drive evidence, because they make the HTML report work offline.
- Use Drive links to fetch missing images only when local equivalents are unavailable or ambiguous.
- If a Drive file or folder requires permission, keep the Drive URL in the evidence manifest and mark it as inaccessible rather than omitting it.
- Annotate images in the HTML report with lightweight research callouts:
  - Numbered markers over the screenshot where useful.
  - A short caption below the image.
  - A nearby "What this proves" note.
  - A nearby "What it does not prove" note for inferred or unvalidated claims.
- Do not over-annotate screenshots. Each image should explain one main insight or risk.
- Keep annotations mobile-compatible:
  - On desktop, show markers over the image with a side note.
  - On mobile, show the image first and the numbered notes beneath it.
  - Avoid tiny labels embedded inside the image that become unreadable on phones.

## Analysis Method
- Create a cross-platform pattern map rather than a competitor-by-competitor feature list.
- Map each feature to learn-to-hire loop stage:
  - Activation
  - First meaningful action
  - Practice and feedback
  - Stuck-point recovery
  - Mastery and skill evidence
  - Return trigger and retention
  - Career-readiness signal
- Assess career-readiness evidence conservatively:
  - Does the pattern produce observable proof of skill, such as code output, corrected production, mastery state, portfolio artifact, or assessment result?
  - Is the proof credible enough for a hiring context, or only useful for learner motivation?
  - Does the artifact show transfer from guided practice to independent performance?
  - Is the signal auditable by coaches, employers, or internal success teams?
  - If benchmark evidence does not support a career-readiness claim, mark it as a gap rather than inferring it.
- Rate each pattern on:
  - Loop impact
  - Evidence strength
  - Fit for solve.education
  - Implementation complexity
  - Operational risk
  - Validation urgency
- Translate each pattern into:
  - Product implication
  - UI/UX implication
  - Developer implication
  - Validation metric or experiment
- For every recommended pattern, include these mandatory fields:
  - Pattern name
  - Source features and CSV row references
  - Supporting artifacts
  - Evidence grade
  - Learn-to-hire loop stage
  - Why it matters for solve.education
  - Product implication
  - UI/UX implication
  - Developer implication
  - Risks and anti-patterns
  - Validation metric or experiment
  - Recommendation status: adapt now, prototype/test, monitor, or avoid

## Expected Synthesis Structure
- A simple, clean, single-page HTML report optimized for desktop and mobile reading.
- Executive summary
- Research objective and evidence base
- Cross-platform pattern map
- CSV reconciliation table
- Learn-to-hire loop mapping
- Key insights
- Opportunity areas for solve.education
- Prioritization matrix
- Stakeholder implications:
  - Head of Product
  - UI/UX
  - Developers
- Validation roadmap
- Risks and anti-patterns
- Appendix: feature-level visual evidence

## HTML Report Requirements
- Use a docs-like report format, not a slide deck, because stakeholders need both summary and evidence traceability.
- Keep the first screen useful on mobile: headline takeaway, top 3 recommendations, and strongest caution.
- Use responsive layout:
  - Single column on mobile.
  - Wider two-column or card grid only on tablet/desktop.
  - Tables must either become stacked cards on mobile or support horizontal scrolling.
  - Sidebar navigation must collapse into a top anchor menu or compact section list.
- Use short insight cards with clear labels for evidence strength, loop stage, risk, and validation status.
- Keep screenshots as responsive thumbnails with captions and links to local artifacts.
- Include annotated evidence blocks for the most important screenshots, using the CSV Drive links and local artifact matches.
- Put heavy detail, such as CSV reconciliation and feature-level evidence, in compact appendix sections so the main read stays light.
- Avoid dense paragraphs, tiny text, and wide matrices that are unreadable on a phone.
- The report should work as a static local HTML file with relative links to evidence artifacts.

## Success Criteria
- The synthesis answers the CSV objective and explicitly ties insights to solve.education's learn-to-hire loop.
- Every major recommendation is traceable to CSV rows plus local artifacts.
- Direct observations, inferences, and validation gaps are clearly separated.
- The output gives Head of Product a decision frame, UI/UX a design-requirement view, and developers concrete implementation and instrumentation implications.
- The synthesis does not overclaim learning effectiveness or retention where no outcome data exists.
- The final recommendations include testable validation plans.
- Every CSV row is either included in a synthesized pattern or explicitly downgraded/excluded with rationale.
- Every recommended pattern includes evidence grade, loop stage, solve.education fit, risk, validation metric, and stakeholder implications.
- Career-readiness claims are backed by artifact evidence or marked as validation gaps.
- The HTML report is readable on mobile without horizontal page scrolling, except for explicitly scrollable tables.
- The HTML report can be opened locally and still link to the supporting artifact files.

## Open Questions For User
- Should the final synthesis recommend a prioritized product bet, or stay at the level of research-backed opportunity areas?
- Should we include visual screenshots directly in the synthesis, or keep them as linked evidence in an appendix?
- Are there existing solve.education learner segments, funnel metrics, or hiring outcomes that should be used as the evaluation lens?

## Principal Researcher Review
Reviewed on 2026-07-09.

Must-fixes addressed:
- Added CSV row reconciliation and exclusion logic.
- Added a conservative career-readiness evidence assessment lens.
- Made per-pattern output fields mandatory for decision-readiness.
