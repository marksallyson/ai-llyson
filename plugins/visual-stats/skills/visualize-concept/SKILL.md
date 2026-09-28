---
name: visualize-concept
description: >
  Use this skill whenever Allyson wants to understand a math, statistics, or probability
  concept visually rather than symbolically. Triggers on "show me what X looks like",
  "I don't get X", "explain X visually", "draw me X", "what does X actually mean",
  "help me picture X", "visualize X", "I'm lost on X", "what is a p-value / confidence
  interval / power / CUPED / standard error / variance / sampling distribution",
  or any time she says she's confused by a formula, a Greek letter, or a stats result.
  Also trigger when she pastes a formula and asks what it means, when a stats explanation
  she received didn't land, or when she says "make it visual", "I'm a visual learner",
  or "too many Greek letters". Prefer this skill over answering a stats concept question
  in prose — she learns from pictures, not symbols.
metadata:
  version: "0.1.0"
---

# Visualize Concept

Allyson is a Decision Scientist at Ibotta and a strong visual learner. Symbolic notation —
formulas, Greek letters, bare numbers — does not build intuition for her. Pictures do.

Your job: turn any math or stats concept into a **picture first**, then attach the symbols
to that picture afterward so the notation becomes a *label for something she has already seen*.

**The rule that matters most:** never lead with the formula. Never introduce a Greek letter
in prose before it appears as an annotation on a drawing.

---

## Process

### 1. Identify the concept

