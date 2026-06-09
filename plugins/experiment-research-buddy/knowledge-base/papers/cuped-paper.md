---
title: "Improving the Sensitivity of Online Controlled Experiments by Utilizing Pre-Experiment Data"
type: paper
tags: [variance-reduction, cuped, sample-size, causal-inference, microsoft-exp]
source_url: https://exp-platform.com/Documents/2013-02-CUPED-ImprovingSensitivityOfControlledExperiments.pdf
added: 2026-06-08
---

# CUPED: Improving the Sensitivity of Online Controlled Experiments by Utilizing Pre-Experiment Data

## At a Glance
Deng, A., Xu, Y., Kohavi, R., & Walker, T. (KDD 2013). Introduced CUPED — Controlled-experiment Using Pre-Experiment Data — a technique that uses pre-experiment covariates to reduce variance in A/B test estimators without introducing bias.

## Why They Matter
CUPED is now industry standard at Netflix, Airbnb, DoorDash, LinkedIn, Uber, and Microsoft. It allows teams to detect the same effect sizes with less traffic, or equivalently, detect smaller effects with the same traffic. For Ibotta, where experiment populations can be limited by offer eligibility, CUPED directly addresses the power problem.

## Key Contributions
- Derived the CUPED adjusted estimator: Y_adj = Y - θ × (X - E[X]), where θ = Cov(Y,X)/Var(X)
- Proved the estimator is unbiased with variance Var(Y) × (1 - ρ²)
- Showed ρ = 0.7 (prior metric correlated at 0.7 with outcome) gives ~51% variance reduction
- Equivalent to running the experiment on twice as many users without recruiting more
- Demonstrated that pre-period outcome (same metric, prior 2–4 weeks) is typically the strongest covariate
- Generalized to any covariate, including ML-derived features (the foundation for CUPAC)

## Takeaways for Practice
1. **Use pre-period redemption rate as CUPED covariate for Ibotta offer experiments.** Prior 2–4 week redemption rate on the same offer category is typically correlated ρ ≥ 0.6 with the experiment outcome — yielding 36%+ variance reduction.
2. **Compute θ on the control group only**, then apply to both treatment and control. Computing on pooled data introduces a subtle bias.
3. **Pre-period window must not overlap the experiment window.** If your experiment starts Monday, use data from the 4 weeks before Monday.
4. **Check ρ before committing to CUPED.** If ρ < 0.3, the variance reduction is <10% — may not be worth the added complexity.
5. **CUPED works for binary outcomes** (conversion rate) but gains are typically smaller than for continuous metrics — calibrate expectations.

## Action Items / Things to Read
- PDF: https://exp-platform.com/Documents/2013-02-CUPED-ImprovingSensitivityOfControlledExperiments.pdf
- DoorDash blog on CUPAC (ML-based CUPED): https://doordash.engineering/2020/06/08/improving-experimental-power-through-control-using-predictions-as-covariate-cupac/
- See also: `references/cuped.md` in the statistical-methods skill for implementation code patterns

## Tags
variance-reduction, cuped, sample-size, causal-inference, microsoft-exp
