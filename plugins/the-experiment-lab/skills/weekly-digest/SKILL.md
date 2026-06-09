---
name: weekly-digest
description: >
  Use this skill to generate or send the weekly experiment-lab digest. Triggers on
  "send the weekly digest", "what's new in the KB this week", "weekly update",
  "experiment lab digest", or when called by the automated weekly routine after
  kb-curator finishes. Composes a curated newsletter-style digest from KB changes
  made in the last 7 days and delivers it via Slack DM and Gmail.
metadata:
  version: "0.1.0"
---

# Weekly Digest Skill

## Purpose

After the kb-curator has scanned sources and written new/updated KB entries, this skill
composes and delivers the weekly digest. The digest is a curated newsletter — opinionated,
scannable in 2 minutes, with explicit Ibotta callouts.

**Recipient:** allyson.marks@ibotta.com  
**Delivery:** Slack DM + Gmail  
**Cadence:** Every Monday ~8am Denver time (automated), or on-demand

---

## Step 1: Gather what changed this week

Read `knowledge-base/_INDEX.md` and scan the `added:` frontmatter dates across all entries
in `knowledge-base/companies/`, `knowledge-base/individuals/`, `knowledge-base/papers/`,
and `knowledge-base/articles/`.

Identify:
- **New entries** added in the last 7 days (frontmatter `added:` date)
- **Updated entries** (look for `## Recent:` sections appended at the bottom of existing files)

If nothing changed this week (rare), send a brief "quiet week" digest — 1-2 interesting
evergreen picks from the KB instead.

---

## Step 2: Compose the digest

Use this exact format:

```
Subject: 🧪 Experiment Lab Weekly · [Month Day]

This week in experimentation — [N] things worth your attention.

━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📌 HIGHLIGHT OF THE WEEK
[Company or Person] — [Title of post/paper]

[2-3 sentences: what they found or built, why it's interesting or
envelope-pushing, what makes it worth reading over everything else
this week. Be specific — name the technique, the result, the surprise.]

⚡ Ibotta-relevant: [One sentence connecting this to offer testing,
incentive design, two-sided marketplace dynamics, or Allyson's current
work as a Decision Scientist at a promotions/cashback platform.]
→ Full entry: knowledge-base/[subdir]/[filename].md

━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🔬 ALSO NOTABLE
[For each additional new/updated entry this week — max 3 bullets:]
• [Company/Person] — [Title]: [One punchy sentence on what's interesting.]
  ⚡ Ibotta-relevant: [One sentence, only if genuinely applicable — skip if not]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━

💡 HOT TAKE OF THE WEEK
[One spicy, opinionated observation based on this week's reading.
Could be a contrarian view, a surprising finding, a pattern across
multiple sources, or something worth bringing up in a DS team meeting.
Write it in first person as if you're the one with the hot take.
2-4 sentences. Be specific, not vague.]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📚 ADDED TO THE KB THIS WEEK
[N] new entries · [N] updated · [List filenames, one per line, with one-word type tag]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Experiment Lab v0.1.0 · kb-curator ran [Day Month Date] at 8am Denver
```

### Composing guidelines

**Highlight of the Week:** Pick the single most interesting or envelope-pushing item.
Prioritize: novel methodology > surprising finding > useful tool > process improvement.
If there's a clear Ibotta-relevant item, that gets priority for the highlight spot.

**Also Notable:** Max 3 bullets. Skip Ibotta-relevant callout if it's a stretch.
Don't force it — only flag genuine connections.

**Hot Take:** This is the most important section for making the digest worth reading.
Don't summarize — opine. Examples of good hot takes:
- "Everyone's building CUPAC but almost no one has enough pre-experiment data for
  the ML model to beat standard CUPED. Worth checking your sample sizes before investing."
- "DoorDash's interleaving work is a reminder that A/B testing ranking algorithms is
  almost always the wrong call — and yet it's the default at most companies."
- "The Booking.com meta-experiments paper quietly buries the idea that you can learn
  anything meaningful from experiments under 2 weeks. Most Ibotta offer tests are shorter."

**KB summary:** Just filenames + type. No descriptions needed here — that's what the
entries themselves are for.

---

## Step 3: Deliver

Send the composed digest:

1. **Slack DM** to the user (search for allyson.marks@ibotta.com or Allyson Marks).
   Use the Slack MCP tool. Send as a DM, not a channel post.

2. **Gmail** to allyson.marks@ibotta.com.
   Use the Gmail MCP tool to create a draft or send directly.
   Subject line: `🧪 Experiment Lab Weekly · [Month Day]`

If either delivery fails, output the full digest text to the session so it's not lost.

---

## On-demand usage

When Allyson invokes this skill manually (not via the automated routine):
- Ask: "Do you want this week's digest based on recent KB changes, or a digest on a
  specific topic?" 
- If topic-based: pull the most relevant KB entries by tag and compose a focused version
  of the digest format on that topic instead of time-based changes.
