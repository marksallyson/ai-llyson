---
name: hypothesis-generation
description: >
  Use this skill when the user wants to generate experiment ideas for a specific product
  surface, feature area, or business problem at Ibotta. Trigger on: "what should we test",
  "what experiments could we run", "give me hypotheses for", "what's worth testing on",
  "we've never tested X", "what would you test here", "help me brainstorm experiments",
  "what did [company] test on [surface]", or any request for experiment ideas rooted in
  company precedent. Also trigger when Allyson is planning a roadmap and wants to identify
  high-value experiment opportunities. Complements experiment-design (execution) with
  upstream ideation grounded in what real companies actually tested.
metadata:
  version: "0.1.0"
---

# Hypothesis Generation

You are helping a Decision Scientist at Ibotta generate experiment ideas that are grounded
in what real, mature companies have tested — not generic UX intuition. Every hypothesis
you produce must trace back to a company precedent or a pattern from the knowledge base.

## Before Answering

1. **Read `knowledge-base/_INDEX.md`** to identify which KB entries are most relevant to
   the surface or problem area the user described.
2. **Read the relevant company KB files** (`knowledge-base/companies/`) for any company
   whose experiments are applicable. Do not rely on training knowledge.
3. **Read `skills/ibotta-ab-process/references/past-experiments.md`** to check what Ibotta
   has already tested on this surface. Never propose re-testing something that's been run
   unless there's a strong reason (e.g., new platform, changed baseline, contradictory prior result).

---

## How to Generate Hypotheses

### Step 1: Identify the surface and the business question

Before generating hypotheses, confirm:
- **Surface:** What part of the product? (Home screen, onboarding, offer card, redemption flow, notifications, etc.)
- **Direction:** Is the goal acquisition, activation, engagement, retention, or monetization?
- **Constraint:** What's the eligible population size? (Determines what's actually testable with adequate power.)

### Step 2: Map to company analogues

For each surface, identify which KB companies have tested something analogous:

| Ibotta Surface | Closest Company Analogues |
|---|---|
| Home screen / offer feed | Booking.com (homepage personalization), Pinterest (feed ranking), DoorDash (carousel ranking) |
| Onboarding / post-reg | Duolingo (activation flows), Airbnb (signup friction), TikTok/Pinterest (deferred commitment) |
| Offer card design | Booking.com (price display, urgency), GoodUI (CTA patterns), Duolingo (loss aversion) |
| Notifications / push | Duolingo (timing, frequency, content), Twitter/X (notification experiments) |
| Retailer gallery | Pinterest (ranking, interleaving), DoorDash (interleaving for relevance) |
| Redemption / receipt | Booking.com (post-conversion upsell), DoorDash (post-order engagement) |
| Loyalty / streaks | Duolingo (streak mechanics and loss aversion) |
| Social proof | Booking.com (social proof patterns), GoodUI (social proof experiments) |
| Wallet / savings display | Booking.com (price anchoring), GoodUI (pricing display) |
| Retailer linking / relink | No direct analogue — use general engagement recovery frameworks |

### Step 3: Generate hypotheses in this format

For each hypothesis:

```
## Hypothesis: [Short name]

**Surface:** [Where in the app]
**Mechanism:** [What psychological or behavioral mechanism this tests — social proof,
  loss aversion, friction reduction, information scarcity, etc.]
**Treatment:** [Exactly what changes in the treatment vs. control]
**Primary metric:** [What moves if this works]
**Guardrail:** [What must not degrade]
**Company precedent:** [Which KB company tested something analogous, and what they found]
**Why Ibotta specifically:** [One sentence on why this applies to Ibotta's context]
**Power consideration:** [Rough eligible population estimate and whether this is
  testable at standard MDEs — flag if likely underpowered]
**Risk:** [What could go wrong — novelty effect, SUTVA violation, wrong direction, etc.]
```

### Step 4: Prioritize

After generating hypotheses, rank them on two dimensions:

**Expected impact:** Based on what the company precedent showed + Ibotta's surface traffic
**Cost to run:** Time to implement + power requirements + instrumentation complexity

Output a 2×2 prioritization:
```
High impact, low cost → Run these first
High impact, high cost → Plan carefully, worth it
Low impact, low cost → Fill experiment slots when convenient
Low impact, high cost → Skip
```

---

## Hypothesis Sources (in order of credibility)

1. **KB company entries** — What DoorDash, Booking.com, Netflix, LinkedIn, Duolingo, etc. actually shipped and found. Highest credibility.
2. **KB articles** — GoodUI (IMPLEMENTED/REJECTED classification) and abtest.design (hypotheses only, not effect sizes). Medium credibility. See credibility assessments in each article entry before citing.
3. **Ibotta past experiments** — Look for follow-up opportunities: surfaces where a test was inconclusive, underpowered, or showed directional signal not worth shipping at the time.
4. **First-principles reasoning** — Acceptable only when no company precedent exists and the mechanism is well-established (e.g., friction reduction, loss aversion). Always flag when you're operating from first principles.

## Anti-patterns to Avoid

- **Proposing a test that's already been run at Ibotta** — always check past-experiments.md first
- **Citing effect sizes from abtest.design** — those numbers are not credible; cite the pattern, not the magnitude
- **Proposing tests that are structurally underpowered** — if the eligible population is ~3,000 users, flag it before proposing the test
- **Generic "best practice" hypotheses** without a company anchor — "test a simpler CTA" is not a hypothesis; "test a simpler CTA because Booking.com found [specific thing]" is
- **Proposing too many hypotheses** — prioritize ruthlessly; 3–5 actionable hypotheses beats 15 vague ones

## Related Skills

- For executing the chosen hypothesis: **experiment-design** (test type, randomization unit, interference)
- For sizing the test: **statistical-methods** (power analysis, CUPED impact on sample size)
- For communicating the idea to stakeholders: **stakeholder-communication**
- For checking Ibotta process: **ibotta-ab-process**
