---
description: Publish the active research to GitHub — safety-check for PII, commit, and push via the gh CLI.
argument-hint: [-m "custom commit message"]
---

Publish the currently active research to the GitHub remote using the `gh` CLI.
This is an **explicit** publish step — it is never run automatically, because
captures can contain sensitive data and this repo may be public.

Steps:

1. **Locate the research.** Read `.claude/.active-research`. If missing/empty, tell
   the user there's no active research and stop.

2. **Confirm the remote & auth.** Run `gh auth status`. If not logged in, tell the
   user to run `gh auth login` themselves (never handle their credentials) and stop.
   Ensure git is configured to use gh for HTTPS pushes:
   `gh auth setup-git`. If the repo has no `origin`, ask the user for the repo
   (or create one only if they explicitly ask) — do not invent a remote.

3. **PII / paywall safety gate (required).** Before staging, verify the guardrails
   in `CLAUDE.md` are satisfied for what you're about to publish:
   - Skim the new/changed captures in `platforms/*/screenshots/` and `flow.gif`
     for un-redacted personal data — the account holder's **and third parties'**
     names, avatars, emails (e.g. leaderboard/comment/social surfaces).
   - If the remote repo is **public** (`gh repo view --json visibility`), and any
     capture may contain PII, STOP and flag it to the user before pushing.
   - Confirm no paid-feature transaction happened.
   Only continue once this is clean.

4. **Stage & commit.** Stage the active research folder (and any workspace docs you
   changed this session — `README.md`, `CLAUDE.md`, `.claude/`). Show
   `git status --short` first. Commit with a clear, conventional message
   summarizing what was captured/synthesized (or use the user's `-m` message).
   End the commit body with the standard `Co-Authored-By` trailer.

5. **Push.** `git push` (set upstream with `-u origin <branch>` on first push).
   If on the default branch and the user prefers PRs, offer to branch + `gh pr
   create` instead — otherwise push directly per this workspace's convention.

6. **Report** the pushed commit hash, the branch, the remote URL
   (`gh repo view --json url -q .url`), and a one-line summary of what went public.
