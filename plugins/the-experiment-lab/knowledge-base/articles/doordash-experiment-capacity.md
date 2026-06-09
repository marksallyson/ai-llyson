---
title: "The 4 Principles DoorDash Used to Increase Experiment Capacity by 1000%"
type: article
tags: [variance-reduction, cuped, cupac, organizational-maturity, platform, marketplace, two-sided-markets]
source_url: https://doordash.engineering/2020/09/09/the-4-principles-doordash-used-to-increase-its-logistics-experiment-capacity-by-1000/
added: 2026-06-08
---

# The 4 Principles DoorDash Used to Increase Experiment Capacity by 1000%

## At a Glance
DoorDash Engineering (2020-09-09). Documents how DoorDash scaled from ~20 experiments/month to hundreds through four interventions: (1) variance reduction via CUPED/CUPAC, (2) reducing MDE targets, (3) pre-experiment analysis, and (4) organizational ownership changes.

## Why They Matter
DoorDash is a two-sided marketplace that faced many of the same constraints Ibotta faces: limited eligible user pools, high metric variance, and organizational friction around experiment ownership. Their scaling playbook is directly adaptable. CUPAC — their ML-based extension of CUPED using predicted outcomes as covariates — is the single highest-leverage technical intervention for teams with rich behavioral data.

## Key Contributions
- Documented CUPAC: uses ML model predictions (not just raw prior metrics) as CUPED covariate — captures nonlinear pre-experiment patterns and achieves higher variance reduction than standard CUPED
- Showed that reducing MDE from 5% to 2% detection target (by accepting longer tests or more variance reduction) increases the number of feasibly testable features dramatically
- Pre-experiment analysis: build power analysis into the experiment request workflow so teams know upfront if their test is feasible
- Organizational: moved experiment ownership from central DS to embedded DS in product teams, dramatically increasing throughput

## Takeaways for Practice
1. **CUPAC is the highest-leverage single technical intervention for Ibotta.** If you train an ML model on pre-experiment user behavior to predict experiment outcomes, use those predictions as the CUPED covariate. Typical variance reduction: 40–60% vs. 20–40% for standard CUPED.
2. **Reducing MDE targets has huge compound returns.** If you accept that experiments run 2x longer but detect 2x smaller effects, you can test features that were previously "too small to measure."
3. **Embed power analysis in the experiment request process.** The most expensive mistake is running an underpowered test for 4 weeks and learning nothing. Build the power check into the design stage, not post-hoc.
4. **Org structure changes can matter as much as tooling.** If central DS is a bottleneck for experiment setup, consider embedded DS models or self-serve power calculators.
5. **The DoorDash engineering blog is a primary source.** Their experimentation content (Dash-AB, CUPAC, switchback) is consistently high quality and directly applicable to two-sided marketplace contexts.

## Action Items / Things to Read
- Post: https://doordash.engineering/2020/09/09/the-4-principles-doordash-used-to-increase-its-logistics-experiment-capacity-by-1000/
- CUPAC paper/post: https://doordash.engineering/2020/06/08/improving-experimental-power-through-control-using-predictions-as-covariate-cupac/
- See also: `knowledge-base/companies/doordash.md`

## Tags
variance-reduction, cuped, cupac, organizational-maturity, platform, marketplace, two-sided-markets
