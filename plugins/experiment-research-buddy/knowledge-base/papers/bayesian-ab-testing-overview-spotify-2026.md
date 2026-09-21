---
title: "Bayesian Inference Procedures for A/B Testing: An Overview"
type: paper
tags: [bayesian, frequentist-vs-bayesian, sequential-testing, always-valid-inference, empirical-bayes, false-positive, type-i-error, platform]
source_url: https://arxiv.org/abs/2608.12949
added: 2026-08-17
---

# Bayesian Inference Procedures for A/B Testing: An Overview

## At a Glance
Schultzberg & Frånberg (Spotify Confidence team, arXiv August 13, 2026) systematically map the landscape of Bayesian A/B testing for the first time. The central argument: "Bayesian A/B testing" is not a single method but a family of configurations with fundamentally different statistical guarantees, and most discussions treat them as interchangeable — which is dangerous when a DS team thinks they have error control and they don't.

## Why They Matter
Every DS team evaluating Bayesian experimentation tooling needs this paper. The three-tier framework gives you the vocabulary to ask vendors the right questions: which tier does your platform operate at by default? The finding that many commercial platforms default to Tier 1 (no error control at all) is a cautionary note for anyone who switched to Bayesian testing thinking it solved the peeking problem.

## Key Contributions
- **Three-tier hierarchy of Bayesian A/B testing configurations:**
  - **Tier 1 — Posterior coherence, no error control**: update the posterior as data arrives; report probability that treatment is better; no frequentist false positive rate guarantee; Type I error is not controlled; stopping decisions are arbitrary. Most commercially deployed Bayesian platforms operate here by default.
  - **Tier 2 — Bayes factor stopping, bounded false positive rate**: use Bayes factors as the stopping criterion; this provides frequentist-valid error control under continuous monitoring (analogous to sequential probability ratio tests); the authors prove this is near-optimal for a broad class of cost functions used in A/B testing literature.
  - **Tier 3 — Empirical Bayes (FDR control + calibrated shrinkage)**: prior is learned from the portfolio of historical experiments; controls false discovery rate; provides calibrated shrinkage that reduces winner's curse; requires a large experiment portfolio to fit the prior reliably.
- **Near-optimality of Bayes factor stopping**: under almost any reasonable cost function for balancing Type I error, Type II error, and experiment duration, Bayes factor stopping dominates both naive posterior methods and classical sequential testing.
- **Practical implication for platform evaluation**: if a vendor says "we use Bayesian testing," ask specifically whether they implement Bayes factor stopping rules (Tier 2) or empirical Bayes priors (Tier 3); if neither, you have a Tier 1 platform with no peeking protection.
- **Authors**: Mårten Schultzberg and Mattias Frånberg, Experimentation Platform team, Confidence, Spotify, Stockholm, Sweden.

## Takeaways for Practice
1. **If Ibotta uses a Bayesian tool (Eppo/Datadog Experiments, Confidence, or any commercial platform), ask which tier it operates at.** Tier 1 gives you nice posterior plots but no protection against repeated peeking. If a platform defaults to Tier 1, treat it exactly like frequentist testing — only read results when the experiment is fully powered.
2. **Bayes factor stopping (Tier 2) is the right default for most DS teams.** It gives frequentist-valid error control while allowing early stopping without pre-specified sample sizes — a real operational benefit over classical fixed-horizon tests. If your platform supports it, use it.
3. **Empirical Bayes (Tier 3) is powerful but requires a large, stable experiment portfolio.** The prior is estimated from your historical distribution of treatment effects. If Ibotta's experiment portfolio is small or the mix of experiment types is heterogeneous (offer-level, platform-level, copy tests), the prior may not be well-estimated. Start with Tier 2 until you have 100+ experiments in the portfolio.
4. **"Bayesian" is not a synonym for "handles peeking."** This paper makes clear that the peeking problem is only solved at Tier 2 and above. Tier 1 Bayesian testing with daily result checks still inflates your false positive rate — it just does so in a way that's harder to detect because there's no p-value to compare to a threshold.
5. **For Ibotta's offer-level experiments with small sample sizes, Bayesian methods are genuinely useful — but only if implemented correctly.** Small samples mean frequentist power is hard to achieve, making Bayesian decision rules attractive. But if the platform defaults to Tier 1, you're making decisions on noisy posteriors with no error guarantees.

## Action Items / Things to Read
- Paper (arXiv): https://arxiv.org/abs/2608.12949
- HTML version: https://arxiv.org/html/2608.12949
- Related: Spotify on Bayesian decision rules — `companies/spotify.md`
- Related: Statsig on informed Bayesian testing — `articles/statsig-informed-bayesian-ab-testing.md`
- Related: Eppo comparison frequentist vs. Bayesian vs. sequential — `articles/eppo-frequentist-vs-bayesian-vs-sequential.md`
- Related: Objective Bayesian testing (Deng et al., 2016) — `papers/objective-bayesian-ab-testing-deng.md`
- Related: Empirical Bayes multistage testing (arXiv 2022) — `papers/empirical-bayes-multistage-testing.md`

## Tags
bayesian, frequentist-vs-bayesian, sequential-testing, always-valid-inference, empirical-bayes, false-positive, type-i-error, platform
