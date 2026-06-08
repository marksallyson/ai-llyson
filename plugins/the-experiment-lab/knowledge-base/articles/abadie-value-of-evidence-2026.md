---
title: Estimating the Value of Evidence-Based Decision Making
type: paper
tags: [metric-design, bayesian, decision-theory, empirical-bayes, variance-reduction, sample-size]
source_url: https://arxiv.org/abs/2306.13681
added: 2026-06-08
---

# Estimating the Value of Evidence-Based Decision Making

## At a Glance
A landmark paper by Abadie, Agarwal, Imbens et al. (MIT/Stanford/Amazon) showing that standard p < 0.05 significance rules leave 27–30% of attainable business value on the table — validated on 4,800+ real Upworthy A/B tests — and that empirical Bayes decision rules can recover most of that lost value.

## Why They Matter
Most experimentation teams evaluate experiments with a binary question: "did it hit p < 0.05?" This paper proves that rule is suboptimal from a decision-theoretic perspective. Using the Upworthy headline-testing dataset (one of the largest publicly available real-world A/B test collections), the authors quantify exactly how much value significance-based decision-making discards — and demonstrate that empirical Bayes methods consistently outperform fixed significance thresholds. The February 2026 working paper update (the version highlighted in June 2026) adds nonparametric robustness checks that strengthen the original result. The authors are three of the most decorated causal inference researchers alive; this isn't a practitioner blogpost — it's a formal proof with data.

## Key Contributions
- **Empirical framework for EBDM value**: introduces methods to measure how much value evidence-based decision making delivers, how much *more* it could deliver with better decision rules, and the ROI of investing in higher statistical precision
- **Significance rules are provably suboptimal**: the standard p < 0.05 decision rule leaves 27% (parametric model) to 30% (nonparametric) of attainable value unrealized — not because experiments fail, but because the *decision rule* is too blunt
- **Significance screening can produce negative expected value**: in settings with many null effects and noisy estimates, filtering by significance discards genuine positive-ROI options while occasionally surfacing noise; using the point estimate directly (without screening) outperforms filtering
- **Empirical Bayes decision rules**: the fix is to shrink each experiment's result toward the prior distribution of historical effects; small estimated lifts from underpowered experiments get attenuated, large lifts get more weight — a principled alternative to binary p-value thresholds
- **Upworthy validation**: results confirmed on 4,800+ Upworthy A/B tests, a realistic benchmark for orgs running experiments on discrete choice outcomes (headline clicks ≈ offer redemption decisions)
- **ROI of precision investment**: higher statistical power yields more value from EBDM, but with diminishing returns; the framework can quantify the expected benefit of extending a running experiment vs. stopping early

## Takeaways for Practice
1. **Audit Ibotta's current ship/no-ship decision rule.** If experiments are decided purely by p < 0.05, estimate the cost: pull all past experiments, compute what decisions an empirical Bayes rule would have made differently, and measure the implied missed lift. Even a rough estimate will be eye-opening for leadership.
2. **Build a prior over historical effect sizes by metric category.** For "offer redemption rate" experiments, fit a distribution over all past lift estimates. This prior is the ingredient for an empirical Bayes decision rule — even a simple normal prior with estimated mean and variance beats significance thresholds in the Upworthy setting.
3. **For offer portfolio decisions (e.g., which of 10 tested offer structures to run this quarter), rank by expected lift rather than filtering by significance.** The paper's results directly support ranking-based allocation as superior to binary screening when you're choosing among many variants.
4. **Low-traffic offer-level experiments at Ibotta are exactly the setting where significance screening fails hardest.** Small sample sizes → noisy estimates → significance filters discard real effects and occasionally approve noise. Empirical Bayes shrinkage is the right tool for sparse traffic settings.
5. **More precision (CUPED, longer experiments) increases the value of whatever decision rule you use.** The paper quantifies this: reducing experiment noise raises the ceiling for any evidence-based process. This is the mathematical case for investing in variance reduction.

## Action Items / Things to Read
- arXiv:2306.13681 (February 2026 version): https://arxiv.org/abs/2306.13681
- MIT working paper (Feb 2026): https://economics.mit.edu/sites/default/files/2026-02/Estimating%20the%20Value%20of%20Evidence-Based%20Decision%20Making%20Feb%202026.pdf
- Kevin Anderson "Experimental Mind" Digest 22 (June 1, 2026) — practitioner-accessible summary and framing of this paper
- "Ranking by Lifts: A Cost-Benefit Approach to Large-Scale A/B Tests" (arXiv:2407.01036) — related work on cost-benefit decision rules for portfolios of A/B tests
- Efron & Hastie (2016) *Computer Age Statistical Inference* — Ch. 6 covers empirical Bayes; useful background for implementing shrinkage estimators

## Tags
metric-design, bayesian, decision-theory, empirical-bayes, variance-reduction, sample-size, peeking, upworthy
