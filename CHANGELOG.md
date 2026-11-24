# Changelog

## 0.8.0 — 2026-11-24
- Auto-sync: sync-progress runs on its own after a meaningful chunk of work or when the user wraps up, with a one-line report.
- First sync in a project adds an auto-sync line to the project's AGENTS.md/CLAUDE.md (or tells the user what to paste into chat-project instructions).

## 0.7.0 — 2026-11-24
- sync-progress aligns Next Steps with the agreed plan in plans.md instead of keeping its own older schedule.
- Cloud sessions (web/desktop chat, Cowork, cloud Claude Code) no longer register in projects.tsv, since sync-all cannot reach them.

## 0.6.0 — 2026-11-24
- New `sync-all` skill + `sync-all.sh`: re-sync every registered project at once (Claude Code projects resume their latest session headlessly via `claude -c -p`; others listed for manual sync).
- `sync-progress` registers each project in `~/.progress-hub/projects.tsv`.

## 0.5.0 — 2026-11-24
- Project files get a `## Links` section: sync-progress collects artifact, doc, repo, and file links from the session; status and plan-session surface them.

## 0.4.0 — 2026-11-24
- New `plan-session` skill: interactive planning for exams, learning goals, and deadlines; saves the agreed plan.
- Long-term goals may have indented milestone sub-items.

## 0.3.0 — 2026-11-24
- Renamed to progress-hub; agent-neutral Agent Skills (`skills/*/SKILL.md`) instead of Claude-only commands.
- Skills: `sync-progress`, `add-plan`, `progress-status`. Folder setting moved to `~/.progress-hub/folder.txt`.
- Project files record which agent synced them.

## 0.2.0 — 2026-11-24
- Added plan and status commands (Claude Code only).

## 0.1.0 — 2026-11-24
- sync-progress command.
