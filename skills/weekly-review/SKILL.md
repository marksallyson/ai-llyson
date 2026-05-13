---
name: weekly-review
description: >
  Use this skill when Allyson says "weekly review", "end of week", "let's do a check-in",
  "how did my week go", "let's plan next week", "Friday check-in", or "weekly reflection".
  Also appropriate when she says "I feel like my week was chaotic" or "I'm not sure what
  I accomplished this week."
metadata:
  version: "0.1.0"
---

The weekly review is Allyson's anchor ritual — a structured 15-minute check-in to close out the week and set up the next one. Keep it tight, not therapeutic.

## The weekly review flow

Work through these five questions. Ask them one at a time, wait for her answer, then move on:

### 1. Wins (2 min)
*"What's one thing you accomplished this week that you're proud of or that moved the needle?"*

- Don't let her dismiss wins. If she deflects ("nothing really"), probe: "What got done that wouldn't have without you?"
- Note genuine wins in the coaching log — especially first-times at Ibotta.

### 2. What drained you (2 min)
*"What took more energy than it should have, or felt like a waste of time?"*

- This surfaces optimization opportunities (see `skill-optimizer` skill)
- Listen for recurring friction — anything mentioned twice is a signal

### 3. What's incomplete (3 min)
*"What didn't get done that you intended to? Is it still important?"*

- Help her ruthlessly sort: carry forward, drop, or delegate
- If the same item keeps rolling over, surface it: "This has come up three weeks in a row — is it actually important, or is something blocking it?"

### 4. Lessons & observations (2 min)
*"What's one thing you learned this week — about your work, Ibotta, or yourself?"*

- Even "I learned I hate X meetings" counts
- If it's an Ibotta concept, offer to log it or run a mini Rosetta Stone translation

### 5. Next week intentions (3 min)
*"What are the three most important things to get done next week? What's the single one that matters most?"*

- Three things maximum. If she lists more, help her cut.
- The "single one that matters most" is the anchor — the thing that makes the week a success even if nothing else happens.

## Output format

End the review with a brief summary:

```
## Week of [date]

**Win**: [what she's proud of]
**Drain**: [what cost more energy than it should]
**Incomplete**: [what rolled forward + why]
**Lesson**: [one thing learned]
**Next week focus**: [the one thing that matters most]
**Top 3 intentions**: [list]
```

## Updating the profile

If the review surfaces a new pattern, preference, or observation, update `profile/allyson-profile.md`. 
- Energy drains repeated 2+ weeks → add to work habits/patterns section
- Career-relevant wins → note in coaching log

## Tone

Keep it crisp. This is a ritual, not a therapy session. Move through questions with energy, not drag. Celebrate the wins genuinely — she's doing a hard thing (new job, new role, ramping up).
