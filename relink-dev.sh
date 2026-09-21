#!/usr/bin/env bash
# Re-point this repo's installed plugin caches at the working tree.
#
# Claude Code always COPIES a plugin into ~/.claude/plugins/cache/ on install or
# update — there is no supported "load from source" mode. Symlinking the cache
# dir at the live source works, but `claude plugin update` deletes the symlink
# and restores a snapshot, silently. Re-run this after any update.
#
# Usage: ./relink-dev.sh [--check]
#   --check  report status and exit non-zero if anything is unlinked (no writes)

set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REGISTRY="$HOME/.claude/plugins/installed_plugins.json"
CHECK=0
[ "${1:-}" = "--check" ] && CHECK=1

[ -f "$REGISTRY" ] || { echo "no plugin registry at $REGISTRY"; exit 1; }

MARKETPLACE="$(python3 -c 'import json,sys;print(json.load(open(sys.argv[1]))["name"])' \
  "$REPO/.claude-plugin/marketplace.json")"

READ_ROWS='
import json, sys
registry, marketplace = sys.argv[1], sys.argv[2]
for key, installs in json.load(open(registry))["plugins"].items():
    name, _, mp = key.partition("@")
    if mp == marketplace:
        print(name + "\t" + installs[0]["installPath"])
'
ROWS="$(python3 -c "$READ_ROWS" "$REGISTRY" "$MARKETPLACE")"

[ -n "$ROWS" ] || { echo "no plugins installed from '$MARKETPLACE'"; exit 1; }

rc=0
while IFS="$(printf '\t')" read -r name path; do
  [ -n "$name" ] || continue
  src="$REPO/plugins/$name"

  if [ ! -d "$src" ]; then
    echo "  !! $name — no source dir at $src (renamed or removed?)"
    rc=1; continue
  fi
  if [ -L "$path" ] && [ "$(readlink "$path")" = "$src" ]; then
    echo "  ok $name"
    continue
  fi
  if [ "$CHECK" -eq 1 ]; then
    echo "  !! $name — snapshot, not linked"
    rc=1; continue
  fi
  rm -rf "$path"
  mkdir -p "$(dirname "$path")"
  ln -s "$src" "$path"
  echo "  -> $name relinked"
done <<EOF
$ROWS
EOF

if [ "$CHECK" -eq 1 ] && [ "$rc" -ne 0 ]; then
  echo "run ./relink-dev.sh to fix"
fi
exit $rc
