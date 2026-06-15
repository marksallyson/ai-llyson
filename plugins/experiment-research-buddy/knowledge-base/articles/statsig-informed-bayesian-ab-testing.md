---
title: "Informed Bayesian A/B Testing: Two Approaches"
type: article
tags: [bayesian, empirical-bayes, false-positive, stakeholder-communication, type-i-error]
source_url: https://www.statsig.com/blog/informed-bayesian-ab-testing
added: 2026-06-15
---

# Informed Bayesian A/B Testing: Two Approaches

**Author**: Statsig Engineering
**Venue**: Statsig Blog
**Source**: https://www.statsig.com/blog/informed-bayesian-ab-testing

## At a Glance
Distinguishes two ways of incorporating prior knowledge into Bayesian A/B testing — one that shifts point estimates, one that tightens credible intervals — and explains the risks of each, including why leadership-imposed priors are dangerous.

## Why They Matter
This is the clearest practitioner-level treatment of the risks of "informed" Bayesian testing. It names Microsoft Bing as a real-world example of empirical Bayes done right, and warns explicitly about the organizational failure modes that make Bayesian testing go wrong in practice.

## Key Contributions
- **Type 1 informed prior**: adjusts the *point estimate* of the effect — e.g., a skeptical prior shrinks the estimated effect toward zero, an optimistic prior amplifies it
- **Type 2 informed prior**: *tightens credible intervals* — functionally equivalent to applying a multiple testing correction (like Benjamini-Hochberg) but framed as Bayesian
- **Microsoft Bing example**: uses empirical Bayes priors from historical data to center on realistic small effect sizes — cited as the model for how to do this correctly
- **Leadership prior risk**: warns explicitly that if a PM or exec can influence the prior, the system becomes gameable — "once an informed prior is introduced, Bayesian results can shift toward or away from significance depending on how that prior is specified"
- **Recommended approach**: use empirical Bayes (prior from historical experiment data), not expert elicitation; run independent reviews before analysis begins to validate distribution assumptions

## Takeaways for Practice
1. **Never let a stakeholder influence the prior.** If a PM says "I believe this feature will work, so use an optimistic prior," that defeats the purpose of running an experiment. The prior must be set before results are seen and based on historical data, not current hypothesis.
2. **Empirical Bayes (prior from past experiments) is the only defensible approach for Ibotta** if you move toward Bayesian testing. Use the distribution of historical treatment effect sizes — not subjective beliefs.
3. **Type 2 priors (interval tightening) are equivalent to FDR corrections** — if that's the goal, just use Benjamini-Hochberg directly. It's simpler and more transparent.
4. **Bayesian results can be made to say almost anything with the wrong prior.** This is the main reason large-scale platforms (Booking.com, Spotify) prefer sequential frequentist testing — it's harder to manipulate and easier to audit.
5. **If you use Bayesian testing for stakeholder communication** ("87% chance this wins"), separate the communication layer from the decision layer. Use frequentist inference for the actual ship/no-ship decision and Bayesian framing only for explaining results to non-technical audiences.

## Action Items / Things to Read
- [Full blog post](https://www.statsig.com/blog/informed-bayesian-ab-testing)
- Deng et al. (2016) "Objective Bayesian Two Sample Hypothesis Testing" — the Bing paper cited in this post; see `papers/objective-bayesian-ab-testing-deng.md`
- Statsig docs on Bayesian experiment setup: statsig.com/updates/update/bayesian-analysis-for-experiments

## Tags
bayesian, empirical-bayes, false-positive, stakeholder-communication, type-i-error
