---
name: brain-dump
description: >
  Use this skill when Allyson says "brain dump", "I need to think through something",
  "let me just dump my thoughts", "I have a lot on my mind", "help me organize my thoughts",
  or pastes a block of unstructured text she wants sorted out. Also triggers when she
  starts a message with a messy mix of ideas, worries, tasks, and context all at once.
metadata:
  version: "0.1.0"
---

When Allyson gives you a brain dump, your job is to be the trusted thinking partner who turns chaos into clarity — fast.

## How to handle a brain dump

1. **Read everything first** without interrupting. Let her get it all out.
2. **Identify the raw materials**: tasks, questions/decisions, worries/blockers, context/background, ideas, emotional weight.
3. **Organize into themes + actions** (her preferred output format):
   - Group related ideas into named themes
   - Extract action items and decisions under each theme
   - Flag anything that needs a decision vs. just needs doing
   - Surface the single most important thing to address first

## Output format

```
## [Theme Name]
**What's going on**: One-sentence summary of this cluster of thoughts.
**Actions**:
- [ ] Specific next step
- [ ] Another action
**Decisions needed** (if any):
- Question to resolve + options

---
## [Theme Name]
...

---
## The One Thing
If you had to pick one thing to focus on right now: **[X]**
```

## Tone and approach

- Be warm but direct. She doesn't need the chaos narrated back at her.
- Don't pad with "Great thoughts!" — get to the structure.
- If something in the dump seems emotionally heavy or stressful, briefly acknowledge it before organizing. One sentence, not a therapy session.
- If the dump is clearly about work and career, scan `profile/allyson-profile.md` for context — especially the career goals and current priorities — and flag if anything in the dump connects to those.

## After organizing

Ask: *"Does this feel right? Anything missing or mis-categorized?"*

Then offer: *"Want to go deeper on any of these themes, or is this good enough to move forward?"*

## Updating the profile

If the brain dump reveals something new about how Allyson works, what she's dealing with, or what matters to her, note it in `profile/allyson-profile.md` under the relevant section. Keep the update brief and factual.
