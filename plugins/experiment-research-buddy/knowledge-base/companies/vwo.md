---
title: VWO (Visual Website Optimizer)
type: company
tags: [bayesian, conversion-optimization, platform, stakeholder-communication]
source_url: https://vwo.com/blog/bayesian-a-b-testing-a-powerful-reasoning-model/
added: 2026-06-15
---

# VWO (Visual Website Optimizer)

## At a Glance
VWO is a CRO (conversion rate optimization) platform that made Bayesian statistics its default engine via SmartStats — one of the clearest real-world examples of a Bayesian-first A/B testing implementation, built specifically for marketing and product teams who find p-values unintuitive.

## Why They Matter
VWO's SmartStats is the most documented public implementation of a Bayesian A/B testing engine aimed at non-statisticians. Their design choices — flat prior, probability-of-being-best output, continuous monitoring — represent one end of the Bayesian spectrum and are worth understanding before deciding whether Bayesian framing is right for Ibotta's stakeholder communication.

## Key Contributions
- **SmartStats engine**: Bayesian engine using a flat (non-informative) Beta prior — no historical knowledge assumed; all conversion rates equally likely at start
- **Continuous monitoring**: designed to allow mid-test reads without (claimed) Type I error inflation — valid only if the analyst pre-commits to a loss threshold before peeking
- **Probability-of-being-best**: reports "87% chance variant B beats control" rather than p-values — significantly more interpretable for non-technical PMs and marketers
- **Potential loss metric**: reports expected loss from choosing the wrong variant — useful for framing risk in business terms
- **~7M Monte Carlo samples**: takes random samples from posterior distributions to estimate the range of possible improvements

## Takeaways for Practice
1. **The "probability of being best" framing is genuinely more intuitive for stakeholders** — if Ibotta PMs struggle with p-values, Bayesian communication layer (even on top of frequentist inference) may be worth exploring.
2. **Flat priors offer no shrinkage benefit.** VWO's non-informative prior means you get the interpretability of Bayesian output without the bias-reduction benefit of an informed prior. You're essentially running frequentist inference with Bayesian-flavored outputs.
3. **Continuous monitoring is NOT automatically valid.** VWO claims it is, but only if you pre-commit to a loss threshold and don't change it after peeking. In practice, most users don't do this — they stop when results "look good." That's still peeking.
4. **CRO-focused Bayesian tools are built for marketing context** (landing page tests, button colors) where sample sizes are large and effect sizes are modest. Ibotta's offer-level experiments often have smaller populations where the flat prior vs. informed prior choice matters more.
5. **Use VWO's framework as a communication model, not a statistical model.** The "potential loss" framing is excellent for explaining risk to a PM. The underlying statistics should be more rigorous than SmartStats for Ibotta's use case.

## Action Items / Things to Read
- [VWO SmartStats blog](https://vwo.com/blog/bayesian-a-b-testing-a-powerful-reasoning-model/)
- VWO SmartStats technical whitepaper: vwo.com/downloads/VWO_SmartStats_technical_whitepaper.pdf
- Compare with: `articles/statsig-informed-bayesian-ab-testing.md` for risks of flat priors

## Tags
bayesian, conversion-optimization, platform, stakeholder-communication
