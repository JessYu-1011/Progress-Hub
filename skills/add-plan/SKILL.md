---
name: add-plan
description: Add a long-term goal, short-term to-do, or dated event to the progress-hub plans file, or mark one done. Use when the user wants to add a plan, task, deadline, appointment, or goal (e.g. "add plan", "新增行程", "/add-plan").
---

# Add plan

## Find the hub folder

- If I gave a folder path in my request (e.g. "folder: <path>"), use it and save it as the only line of `~/.progress-hub/folder.txt` (create `~/.progress-hub/` if needed).
- Otherwise read the path from `~/.progress-hub/folder.txt`.
- If neither exists, ask me for the local path of my Google Drive "progress-hub" folder. Typical locations: macOS `~/Library/CloudStorage/GoogleDrive-<email>/My Drive/progress-hub`; Windows `G:\My Drive\progress-hub`. Do not guess.
- The folder contains `plans.md` and a `projects/` subfolder. Create `projects/` if missing; never create a second `plans.md` elsewhere.

## Update plans.md

1. Read `<folder>/plans.md`. If the request has no item, ask what to add.
2. Place each item (one request may contain several):
   - Specific date or time (meeting, appointment, exam, trip) → `## Calendar Inbox` as `- Title | YYYY-MM-DD HH:mm (or all-day) | duration (optional) | notes (optional)`. The daily brief moves these into Google Calendar.
   - Task to finish soon → `## Short-term To-dos` as `- [ ] Task (due: YYYY-MM-DD) [project: name]`. Link the current project if relevant.
   - Goal spanning weeks or months → `## Long-term Goals` as `- [ ] Goal (target: YYYY-MM or ongoing)`.
   - "X is done" → move it to `## Done` with today's date.
3. Resolve relative dates ("tomorrow", "下週五") to absolute dates in my local time zone. If the date or category is truly ambiguous, ask instead of guessing.
4. Write items in English (translate if needed). Leave everything else in the file unchanged. Never write passwords, keys, or tokens.
5. Report in one or two lines what was added and where.
