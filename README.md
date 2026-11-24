# progress-hub

Agent-neutral skills for a personal progress hub. Every agent (Claude Code, Codex, Cursor, Gemini CLI, Copilot…) writes to and reads from one Google Drive folder, and a daily brief summarizes it.

```
progress-hub/            (Google Drive, synced locally by Google Drive for desktop)
├── plans.md             long-term goals, to-dos, calendar inbox, done
└── projects/<name>.md   one file per project, written by sync-progress
```

## Skills

| Skill | What it does |
|---|---|
| `sync-progress` | Summarize this session's progress into `projects/<project>.md`, with compressed history |
| `add-plan` | Add a goal, to-do, or dated event to `plans.md` |
| `progress-status` | Overview of all projects and plans |
| `sync-all` | Re-sync all registered projects at once (`skills/sync-all/sync-all.sh`) |
| `plan-session` | Discuss and plan together: exams, learning goals, deadlines → agreed schedule saved to `plans.md` |

First use: include the folder path, e.g. `sync progress, folder: ~/Library/CloudStorage/GoogleDrive-<email>/My Drive/progress-hub`. It is remembered in `~/.progress-hub/folder.txt`, shared by all agents.

## Sync everything at once

Each project is registered in `~/.progress-hub/projects.tsv` the first time it runs `sync-progress`. Then either say "全部同步" in any Claude Code session, or run from a terminal:

```
bash /path/to/Progress-Hub/skills/sync-all/sync-all.sh          # all projects
bash /path/to/Progress-Hub/skills/sync-all/sync-all.sh 分散式系統  # only some
```

Claude Code projects are synced automatically (the latest session in each project folder is resumed). Projects in other agents or in Claude web/desktop chats are listed so you can sync them by hand.

## Install

Any agent that supports Agent Skills (via the open `skills` CLI):

```
npx skills add JessYu-1011/progress-hub
```

Claude Code plugin:

```
claude plugin marketplace add JessYu-1011/progress-hub
claude plugin install progress-hub@progress-hub
```

Or copy `skills/*` into your agent's skills folder (e.g. `~/.claude/skills/`, `~/.codex/skills/`, `~/.gemini/skills/`).

## Development

- Claude Code: `claude --plugin-dir /path/to/progress-hub` to test without reinstalling.
- Release: bump `version` in `.claude-plugin/plugin.json`, add a `CHANGELOG.md` line, commit, push. Then `npx skills update` or `claude plugin update progress-hub@progress-hub`.
- The daily brief is a separate scheduled task reading the same Drive folder; see `AGENTS.md` for the shared file formats.
