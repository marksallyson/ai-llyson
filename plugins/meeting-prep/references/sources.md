# Source connectors and how to resolve them

## Critical: never hardcode MCP tool names

Allyson's connectors are exposed with **session-specific UUID prefixes**, e.g.
`mcp__59d56de3-d972-442b-8a5b-eb31108518dc__list_events`. Those UUIDs are not
stable across sessions or machines. A skill that hardcodes one will silently
stop finding its tools.

**Always resolve by capability at runtime.** Look through the available tools
for one whose suffix matches the function you need — `list_events`,
`get_meeting_transcript`, `slack_search_public`, `search_threads`,
`searchJiraIssuesUsingJql`. If several match, prefer the one whose server also
exposes the sibling tools you'd expect.

If a needed capability is absent, say so in one line and continue with what's
available. Never block a whole prep on one missing source.

## The sources, in priority order

### 1. Calendar — the spine (required)
Capabilities: `list_events`, `get_event`, `search_events`, `list_calendars`

Always start here. Everything else keys off the attendee list, title, time, and
description. Pull the event `description` and any attachments — invites often
carry the agenda or a linked doc that makes the rest of the sweep unnecessary.

### 2. Granola — past meeting notes (highest-value context)
Capabilities: `query_granola_meetings`, `list_meetings`, `get_meeting_transcript`,
`get_meetings`, `list_meeting_folders`

Match the previous instance of a recurring meeting by title similarity **and**
attendee overlap, not title alone — titles drift ("Weekly sync" → "DSP sync").
Prefer the most recent instance with ≥2 shared attendees.

Transcripts are long. Do not read a full transcript into a prep. Extract only:
decisions made, action items with owners, open questions, and anything left
explicitly unresolved.

### 3. Zoom — recordings and AI Companion summaries
Capabilities: `search_meetings`, `recordings_list`, `get_recording_resource`,
`get_meeting_assets`, `my_notes_get_note_content`

Use as the fallback when Granola has no record. AI Companion summaries are
already condensed — cheaper than a raw transcript, prefer them.

### 4. Slack — what's been said recently
Capabilities: `slack_search_public_and_private`, `slack_search_public`,
`slack_read_channel`, `slack_read_thread`, `slack_search_users`,
`slack_read_user_profile`

Scope searches tightly: last 7 days, and either (a) messages from the meeting's
attendees, or (b) messages mentioning the project keyword. An unscoped search
returns noise that will blow the four-line budget.

`slack_read_user_profile` is useful for first-time meetings with someone
new — role and team, nothing more.

### 5. Gmail — open threads with attendees
Capabilities: `search_threads`, `get_thread`, `get_message`

Search threads involving the attendees from the last 14 days. Relevant mainly
for external and cross-functional meetings; internal work usually lives in
Slack. Read thread subjects and the latest message only — don't walk full
histories.

**Read-only. This plugin never sends, replies to, forwards, drafts, labels,
trashes, or otherwise modifies mail.**

### 6. Jira / Confluence — ticket and doc status
Capabilities: `searchJiraIssuesUsingJql`, `getJiraIssue`, `getConfluencePage`,
`searchConfluenceUsingCql`

**Requires authorization.** The Atlassian connector needs to be connected in
Allyson's claude.ai connector settings before these tools work. If the calls
fail with an auth error, note it once — `Jira: not connected` — and move on.
Do not retry in a loop, and never ask her for a token or auth code.

Useful JQL patterns once connected:

```
project = DSP AND updated >= -7d AND assignee = currentUser()
project = DSP AND key IN (PE-412, PE-418)
```

Pull ticket keys out of the meeting title, description, and the previous
instance's notes, then look up just those.

Read-only: never transition, comment on, or edit an issue from this plugin.
Writing to Jira belongs to the `jira-post-approved-comments` skill, which is
human-supervised by design.

## What this plugin deliberately does not touch

- **Looker / Databricks.** Allyson excluded live metric pulls — they're slow and
  easy to over-trigger. If a meeting is a readout and she wants numbers, she'll
  ask, and the `looker-expert` / `data` skills already cover it.
- **Any write to an external system**, with the single exception of the
  self-DM described in `daily-brief`.
