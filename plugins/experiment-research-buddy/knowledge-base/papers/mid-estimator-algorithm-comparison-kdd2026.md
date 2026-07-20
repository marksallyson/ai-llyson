---
title: "A More Accurate Algorithm Comparison through A/B Testing using Offline Evaluation Methods (MID Estimator)"
type: paper
tags: [variance-reduction, cuped, offline-evaluation, ranking, algorithm-comparison, sample-size, off-policy-evaluation]
source_url: https://arxiv.org/abs/2607.01958
added: 2026-07-20
---

# A More Accurate Algorithm Comparison through A/B Testing using Offline Evaluation Methods (MID Estimator)

## At a Glance
Konishi, Ushiku, and Saito (KDD 2026) introduce the **MID estimator**, which cuts the algorithm comparison error rate in A/B tests approximately in half by intentionally inducing positive correlation between two competing algorithms' observed outcomes — a property that offline evaluation methods produce naturally but live A/B tests do not.

## Why It Matters
When comparing two recommendation or ranking algorithms in a live A/B test, the standard approach (split traffic randomly, measure each arm's performance, compute the difference) leaves a lot of statistical power on the table. The two arms' outcomes are *uncorrelated by construction*, which means all the variance in the difference estimator comes from both arms simultaneously. Offline evaluation methods (inverse propensity scoring, doubly-robust estimators, direct model estimation) unintentionally produce *correlated* estimates for both algorithms — because both are estimated from the same shared dataset — which drives down variance in the comparison. MID imports this property into a live A/B test by routing some traffic through a "middle algorithm" π_M and estimating π_A vs π_B in two steps via π_M, rather than directly. The positive correlation induced by this stepwise construction reduces the variance of the difference estimate enough to halve the required sample for the same error rate.

## Key Contributions
- **MID estimator**: a bias–variance decomposition shows that the improvement comes from the positive correlation induced between the two algorithm comparisons, not from any distributional assumption
- **Middle algorithm design**: π_M can be any algorithm whose offline evaluation scores correlate with both π_A and π_B; the paper provides guidance on how to choose it
- **Sample reduction**: empirically, MID achieves the same algorithm selection accuracy as standard A/B testing with ~50% fewer observations, at the cost of introducing a third traffic arm (π_M)
- **Bridges A/B testing and offline evaluation**: the framework makes precise the relationship between off-policy evaluation variance reduction and live experiment variance reduction — the same mathematical structure drives both

## Takeaways for Practice
1. **If Ibotta is comparing two offer ranking or targeting algorithms (e.g., two versions of an offer affinity model), MID provides a structured way to get a statistically reliable comparison with roughly half the traffic.** The tradeoff: you need a third traffic arm for π_M, which requires enough users to make three arms viable.
2. **The middle algorithm doesn't need to be the "best" algorithm** — it just needs to be one whose offline evaluation scores correlate with both candidates. A current production algorithm often serves this role naturally.
3. **This is most useful for algorithm comparison experiments where sample size is genuinely limiting** — if you have abundant traffic, standard A/B is fine. The technique pays off most in low-traffic segments or expensive-to-collect outcomes.
4. **Read alongside the AI-Assisted Variance Reduction paper (arXiv 2606.08853)**: that paper addresses the same variance reduction problem with a different tool (AI covariates in CUPED); MID addresses it at the experiment design level. Both can be applied simultaneously.
5. **The offline evaluation component requires logging** — the approach assumes you can run your offline evaluation pipeline on live experiment data, which means you need a historical log of user decisions/outcomes to compute the estimates. Standard for recommendation systems; not always available for simpler offer experiments.

## Action Items / Things to Read
- arXiv:2607.01958 · https://arxiv.org/abs/2607.01958
- KDD '26 proceedings (August 2026, Jeju Island)
- Background: Saito and Joachims (2021) "Counterfactual Learning and Evaluation for Recommender Systems" — foundational off-policy evaluation context
- Companion reading: arXiv:2606.08853 (AI-Assisted Variance Reduction, also KDD 2026) — different approach to the same problem

## Tags
variance-reduction, cuped, offline-evaluation, ranking, algorithm-comparison, sample-size, off-policy-evaluation
