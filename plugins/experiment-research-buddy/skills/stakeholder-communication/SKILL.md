---
name: stakeholder-communication
description: >
  Use this skill when the user needs to communicate experiment results, proposals, or
  methodology to non-technical stakeholders — PMs, brand managers, leadership, or
  cross-functional partners. Trigger on: "how do I explain this to my PM", "leadership
  wants to stop the test early", "my stakeholder doesn't believe the result", "how do I
  present this", "the PM wants to see significance before we're done", "how do I push back
  on [bad request]", "write a readout", "make this accessible", "explain why we can't just
  look at the data", or any request to translate DS judgment into business language.
  Complements experiment-strategy (technical) with the communication layer on top.
metadata:
  version: "0.1.0"
---

# Stakeholder Communication

You are helping a Decision Scientist at Ibotta translate rigorous experiment thinking into
language that lands with non-technical stakeholders. The goal is never to dumb things down
— it is to find the framing that makes the right conclusion feel inevitable to someone who
doesn't think in p-values.

## Before Answering

Read `knowledge-base/individuals/rommil-santiago.md` — his *Prove It or Lose It* (2025)
is the best practitioner resource on this specific problem. Also read
`knowledge-base/articles/surprising-ab-test-results.md` — the Microsoft catalog of
experiments that contradicted expert intuition is the most powerful tool for pushing back
on premature conclusions.

---

## The Core Communication Challenges

### 1. "Can we stop the test early? It looks like it's working."

**What's actually happening:** The PM is peeking. The p-value isn't valid yet. Stopping
now inflates the false positive rate significantly.

**How to respond — don't say "no" without giving them something:**

> "I get the excitement — the early signal is encouraging. Here's the problem: stopping
> early because it looks good is actually one of the most common ways A/B tests produce
> results that don't hold up. The math only works if we wait for the pre-agreed sample
> size. Booking.com, LinkedIn, and Spotify all have 'always-valid' monitoring precisely
> because this pressure is universal — and even those systems require pre-committing to
> the stopping rule.
>
> What I can do: check whether the confidence interval already excludes zero at our
> pre-specified MDE. If it does, that's a legitimate early read. Let me pull that."

**Resources to share:** Evan Miller's "How Not To Run an A/B Test" — 500 words, no
equations, immediately convincing. Link: https://www.evanmiller.org/how-not-to-run-an-ab-test.html

---

### 2. "The test was negative — but I still believe in the feature."

**What's actually happening:** HiPPO effect (Highest Paid Person's Opinion). Confirmation
bias. Or the test was genuinely underpowered.

**Distinguish the two cases:**

*If the test was adequately powered:*
> "I know this is hard to hear. But this is exactly the situation where A/B tests earn
> their keep. Ron Kohavi's team at Microsoft found that roughly 1 in 3 ideas that experts
> believed would work showed neutral or negative results. The test didn't say your idea
> was bad — it said this specific implementation didn't move [metric] for this user
> segment. That's valuable. It narrows where to look next."

*If the test was underpowered:*
> "The test is genuinely inconclusive — the confidence interval is wide enough that a
> real effect could exist and we'd still see this result. We didn't prove it doesn't
> work; we just didn't have enough data to see it if it does. Here's what I'd recommend:
> [CUPED to reduce required sample size / extend test duration / reframe MDE]."

---

### 3. "We already know this will work — do we really need to test it?"

**What's actually happening:** Overconfidence. The right response references base rates.

> "The research on this is pretty humbling. At Microsoft — one of the most rigorous
> experimentation programs in the world — about a third of ideas that experienced teams
> were confident would work either did nothing or made things worse. Not because the teams
> were bad at their jobs. Because user behavior is genuinely hard to predict.
>
> The test doesn't slow us down — it protects us from shipping something that hurts
> retention while we think it's helping. A two-week test now is much cheaper than a
> rollback plus an investigation later."

---

### 4. "Different metrics are pointing in different directions — what do we do?"

**What's actually happening:** The pre-specified OEC moved; a secondary metric didn't,
or vice versa. Or a guardrail degraded.

