#!/usr/bin/env bash
# Re-sync every project registered in ~/.progress-hub/projects.tsv.
# Claude Code projects: resume the latest session in that folder headlessly and run sync-progress.
# Other agents: listed as "sync by hand".
# Usage: sync-all.sh [project-name ...]   (no names = all projects)
set -u

HUB="$HOME/.progress-hub"
REG="$HUB/projects.tsv"

if [ ! -f "$REG" ]; then
  echo "No registry at $REG. Run sync-progress once in each project first."
  exit 1
fi
FOLDER="$(head -n 1 "$HUB/folder.txt" 2>/dev/null || true)"
FOLDER="${FOLDER/#\~/$HOME}"
if [ -z "$FOLDER" ] || [ ! -d "$FOLDER" ]; then
  echo "Hub folder not found (from $HUB/folder.txt): '$FOLDER'"
  exit 1
fi

PROMPT="Use the sync-progress skill now to sync this project's progress to progress-hub. Do not ask me any questions; record anything unclear under Open Questions / Blockers. Finish with one line: the file path and the new History entry."

wanted=("$@")
is_wanted() {
  [ ${#wanted[@]} -eq 0 ] && return 0
  local w; for w in "${wanted[@]}"; do [ "$w" = "$1" ] && return 0; done
  return 1
}

ok=(); manual=(); failed=()
while IFS=$'\t' read -r name path agent _rest || [ -n "${name:-}" ]; do
  [ -z "${name:-}" ] && continue
  case "$name" in \#*) continue ;; esac
  is_wanted "$name" || continue
  path="${path/#\~/$HOME}"

  case "${agent:-}" in
    claude-code)
      if [ "$path" = "-" ] || [ ! -d "$path" ]; then failed+=("$name: folder not found ($path)"); continue; fi
      if ! command -v claude >/dev/null 2>&1; then failed+=("$name: claude CLI not found"); continue; fi
      echo "→ Syncing $name ($path)"
      if (cd "$path" && claude -c -p "$PROMPT" --add-dir "$FOLDER" --add-dir "$HUB" --permission-mode acceptEdits </dev/null); then
        ok+=("$name")
      else
        failed+=("$name: claude exited with an error")
      fi
      ;;
    *)
      manual+=("$name (${agent:-unknown}${path:+, $path})")
      ;;
  esac
done < "$REG"

echo
echo "=== sync-all summary ==="
echo "Synced (${#ok[@]}):";       for x in "${ok[@]+"${ok[@]}"}"; do echo "  ✓ $x"; done
echo "Failed (${#failed[@]}):";   for x in "${failed[@]+"${failed[@]}"}"; do echo "  ✗ $x"; done
echo "Sync by hand (${#manual[@]}) — open that chat and say \"同步進度\":"
for x in "${manual[@]+"${manual[@]}"}"; do echo "  • $x"; done
