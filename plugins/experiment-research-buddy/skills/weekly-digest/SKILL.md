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
scannable in 2 minutes, with explicit callouts tying each item to the user's own company.

## Step 0 — Load delivery settings

Read the **Digest delivery** section of `${CLAUDE_PLUGIN_ROOT}/config/company-profile.md`
for the recipient, channels, cadence, and timezone. Also read the **Identity** and
**Metrics** sections so the "angle" lines below are about the user's actual business.

If the profile is missing, ask the user where to send the digest and offer the **setup**
skill. If it says `disabled`, generate the digest in the chat and do not send anything.

---

## Step 1: Gather what changed this week

Read `${CLAUDE_PLUGIN_ROOT}/knowledge-base/_INDEX.md` and scan the `added:` frontmatter dates across all entries
in `${CLAUDE_PLUGIN_ROOT}/knowledge-base/companies/`, `${CLAUDE_PLUGIN_ROOT}/knowledge-base/individuals/`, `${CLAUDE_PLUGIN_ROOT}/knowledge-base/papers/`,
and `${CLAUDE_PLUGIN_ROOT}/knowledge-base/articles/`.

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

**In plain English:** [1-2 sentences explaining what this is about as if talking
to a smart colleague who isn't a statistician. No jargon without explanation.
If a statistical concept is central, give it a one-sentence analogy or real-world
comparison. Example: "Think of it like checking your GPS after every turn instead
of only at your destination — you catch wrong turns earlier."]

**What they found:** [1-2 sentences on the specific result or method. Be concrete —
name the technique, the number, the surprise. Don't say "they found interesting results"
— say what the result actually was.]

**So what?** [1 sentence: why does this matter in practice? What would change about
how you run or interpret a test if you applied this?]

⚡ Your angle: [One sentence connecting this to the surfaces, metrics, and
business model in the company profile, or to the user's current work. Only
include if the connection is genuine — skip if it's a stretch.]
→ Full entry: knowledge-base/[subdir]/[filename].md

━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🔬 ALSO NOTABLE
[For each additional new/updated entry this week — max 3 bullets:]
• [Company/Person] — [Title]
  Plain English: [One sentence — what is this about, no jargon.]
  Interesting because: [One sentence — the specific finding or implication.]
  ⚡ Your angle: [One sentence, only if genuinely applicable — skip if not.]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━

💡 HOT TAKE OF THE WEEK
[One spicy, opinionated observation based on this week's reading.
Write it as if you're explaining it to the user over coffee — plain language,
no assumed knowledge, but treat them as smart. If the hot take involves a
statistical concept, use an analogy to make it land. Could be a contrarian view,
a surprising finding, a pattern across sources, or something worth raising in a
DS team meeting. 3-5 sentences. Be specific, not vague.]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📚 ADDED TO THE KB THIS WEEK
[N] new entries · [N] updated · [List filenames, one per line, with one-word type tag]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Experiment Research Buddy · kb-curator ran [Day Month Date] at [time, profile timezone]
```

### Composing guidelines

**Plain English rule:** Every entry in the digest must be readable by someone who
understands experimentation conceptually but doesn't live in statistics papers.
If you use a term like "variance reduction," "empirical Bayes," "censored data," or
"winner's curse," explain it in the same breath with an analogy or one-sentence
definition. Don't assume the reader will google it.

Good analogy pattern: "[Technical thing] is like [everyday thing] — [why the
comparison works in one clause]."
Examples:
- "Variance reduction (CUPED) is like noise-canceling headphones for your data —
  it filters out the background variation so the signal from your test comes through cleaner."
- "The winner's curse is like a job interview where only overconfident candidates
  apply — the ones who make it through look better on paper than they'll perform in practice."
- "Censored data just means some users haven't had enough time to churn yet — like
  grading a test before everyone's finished."

**Highlight of the Week:** Pick the single most interesting or envelope-pushing item.
Prioritize: novel methodology > surprising finding > useful tool > process improvement.
If there's an item clearly relevant to the user's company, it gets the highlight spot.

**Also Notable:** Max 3 bullets. Skip the angle line if it's a stretch.
Don't force it — only flag genuine connections.

**Hot Take:** This is the most important section for making the digest worth reading.
Don't summarize — opine. Use plain language. Make it sound like a real opinion, not
a hedge. Examples of good hot takes:
- "Everyone's building CUPAC but almost no one has enough pre-experiment data for
  the ML model to beat standard CUPED. It's like buying a sports car when you haven't
  learned to drive stick yet — master the basics first."
- "The Booking.com research quietly buries the idea that you can learn anything
  meaningful from a two-week experiment. Most of our tests are shorter than that.
  We might be making decisions from data that's more noise than signal."
- "Microsoft found that concurrent tests interfere with each other only 1 in 50,000
  times. Yet most teams — including ours — treat overlap like it's a fire hazard.
  We're paying a real cost in slower iteration for a risk that barely exists."

**KB summary:** Just filenames + type. No descriptions needed here.

---

## Step 3: Deliver

Send the composed digest:

1. **Slack DM** to the recipient named in the company profile's Digest delivery section.
   Use the Slack MCP tool. Send as a DM, not a channel post.

2. **Email** to the same recipient.
   Use the Gmail MCP tool to create a draft or send directly.
   Subject line: `🧪 Experiment Lab Weekly · [Month Day]`

If either delivery fails, output the full digest text to the session so it's not lost.

---

## On-demand usage

When the user invokes this skill manually (not via the automated routine):
- Ask: "Do you want this week's digest based on recent KB changes, or a digest on a
  specific topic?" 
- If topic-based: pull the most relevant KB entries by tag and compose a focused version
  of the digest format on that topic instead of time-based changes.
