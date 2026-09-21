---
title: Martin Tingley + Netflix Team
type: individual
tags: [binary-outcomes, causal-inference, glm, long-term-effects, modular-inference, netflix, platform, surrogate-metrics, variance-reduction]
source_url: https://netflixtechblog.com/
added: 2026-06-04
---

# Martin Tingley + Netflix Experimentation Team

## At a Glance
Martin Tingley is a research scientist at Netflix who leads much of the causal inference and experimentation methodology work. He and the broader Netflix experimentation team (Wenjing Zheng, Mike Lindon, and others) have published extensively on computational causal inference, GLM-based variance reduction, and modular experiment infrastructure.

## Why They Matter
Netflix's team publishes some of the most technically sophisticated practitioner content in the field, at a level that bridges academic causal inference and production systems. Tingley's work on GLM-based variance reduction is directly applicable to Ibotta because Ibotta's primary outcomes (did the user redeem?) are binary — standard CUPED assumes a continuous outcome, which is wrong. His work shows how to do variance reduction correctly for binary and count outcomes. The modular inference infrastructure papers are also a useful reference for any team building or evaluating an experimentation platform.

## Key Contributions
- **GLM-based variance reduction**: extends CUPED and other covariate adjustment methods to generalized linear models (logistic regression for binary outcomes, Poisson for counts); shows larger efficiency gains than OLS-based CUPED for non-continuous outcomes
- **"Computational Causal Inference at Netflix"** (Netflix Tech Blog, 2021): describes the full causal inference stack from logging to estimator selection to reporting
- **Modular inference models**: decouple experiment assignment from statistical analysis; allows different estimators to be applied to the same logged data post-hoc without re-running the experiment
- **Causal inference for personalization**: work on measuring treatment effects in a personalized system where the personalization algorithm itself is being tested
- **"Online A/B Testing, Calibration, and Decision Making"** — Netflix Tech Blog: documents how Netflix frames experiment decisions, not just analysis
- **Collaboration with academic causal inference community**: Tingley's work bridges the gap between academic potential outcomes framework and production experiments

## Takeaways for Practice
- **Read the GLM-based variance reduction paper before implementing CUPED for Ibotta's redemption rate experiments.** The standard CUPED derivation assumes a continuous outcome and OLS. For binary redemption (0/1), logistic regression-based covariate adjustment (ANCOVA/regression adjustment) is more efficient. The difference matters in small samples.
- **"Computational Causal Inference at Netflix" is worth reading end-to-end** as a model for what a mature causal inference stack looks like. It's written for practitioners and is unusually honest about implementation complexity.
- **The modular inference architecture — log assignment and exposure separately; apply estimator post-hoc — is the right design for Ibotta's long-run experiment logging infrastructure.** Implementing this now means you can apply better estimators later without retroactively re-analyzing old experiments.
- **Tingley's work on personalization × experimentation interaction is relevant** if Ibotta's offer ranking algorithm is personalized. If the algorithm is changing (or being tested), you need to be explicit about whether you're measuring the algorithm's ATE or the interaction of the algorithm × a specific feature.
- **Follow the Netflix Tech Blog for methodology posts** — filter for posts on experimentation and causal inference; they publish 3-5 per year at high quality.

## Action Items / Things to Read
- "Computational Causal Inference at Netflix" — Netflix Tech Blog, December 2021
- Netflix Tech Blog: netflixtechblog.com — search "causal" and "experimentation"
- Lindon & Tingley papers on arXiv — search "Netflix causal inference"
- "Improving Online Experiment Capacity by 4X with Parallelization and Increased Sensitivity" — Netflix Tech Blog

## Tags
binary-outcomes, causal-inference, glm, long-term-effects, modular-inference, netflix, platform, surrogate-metrics, variance-reduction

---

## Recent: 2026-08-11 — Evaluating for the Long Term: Learnings from Industry

**Source:** arXiv:2608.08043, August 2026 · https://arxiv.org/abs/2608.08043  
**Co-authors:** 25 additional co-authors from Netflix, Meta, Airbnb, Google, Booking.com, Statsig, Uber, Lyft, Pinterest, UC Berkeley, MIT CSAIL, and others

**What they found:** Tingley co-authored this cross-industry workshop paper synthesizing consensus knowledge on the long-term evaluation problem. His role is one of the Netflix practitioners anchoring the empirical propositions to Netflix's actual long-run holdout experiment portfolio. Key findings: sign reversals rare; autosurrogate often hard to beat; experimentally-learned surrogates > observationally-learned; novelty effects concentrate in content quality, pricing, and hyper-monetization domains.

**Why it matters for Ibotta:** Tingley's presence on this paper signals that Netflix's internal conclusions on long-term effects align with the broader industry consensus. For Ibotta, the most actionable finding is that standard offer feature experiments (UI changes, copy tests, offer sequencing) are unlikely to produce sign reversals, but pricing and reward structure changes warrant longer tests.

**Full entry:** `papers/evaluating-long-term-industry-workshop-2026.md`

**Tags added:** long-term-effects, industry-consensus, surrogate-metrics, novelty-effects
