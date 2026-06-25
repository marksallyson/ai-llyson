---
title: "The Whole Is Less Than the Sum of Its Parts: Rethinking How We Measure Experimental Impact"
type: article
tags: [concurrent-experiments, long-term-effects, bayesian, holdout, organizational-maturity, metric-design, winner-curse, eppo]
source_url: https://www.geteppo.com/blog/rethinking-measuring-experimental-impact
author: Sven Schmit (Head of Statistics Engineering, Eppo; former Stitch Fix; PhD Statistics, Stanford)
added: 2026-06-24
---

# The Whole Is Less Than the Sum of Its Parts

## At a Glance
Sven Schmit's 2025 analysis of why summing individual A/B test wins systematically overstates actual product impact — and what to do about it. Four mechanisms explain the gap: winner's curse, interaction effects, novelty decay, and selection bias. Proposed fixes: global holdouts or Bayesian shrinkage on individual estimates.

## Why It Matters
This is the analytical foundation for why individual experiment wins don't add up. If you've ever presented a "we shipped X experiments with average +Y% lift = total impact of Z%" narrative, this paper explains why that number is almost certainly wrong and by how much.

## The Four Mechanisms

**1. Winner's curse**
Only experiments that clear a significance threshold get shipped. But significance at a fixed threshold is noisy — experiments that barely cross the line are overestimates of the true effect. The true effect of a barely-significant result regresses toward zero when measured again. Summing only the winners systematically inflates the aggregate.

**2. Interaction effects**
Features shipped from separate experiments can interact. The combined effect of two features isn't necessarily the sum of their individual effects — it could be less (redundancy), more (synergy), or opposite (interference). Naively summing assumes independence that often doesn't hold post-ship.

**3. Novelty decay**
Experiment effect estimates are measured during the novelty window — when users are actively engaging with the new feature because it's new. After shipping, novelty fades. The steady-state effect is lower than the experiment estimate. Summing experiment effects sums the novelty-inflated estimates, not the long-run reality.

**4. Selection bias**
Teams don't run experiments randomly — they test things they believe will work. The selection process itself biases the distribution of effects upward. Experiments believed likely to fail often don't get run.

## Proposed Fixes

**Global holdouts (preferred):** Hold a slice of users out of all experiments permanently. Measure actual product trajectory vs. holdout at quarterly intervals. This directly measures collective impact without inference. Used at Netflix, Meta, and now Etsy.

**Bayesian shrinkage:** Apply empirical Bayes shrinkage to individual experiment estimates before summing — shrink each estimate toward zero based on the distribution of prior effects. This partially corrects winner's curse and noise amplification. More practical than a global holdout for teams that can't afford the holdout cost.

**Stricter thresholds and two-stage validation:** Raise the significance bar or require replication before treating an effect as real. Reduces winner's curse at the cost of slower iteration.

## Takeaways for Practice

1. **Never present a naively summed impact number to leadership.** "10 experiments × +1% = +10% better product" is almost certainly wrong. If you need to report aggregate impact, apply a discount factor or use a global holdout estimate.

2. **Bayesian shrinkage is implementable now without new infrastructure.** If Ibotta has a history of experiment effect sizes, you can fit an empirical prior and shrink current estimates toward it. This is the same principle as the Microsoft Bing Bayesian A/B paper already in the KB.

3. **Novelty decay is particularly relevant for UI changes.** Onboarding and home screen experiments at Ibotta are exactly the context where novelty-inflated estimates are most dangerous. A 2-week test on a UI change almost always captures novelty.

4. **The winner's curse is worst when tests are borderline significant.** A result at p = 0.048 is more likely to be overstated than p = 0.001. Flag borderline results explicitly in readouts.

5. **This paper is useful for managing expectations with leadership.** When a quarter's worth of shipped experiments doesn't show up in business metrics, this is why — and having the framework pre-emptively is better than explaining it after the fact.

## Related Reading
- `articles/etsy-collective-impact-experiments.md` — Etsy's global holdout implementation
- `knowledge-base/papers/objective-bayesian-ab-testing-deng.md` — empirical Bayes approach to shrinkage from Microsoft

## Tags
concurrent-experiments, long-term-effects, bayesian, holdout, organizational-maturity, metric-design, winner-curse, eppo
