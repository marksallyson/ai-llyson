---
title: Lyft
type: company
tags: [causal-inference, difference-in-differences, holdout, interference, long-term-effects, marketplace, quasi-experimental, two-sided-markets]
source_url: https://eng.lyft.com/tagged/experimentation
added: 2026-06-04
---

# Lyft

## At a Glance
Lyft's experimentation team has published important work on two-sided market interference, long-term holdout experiments, and quasi-experimental methods — particularly relevant for when RCT is infeasible in a marketplace context.

## Why They Matter
Lyft's published papers address a problem Ibotta faces acutely: how do you measure long-term behavioral effects (e.g., 6-month retention) when your experiment only runs for 2 weeks? And how do you measure effects in a two-sided market where treatment affects both sides? Their long-term holdout framework and quasi-experimental methods are directly actionable, and their two-sided market paper is one of the clearer treatments of marketplace interference in the practitioner literature.

## Key Contributions
- **"The Challenges of Online Controlled Experiments in Two-Sided Marketplace Platforms"** (Lyft/KDD 2018): documents interference patterns specific to ride-sharing and proposes design alternatives
- **Long-term holdout experiments**: maintain a never-treated user cohort over months to measure cumulative treatment effects; separates short-term novelty effects from durable behavior change
- **Quasi-experimental methods**: difference-in-differences, interrupted time series, regression discontinuity applied to situations where RCT is not feasible
- **Variance reduction via machine learning covariates**: extended CUPED-style adjustment using richer feature sets than simple pre-period means
- **"Quasi-experimental causal inference for product analytics"** — Lyft Engineering Blog: practical guide to when and how to use observational methods

## Takeaways for Practice
1. **If Ibotta runs a 2-week experiment on a feature that's supposed to drive 90-day retention, the 2-week result is measuring novelty, not retention.** Lyft's long-term holdout design is the solution: keep 1-2% of users in a permanent holdout and compare them to treatment cohorts at 30, 60, 90, 180 days.
2. **Lyft's two-sided market paper is required reading before designing any Ibotta experiment that changes offer inventory or brand budget allocation.** It formalizes the conditions under which user-level randomization fails.
3. **Difference-in-differences is your go-to when a brand wants to test a new offer structure on one retailer but not others.** Use the other retailers as a control group; document parallel trends assumption; report sensitivity analysis.
4. **Quasi-experimental methods are not inferior to RCTs — they're the right tool for the right situation.** Lyft's blog post on this is a good reference for stakeholders who push back on "why didn't you run an A/B test?"
5. **When variance reduction via linear covariates plateaus, try ML-based covariate adjustment.** Lyft's work on this is a good starting point for Ibotta users with complex behavioral histories that aren't well-captured by a linear model.

## Action Items / Things to Read
- Lyft Engineering Blog: eng.lyft.com — search "experimentation" and "causal"
- "Quasi-experimental Causal Inference for Product Analytics" — Lyft Engineering Blog
- Holtz et al. (2020) "Interdependence and the Cost of Uncoordinated Responses in Online Experiments" — Lyft + Berkeley paper
- "The Challenges of Online Controlled Experiments in Two-Sided Marketplace Platforms" — search on Google Scholar

## Tags
causal-inference, difference-in-differences, holdout, interference, long-term-effects, marketplace, quasi-experimental, two-sided-markets
