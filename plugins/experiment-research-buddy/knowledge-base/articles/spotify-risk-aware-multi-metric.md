---
title: "Risk-Aware Product Decisions in A/B Tests with Multiple Metrics"
type: article
tags: [always-valid-inference, guardrail-metrics, metric-design, multiple-testing, sequential-testing, spotify, type-i-error]
source_url: https://engineering.atspotify.com/2024/03/risk-aware-product-decisions-in-a-b-tests-with-multiple-metrics
added: 2026-06-15
---

# Risk-Aware Product Decisions in A/B Tests with Multiple Metrics

**Authors**: Schultzberg, Ankargren, Frånberg (Spotify)
**Venue**: Spotify Engineering Blog, March 2024
**Source**: https://engineering.atspotify.com/2024/03/risk-aware-product-decisions-in-a-b-tests-with-multiple-metrics

## At a Glance
Spotify's 2024 formalization of their multi-metric decision framework — a frequentist system that controls false positive AND false negative risks across four categories of metrics (success, guardrail, deterioration, quality), with a novel beta correction for guardrail metrics built from scratch in 2019-2020.

## Why They Matter
This is how a world-class experimentation team handles the hardest practical problem in A/B testing: making a ship/no-ship decision when you have multiple metrics pointing in different directions. Their insight — that guardrail metrics need *power* corrections, not alpha corrections — is non-obvious and directly applicable to Ibotta's multi-metric experiments.

## Key Contributions
- **Four metric categories**: success (superiority test), guardrail (non-inferiority test), deterioration (inferiority test), quality (validates experiment integrity)
- **Alpha corrections only for success metrics**: when testing multiple success metrics, apply Bonferroni/BH to control family-wise error. Guardrail metrics are NOT alpha-corrected.
- **Beta corrections for guardrails**: testing non-inferiority across multiple guardrails simultaneously requires *power* adjustments proportional to the number of guardrails — each additional guardrail demand increases the risk of falsely concluding "no harm." This is the key insight most teams miss.
- **Built from scratch in 2019-2020**: replaced "time-consuming, manual effort with no standardized approach" — a reminder that even Spotify once had an ad hoc process
- **Fully frequentist**: no Bayesian elements; validates that sophisticated multi-metric decision-making doesn't require Bayesian methods

## Takeaways for Practice
1. **Separate your metrics into these four categories before every Ibotta experiment.** "What are we trying to move?" (success) vs. "What must we not break?" (guardrail) vs. "What would tell us something went wrong?" (quality) are different questions requiring different statistical treatment.
2. **Guardrail metrics need power, not alpha.** At Ibotta, if you're testing a new offer UI and your guardrails are redemption reversal rate + CS contact rate + app crash rate, you need to power your experiment to detect a meaningful degradation in ALL three — not just one. Adding more guardrails requires more power.
3. **Don't apply Bonferroni to guardrail metrics.** It's tempting but wrong. Bonferroni controls false positives (falsely concluding harm); for guardrails you're more worried about false negatives (missing actual harm). Tighten the non-inferiority margin, not the alpha.
4. **The "from scratch in 2019-2020" note is reassuring.** Ibotta doesn't need to solve this perfectly on day one. The goal is a standardized, pre-committed decision framework — even a simple one beats ad hoc analysis.
5. **This framework is entirely frequentist.** If stakeholders ask why Ibotta doesn't use Bayesian testing, Spotify's multi-metric framework is evidence that rigorous, nuanced experimentation doesn't require it.

## Action Items / Things to Read
- [Full Spotify Engineering post](https://engineering.atspotify.com/2024/03/risk-aware-product-decisions-in-a-b-tests-with-multiple-metrics)
- Johari et al. mSPRT — Spotify's sequential testing foundation; see `papers/peeking-problem.md`
- Spotify Confidence platform docs — this framework is implemented in Confidence; see `companies/spotify.md`
- Benjamini & Hochberg (1995) — FDR control foundational paper; relevant for success metric alpha corrections

## Tags
always-valid-inference, guardrail-metrics, metric-design, multiple-testing, sequential-testing, spotify, type-i-error
