---
title: Making Experiment Results Comparable through Sitewide Impact Estimation (Zhang, Zheng, Kang, Manthena — Roblox, arXiv:2611.18411, November 2026)
type: paper
tags: [causal-inference, generalization, holdout, metric-design, multi-experiment, proxy-metrics, surrogate-metrics, variance-reduction]
source_url: https://arxiv.org/abs/2611.18411
added: 2026-11-23
---

# Making Experiment Results Comparable through Sitewide Impact Estimation

## At a Glance
Roblox researchers find that the lift measured within a single A/B test on one product surface is nearly useless for comparing the business impact of experiments run on different surfaces: across 139 statistically significant experiments on time spent, the Spearman rank correlation between surface-level lift and estimated sitewide impact is only 0.20. The paper introduces a "coverage factor" that converts surface lift into a sitewide impact estimate, enabling prioritization decisions across experiments that otherwise can't be meaningfully compared.

## Why They Matter
Most teams implicitly treat "lift" as the unit of comparison when deciding which experiments to prioritize and which features to ship. This paper provides the first large-scale empirical demonstration that lift is a bad prioritization signal when experiments run on surfaces with different reach or metric share. The method is simple, interpretable, and validated with both A/A tests and a long-term holdout.

## Key Contributions
- **The core problem:** A 10% lift on a low-traffic surface may produce less aggregate business impact than a 2% lift on a high-traffic surface. When teams rank experiments by lift, they systematically favor small-surface wins over large-surface wins.
- **The coverage factor:** Sitewide impact = experiment lift × coverage factor, where coverage factor = (surface's target population reach) × (target population's share of the metric). The coverage factor adjusts for how many people are even eligible for the experiment and how much of the total metric they account for.
- **Two estimators:** One for difference-in-means metrics (e.g., average time spent per user), one for variant-level ratio metrics (e.g., session-level engagement rate). Both are validated against A/A tests and confirmed with a long-term holdout on a subset of experiments.
- **Empirical result:** Only 5 of the 10 largest experiment lifts are also among the 10 largest sitewide impacts. Using lift alone to prioritize misranks half the top-10 candidates.
- **Practical upshot:** Teams can compute coverage factors using existing data warehouse tables (DAU by surface, metric volume by surface) — no new instrumentation required.

## Takeaways for Practice
1. **Stop ranking feature launches by experiment lift alone.** Lift is surface-local; sitewide impact is what the business cares about. At Ibotta, an offer experiment that shows a 12% lift on a low-volume brand partner's offer page has less real business impact than a 3% lift on a high-volume grocery retailer page. Compute the coverage factor before stack-ranking experiments.
2. **Build a sitewide impact estimate into every post-experiment writeup.** The inputs — surface reach and metric share — come from standard data warehouse tables (DAUs by surface, metric volume by surface). This is a 2-hour implementation in SQL, not a research project.
3. **Use this framework to have better conversations with stakeholders.** When a PM asks "why aren't we shipping the feature with the highest lift?", a sitewide impact comparison gives you a principled answer that isn't just "trust me, the statistics are more complex."
4. **Validate your coverage factor estimates with A/A tests.** The Roblox team ran A/A experiments (where both arms get the same experience) and confirmed their estimator produces near-zero estimated impact, as expected. This is the right quality check before using the method in production.
5. **Apply this logic when designing experiments too.** If the sitewide impact of a surface is small relative to the total metric, an experiment there is a poor investment regardless of statistical power. Prioritize experiment design toward high-reach, high-metric-share surfaces.

## Action Items / Things to Read
- Paper: https://arxiv.org/abs/2611.18411
- Roblox publication page: https://about.roblox.com/publications/making-experiment-results-comparable-through-sitewide-impact-estimation
- Related: "Evaluating for the Long Term" (arXiv 2608.08043) — covers cross-surface generalization from a different angle
- Related: "Multi-Experiment Analysis" (LinkedIn, arXiv 2026) — joint estimation across overlapping experiments; complementary lens on cross-experiment comparability

## Tags
causal-inference, generalization, holdout, metric-design, multi-experiment, proxy-metrics, surrogate-metrics, variance-reduction
