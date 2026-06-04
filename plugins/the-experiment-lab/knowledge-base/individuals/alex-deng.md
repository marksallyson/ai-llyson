---
title: Alex Deng
type: individual
tags: [variance-reduction, cuped, sample-size, causal-inference, metric-design]
source_url: https://exp-platform.com
added: 2026-06-04
---

# Alex Deng

## At a Glance
Alex Deng is a Principal Researcher at Microsoft ExP and co-inventor of CUPED (Controlled-experiment Using Pre-Experiment Data), published at KDD 2013. He is among the most technically precise authors in product experimentation, with a focus on variance reduction, statistical methodology, and common misunderstandings in A/B testing practice.

## Why They Matter
Deng's CUPED paper is one of the highest-ROI reads in the field: it describes a method that reduces required sample size by 20-50% for typical product experiments, requires only pre-experiment covariate data you already have, and is implementable in a few lines of code. His follow-up work on "A/B Testing Intuition Busters" is a catalog of systematic errors that smart practitioners make — essential reading before pre-registering an experiment you're confident about.

## Key Contributions
- **CUPED** (Deng, Xu, Kohavi, Walker, KDD 2013): variance reduction using pre-experiment covariates; reduces required sample size 20-50%; implemented in every major experimentation platform
- **"A/B Testing Intuition Busters"** (Deng & Kohavi, 2022): documented cases where practitioner intuition about experiment results was systematically wrong; includes Simpson's paradox cases, survivorship bias, and carryover effects
- **Regression to the mean in A/B tests**: Deng's work on how selecting users based on a metric (e.g., "top spenders") and then measuring that same metric creates artificial regression-to-the-mean effects
- **Variance reduction survey**: survey paper on all major variance reduction methods in online experiments
- **Outlier treatment in experiments**: documented how a handful of extreme users can drive experiment results; advocates for pre-registered Winsorization
- **Multiple testing corrections**: practical guidance on handling multiple metrics in a single experiment without inflating false discovery rate

## Takeaways for Practice
- **Implement CUPED immediately for every Ibotta experiment using prior-period redemption rate as the covariate.** Deng's original paper is 8 pages and includes the formula. The implementation is: (1) regress outcome on pre-period covariate, (2) subtract fitted values from outcome, (3) run t-test on residuals. 30-minute implementation for 20-50% variance reduction.
- **Read "A/B Testing Intuition Busters" when you're about to pre-register an experiment you're confident about.** It will make you less confident, which is correct.
- **Deng's outlier/Winsorization work is directly applicable to Ibotta GMV experiments.** A small number of extremely high-value users will dominate variance. Pre-register Winsorization at the 99th percentile of the distribution before the experiment launches.
- **His work on regression to the mean matters for user segmentation experiments.** If you're targeting "low engagement users" (defined by recent behavior) and measuring re-engagement, you're selecting a cohort that would regress to the mean regardless of treatment. Use a pre-treatment period from before the selection period to avoid this.
- His papers are all on exp-platform.com and Google Scholar — freely available.

## Action Items / Things to Read
- Deng et al. (2013) "Improving the Sensitivity of Online Controlled Experiments by Utilizing Pre-Experiment Data" — KDD 2013; the CUPED paper; free on exp-platform.com
- Deng & Kohavi (2022) "A/B Testing Intuition Busters" — arXiv; also on exp-platform.com
- Deng et al. (2016) "Continuous Monitoring of A/B Tests without Pain: Optional Stopping in Bayesian Testing"
- Deng's Google Scholar profile for full paper list

## Tags
variance-reduction, cuped, sample-size, causal-inference, metric-design, outlier-treatment, multiple-testing, regression-to-mean
