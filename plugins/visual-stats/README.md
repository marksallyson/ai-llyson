# visual-stats

Understand math and statistics through pictures, not formulas. Built for visual learners:
every explanation leads with a drawing, then attaches the Greek letters to it as labels — so
notation becomes a name for something you've already seen instead of something to decode.

## Skills

| Skill | How to trigger |
|-------|---------------|
| **visualize-concept** | "Show me what a p-value looks like" or "I don't get CUPED" |
| **visual-glossary** | "What concepts have we covered?" or "What should I learn next?" |

## How it works

`visualize-concept` follows a fixed four-layer protocol: draw the picture, explain it in
plain words, name the symbols on the drawing, then show the formula last (mapped back to the
picture). It reads a canonical picture per concept from
`skills/visualize-concept/references/visual-grammar.md`, so the same idea renders the same
way every time. That consistency is the point — a different clever metaphor each session
undoes the last one.

Visuals render inline by default. Say "save that" and you get a self-contained HTML file.

## State (survives version bumps)

Your personal glossary and saved visuals live **outside** the plugin, at
`~/.claude/visual-stats/` (override with `$VISUAL_STATS_STATE`):

- `VISUAL-GLOSSARY.md` — concepts you've worked through, and what kind of explanation lands
- `<concept>.html` — saved standalone visuals

Claude Code replaces the plugin's install directory wholesale on every update, so nothing
you want to keep is stored inside the plugin. The seed template for a fresh glossary lives
at `references/templates/VISUAL-GLOSSARY.md`.

## Using it in Cowork

Cowork loads plugins from your claude.ai account, not your local machine. To use these
skills in Cowork: in claude.ai (or the desktop app) go to **Customize → Plugins**, add the
`marksallyson/ai-llyson` marketplace, and enable **visual-stats**.
