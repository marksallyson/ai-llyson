---
title: "Can Training Logs Make Model Comparisons More Precise? (Huang, ICML Workshop 2026)"
type: paper
tags: [variance-reduction, cuped, ml-covariate, algorithm-comparison, model-evaluation]
source_url: https://arxiv.org/abs/2608.02705
added: 2026-08-10
---

# Can Training Logs Make Model Comparisons More Precise?

## At a Glance
When comparing two stochastically trained ML models via A/B test, early training log statistics — like validation loss after the first epoch — can serve as CUPED-style arm-specific covariates to reduce variance in the performance estimate. Simple, targeted adjustment often works; broadly searching the log pool for the most correlated statistic backfires.

## Why They Matter
ML model comparison experiments are a distinct sub-problem in the A/B testing universe: instead of assigning users to product variants, you're assigning model training runs to "treatment arms," and the noise source is training stochasticity (different random seeds, different mini-batch orderings). Standard CUPED requires a pre-experiment covariate that's correlated with the outcome. This paper identifies that training logs themselves — specifically, early-training metrics from the same model run — fill that role naturally and cheaply.

## Key Contributions
- **Arm-specific covariate adjustment**: each arm's training runs are adjusted using covariates from that arm's own logs only (not cross-arm). This preserves the unbiasedness of the estimator while still capturing variance reduction from early-training predictors.
- **Early training log as the covariate**: validation loss, training loss, or other per-epoch statistics from the first few epochs often correlate strongly with final model performance — making them natural variance-reducing covariates without requiring any external data.
- **Selection noise is real**: broadly searching the log pool to find the most correlated statistic often inflates variance rather than reducing it — even when useful statistics exist in hindsight. The covariate must be chosen with restraint, not optimized post-hoc.
- **Vision study validation**: tested across three model architectures and three datasets; simple early-log adjustments reliably reduce uncertainty; broad log search reliably adds noise.
- **Venue**: ICML 2026 Workshop on Hypothesis Testing (arXiv:2608.02705, submitted August 3, 2026, by Wei-Jung Huang)

## Takeaways for Practice
1. **If you are comparing two versions of an ML model (e.g., recommendation model A vs. B) in an experiment, early training metrics are free variance reduction.** Record epoch-by-epoch training and validation loss for every training run. Use early-epoch validation loss from each run as a covariate. This is CUPED but with the model's own training history as the "pre-experiment user data."
2. **Use arm-specific covariates, not shared ones.** Adjusting model A's results using model A's own training log statistics, and model B's results using model B's own logs, keeps the estimator valid. Cross-arm covariate use would introduce bias.
3. **Don't search for the best covariate post-hoc.** Pick one or two training statistics you know are correlated with final performance *before* looking at results. Fishing through the log pool after you see the outcome inflates Type I error and eliminates variance reduction benefits.
4. **This is most valuable when comparing models with high training variance** — e.g., large models on small datasets, or models where architecture choices significantly affect convergence paths. If training variance is already low, the variance reduction will be modest.
5. **For offline evaluation of recommendation algorithms at Ibotta**: when comparing two targeting or ranking models in a live experiment, capture early training loss as a standard artifact. The uplift analysis can then use these as covariates to reduce the traffic or time required for a statistically valid comparison.

## Action Items / Things to Read
- arXiv:2608.02705 — "Can Training Logs Make Model Comparisons More Precise?" by Wei-Jung Huang
- ICML 2026 Workshop on Hypothesis Testing proceedings (for context on how this fits the field)
- Compare with KB entry for MID Estimator (Konishi et al., KDD 2026), which takes a different approach to reducing sample requirements for algorithm comparison
- CUPED paper (Deng et al., KDD 2013) — the foundational variance reduction method this extends

## Tags
variance-reduction, cuped, ml-covariate, algorithm-comparison, model-evaluation
