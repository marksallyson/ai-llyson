---
title: "Testing for Trends in Online Experiments"
type: paper
tags: [novelty-effects, time-adaptive, variance-reduction, metric-design, causal-inference, jackknife, linear-regression, online-experiments, google]
source_url: https://arxiv.org/abs/2609.01973
added: 2026-10-05
---

# Testing for Trends in Online Experiments

## At a Glance
Google researchers propose a simple, practical method for detecting time-dependent treatment effects in online experiments using per-day effect estimates and a jackknife variance estimator. The method validates whether an A/B test result is stable over time or driven by a novelty/primacy artifact — and it works without the specialized cookie-cookie-day experimental design previously required.

**Citation:** Chris Haulk, Lee Richardson, Jacopo Soriano. *Testing for trends in online experiments.* arXiv:2609.01973 (stat.ME), September 2026. Affiliation: Google.

## Why They Matter
Time-dependent treatment effects — novelty effects (a spike that fades as users habituate) and primacy effects (a suppressed effect that grows as users learn) — are among the most common ways A/B test results mislead practitioners. A feature appears to win convincingly, launches to 100%, and performance reverts to baseline in three weeks. The standard recommendation has been to run longer experiments, but this paper gives analysts the statistical machinery to *test* whether a trend exists, and *quantify* it, rather than only eyeballing per-day plots.

## Key Contributions
- **Regression-based trend detection**: Linear regression of per-day treatment effect estimates (δ₁, δ₂, …, δ_T) against day number provides a valid test for time trends with a simple numeric slope: effect change per day.
- **Jackknife variance estimator**: The jackknife (leave-one-day-out) estimator yields valid standard errors for the regression slope even when daily effects are correlated — which they are, since the same users appear on multiple days.
- **No cookie-cookie-day requirement**: Previous approaches (notably the cookie-cookie-day design) required specialized experimental infrastructure. This method works with standard per-day effect estimates from any experiment log.
- **When regression wins**: For monotonic trends, regression loses little power relative to optimal sequential trend tests and is far simpler to implement. The paper characterizes cases where other methods (LOWESS smoothing, segmented regression) would be preferred.
- **Power analysis for trend detection**: The paper derives minimum detectable trend sizes as a function of experiment duration T and per-day effect variance, giving practitioners guidance on whether their experiment is long enough to detect a trend even if it exists.

## Takeaways for Practice
1. **Add a trend test to every A/B test post-analysis.** Fit a linear model to per-day treatment effects and test whether the slope differs from zero. If your stats library supports jackknife resampling, use it; otherwise, robust standard errors clustered by day are a reasonable approximation. This is a cheap diagnostic that catches novelty and primacy artifacts before launch.
2. **A significant average effect with a negative slope is a red flag.** If treatment wins overall but the per-day effect is monotonically declining, the feature may be a novelty — commit to a longer experiment or a holdout before shipping.
3. **Don't use per-day plots as the only novelty diagnostic.** Visual inspection is unreliable when daily effects are noisy. The regression + jackknife gives you a proper p-value and confidence interval for the trend slope.
4. **Ibotta offer experiments with streak mechanics or new reward categories are prime candidates for novelty effects.** A new cashback category or a higher-value introductory offer will produce a usage spike; the regression slope tells you whether the spike is real engagement or habituation burn-off.
5. **Use experiment duration strategically.** The power analysis in the paper shows that trend detection improves more from adding days at the beginning and end of the experiment (where the slope is most visible) than from adding weeks in the middle. Plan longer experiments for features where novelty effects are plausible.

## Action Items / Things to Read
- Full paper: https://arxiv.org/abs/2609.01973
- HTML version: https://arxiv.org/html/2609.01973
- Companion reading: "Novelty and Primacy: A Long-Term Estimator for Online Experiments" (Hohnhold et al., 2015) — the foundational paper this builds on
- Statsig's article on running faster tests (Part 2: Modifying Metrics) — proxy metrics as novelty-resistant alternatives
- `evaluating-long-term-industry-workshop-2026.md` — cross-industry finding that novelty effects concentrate in pricing and content quality experiments (Ibotta relevant)

## Tags
novelty-effects, time-adaptive, metric-design, causal-inference, jackknife, linear-regression, online-experiments, google, variance-reduction, long-term-effects
