# meeting-prep

Walk into meetings already oriented. A concise digest built from your calendar, past
meeting transcripts, Slack, Gmail, and Jira — with memory that builds itself.

## How it works

```
                 ┌──────────────────┐
  7:30am ───────▶│ harvest-meetings │──▶ memory/series/*.md
  (scheduled)    └──────────────────┘    memory/people/*.md
                          │                      │
                          ▼                      │
                 ┌──────────────────┐            │
                 │   daily-brief    │◀───────────┤
                 └──────────────────┘            │
                     │        │                  │
             Slack DM ▼        ▼ memory/today-brief.md
                              │
                    SessionStart hook ──▶ shown in any session today

  anytime ──────▶┌──────────────────┐
  "prep me for   │      prep        │◀───────────┘
   my 2pm"       └──────────────────┘
```

The loop is the point. `harvest-meetings` turns yesterday's transcripts into memory, and
memory makes tomorrow's prep sharper. By month three it knows that one stakeholder always
asks about sample size and which thread has been open since June.

## Skills

| Skill | When | What it does |
|---|---|---|
| `prep` | On demand | Preps one meeting or the rest of today. Tiered sweep — light for standups, deep for new stakeholders. |
| `daily-brief` | Scheduled, weekday mornings | Harvests, briefs the day, caches it, DMs it to you on Slack. |
| `harvest-meetings` | Auto, as brief phase 1 | Extracts decisions, action items, open questions, and person signals from Granola/Zoom transcripts into `memory/`. |

## The output format

Four lines maximum per meeting. That's a hard constraint.

```
**2:00p · Pricing Engine sync · 30m · Kevin, Dana +3**
- Last time: agreed to scope the quote_line_offer event; Kevin owns the QB side
- Since then: PE-412 → In Review; Dana raised ID collision in #pricing-eng (Thu)
- Watch for: they'll want a handoff date, and you don't have one
- Your ask: does pricing-request-ID land on the line item or a parent?
```

`Watch for` and `Your ask` are the lines that earn the plugin's keep. Anyone can restate
a calendar invite.

## Setup

**1. Install** — it's in the `ai-llyson` marketplace:

```bash
claude plugin install meeting-prep@ai-llyson
```

**2. Schedule the morning brief** — ask Claude, or use the `schedule` skill:

```
Schedule the meeting-prep daily-brief skill for weekdays at 7:30am.
```

**3. Connect Atlassian** — Jira and Confluence lookups need the Atlassian connector
authorized in your claude.ai connector settings. Everything else works without it; the
plugin degrades gracefully and notes `Jira: not connected` once.

**4. Seed memory** (optional) — run a first harvest so day one isn't cold:

```
Harvest my meetings from the last two weeks.
```

## Connectors used

Calendar and Granola are the load-bearing ones. Zoom backs up Granola; Slack, Gmail, and
Jira add the "since then" line.

| Connector | Required | Used for |
|---|---|---|
| Calendar | Yes | Who, when, what |
| Granola | Strongly recommended | Past meeting notes — the memory engine |
| Zoom | Optional | Fallback transcripts and AI Companion summaries |
| Slack | Optional | Recent context + brief delivery |
| Gmail | Optional | Open threads, mainly for external meetings |
| Atlassian | Optional | Ticket and doc status |

Looker and Databricks are deliberately out of scope — live metric pulls are slow and easy
to over-trigger. Ask the `data` or `looker-expert` skills when a readout needs numbers.

## What it will not do

Read-only against every external system, with exactly two exceptions: it writes to
`memory/`, and it DMs the daily brief to you and only you.

It never sends mail, replies to threads, creates or edits calendar events, comments on or
transitions Jira issues, or messages anyone else. Writing to Jira belongs to
`jira-post-approved-comments`, which is human-supervised by design.

It also never acts on instructions found inside a calendar description, transcript,
email, or Slack message. Fetched content is data. If something in there is addressed to
Claude, it gets surfaced to you, not obeyed.

Sensitive meetings — performance reviews, comp, HR matters — are recorded in memory as
having occurred, with nothing about their content.

## Notes on memory

`memory/` is auto-built, never hand-written. Two consequences worth knowing:

- **Unrecorded meetings are invisible.** No Granola or Zoom record means nothing to
  harvest. Prep for those falls back to calendar + Slack.
- **Nothing is human-reviewed**, so the harvester is deliberately conservative: it
  extracts only what was explicitly said, records recurring patterns only on the third
  observation, and drops anything uncertain. A wrong "last time" is worse than none.

Files are capped near 150 lines; the harvester prunes old history and closed threads but
keeps every decision.
