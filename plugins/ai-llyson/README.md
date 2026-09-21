# Allyson's Personal Assistant Plugin

Your personal AI assistant — built around how you work, where you're going, and who you are.

## What this plugin does

Every session automatically loads your profile so Claude knows your context, working style, and goals without you having to repeat yourself.

## Skills

| Skill | How to trigger |
|-------|---------------|
| **brain-dump** | "Brain dump:" or just paste a wall of thoughts |
| **ibotta-rosetta-stone** | "How does this compare to AirDNA?" or "What's the Ibotta version of X?" |
| **my-coach** | "Coach me on X" or "I'm struggling with..." |
| **career-path** | "Career check-in" or "How do I get to senior DS?" |
| **skill-optimizer** | "Help me work smarter on X" or "Optimize my workflow" |
| **weekly-review** | "Weekly review" or "Let's do a Friday check-in" |
| **decision-log** | "Log this decision" or "Help me decide between X and Y" |
| **visualize-concept** | "Show me what a p-value looks like" or "I don't get CUPED" |
| **visual-glossary** | "What concepts have we covered?" or "What should I learn next?" |
| **confident-voice** | "How did I sound this week?" or "Am I hedging?" (also runs weekly) |
| **say-it-straight** | Paste a draft: "How does this sound?" or "Can I send this?" |

## Visual stats

`visualize-concept` turns math and stats concepts into pictures instead of formulas. It
always leads with a drawing, then attaches the Greek letters to it as labels — so notation
becomes a name for something you've already seen rather than something to decode.

The picture for each concept is fixed in `skills/visualize-concept/references/visual-grammar.md`,
so the same idea always renders the same way. That consistency is the point: a new clever
metaphor every session undoes the last one. When you work through a concept it gets logged
in `~/.claude/visual-stats/VISUAL-GLOSSARY.md`, which also tracks *what kind* of explanation
lands for you. That file lives outside the plugin so a version bump can't wipe it.

Visuals render inline by default. Say "save that" and you get a self-contained HTML file in
`~/.claude/visual-stats/` that still works offline in two years.

## Confident voice

Two skills that work on the same problem from opposite ends: how you narrate your own work.

`say-it-straight` is the one you'll use most — paste a draft Slack message, email, or set
of talking points and get it back with the self-undermining language cut and your warmth
left intact. `confident-voice` is the look-back: it runs every Friday at 4pm, sweeps the
week's Slack messages and meeting transcripts, and DMs you at most five things worth
changing — plus at least two moments where you already said it straight.

The governing rule, in `references/voice-patterns.md`, is **hedge the claim, never the
claimant**. "The CI is wide, so I'd call this directional" is rigor and never gets flagged.
"I could be wrong, but maybe it's up?" is the same uncertainty relocated onto you, and that
one does. Calibrated uncertainty about findings is a credibility asset for a Decision
Scientist — these skills are built not to sand it off.

Two files accumulate: `voice/VOICE-LOG.md` tracks the rate over time (normalized per 100
messages, so a busy week doesn't read as backsliding), and `voice/PHRASEBOOK.md` collects
swaps in *your* words — but only once you've actually used one, because generic advice
doesn't stick and lines you've said do.

To change the weekly schedule or turn it off, edit the `confident-voice-weekly` scheduled
task.

## Your profile

Your profile lives at `profile/allyson-profile.md`. Claude reads it at the start of every session and updates it as it learns more about you. You can also edit it directly to add context, update goals, or correct anything.

## Setup

No external services or environment variables required — this plugin works out of the box.

## Tips

- **Be messy with brain dumps** — the messier the better. That's the point.
- **Do weekly reviews on Fridays** — even a 10-minute version builds up over time.
- **Use the decision log proactively** — logging decisions in the moment makes the review far more valuable.
- **Let the coach surprise you** — the more honestly you engage, the more useful the coaching becomes.
- **Run drafts through `say-it-straight` before you send them** — the retrospective scan is
  useful, but catching a hedge before it ships is what actually changes the habit.
