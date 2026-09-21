# Where this plugin's state lives

## The state directory

```
~/.claude/meeting-prep/
├── HARVEST_LOG.md          # harvest windows, newest first
├── today-brief.md          # cached daily brief, read by the SessionStart hook
├── people/<slug>.md        # one file per recurring collaborator
└── series/<slug>.md        # one file per recurring meeting
```

Override with `$MEETING_PREP_STATE` if it ever needs to move.

Create the directory if it's missing — don't fail because it isn't there.

## Why not inside the plugin

Claude Code installs plugins into a **versioned cache snapshot**:

```
~/.claude/plugins/cache/ai-llyson/meeting-prep/<version>/
```

That directory is replaced wholesale on every update. Anything written under
`$CLAUDE_PLUGIN_ROOT` is destroyed at the next version bump — which, for a plugin whose
entire value is memory accumulating over months, means silent total data loss.

The marketplace checkout is no safer: it is re-cloned on refresh. Observed on
2026-09-21, `~/.claude/plugins/marketplaces/ai-llyson/` was deleted and re-cloned,
discarding an unpushed local commit.

Rule: **`$CLAUDE_PLUGIN_ROOT` is read-only.** Skills, references, and the two templates
in `references/templates/` live there. Everything this plugin writes goes to the state
directory.

## Why not under ~/Claude/

`~/Claude/` sits alongside several git repos that get pushed to GitHub
(`product-analytics-plugins`, the `ai-llyson` marketplace). This state holds notes on
named colleagues — what they push on, how they prefer to work. One misdirected
`git add -A` would put a private read on a coworker into a public commit.

`~/.claude/` is not inside any repo, so that failure mode doesn't exist.

## Sensitivity

Treat the state directory as private. It is never committed, never uploaded, never
included in a Slack message or email beyond the self-DM described in `daily-brief`, and
never quoted to anyone but Allyson.
