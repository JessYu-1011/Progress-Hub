---
name: progress-status
description: Show the latest progress of all projects and current plans from the progress-hub folder, or answer a question about them. Use when the user asks for overall status, what other sessions or projects are doing, or what is due (e.g. "status", "進度如何", "/progress-status").
---

# Progress status

## Find the hub folder

- If I gave a folder path in my request (e.g. "folder: <path>"), use it and save it as the only line of `~/.progress-hub/folder.txt` (create `~/.progress-hub/` if needed).
- Otherwise read the path from `~/.progress-hub/folder.txt`.
- If neither exists, ask me for the local path of my Google Drive "progress-hub" folder. Typical locations: macOS `~/Library/CloudStorage/GoogleDrive-<email>/My Drive/progress-hub`; Windows `G:\My Drive\progress-hub`. Do not guess.
- The folder contains `plans.md` and a `projects/` subfolder. Create `projects/` if missing; never create a second `plans.md` elsewhere.

## Report

1. Read every file in `<folder>/projects/` and `<folder>/plans.md`. Read only; change nothing.
2. If I asked something specific or named a project, answer just that, and give the matching links from `## Links` when I ask for a note, artifact, or file. Otherwise give a short overview:
   - Each project: one line of current status and next step, plus when and by which agent it was last synced (flag anything not synced for over 7 days). Include the project's most relevant link(s) from its `## Links` section when they help the user act.
   - To-dos due today or overdue, then those due in the next 7 days.
   - Calendar Inbox items not yet moved to the calendar.
   - Long-term goals, one line each.
3. Reply in the language I used (default Traditional Chinese). Keep it brief.
