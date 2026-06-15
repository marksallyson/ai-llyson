---
title: "Objective Bayesian Two Sample Hypothesis Testing for Online Controlled Experiments"
type: paper
tags: [bayesian, empirical-bayes, false-positive, microsoft, platform, sequential-testing, type-i-error]
source_url: https://www.exp-platform.com/Documents/BayesianAB.pdf
added: 2026-06-15
---

# Objective Bayesian Two Sample Hypothesis Testing for Online Controlled Experiments

**Authors**: Alex Deng, Jiannan Lu, Shouyuan Chen (Microsoft)
**Venue**: WWW 2016

## At a Glance
Proposes an objective Bayesian A/B testing framework for online experiments where the prior is learned empirically from thousands of historical Bing experiments — removing the subjectivity that makes Bayesian testing controversial in practice.

## Why They Matter
This is the most credible industry implementation of Bayesian A/B testing at scale. By learning the prior from Bing's own historical experiment archive (thousands of past tests), Deng et al. sidestep the hardest problem in Bayesian A/B testing: who picks the prior and how? Their answer — the data does, automatically — makes this approach defensible and auditable.

## Key Contributions
- **Empirical Bayes prior**: prior on effect sizes is estimated from the distribution of observed treatment effects in past Bing experiments, not set subjectively by analysts
- **Objective prior = reproducible**: because the prior is derived from data, two analysts starting from the same historical archive will produce the same prior — removes political risk of "management-influenced priors"
- **Balances false positives and false negatives**: the empirical prior naturally centers on small, realistic effect sizes; this shrinks noisy estimates and reduces false positives without sacrificing power on real effects
- **Applied at Bing scale**: validated across thousands of concurrent experiments; priors are stable and well-calibrated at this scale
- **Bridges Bayesian and frequentist**: the framework produces posterior probabilities but can be evaluated on frequentist operating characteristics (Type I error, power) — making it easier to sell to frequentist-trained teams

## Takeaways for Practice
1. **Bayesian A/B testing is only defensible when the prior comes from data, not intuition.** If Ibotta ever moves toward Bayesian testing, the prior should be estimated from the distribution of historical experiment effect sizes — not set by a PM or analyst's "belief."
2. **The empirical Bayes approach is especially useful when you have a large experiment archive.** Ibotta's historical experiments are a valuable asset for calibrating priors; the more experiments you've run, the better the prior.
3. **This approach doesn't solve the peeking problem.** Posterior probabilities with fixed thresholds inflate false positives under repeated testing just like p-values do — you still need a proper stopping rule.
4. **Use this framework to benchmark your current false positive rate.** If your current experiment portfolio has many "winners" that don't replicate, empirical Bayes shrinkage may explain why — your observed effect sizes are likely inflated by sampling noise.
5. **The prior in this framework encodes "most experiments have small effects."** This is almost certainly true at Ibotta. Building that prior into your decision framework naturally penalizes implausibly large effect size estimates.

## Action Items / Things to Read
- [Full paper (PDF)](https://www.exp-platform.com/Documents/BayesianAB.pdf)
- Deng et al. (2013) CUPED paper — same first author; read together for a full picture of the Microsoft ExP statistical approach
- Statsig blog: "Informed Bayesian A/B Testing" — practitioner follow-up on how to implement informed priors safely
- See also: `individuals/alex-deng.md`, `companies/microsoft-exp.md`

## Tags
bayesian, empirical-bayes, false-positive, microsoft, platform, sequential-testing, type-i-error
