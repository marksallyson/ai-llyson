# Voice log

Append-only. One entry per `confident-voice` run, newest at the top.
Never rewrite past entries — the trend is the whole point.

Counts are per-100-messages-scanned, not raw totals, so a busy Slack week
doesn't look like a regression.

## Entry format

```
## YYYY-MM-DD (window: YYYY-MM-DD → YYYY-MM-DD)
- scanned: N Slack messages, M meetings
- rate: X.X flags per 100 messages  (prev: Y.Y)
- top pattern: <category> (N)
- second: <category> (N)
- confident moves: N
- note: <one line — what changed, or what to watch>
```

---

*(no entries yet — the first run establishes the baseline)*
