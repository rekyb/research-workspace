---
description: Start a new benchmarking research — creates a dated folder, scaffolds it, and marks it active.
argument-hint: <research topic>
---

You are starting a new secondary desk-research effort. The topic is: **$ARGUMENTS**

Follow these steps exactly:

1. **Check for an already-active research.** Read `.claude/.active-research` if it
   exists. If it points to a research whose `README.md` is not marked `Status: Closed`,
   STOP and tell the user there's an open research (`<path>`); ask them to run
   `/close-research` first, or confirm they want to switch anyway.

2. **Derive the slug.** Build it defensively from the topic:
   - lowercase everything;
   - strip quotes, apostrophes, brackets, and other punctuation entirely (don't
     turn them into hyphens — `"users' data"` → `users-data`, not `users--data`);
   - replace any run of spaces/remaining separators with a single hyphen;
   - collapse repeated hyphens and trim leading/trailing hyphens;
   - keep it concise — if the topic is a long sentence, use the meaningful head
     (roughly the first 5–6 words / ~50 chars), not the whole thing.

   Get today's date with `date +%F` (or the harness-provided current date if
   available). Folder path = `research/<YYYY-MM-DD>-<slug>/`.

3. **Scaffold the folder:**
   - `research/<...>/platforms/` (empty; one subfolder per platform gets added later)
   - `research/<...>/sources.md` — header `# Sources — <topic>` and a table with
     columns: Platform | URL | Accessed | Notes.
   - `research/<...>/README.md` — the research brief (see template below).

4. **Set the active pointer.** Write the folder path (no trailing slash) into
   `.claude/.active-research`.

5. **Confirm** to the user: folder created, what to do next (name the platforms to
   benchmark), and remind them capture happens via the Claude-in-Chrome tools.

README.md template (fill in what you know from the topic; leave TBD where unknown):

```
# Research: <Topic>

- **Status:** Active
- **Started:** <YYYY-MM-DD>
- **Researcher:** Claude (acting Senior UI/UX Designer)

## Goal
<one-paragraph statement of what we want to learn>

## Scope
<what's in / out of scope>

## Platforms to benchmark
- [ ] <platform 1>
- [ ] <platform 2>

## Log
- <YYYY-MM-DD> — research created.
```

After creating everything, do NOT start browsing yet — wait for the user to tell you
which platforms to benchmark, unless they already named them in the topic.
