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
   ## Links           (things the user may want to open; see step 3)
   ## History
   ```

3. Agreed plan: read `<folder>/plans.md`. If it has milestones or to-dos for this project (`[project: <name>]` or a goal naming it), write Next Steps so they follow that agreed plan and its dates, and replace any older day-by-day schedule of your own. If you disagree with the plan, keep it and say why under Open Questions / Blockers.
3b. Links: list artifacts, documents, notes, repos, PRs, dashboards, or files that this session created, edited, or relied on, so other agents and the daily brief can hand them straight to the user. Look through the conversation for URLs (claude.ai artifact or doc links, Google Drive/Docs links, GitHub repo/PR links, published pages) and important local file paths. Format each as `- <Title> — <URL or path> (<type>, updated YYYY-MM-DD)`, e.g. `- Ch 19 notes — https://claude.ai/artifact/... (artifact, updated 2026-11-24)`. Keep existing links that are still relevant, update changed ones, drop obsolete ones; at most ~15, most useful first. Never include links that embed secrets or access tokens. If there are none, write `- (none)`.
4. History: add one entry for this sync — the date plus 2–4 lines on what was done and what was decided. Compress: keep the 5 most recent entries as they are; merge older entries into one line per week; merge anything older than a month into one line per month. Keep the whole file under 150 lines.
5. Record conclusions and decisions only. No code, no full conversation, never passwords, keys, or tokens.
6. Register the project so `sync-all` can re-sync it later: make sure `~/.progress-hub/projects.tsv` has exactly one tab-separated line for this project:
   `<project name>	<absolute project path>	<agent id>	<last synced YYYY-MM-DD HH:mm>`
   - agent id: `claude-code`, `codex`, `cursor`, `gemini-cli`, `claude-app` (Claude web/desktop chat), or `other`.
   - Use `-` as the path when the session has no local project folder (e.g. a Claude web chat).
   - Skip this step if the session runs in a temporary cloud environment (no lasting home folder on the user's own computer, e.g. Claude web/desktop chat, Cowork, or a cloud Claude Code session). `sync-all` cannot reach those sessions anyway; just tell the user this project is synced by saying "同步進度" in this chat.
   - Replace an existing line with the same name and path; create the file with the header line `# name	path	agent	last_synced` if it does not exist. Leave other lines unchanged.
7. Report the file path and the entry added this time.
