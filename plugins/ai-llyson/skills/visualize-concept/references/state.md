# Where the visual-stats skills keep state

## The state directory

```
~/.claude/visual-stats/
├── VISUAL-GLOSSARY.md          # concepts covered + what kind of explanation lands
└── <concept-slug>.html         # saved standalone visuals
```

Override the location with `$VISUAL_STATS_STATE` if it ever needs to move.
Create the directory if it's missing — never fail because it isn't there.
Seed a fresh `VISUAL-GLOSSARY.md` from
`${CLAUDE_PLUGIN_ROOT}/references/templates/VISUAL-GLOSSARY.md`.

## What lives in the plugin vs. the state dir

| In the plugin (read-only, restored from git) | In the state dir (accumulates, never committed) |
|---|---|
| `references/visual-grammar.md` — the canonical pictures | `VISUAL-GLOSSARY.md` — what Allyson has worked through |
| `references/render-recipes.md` — how to draw them | saved `<concept>.html` files |
| `references/templates/VISUAL-GLOSSARY.md` — the seed | |

## Why not inside the plugin

Claude Code installs plugins into a versioned cache snapshot:

```
~/.claude/plugins/cache/ai-llyson/ai-llyson/<version>/
```

That directory is replaced wholesale on every update. Anything written under
`$CLAUDE_PLUGIN_ROOT` is destroyed at the next version bump. The glossary is the one
file here that accumulates across sessions, so storing it in the plugin meant silent
data loss — its whole value is the record building up over time. It now lives in the
state dir. The grammar and recipes stay in the plugin because they are fixed content,
not user data, and git restores them.

## Why not under ~/Claude/

`~/Claude/` sits alongside git repos that get pushed to GitHub. Saved visuals aren't
sensitive, but keeping every writable path in one non-repo location is simpler than
reasoning about which ones are safe to sit next to a `git add -A`. `~/.claude/` is not
inside any repo.
