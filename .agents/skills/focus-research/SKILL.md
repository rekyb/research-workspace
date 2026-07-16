---
name: focus-research
description: Point this terminal at one of the active research studies, so unqualified workflow commands default to it.
---

Bind **this terminal** to one of the currently active studies. The workspace can have
several studies active at once (see `.claude/references/active-research.md`); this command
sets which one *this* terminal works on by default, without affecting any other terminal.

Use it when more than one study is active and you want unqualified commands
(`synth-findings`, `review-research`, …) to target a specific one here.

Steps:

1. **Read the target.** Take the `<folder>` argument (a research folder path). If none was
   given, list the active studies from `.claude/.active-research` and ask which one.

2. **Validate it is active.** Confirm `<folder>` is a line in `.claude/.active-research`. If
   it is not, STOP and tell the user it is not an active study — they can start it with
   `new-research` or check `research-board`.

3. **Derive the session id.** Read it from this session's scratchpad path (the
   `<SESSION-UUID>` directory segment). See `.claude/references/active-research.md`.

4. **Write the binding.** Create `.claude/.current-research/` if it does not exist, then
   write `<folder>` (no trailing slash) into `.claude/.current-research/<session-id>`,
   replacing any previous binding for this terminal.

5. **Report.** Confirm this terminal is now focused on `<folder>`, and list the other
   active studies so the user knows what else is open.

See `.claude/references/active-research.md` for the full two-layer model and resolution
rule.
