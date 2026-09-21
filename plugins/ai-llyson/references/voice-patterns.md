# Voice patterns — what to flag, what to leave alone

Shared reference for the `confident-voice` (retrospective) and `say-it-straight`
(pre-send) skills. Read this before flagging or rewriting anything.

## The one rule that governs everything here

**Hedge the claim, never the claimant.**

Allyson is a Decision Scientist. Uncertainty about *findings* is her job done
well — "the CI is wide, so I'd treat this as directional" is rigor, and it is a
credibility asset. Uncertainty about *her standing to speak* is the thing to cut.

| Statement | Verdict |
|---|---|
| "The lift is +2.1% but the window is short — I'd call it directional." | **Keep.** Calibrated. This is good science. |
| "I could be wrong, but I think the lift is maybe around 2%?" | **Flag.** Same uncertainty, relocated onto her. |

If you can't tell which one you're looking at, ask: *is the doubt about the data,
or about her?* Only the second one gets flagged. When still unsure, leave it —
a false positive here teaches her to distrust her own good instincts.

---

## Flag these (self-undermining)

### 1. Pre-apology / permission-seeking
"Sorry to bother you", "sorry for the dumb question", "if you have a sec",
"I hate to ask", "no rush at all but".

**Cost:** frames her time as worth less than the reader's, before the ask lands.

**Fix:** delete it, or convert to a direct, time-bounded ask.
- "Sorry to bug you — when you get a chance, could you look at the holdout config?"
- → "Could you check the holdout config before Thursday's launch?"

### 2. Self-deprecation about competence — *the imposter-syndrome core*
"Dumb question", "this might be obvious", "I'm probably missing something",
"I'm still new here so", "this is probably wrong but", "I might be way off".

**Cost:** it tells the reader to discount everything after it. It also quietly
recruits other people into a story about her that isn't true — say "I'm still
new" often enough and it becomes the thing they remember about her at
calibration.

**Fix:** state what she *does* know, then ask the specific question.
- "Dumb question, but is the holdout 5%?"
- → "Let me check my read — I'm seeing the holdout at 5%. Is that right?"
- "I'm probably missing something obvious, but why are we excluding iOS?"
- → "What's the reason for excluding iOS? I want to make sure I'm not
    missing a constraint."

Note the second one keeps the humility (*she's asking*) but drops the
self-diagnosis (*something's wrong with her for asking*).

### 3. Ownership hedges on her own analysis
"I think maybe", "it kind of looks like", "just my two cents", "this is just
my read", "FWIW", "take this with a grain of salt".

**Cost:** she did the work. The hedge hands the conclusion's authority to
whoever reads it, and they will usually take it.

**Fix:** state the finding, then state the real limitation separately.
- "I think maybe redemption is kind of trending down?"
- → "Redemption is down 3% over the last two weeks. Small sample, so I'd
    confirm before acting on it."

### 4. Diminishers
"Just", "only", "a quick thing", "a small note", "a tiny question".

**Cost:** "just" is the single highest-frequency offender and is almost always
deletable with zero loss. "I just ran a quick regression" is doing real work
while describing it as nothing.

**Fix:** delete the word. Read it back. It's fine.

### 5. Validation-seeking tags
"...right?", "does that make sense?", "if that makes sense", "hopefully that's
clear?", "let me know if I'm off base".

**Cost:** asks for approval on something she already knows. Different from
genuinely inviting critique (see below) — the tell is whether she'd change her
mind based on the answer.

**Fix:** if she wants input, ask for it specifically. If she doesn't, stop.
- "So we'd launch Monday. Does that make sense?"
- → "So we'd launch Monday. Anything on your side that would block that?"

### 6. Over-qualified asks
"Whenever you get a chance, totally fine if not, no pressure, only if you have
time."

**Cost:** an ask this easy to ignore *will* be ignored, and then she has to
follow up — which costs everyone more time than the direct version would have.

**Fix:** one deadline, stated once.

### 7. Credit deflection
"It was really a team effort" (when it wasn't), "the data kind of showed
itself", "I just pulled the numbers", "Eric did most of the thinking".

**Cost:** this one compounds. There's no attribution trail at promo time, and
Allyson is explicitly working toward Senior DS. Deflected credit doesn't get
re-attributed later.

**Fix:** name her contribution factually, then share credit honestly on top.
- "Oh, I just pulled the numbers."
- → "I built the analysis; Eric helped me pressure-test the assumptions."

---

## Leave these alone (not hedging)

Flagging these would make her worse at her job, not better.

- **Calibrated uncertainty about findings.** "Directional", "underpowered",
  "confounded", "I'd want another week of data." Rigor. Never flag.
- **Genuine invitations to critique.** "Curious what you think", "push back on
  this if you see it differently." She's soliciting real input from someone
  with information she lacks. That's senior behavior, not weakness.
- **Ordinary warmth.** "Thanks for turning this around so fast", "hope the trip
  was good." Being pleasant is not being small.
- **Real deference on scope.** Checking before committing someone else's time
  or making a call that isn't hers is correct.
- **Softening genuinely delicate news.** Telling a PM their feature lost
  requires care. Care is not hedging.

---

## Spoken patterns (Granola / Zoom transcripts)

Meetings surface different tells than Slack does:

- **Permission to speak:** "Can I just jump in", "sorry to interrupt",
  "sorry, go ahead" when she was already talking.
- **Mid-sentence retraction:** landing a point and then walking it back —
  "...or maybe not, I don't know."
- **Qualifier stacking before a recommendation** — three hedges in the run-up
  to the actual sentence.
- **Deferring a question she can answer** — "Eric probably knows better" about
  her own analysis.
- **Hedging by disappearance:** she made a point, got talked over, and never
  came back to it. This is the highest-cost pattern in the whole file and the
  easiest to miss, because there's nothing in the transcript to quote — look
  for her thread going unanswered and then unrepeated.

Transcripts are noisy. Verbal filler ("um", "like", "you know") is **not** on
this list — it's how everyone talks out loud, cutting it is a speech-coaching
project, not a confidence one, and flagging it will just make her self-conscious
in meetings. Skip it entirely.

---

## Rewriting principles

1. **Delete before you replace.** Most hedges just come out. A replacement
   phrase that's as long as the hedge hasn't fixed anything.
2. **Keep the uncertainty, move it to the claim.** Never trade accuracy for
   confidence — that's a worse failure than hedging.
3. **Front-load the ask.** The question goes first; context follows.
4. **Shorter reads more senior.** Length itself is often the hedge.
5. **It has to sound like her.** A rewrite she'd never actually send is a
   rewrite that changes nothing. Warm and direct is the target — not clipped,
   not corporate, not aggressive. If a rewrite reads colder than she is,
   it's wrong.
6. **Preserve one warm beat** in anything longer than two lines. Cutting hedges
   should not cut friendliness; those are different edits.
