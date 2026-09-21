#!/bin/sh
# SessionStart hook: surface today's cached meeting brief, if it's actually from today.
#
# Deliberately does no network or MCP work — the brief is generated once each morning by
# the daily-brief skill and cached. This hook only decides whether the cache is fresh.
#
# Reads from the state dir, NOT from the plugin dir: plugins are installed into a
# versioned cache snapshot that is replaced on every update, so anything written inside
# CLAUDE_PLUGIN_ROOT is lost when the plugin is upgraded. See references/state.md.

set -u

BRIEF="${MEETING_PREP_STATE:-$HOME/.claude/meeting-prep}/today-brief.md"

[ -f "$BRIEF" ] || exit 0

TODAY=$(date +%Y-%m-%d)

# The brief's first line carries: <!-- generated: YYYY-MM-DD HH:MM -->
if ! head -n 1 "$BRIEF" | grep -q "$TODAY"; then
  # Stale brief from a previous day. Say nothing rather than briefing her on yesterday.
  exit 0
fi

printf '# Today'\''s meeting brief\n\n'
cat "$BRIEF"
printf '\n_Cached brief. Ask for a fresh prep on any meeting to re-sweep live sources._\n'
