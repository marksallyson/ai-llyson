---
title: Shopify
type: company
tags: [synthetic-control, quasi-experimental, two-sided-markets, causal-inference, marketplace]
source_url: https://shopify.engineering/
added: 2026-06-04
---

# Shopify

## At a Glance
Shopify's experimentation team has published on synthetic controls and quasi-experimental methods for merchant-level interventions — situations where you cannot randomize at the user level because the "user" is a merchant whose business would be disrupted by seeing different treatment arms.

## Why They Matter
Shopify's problem maps directly to Ibotta's brand/retailer experimentation challenge. When Ibotta tests a new offer structure or fee model with a brand partner, you can't randomize within the brand — the brand sees one treatment condition. The same is true for Shopify testing new merchant features: a merchant either gets the feature or doesn't. Shopify's synthetic control and interrupted time series approaches for this setting are directly applicable to Ibotta's brand- and retailer-level experiments.

## Key Contributions
- **Synthetic control for merchant experiments**: when randomization within a merchant cohort is infeasible, construct a synthetic control merchant from the weighted combination of comparable non-treated merchants
- **"Experimentation at Shopify: Causal Inference for Non-Randomized Interventions"** — Engineering Blog: documents when and how they use synthetic control vs. diff-in-diff vs. RCT
- **Interrupted time series analysis**: for policy changes that affect all merchants simultaneously (no control group), use pre/post time series with modeling
- **Quasi-experimental methods write-up**: one of the clearest practitioner guides to when each quasi-experimental method is appropriate
- **Platform-level vs. merchant-level experiment decomposition**: separate experiments on the Shopify platform from experiments on individual merchant stores

## Takeaways for Practice
1. **Use synthetic control for brand-level offer experiments at Ibotta.** If Brand X is testing a new offer structure, identify 3-5 comparable brands that aren't changing anything and construct a synthetic control Brand X. Compare Brand X's actual trajectory to the synthetic control.
2. **Interrupted time series is your tool when a policy change affects all brands simultaneously** — e.g., a fee structure change across all brand partners. Model the pre-change trend and extrapolate it as the counterfactual; the gap is your treatment effect.
3. **Shopify's write-up on "when to use each quasi-experimental method" is worth bookmarking** as a decision tool. The right method depends on sample size, treatment assignment mechanism, and data availability — not on what's familiar.
4. **Synthetic control validity depends on the "parallel trends" assumption before treatment.** For Ibotta brand experiments, this means the treated brand and your synthetic control should have parallel pre-treatment trajectories. If they diverge before treatment, the synthetic control is invalid.
5. **Document the method choice explicitly in every non-RCT analysis.** Shopify's blog posts are good examples of how to communicate quasi-experimental methods to non-technical stakeholders without losing the nuance.

## Action Items / Things to Read
- Shopify Engineering Blog: shopify.engineering — search "causal" and "experimentation"
- "Causal Inference for Non-Randomized Experiments" — Shopify Engineering Blog
- Abadie et al. (2010) "Synthetic Control Methods for Comparative Case Studies" — the foundational synthetic control paper
- "Difference-in-Differences with Multiple Time Periods" — Callaway & Sant'Anna (2021) — modern DiD for staggered adoption

## Tags
synthetic-control, quasi-experimental, two-sided-markets, causal-inference, marketplace, interrupted-time-series, difference-in-differences, brand-level