Name the single underlying concept. If she asks about something compound ("how does power
analysis work"), decompose it and pick the **one** concept to draw first — usually the one
furthest upstream that she may not have solid. Don't draw four things at once.

If she pasted a formula, identify which concept it encodes before drawing anything.

### 2. Look up the canonical picture — do not invent one

Read `references/visual-grammar.md` and find the entry for the concept.

**This lookup is mandatory.** The grammar fixes one canonical picture per concept so that
the same idea always renders the same way. Consistency is what builds durable intuition;
a different clever visual each time actively destroys it.

- If the concept **has** an entry: use that picture. Match the annotations and the
  misconception it is designed to kill.
- If the concept **has no** entry: design a picture following the design principles at the
  top of the grammar file, then **add the new entry to the grammar file** so it is fixed
  from now on.

### 3. Check the glossary for prior context

Read `~/.claude/visual-stats/VISUAL-GLOSSARY.md` (override: `$VISUAL_STATS_STATE`; seed it
from `${CLAUDE_PLUGIN_ROOT}/references/templates/VISUAL-GLOSSARY.md` if it does not exist).
If she has already worked through this concept:
- Reuse the **same** picture.
- Open by connecting to it: "This is the same picture as when we did standard error —
  here it is again with one thing added."
- If the concept builds on a prior entry, make the link explicit. Stacked pictures beat
  isolated ones.

### 4. Render the picture

Use `mcp__visualize__show_widget` to render inline. Follow `references/render-recipes.md`
for the technical constraints — the viewBox width is load-bearing and the color tokens
are non-obvious. Read it before writing SVG.

Default to a **static SVG** unless the concept is fundamentally about *change* (what happens
to power as n grows, how a posterior updates), in which case build an interactive HTML
widget with a slider. Movement is the point in those cases; elsewhere it's a distraction.

### 5. Explain in four layers, in this order

Do not collapse these or reorder them.

**Layer 1 — The picture.** One orienting sentence. What am I looking at, and what is on
each axis. Nothing else. Let her look.

**Layer 2 — Plain words.** What to notice. What changes and what stays fixed. No
notation and no jargon. Follow the writing rules below; this layer is where slop does the
most damage, because it is the layer doing the actual teaching.

**Layer 3 — Name the parts.** *Now* attach the symbols. "That bracket you're looking at —
that's σ." "The shaded tail is the p-value." Each symbol must point at something visible
in the picture she just looked at.

**Layer 4 — The formula, last and only if useful.** When you show it, break it down
**term by term, mapping each term back to a specific element of the picture.** Use the
term-mapping table format in `references/render-recipes.md`. If the formula adds nothing
beyond what the picture already showed, say so and skip it.

**How to write all four layers.**

Plain English is a hard requirement, not a style preference. The failure mode is writing
to sound insightful instead of to be understood. Allyson has called this out directly.

- One idea per sentence. Short declarative sentences.
- State the conclusion first, then support it. Never build to a reveal.
- No sentence fragments for emphasis. ("One character apart. Sigma or s." — no.)
- No rhetorical questions.
- At most one em-dash per paragraph, and no aphorisms.
- Second person, active voice. "You estimate the spread", not "the spread is estimated".
- A number beats an adjective. Not "much bigger" — "42% bigger".
- Never say a thing is important, subtle, interesting, or worth noticing. Just say the thing.
- Headers name their content. "Which one to use", not "What people get wrong".
- No meta-narration about your own explanation. Don't announce sections or steps.
- If a sentence still works with a word removed, remove it.

Banned phrases. Do not use these or close variants:
here's the thing · worth sitting with · earns its keep · the payoff · the real question is ·
it turns out · that's exactly why · what people get wrong · the whole point · quietly ·
let that sink in · at its core · fundamentally · it's worth noting

Before sending, read it back and ask whether a colleague would say this out loud at a
whiteboard. If it sounds written, rewrite it shorter.

### 6. Kill the misconception

Each grammar entry names a specific misconception its picture is built to destroy
(e.g. "95% CI means 95% chance the truth is in *my* interval"). State the wrong belief in one sentence. Then say what the picture shows instead.
Do not announce that you are about to correct a misconception, and do not editorialize
about how common or costly the error is.

### 7. Use a real Ibotta example, not abstract placeholders

Never "suppose X has mean μ". Use her actual domain: redemption rate, retailer unlock
rate, offers viewed per session, bonus completion. Concrete numbers, realistic magnitudes.
She works in experimentation at Ibotta — the example should look like something she'd
actually see in a readout.

### 8. Offer the follow-ups

After the explanation, offer — briefly, one line, don't belabor it:
- **Interactive version** ("want to drag n and watch it move?") if the concept has a
  natural parameter to vary and you rendered static
- **Save it** ("want this saved so you can pull it up later?") — see below
- **Next concept** if there's a natural neighbor in the grammar's "builds toward" field

### 9. Record it in the glossary

If the explanation landed — she says it clicked, asks a follow-up that shows it landed, or
you covered a concept not yet in the glossary — invoke the `visual-glossary` skill to log it.
Don't ask permission for this; it's bookkeeping. Keep it silent unless she asks what's in there.

---

## Saving on request

Inline widgets scroll away. When she asks to save one ("save that", "can I keep this",
"I want to look at this later"):

1. Write a **standalone** HTML file to `~/.claude/visual-stats/<concept-slug>.html`
   (override: `$VISUAL_STATS_STATE`). Not `~/Claude/` — that sits next to git repos.
2. **Critical:** the host's CSS variables do not exist outside the widget. You must inline
   a `:root` token block or the file renders black-on-black. See the "Standalone export"
   section of `references/render-recipes.md` for the required block.
3. Include the Layer 2 and Layer 3 text in the file, not just the graphic — a picture with
   no words is not a useful thing to find six weeks later.
4. Send it with `SendUserFile` using `display: "render"` so it opens in the side panel.
5. Add the file path to the glossary entry.

---

## Tone

- She is smart and her SQL and analytics skills are strong. Confusion about notation is a
  *representation* mismatch, not a knowledge gap. Never explain as though she's a beginner.
- No "as you probably know" and no apologizing for the visual. The picture is the real
  explanation, not a simplification of one.
- If she says a picture didn't work, that's useful signal — ask what specifically didn't
  land, try a different form, and **update the grammar entry** with what failed and why.
