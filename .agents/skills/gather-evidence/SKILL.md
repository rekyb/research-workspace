---
name: gather-evidence
description: (litreview studies) Run the deep-research harness over the approved plan and write a verified evidence.md + sources.md.
---

Gather and fact-check the evidence base for a **litreview** study — the litreview analogue of benchmark capture: the one method-specific step that produces the raw material `synth-findings` reads. It is expensive (multi-agent adversarial verification), so it runs **only after** the `PLAN.md` gate is approved.

Steps:

1. **Locate the study & confirm its type.** Resolve the target study per `.claude/references/active-research.md` (explicit `[folder]` arg, else this terminal's binding, else the sole active study, else ask). Read `README.md` and confirm `Type: litreview`. If it is not litreview, STOP — `gather-evidence` only applies to litreview studies. If the registry is empty, STOP and tell the user to run `new-research --type litreview` first.

2. **Check the plan gate.** Read `PLAN.md`. Confirm its `## Principal Researcher review` records an approved verdict (the Mode A gate from `new-research`). If the plan is still Draft/unapproved, STOP — the harness is expensive and must not run before approval.

3. **Read the inputs.** From `PLAN.md`: the research questions, provided corpus, search angles, inclusion criteria. From `README.md`: the goal. Read any documents in `corpus/` as anchor sources (`provided`; harness-found sources are `found`).

4. **Run the deep-research harness.** Invoke the `deep-research` skill (Skill tool) with a brief assembled from the research question(s) + corpus context + search angles + inclusion criteria. Let it fan out searches, fetch, and 3-vote adversarially verify. Fold `corpus/` documents in as anchor evidence.

5. **Write `sources.md`** — header `# Sources — <topic>`, table: ID | Source | URL | Provenance | Accessed | Notes; one row per `S1..Sn`.

6. **Write `evidence.md`** — `## Verified claims` (each with a confidence label + `[S#]` IDs) and `## Refuted / weak claims` (quarantined; never leak into findings).

7. **Update the README `## Log`** with a dated "evidence gathered" entry (source count, verified-vs-refuted counts).

8. **Report** verified-claim count, refuted/weak count, total sources (provided vs found), the two file paths, and the next step — `synth-findings`.

Never run before the plan gate. Never invent sources or claims. Keep refuted claims quarantined.
