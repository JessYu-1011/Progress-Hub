---
name: sync-progress
description: Summarize the current session's progress, compress older history, and save it to the progress-hub folder. Use when the user asks to sync, save, or push progress (e.g. "sync progress", "同步進度", "/sync-progress").
---

# Sync progress

## Find the hub folder

- If I gave a folder path in my request (e.g. "folder: <path>"), use it and save it as the only line of `~/.progress-hub/folder.txt` (create `~/.progress-hub/` if needed).
- Otherwise read the path from `~/.progress-hub/folder.txt`.
- If neither exists, ask me for the local path of my Google Drive "progress-hub" folder. Typical locations: macOS `~/Library/CloudStorage/GoogleDrive-<email>/My Drive/progress-hub`; Windows `G:\My Drive\progress-hub`. Do not guess.
- The folder contains `plans.md` and a `projects/` subfolder. Create `projects/` if missing; never create a second `plans.md` elsewhere.

## Write the project file

1. File: `<folder>/projects/<project name>.md`, where the project name is the current working directory's folder name (ask if there is no clear project). If it exists, read it first and update it rather than starting over.
2. Write it in English, in this format:

   ```
   # <Project name>
   Last synced: YYYY-MM-DD HH:mm (<time zone>)
   Agent: <which agent/tool wrote this, e.g. Claude Code, Codex, Cursor>
   ## Goal            (1–3 lines)
   ## Current Status  (latest only; replace the old content)
   ## Next Steps
   ## Open Questions / Blockers
   ## History
   ```

3. History: add one entry for this sync — the date plus 2–4 lines on what was done and what was decided. Compress: keep the 5 most recent entries as they are; merge older entries into one line per week; merge anything older than a month into one line per month. Keep the whole file under 150 lines.
4. Record conclusions and decisions only. No code, no full conversation, never passwords, keys, or tokens.
5. Report the file path and the entry added this time.
