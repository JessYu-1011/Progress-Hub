---
name: sync-all
description: Re-sync every project registered in progress-hub at once, by resuming each project's latest agent session headlessly and running sync-progress there. Use when the user asks to sync all projects or sessions together (e.g. "sync all", "全部同步", "一起同步", "/sync-all").
---

# Sync all projects

Projects are registered in `~/.progress-hub/projects.tsv` the first time `sync-progress` runs in them.

1. If you can run shell commands on the user's computer, run the script that sits next to this file:

   ```
   bash <this skill's folder>/sync-all.sh
   ```

   It goes through the registry and, for each `claude-code` project, runs `claude -c -p` in that folder. That resumes the most recent Claude Code session there, so the session's own context is used, and asks it to run `sync-progress`. Projects run one at a time; each takes about a minute.
   - Optional: `bash sync-all.sh <name> [<name> ...]` syncs only the named projects.
2. If you cannot run shell commands (e.g. a web chat), tell the user to run the command above in a terminal, or to say "全部同步" in any Claude Code session.
3. Report the script's summary in the user's language: which projects were synced, which failed and why, and which must be synced by hand (agents other than Claude Code, or Claude web/desktop chats). For those, tell the user to open that chat and say "同步進度".
4. If the user is also using a planning or brief agent that reads progress-hub, mention that the new progress is now available there.