> "This is actually the most important scenario to get right. Before we interpret any of
> these numbers, we need to go back to the pre-specified primary metric — [OEC name].
> That's the one we said we'd make the decision on before the test started.
>
> If [OEC] moved positively and [guardrail] degraded: we don't ship. That's a hard rule.
> We're trading short-term [engagement/conversion] for long-term [retention/revenue], and
> that's not a trade we want to make implicitly.
>
> If [OEC] is flat and [secondary metric] looks great: the secondary result is a
> hypothesis for the next test, not a reason to ship this one."

---

### 5. Writing a readout that a PM will actually read

**Structure that works:**

```
1. The question we were asking (one sentence)
2. What we found (one sentence — lead with the result, not the method)
3. What it means for the decision (ship / no-ship / iterate — one sentence)
4. The evidence (metric table — primary metric first, then guardrails)
5. What we learned (even from a null result — what does this tell us about users?)
6. What's next (follow-up hypothesis or recommendation)
```

**Rules for the readout:**
- Lead with the conclusion, not the methodology
- Primary metric first, guardrails second, secondary metrics last
- Confidence intervals > p-values for non-technical audiences ("we're 95% confident the
  effect is between +0.3% and +1.2%" lands better than "p = 0.03")
- Null results are not failures — frame them as learning ("we confirmed users in this
  segment don't respond to X, which tells us to focus on Y")
- One chart maximum per section; remove any chart that doesn't change the conclusion

---

### 6. Making the case for a methodological improvement (CUPED, sequential testing, etc.)

The key is translating statistical improvement into business terms:

**CUPED:**
> "We can run tests 30–40% faster — or detect effects that are 30–40% smaller —
> by using each user's behavior from before the test started to reduce noise.
> DoorDash implemented this and it's one of the primary reasons they scaled from
> ~20 experiments/month to hundreds. For Ibotta, the concrete impact is: tests
> that currently require 6 weeks could finish in 4."

**Sequential testing / mSPRT:**
> "Right now, if a PM checks results on day 5 of a 4-week test, that check itself
> inflates our false positive rate. mSPRT is a monitoring approach — used by LinkedIn,
> Booking.com, and Spotify — that makes daily monitoring mathematically valid. It
> doesn't change how we analyze results; it changes whether peeking at dashboards
> invalidates them. For Ibotta, the practical benefit is: PMs can see a live dashboard
> without us worrying they're poisoning the test."

**Bayesian (for small-N experiments):**
> "For experiments where we don't have enough users to reach traditional statistical
> significance — like the Walmart Relink test — Bayesian methods let us say 'there's
> a 73% probability the treatment is better' rather than 'we failed to reject the null.'
> It's not a magic solution for small samples, but it's a more honest communication of
> what we know. Spotify uses this specifically for their long-tail feature experiments
> where full power isn't achievable."

---

## Tone Calibration by Audience

| Audience | What They Care About | Language to Use | Language to Avoid |
|---|---|---|---|
| PM / Product | Speed, directional signal, what to ship | "We're confident", "the data shows", "here's the decision" | "p-value", "Type I error", "confidence interval" |
| Brand manager | ROI, incrementality, not wasting offer budget | "Incremental lift", "offer efficiency", "what drove the purchase" | "SUTVA", "OEC", "treatment effect" |
| Engineering | Correctness, reliability, edge cases | Technical precision is fine | Oversimplifying; they'll catch it |
| Leadership | Business impact, risk | Dollar amounts, user counts, strategic framing | Any number without business context |
| Data Science peer | Everything | Full technical precision | Oversimplifying |

---

## References

- `knowledge-base/individuals/rommil-santiago.md` — *Prove It or Lose It* (2025); stakeholder communication chapters
- `knowledge-base/articles/surprising-ab-test-results.md` — base rate argument for mandatory testing
- `knowledge-base/articles/how-not-to-run-an-ab-test.md` — shareable resource for the early-stopping conversation
- `knowledge-base/individuals/lukas-vermeer.md` — "education before tooling" principle at Booking.com
- `knowledge-base/individuals/aleksander-fabijan.md` — maturity model framing for organizational conversations

## Related Skills

- For the technical analysis underlying the communication: **experiment-strategy**
- For methodology improvement proposals: **statistical-methods**
- For Ibotta-specific process questions that come up: **ibotta-ab-process**
