---
title: "Mitigating the Winner's Curse in Online Experiments"
type: article
tags: [winner-curse, bayesian, shrinkage, empirical-bayes, organizational-maturity, metric-design, multiple-testing, false-discovery, etsy]
source_url: https://www.etsy.com/codeascraft/mitigating-the-winners-curse-in-online-experiments
author: Stephane Shao (Etsy Product Analytics & Experimentation Science)
published: 2022-12-13
added: 2026-06-24
---

# Mitigating the Winner's Curse in Online Experiments

## At a Glance
Etsy's 2022 implementation of Bayesian shrinkage to correct for winner's curse bias in reported experiment lifts. The core problem: observed lifts of winning experiments systematically overestimate true effects due to selection bias. The fix: fit a historical prior on past experiment lifts and compute a posterior-discounted lift that pulls each result toward prior expectations — with discounts scaled to each experiment's precision, not applied uniformly.

Inspired directly by Deng et al. [2021] (Microsoft) and implemented via Gibbs sampling / MCMC. This is the practitioner implementation counterpart to the academic framework.

## The Problem: Winner's Curse Defined

When you select experiments that cross a significance threshold, you introduce selection bias:
- Observed lifts are unbiased across all experiments (equally likely to over/underestimate the truth)
- But **conditional on being called a winner**, the observed lift is expected to overestimate the true lift
- This is because borderline winners (barely above the threshold) are systematically drawn from the right tail of the noise distribution

This is not human bias, p-hacking, or confirmation bias. It is a **mathematical property of any selection protocol** that uses a threshold. It cannot be avoided by better experimental practice — only corrected in post-analysis.

## Why It Matters for Business Impact
Etsy runs hundreds of experiments per quarter. If they naively sum the observed lifts of shipped winners to calculate total program impact, they will substantially overstate the value created. The winner's curse is the mechanism behind why individual wins don't add up to collective impact (see `articles/etsy-collective-impact-experiments.md` and `articles/eppo-rethinking-experimental-impact.md`).

## The Methodology

**Step 1: Build a historical prior**
Fit a statistical model on thousands of past experiment lifts. Etsy's model (following Deng et al.) mixes light- and heavy-tailed distributions — capturing the high concentration of effects near zero (most tests don't move the needle much) while leaving room for rare large effects (new features, algorithm shifts). This models the realistic distribution of true lifts in a maturing product.

**Step 2: Combine prior + observed lift via Bayesian update**
Use Gibbs sampling (MCMC) to compute the posterior distribution over the true lift for each winning experiment. The posterior is a weighted blend of:
- The observed lift (with weight proportional to its precision — inversely related to standard error)
- The historical prior (with weight inversely proportional to precision)

**Step 3: Report the posterior mean as the "discounted lift"**
This is the bias-corrected estimate of the true effect. It behaves as a principled haircut on the raw observed lift.

## Key Properties of the Method

**Adaptive discounting (not a fixed haircut):**
- A high-precision experiment (large sample, tight confidence interval) gets a small discount — the data is credible enough to trust
- A low-precision experiment (small sample, wide confidence interval) gets a larger discount — uncertainty is high, so the prior dominates
- This is the right behavior: it's exactly the underpowered experiments that are most vulnerable to winner's curse inflation

**Discounts disappear for large true effects:**
When a treatment effect is genuinely large (right tail of the distribution), the selection bias is negligible — the experiment would have been called a winner regardless of noise. The method correctly produces near-zero discounts for these cases.

## Connection to Broader Statistical Concepts
- **Type M error (exaggeration ratio):** The winner's curse is a form of type M error — the factor by which effect magnitude is overstated. Underpowered experiments are especially prone.
- **False discovery rate:** At scale (hundreds of concurrent experiments), even with p < 0.05, a meaningful fraction of "winners" have no true effect. The winner's curse applies on top of false discoveries.
- **Shrinkage:** The discounting mechanism is mathematically equivalent to regularization in ML — pulling noisy estimates toward a shared prior to improve overall estimator performance. Efron (2012) and Coey & Cunningham (2019) are the theoretical roots.

## Key Quotes
> "The winner's curse has nothing to do with human biases (confirmation bias, p-hacking, etc.). It is a systematic bias, inherent in our use of a selection protocol."

> "We are effectively trying to find a needle of signal in a haystack of noise, and discounting — more commonly known as shrinkage in the statistical literature — is a well-established technique for improving the performance of estimators."

## Takeaways for Practice

1. **Every experimentation program with a win/ship protocol has the winner's curse.** There is no way to avoid it — only to correct for it.

2. **The correction is most important for borderline winners.** A p = 0.048 result needs a meaningful discount. A p = 0.001 result probably doesn't. Flag borderline results explicitly in readouts and apply skepticism to their lift estimates.

3. **Underpowered CPG tests at Ibotta are especially exposed.** Small N + high variance = low precision = large winner's curse bias. The reported lifts from underpowered tests are the least trustworthy. This is a concrete reason to invest in CUPED and larger sample sizes.

4. **You can implement a simplified version now.** If Ibotta has a corpus of historical experiment effect sizes (even from past-experiments.md), you can fit an empirical prior and compute shrinkage factors. The Deng et al. (2021) paper (Microsoft) in the KB is the formal framework Etsy implemented.

5. **Use this to set honest expectations with stakeholders.** If a test showed +3% lift but the discounted estimate is +1.8%, report +1.8%. "Discounted for selection bias, our best estimate of the true effect is..." is a defensible and sophisticated framing.

6. **For program-level impact reporting:** Never sum raw observed lifts. Apply winner's curse correction first, then sum the discounted lifts. This bridges to Etsy's global holdout work — both methods are trying to get an honest answer to "what did our experimentation program actually deliver?"

## Related Reading
- `articles/eppo-rethinking-experimental-impact.md` — Eppo's analysis of why summed wins overstate impact (winner's curse is one of four mechanisms)
- `articles/etsy-collective-impact-experiments.md` — Etsy's global holdout for measuring collective impact
- `knowledge-base/papers/objective-bayesian-ab-testing-deng.md` — the Microsoft empirical Bayes framework this implementation is directly based on
- `knowledge-base/papers/empirical-bayes-multistage-testing.md` — related empirical Bayes / sequential testing framework

## References Cited in Article
- [1] Lee, Sheng (2018). Winner's curse: bias estimation for total effects of features in online controlled experiments.
- [2] van Zwet, Cator (2021). The significance filter, the winner's curse and the need to shrink.
- [3] Andrews, Kitagawa, McCloskey (2019). Inference on winners.
- [4] Deng, Li, Lu, Ramamurthy (2021). On post-selection inference in A/B testing. ← **direct inspiration for Etsy's model**
- [5] van Dyk, Park (2008). Partially collapsed Gibbs samplers.
- [6] Gelman, Carlin (2014). Beyond power calculations: type S and type M errors.
- [7] Benjamini, Hochberg (1995). Controlling the false discovery rate.
- [8] Coey, Cunningham (2019). Improving treatment effect estimators through experiment splitting.
- [9] Efron (2012). Large-scale inference: empirical Bayes methods.

## Tags
winner-curse, bayesian, shrinkage, empirical-bayes, organizational-maturity, metric-design, multiple-testing, false-discovery, etsy
