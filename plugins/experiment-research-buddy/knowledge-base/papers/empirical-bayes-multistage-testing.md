---
title: "Empirical Bayes Multistage Testing for Large-Scale Experiments"
type: paper
tags: [bayesian, empirical-bayes, false-positive, multiple-testing, sequential-testing, type-i-error]
source_url: https://arxiv.org/abs/2209.05788
added: 2026-06-15
---

# Empirical Bayes Multistage Testing for Large-Scale Experiments

**Venue**: arXiv preprint (stat.ME), 2022
**Source**: https://arxiv.org/abs/2209.05788

## At a Glance
Combines sequential hypothesis testing with empirical Bayes to create an adaptive multistage testing procedure (AMSET) that controls false discovery rate (FDR) while allowing early stopping — targeting the portfolio of experiments common at large tech platforms.

## Why They Matter
Most experimentation platforms make a binary choice: frequentist (rigid, interpretable) or Bayesian (flexible, prior-dependent). This paper proposes a hybrid that gets early stopping and FDR control without requiring you to specify a prior subjectively. It's specifically designed for the multi-experiment setting where you're running dozens or hundreds of tests simultaneously.

## Key Contributions
- **AMSET** (Adaptive Multistage Sequential Empirical-Bayes Test): allows experiments to stop at multiple pre-planned interim looks without inflating false discovery rate
- **FDR control, not FWER**: controls false discovery rate across the portfolio of experiments — more appropriate than per-experiment Type I error control when running many tests simultaneously
- **Data-driven stopping rule**: the stopping threshold adapts based on the distribution of test statistics across all running experiments — borrows strength across the portfolio
- **Mixture model for effect sizes**: uses an empirical Bayes mixture distribution to estimate the proportion of null vs. non-null experiments in the portfolio
- **Validated via simulation and real data**: comparison against fixed-horizon and always-valid-p-value approaches shows improved efficiency

## Takeaways for Practice
1. **When running many experiments simultaneously, per-experiment α=0.05 is not the right target** — you're implicitly running a multiple testing problem. FDR control (e.g., Benjamini-Hochberg or this approach) is more appropriate for experiment portfolios.
2. **Adaptive stopping thresholds make more intuitive sense than fixed O'Brien-Fleming boundaries** when effect sizes vary across experiments. This approach adjusts based on what the portfolio is actually showing.
3. **The empirical Bayes mixture model is a useful mental model** even if you don't implement this paper directly: at any moment, some fraction of your running experiments are testing real effects, and some are testing nulls. Your portfolio FDR reflects that mix.
4. **Early stopping rules are only valid when pre-committed.** This paper's framework requires pre-specifying the number of stages and interim look points — ad hoc peeking still inflates false positives even under Bayesian frameworks.
5. **Most practical for teams running 20+ simultaneous experiments.** At lower experiment volumes, the empirical Bayes estimation is unstable. Ibotta may not be at the scale where this is the primary concern yet.

## Action Items / Things to Read
- [arXiv paper](https://arxiv.org/abs/2209.05788)
- Deng et al. (2016) "Continuous Monitoring of A/B Tests without Pain" — related Bayesian sequential testing approach
- Johari et al. (2017) mSPRT paper — the frequentist alternative to sequential Bayesian testing; see `papers/peeking-problem.md`
- Benjamini & Hochberg (1995) — foundational FDR paper; this paper builds on it

## Tags
bayesian, empirical-bayes, false-positive, multiple-testing, sequential-testing, type-i-error
