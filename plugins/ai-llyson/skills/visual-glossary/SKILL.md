---
name: visual-glossary
description: >
  Maintains and reads Allyson's personal visual glossary of math and statistics concepts —
  a running record of which concepts she has worked through visually and which picture was
  used for each. Use when she asks "what have we covered", "show me my glossary", "what
  concepts do I have", "pull up that picture from before", "have we done X already", or
  "what should I learn next". Also invoked automatically by the visualize-concept skill to
  log a concept after explaining it. Read this glossary before explaining any stats concept
  so the same picture gets reused rather than reinvented.
metadata:
  version: "0.1.0"
---

# Visual Glossary

Allyson's personal record of stats concepts she has worked through visually. It exists for
one reason: **the same concept must get the same picture every time.** Re-explaining
variance with a different metaphor each session means she learns it zero times.

Glossary file: `~/.claude/visual-stats/VISUAL-GLOSSARY.md` (override: `$VISUAL_STATS_STATE`).

This lives **outside** the plugin on purpose. The plugin installs into a versioned cache
snapshot that Claude Code replaces wholesale on every update, so a glossary stored inside
the plugin would be wiped at the next version bump — see `../visualize-concept/references/state.md`.

If the file does not exist yet, create it by copying the seed template from
`${CLAUDE_PLUGIN_ROOT}/references/templates/VISUAL-GLOSSARY.md`. Create the
`~/.claude/visual-stats/` directory if missing; never fail because it isn't there.

---

## Reading mode

When she asks what she's covered, or which picture was used before:

1. Read the glossary file.
2. Show it grouped by **theme** (spread & uncertainty, testing, experiment design,
   modeling) rather than alphabetically or by date — the thematic grouping shows her
   where the gaps are.
3. Flag concepts whose `builds toward` chains point at entries she *doesn't* have yet.
   Those are the highest-value next steps, and they're the answer to "what should I
   learn next".
4. If a concept has a saved HTML file, offer to reopen it with `SendUserFile`.

Do not read the whole grammar file for this — the glossary alone answers it.

---

## Writing mode

Invoked by `visualize-concept` after an explanation, or when she says a concept clicked.

Append or update an entry. Keep it terse — this is an index, not notes:

```markdown
### <concept> · <symbols>

- **First covered:** YYYY-MM-DD
- **Picture:** <one line naming the canonical form, e.g. "caterpillar plot of 100 intervals">
- **Landed because:** <the specific thing that made it click, in her words if she said it>
- **Still shaky on:** <only if she flagged something — otherwise omit the line>
- **Saved:** <path, or omit>
- **Revisited:** YYYY-MM-DD (append dates on re-explanation)
```

Rules:

- **"Landed because" is the most valuable field.** It records what kind of explanation
  works for her, which compounds across every future concept. If she said "oh, it's the
  balance point that got me" — write that down verbatim.
- Only log a concept once it actually landed. A confusing session is a revision-log entry
  in `visualize-concept/references/visual-grammar.md`, not a glossary entry.
- If she was confused, also update the grammar's revision log with what failed.
- Update the theme index at the top of the file.
- Silent bookkeeping. Don't announce a glossary write unless she asks.

---

## Why this beats a general note-taking system

The glossary is *keyed to pictures, not prose.* Its job isn't to store the explanation —
it's to store which visual metaphor was used, so the next explanation can build on the
same mental image instead of competing with it. That's the whole mechanism.
