---
title: "Variance Reduction for Heavy-Tailed Monetization Metrics in Ranking Experiments via Post-Stratification"
type: paper
tags: [variance-reduction, cuped, heavy-tailed, monetization, ranking, post-stratification, marketplace, sample-size]
source_url: https://arxiv.org/abs/2606.04110
added: 2026-06-22
---

# Variance Reduction for Heavy-Tailed Monetization Metrics in Ranking Experiments via Post-Stratification

## At a Glance
Pokharna, N., Jeunen, O., Saraf, Y., & Ustimenko, A. (SIGIR 2026, Industry Track). A practical framework for improving statistical power in experiments where the outcome metric is heavy-tailed — deployed at ShareChat's ranking-driven monetization experiments, achieving equivalent statistical confidence with ~45% less traffic.

## Why They Matter
Most variance reduction literature (CUPED, CUPAC) implicitly assumes a continuous but roughly normal-ish outcome. Monetization metrics — revenue per user, cashback earned, order value, creator earnings — are classic heavy-tailed distributions where a small number of users dominate both the mean and the variance. Standard CUPED applied to these metrics reduces variance less than expected because the heavy tail isn't captured by the pre-period mean covariate. This paper confronts that gap directly and offers a practical remedy: post-stratification, which accounts for user-level heterogeneity in spending behavior by stratifying the population before applying CUPED.

## Key Contributions
- **Post-stratification + CUPED hybrid**: stratify users into groups based on pre-experiment spending tier (e.g., heavy spenders vs. light spenders vs. non-spenders), apply CUPED within each stratum, then aggregate — exploits the structure of the heavy tail rather than ignoring it
- **Deployed at ShareChat**: industry results on real ranking-driven monetization experiments; 45% traffic reduction for equivalent confidence compared to unadjusted metrics
- **Practical design guidance**: discusses when to use post-stratification, how many strata to define, and guardrails to avoid overfitting the stratum boundaries to noise
- **Limitations documented**: method is most effective when spending heterogeneity is predictable from pre-treatment covariates; degrades gracefully when covariates are uninformative
- **SIGIR 2026 Industry Track**: peer-reviewed by IR practitioners; grounded in a real production experiment system

## Takeaways for Practice
1. **Check whether Ibotta's monetization metrics (cashback earned per user, offer redemption value) are heavy-tailed before choosing a variance reduction strategy.** Plot the distribution of per-user redemption amounts in any recent experiment. If the top 10% of users account for >50% of total redemption value, standard CUPED is losing power to the heavy tail.
2. **Stratify by pre-experiment spend tier, not just pre-experiment mean.** Create 3–5 user strata based on total cashback earned in the 4 weeks before the experiment. Run CUPED within each stratum. This is straightforward in Spark/SQL and doesn't require an ML model.
3. **For offer-level experiments where high-value SKUs drive redemption, apply post-stratification by offer redemption category (premium vs. standard vs. everyday).** The same logic applies when heterogeneity is in the offer type rather than the user.
4. **The 45% traffic reduction result means you can run shorter or smaller experiments to reach the same power.** For Ibotta brand partner experiments with small user populations, this matters directly.
5. **Pair with CUPED, not instead of it.** Post-stratification captures between-group variance; CUPED captures within-group temporal correlation. Together they address different sources of variance.

## Action Items / Things to Read
- Paper (arXiv): https://arxiv.org/abs/2606.04110
- HTML version: https://arxiv.org/html/2606.04110
- Related: STATE estimator (arXiv:2407.16337) — alternative approach for heavy-tailed ATE estimation via trimmed means + standard errors
- Related: CUPED paper (Deng et al., KDD 2013) — `papers/cuped-paper.md`
- See also: DoorDash CUPAC for ML-based variance reduction — `companies/doordash.md`

## Tags
variance-reduction, cuped, heavy-tailed, monetization, ranking, post-stratification, marketplace, sample-size
