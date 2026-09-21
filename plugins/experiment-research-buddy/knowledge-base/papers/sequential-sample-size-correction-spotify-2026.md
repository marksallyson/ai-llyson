---
title: "A Closed-Form Sample Size Correction for Always-Valid Inference with Optional Stopping"
type: paper
tags: [sequential-testing, always-valid-inference, sample-size, variance-reduction, platform, peeking]
source_url: https://arxiv.org/abs/2606.18366
added: 2026-08-24
---

# A Closed-Form Sample Size Correction for Always-Valid Inference with Optional Stopping

## At a Glance
Sequential A/B tests — the kind that let you peek at results any time without inflating your false positive rate — are typically sized using a conservative heuristic that wastes traffic. Mårten Schultzberg (Spotify) derives a closed-form correction factor k* that tells you exactly how big a sequential test needs to be relative to a fixed-sample test, with no simulation required. In production at Spotify, this saves a median of 9.5% of sample budget across 713 metrics.

## Why It Matters
Sequential testing (always-valid inference) is increasingly the default for teams that want analysts to check results mid-experiment without compromising statistical validity. The catch: the standard sizing approach — take a fixed-sample size calculator and add some percentage as a buffer — is both conservative (wastes 8–20% of traffic) and unprincipled (the buffer is guesswork). This paper replaces the guesswork with a formula derived from first principles, validated across every major boundary family used in practice.

## Key Contributions
- **The core problem**: "last-point" sizing for sequential tests treats the experiment as if you only look at the final result — but sequential tests give you credit for early stops. This mismatch causes systematic oversizing.
- **The fix**: closed-form correction factor k*(α, β, t₀) expressed in elementary functions and the bivariate normal CDF, where t₀ = m/n_z is the fraction of the sample allocated to a burn-in period. Setting sample size to k* · n_z hits empirical power within ~3 percentage points of target in Gaussian simulations.
- **8–20% sample savings**: across the realistic operating range of (α, β, t₀) values, the correction reduces sample size relative to last-point sizing by 8–20%. For a platform running thousands of experiments per year, this is a non-trivial reduction in traffic committed to experiments.
- **Validated across three boundary families**: the correction holds for mSPRT (mixture sequential probability ratio test), GAVI (group-sequential always-valid inference), and Brownian motion boundaries — the three most common families used in practice.
- **Production validation at Spotify**: median sample-size saving of 9.5% across 713 real metrics on Spotify's experimentation platform. The savings are consistent rather than driven by a few extreme cases.
- **No simulation required**: prior approaches to sizing sequential tests require Monte Carlo simulation that is expensive to run at scale across many metrics. This formula runs instantly.

## Takeaways for Practice
1. **If Ibotta uses sequential testing, resize your experiments with this formula.** The standard approach in most platforms (including many commercial tools) uses the overly conservative last-point heuristic. Applying k* could meaningfully reduce the traffic you need to commit to each experiment.
2. **The burn-in fraction t₀ is a tunable parameter.** Setting a larger burn-in (more fixed-sample-like) is more conservative but requires less correction. Setting a smaller burn-in (more aggressive sequential) requires a larger correction but allows earlier stopping. Tune to your team's typical peeking behavior.
3. **Ask your experimentation platform vendor which sizing formula they use.** If the answer is "we inflate by X%" with no first-principles justification, this paper gives you the language to ask for better. Confidence (Spotify's platform), based on this work, likely already implements it.
4. **For offer-level experiments at Ibotta**: if you're running sequential tests on CPG offer redemption, the 9.5% sample saving means fewer users need to be exposed to an unproven offer variant — directly reducing the cost of experimentation on smaller brands with limited traffic.
5. **The bivariate normal CDF is easy to compute.** Any statistician can implement this in Python in ~20 lines using `scipy.stats`. This doesn't require new tooling — just a more principled sample size calculation.

## Action Items / Things to Read
- arXiv:2606.18366 — full paper: https://arxiv.org/abs/2606.18366
- Related: KB entry on peeking-problem.md — the foundational mSPRT paper this builds on
- Related: Spotify's Bayesian overview paper (arXiv:2608.12949, already in KB) — complementary Bayesian framing by the same team
- Schultzberg's prior work: "Bayesian Inference Procedures for A/B Testing" (already in KB) — same author's conceptual framing

## Tags
sequential-testing, always-valid-inference, sample-size, variance-reduction, platform, peeking, msprt
