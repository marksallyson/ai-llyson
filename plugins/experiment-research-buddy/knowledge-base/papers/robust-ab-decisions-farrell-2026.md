---
title: "Robust A/B Decisions"
type: paper
tags: [decision-theory, distributionally-robust, advertising, regret, deployment-decision, variance-reduction]
source_url: https://arxiv.org/abs/2609.07633
added: 2026-09-28
---

# Robust A/B Decisions

## At a Glance
Farrell, Korganbekova & Misra (University of Chicago Booth, arXiv:2609.07633, September 2026) ask a deceptively simple question: the standard A/B test pipeline uses a t-test to decide whether to deploy — but a t-test tests equality in the *experiment*, not economic payoff in *deployment*. The authors build an ambiguity-averse decision rule grounded in distributionally robust optimization, validated on 552 real advertising experiments, that reduces deployment regret by ~25% compared to conventional hypothesis testing.

## Why They Matter
Almost every team that runs A/B tests uses the same two-step pipeline: (1) test for statistical significance; (2) deploy if p < 0.05. This paper challenges the second step from an economic standpoint. Statistical significance tells you whether an effect existed in your sample; it says nothing about whether that effect will hold when your treatment scales to production or when the distribution of users shifts over time. The paper gives you a closed-form decision rule — as simple to apply as a t-test — that is explicitly calibrated to minimize regret under distributional uncertainty.

## Key Contributions

- **The core problem:** A t-test asks "is the lift nonzero in this sample?" A deployment decision asks "will the lift be positive in the population I deploy to?" These are different questions. The gap between them grows when the experiment sample is small, the outcome distribution is heavy-tailed (e.g. revenue), or the deployment environment differs from the experiment environment.

- **The framework — distributionally robust optimization (DRO):** Each arm's expected payoff is evaluated not just at the empirical distribution but over a neighborhood of distributions close to it (measured by the Kullback-Leibler divergence, using the Donsker-Varadhan representation). The resulting "ambiguity-penalized value" shrinks the estimated lift by a term proportional to the variance of outcomes and a user-specified trust parameter governing how much distributional shift is plausible.

- **The decision rule:** Deploy treatment iff its ambiguity-penalized value exceeds control's — a closed-form threshold as simple as a t-statistic but with an explicit economic interpretation. The trust parameter is interpretable: it quantifies the maximum KL divergence between the experiment and deployment distributions the analyst is willing to tolerate.

- **Empirical validation:** Applied to 552 advertising experiments from an anonymous US-based online platform. The proposed rule reduces average deployment regret by ~25% relative to conventional hypothesis testing. The improvements are largest for experiments with high outcome variance and small samples — exactly the settings where standard t-tests are most unreliable.

- **Authors and affiliation:** Max H. Farrell, Malika Korganbekova, Sanjog Misra — all at the University of Chicago Booth School of Business.

## Takeaways for Practice

1. **Stop treating "statistically significant" as synonymous with "deploy."** Statistical significance tells you the lift was detectable in your sample. The Robust A/B Decisions framework asks the harder question: given that the experiment is a sample and deployment is a population, how confident are you the lift will hold? For Ibotta offer experiments where sample sizes are limited and revenue metrics are heavy-tailed, this distinction matters.

2. **Variance matters to deployment decisions, not just power calculations.** The DRO decision rule penalizes high-variance outcomes because distributional shifts matter more when outcomes are volatile. For Ibotta: if two offers have similar mean lifts but different variance profiles, the DRO rule will favor the more stable one — which is the right economic choice.

3. **The trust parameter is a useful forcing function for conversations with stakeholders.** Before deploying a feature, the DRO framework asks: "How similar do you expect the deployment population to be to the experiment population?" A trust parameter of zero = total uncertainty, revert to priors. A high trust parameter = the experiment was representative. Making this explicit clarifies when you can trust experiment results.

4. **This framework is especially relevant for one-time or irreversible deployments.** Standard A/B tests implicitly assume you can roll back. Irreversible changes (pricing structure, offer redemption mechanics, contract terms) warrant conservative deployment rules. The DRO rule provides a principled, not arbitrary, way to be conservative.

5. **Validated on advertising experiments, directly applicable to offer-level testing.** Ibotta's offer tests are structurally similar to advertising experiments: a treatment (new offer design, new incentive level, new copy) applied to a user segment with a revenue or conversion outcome that is right-skewed. The 552-experiment validation is strong evidence the method transfers.

## Action Items / Things to Read
- Paper (arXiv): https://arxiv.org/abs/2609.07633
- HTML version: https://arxiv.org/html/2609.07633
- Related — decision theory and evidence: `articles/abadie-value-of-evidence-2026.md`
- Related — winner's curse inflating observed lifts: `papers/trustworthy-ab-patterns-winners-curse-kdd2026.md`
- Related — Eppo on why summed wins overstate impact: `articles/eppo-rethinking-experimental-impact.md`

## Tags
decision-theory, distributionally-robust, advertising, regret, deployment-decision, variance-reduction
