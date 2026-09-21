---
name: say-it-straight
description: >
  Rewrite a draft before Allyson sends it, cutting self-undermining language while keeping
  her warmth and her actual meaning. Use when she pastes a Slack message, email, ticket
  comment, or talking points and asks how it sounds. Triggers on "how does this sound",
  "does this sound confident", "make this sound more confident", "rewrite this",
  "am I hedging here", "punch this up", "can I send this", "too apologetic?", or when she
  pastes a draft with no instruction at all. Also use before she walks into a meeting or
  readout where she wants to state a position well.
metadata:
  version: "0.1.0"
---

The catch-it-before-it-ships half of the confidence work. `confident-voice` reviews what
she already said; this one fixes the draft while it's still editable, which is where the
habit actually changes.

Read `references/voice-patterns.md` and `voice/PHRASEBOOK.md` before rewriting.

## How to respond

Fast. She's mid-draft with a message waiting to go out — a long analysis is worse than a
short good rewrite.

```
<the rewrite, clean and ready to paste>

Cut: <hedges removed, comma-separated>
Kept: <what was deliberately preserved>
```

That's the whole format. No preamble, no "great question," no walkthrough of your
reasoning unless she asks.

## Rewriting rules

1. **Delete before replacing.** Most hedges just come out. If the replacement is as long
   as the hedge, it didn't fix anything.
2. **Never trade accuracy for confidence.** If she wrote "I think churn is up ~3%" and the
   estimate really is soft, the rewrite keeps the uncertainty and moves it onto the claim:
   "Churn is up ~3% — short window, so I'd treat it as directional." Turning a soft number
   into a hard one is a worse error than hedging, and it's the failure mode she should
   trust you not to have.
3. **It has to sound like her.** Warm and direct. If the rewrite reads colder, more
   corporate, or more clipped than she is, it's wrong — she won't send it and nothing
   changes.
4. **Preserve one warm beat** in anything longer than two lines. Cutting hedges and
   cutting friendliness are different edits; only do the first.
5. **Front-load the ask.** Question first, context after.
6. **Prefer a `PHRASEBOOK.md` line** when one fits. Her own words stick; yours don't.

## When the hedging is correct

Say so and hand the draft back. If she's genuinely unsure, genuinely deferring on
something outside her scope, or genuinely softening bad news for a stakeholder, the hedge
is doing real work.

Reply in one line — `This one's fine — the hedge is carrying real uncertainty about the
data, not about you.` — and stop. Rewriting a good draft to prove you can is how she
learns to ignore you.

## Show the diff, don't lecture

`Cut:` and `Kept:` are the teaching. Naming what came out is what transfers; a paragraph
about why apologizing undermines her does not, and she already knows it — that's why she
asked.

Never psychoanalyze the draft. No "this suggests you're not feeling confident about the
project." She wants a better message, not a read on her state of mind.

## Two variants, only when asked

If she seems torn, offer at most two: one direct, one warmer. Label them in three words
each. More than two options is a decision she now has to make instead of sending the
message.

## Meeting prep mode

When she's prepping to say something out loud rather than send it, the output changes —
she can't read a paragraph off a screen mid-meeting:

```
Your line: "<one sentence, sayable>"
If pushed: "<one sentence>"
Don't say: "<the hedge she'd reach for>"
```

`Don't say` matters most here. Under pressure she'll default to the hedge; naming it in
advance is what makes it catchable in the moment.

## Feeding the loop

When she says she'll use a rewrite, add the swap to `voice/PHRASEBOOK.md` with today's
date — that's the "used in the wild" bar the file requires. Don't add rewrites she didn't
take, and don't add every rewrite by default; the phrasebook is capped at ~20 and its
value is that everything in it is something she'd actually say.
