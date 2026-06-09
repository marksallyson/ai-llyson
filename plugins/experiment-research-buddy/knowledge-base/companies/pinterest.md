---
title: Pinterest
type: company
tags: [attribution-window, causal-inference, delayed-conversion, interleaving, metric-design, personalization, ranking, right-censoring, user-lifecycle]
source_url: https://medium.com/pinterest-engineering
added: 2026-06-04
---

# Pinterest

## At a Glance
Pinterest's experimentation work is notable for two things: their use of interleaving for recommendation/ranking experiments, and their framework for handling delayed conversion measurement — critical for a platform where users "pin" content now and act on it much later.

## Why They Matter
Delayed conversion is Ibotta's problem too. A user may see an offer, save it mentally or in a list, and redeem it 2 weeks later at the store — well after the experiment window closes. Pinterest's framework for measuring delayed conversion and their approach to attribution windows directly maps to Ibotta's challenge of crediting an experiment with conversions that happen days after the first exposure. Their interleaving work is also directly applicable to offer feed ranking experiments.

## Key Contributions
- **Interleaving for recommendation ranking**: show each user a single list that interleaves results from algorithm A and B; measure relative preference via clicks/saves; far more sensitive than A/B at the same sample size
- **Delayed conversion measurement**: framework for setting attribution windows and measuring conversions that occur after experiment exposure; handles right-censored data
- **"Mediation analysis in recommendation systems"**: attributing conversion to the recommendation vs. organic intent
- **Metric frameworks for discovery products**: how to define "success" for a feed where the user's intent is exploratory rather than transactional
- **Experiment segmentation by user lifecycle stage**: new users, engaged users, and dormant users have different base rates and different response elasticities — Pinterest runs separate analyses by cohort

## Takeaways for Practice
1. **Define your attribution window before the experiment launches.** For Ibotta offer experiments, decide: are you attributing redemptions within 7 days of offer exposure, 14 days, or through offer expiry? A longer window captures more true conversions but introduces more noise from other factors. Document this choice and be consistent.
2. **Right-censoring matters for offer experiments.** If an experiment ends on day 14 and your attribution window is 7 days post-exposure, users exposed on day 14 have no time to convert. Trim the analysis to users who had a full attribution window, or model the censoring explicitly.
3. **Use interleaving if you're A/B testing two offer feed ranking algorithms.** Standard A/B splits 50/50 and needs a large sample to detect small ranking improvements. Interleaving uses within-user comparisons and needs 10-100x fewer users for the same power.
4. **Segment experiment results by user lifecycle stage.** New Ibotta users and highly engaged users will have very different response elasticities to offer changes. Reporting an aggregate ATE may obscure a large positive effect for new users offset by a null effect for engaged users.
5. **Pinterest's "discovery product" metric framework is relevant for Ibotta's offer discovery experience.** If the goal is to expose users to new offer categories, redemption rate is a poor primary metric — it penalizes discovery of new categories with lower base conversion rates. Define a metric that rewards category breadth.

## Action Items / Things to Read
- Pinterest Engineering Blog: medium.com/pinterest-engineering — search "experimentation" and "recommendations"
- "Lessons Learned from Running Thousands of A/B Tests" — Pinterest Engineering Blog
- Chapelle et al. (2012) "Large-Scale Validation and Analysis of Interleaved Search Evaluation" — foundational interleaving paper
- Pinterest's talk at RecSys or KDD on recommendation evaluation (search "Pinterest interleaving" on YouTube)

## Tags
attribution-window, causal-inference, delayed-conversion, interleaving, metric-design, personalization, ranking, right-censoring, user-lifecycle
