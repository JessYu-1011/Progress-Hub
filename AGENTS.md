# progress-hub

Agent Skills (SKILL.md, agentskills.io format) in `skills/*/SKILL.md`, written in English, agent-neutral (no tool-specific variables or paths besides `~/.progress-hub/folder.txt`). `.claude-plugin/` only packages the same skills for Claude Code.

Contract shared with the daily-brief scheduled task — keep stable, or update that task's prompt when changed:
- Folder: Google Drive `progress-hub/` with `plans.md` and `projects/<project>.md`
- `plans.md` sections: Long-term Goals, Short-term To-dos, Calendar Inbox, Done
- Calendar Inbox line: `- Title | YYYY-MM-DD HH:mm (or all-day) | duration | notes`
- Project file: `Last synced:` and `Agent:` lines; sections Goal, Current Status, Next Steps, Open Questions / Blockers, History

When changing behavior: bump `version` in `.claude-plugin/plugin.json` and add a CHANGELOG entry.
