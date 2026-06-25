---
title: "Understanding the Collective Impact of Experiments"
type: article
tags: [concurrent-experiments, holdout, long-term-effects, organizational-maturity, platform, metric-design, etsy]
source_url: https://www.etsy.com/codeascraft/understanding-the-collective-impact-of-experiments
author: Etsy Code as Craft
added: 2026-06-24
---

# Understanding the Collective Impact of Experiments

## At a Glance
Etsy's 2025 method for measuring whether the sum of individual experiment wins actually adds up to real product improvement. Their approach: hold a slice of traffic out of every experiment for a full quarter, then compare where that holdout group ended up vs. the fully-treated group. The finding that motivated this: the sum of individual wins is not the collective effect.

## Why It Matters
Most experimentation programs measure success one test at a time. Individual tests ship. Individual wins accumulate. But nobody checks whether the product actually got better by the amount those wins predicted. Etsy's method is one of the few rigorous ways to answer: "did all these experiments actually move the needle together, or were we fooling ourselves?"

This is the complement to the Microsoft/Statsig work on interaction effects. Those papers ask "do concurrent tests interfere with each other?" Etsy asks "even if they don't interfere, does the sum of wins reflect reality?"

## Methodology
Hold a persistent slice of traffic (a global holdout) out of every experiment running during a quarter. This group sees no experimental treatments — they're the counterfactual for the entire product trajectory.

At the end of the quarter, compare:
- **Holdout group:** where users ended up with no experimental changes
- **Fully treated group:** where users ended up after all experiments shipped

The difference is the true collective impact. Compare this to the sum of individual experiment effects to see if they match.

## Key Finding
The sum of individual experiment wins overstates actual collective impact. The reasons include: winner's curse inflation on individual estimates, interaction effects between shipped features, novelty decay after shipping, and selection bias in which tests reach significance.

## Takeaways for Practice

1. **Individual wins don't guarantee portfolio-level improvement.** Shipping 10 experiments that each showed +1% lift does not mean the product is 10% better. Etsy's method is the only way to actually verify this.

2. **A global holdout is expensive but uniquely valuable.** The cost: a slice of users permanently withheld from new features. The value: the only ground-truth answer to "is our experimentation program actually working?" Most companies don't run one. The ones that do (Netflix, Facebook, Etsy) consistently find the collective effect is smaller than the sum of wins.

3. **Quarterly cadence is the right measurement window.** Short enough that the holdout doesn't age badly; long enough that enough experiments ship to measure meaningful cumulative impact.

4. **This is a program-health metric, not an experiment metric.** It doesn't tell you which test was wrong — it tells you whether your testing program is calibrated. If collective impact is 60% of summed wins, you have a systematic overestimation problem worth diagnosing.

5. **For Ibotta:** A formal global holdout is probably premature (Walk-stage programs typically don't have enough concurrent experiments to make it meaningful). But the conceptual lesson applies now: be skeptical of naively summing experiment wins when reporting program impact to leadership.

## Related Reading
- `articles/eppo-rethinking-experimental-impact.md` — Sven Schmit's analysis of why summing wins overstates impact, with proposed fixes
- `knowledge-base/individuals/aleksander-fabijan.md` — maturity model context for when global holdouts make sense

## Tags
concurrent-experiments, holdout, long-term-effects, organizational-maturity, platform, metric-design, etsy
