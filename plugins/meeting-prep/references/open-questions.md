# The open-questions ledger

`~/.claude/meeting-prep/OPEN-QUESTIONS.md` is the plugin's most actionable artifact. It
is the running answer to "what am I waiting on, and what is someone waiting on me for?"

Series files hold open threads per meeting. The ledger cuts across meetings, which is
what makes it usable — a question raised in a 1:1 gets answered in a different meeting
three days later, and only the ledger sees both.

## Three buckets

### `## Waiting on others`
Questions she asked, or that were assigned to someone else, where she needs the answer
to move. **These become `Ask:` lines in prep** whenever that person is in the room.

```
- **Josh** — is prediction-override tracking required for V1, or can it wait? · asked 2026-09-25 · CD Business Events
```

### `## They're waiting on me`
Questions aimed at her that she hasn't answered. **These become `Be ready for:` lines.**
Record who asked and where, so prep can pair it with an answer.

```
- **Marc** — what's the business value of the correlation work? · asked 2026-09-25 · cross-system ID Slack thread
```

### `## Unowned`
Real open design questions with no named owner. These are the ones that quietly stall a
project. Surface them when the right group is assembled — an unowned question with the
right five people in the room is prep's best `Ask:` line.

```
- Generic `PredictionGenerated` vs service-specific per source? · raised 2026-09-22 · CD Business Events
```

## Line format

```
- [**Owner** — ]<question as she would say it out loud> · <asked|raised> YYYY-MM-DD · <where>
```

Optionally append ` · due YYYY-MM-DD` when someone committed to a date, and
` · ANSWERED: <one line>` on the run that closes it.

## Maintenance rules

- **Delete answered questions.** Do not mark them done and leave them. A ledger of
  resolved items is the main way this file becomes unreadable and then ignored.
  Exception: keep an item one extra run with `ANSWERED:` if the answer is something
  she'll want to cite, then drop it.
- **Age matters.** Prep flags anything past 7 days, and anything past a stated due date.
  That's the chase-it-in-the-room signal.
- **No duplicates.** Before adding, check whether the same question already exists under
  a different wording. Merge rather than append.
- **Cap at 25 items.** Over that, drop the oldest `Unowned` entries — if nobody has
  picked them up in a month, they were not real blockers.
- Phrase every entry as a question she could ask out loud. "UDM mapping" is a topic;
  "does the UDM skeleton ID map to anything today?" is a question.

## Who writes it

`harvest-meetings` maintains it — adds new questions from transcripts, deletes ones the
transcripts show answered, and moves items between buckets when ownership changes.
`prep` and `daily-brief` read it and never write to it, except to delete an item a
source clearly shows resolved.
