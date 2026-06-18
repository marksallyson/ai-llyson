---
title: Media Mix Model Calibration With Bayesian Priors
type: paper
tags: [bayesian, incrementality, quasi-experimental, causal-inference, marketing-measurement, roas, mmm]
source_url: https://research.google/pubs/media-mix-model-calibration-with-bayesian-priors/
added: 2026-06-18
---

# Media Mix Model Calibration With Bayesian Priors

## At a Glance
A 2024 Google Research paper that solves a practical problem in media mix modeling: how do you incorporate A/B experiment results and expert knowledge into an MMM as Bayesian priors? The authors reparameterize the model so that ROAS (Return on Ad Spend) is an explicit parameter, making it straightforward to set a prior directly from incrementality experiment results.

## Why It Matters
MMMs are the primary measurement tool when you can't run a controlled experiment — common in brand-level and CPG advertising. The standard critique of MMMs is that they're observational and produce biased ROAS estimates without external calibration. This paper provides a principled, reproducible way to use your A/B experiment results to calibrate the model — bridging the gap between controlled experimentation and observational marketing measurement.

For Ibotta specifically: CPG client tests are frequently underpowered for frequentist significance (as noted in the experimentation audit). MMMs calibrated with incrementality priors are a legitimate alternative for brand-level measurement when experiment-based ROAS is unreliable.

## Key Methodology

**The core problem:** Standard Bayesian MMMs use priors on media saturation and decay parameters, not directly on ROAS. This makes it hard to incorporate an externally-measured ROAS from an A/B test — the mapping between those parameters and ROAS is nonlinear and opaque.

**The solution:** Reparameterize the model so ROAS is an explicit top-level parameter. You can then set:
- Prior from an A/B test: `ROAS ~ Normal(observed_roas, experiment_uncertainty)`
- Prior from expert knowledge: `ROAS ~ Normal(industry_benchmark, expert_uncertainty)`

**What it buys you:**
- Posterior ROAS estimates with substantially lower bias and uncertainty vs. uncalibrated MMMs (validated via simulation)
- A direct, auditable link between your A/B test results and your MMM output
- A way to propagate uncertainty from the experiment into the model rather than treating the experimental ROAS as a fixed point estimate

## Authors
Yingxiang Zhang, Mike Wurm, Eddie Li, Alexander Wakim, Joseph Kelly, Brenda Price, Ying Liu — Google Research, 2024.

## Takeaways for Practice

1. **CPG incrementality tests that are underpowered for frequentist significance can still calibrate an MMM.** A directional ROAS estimate with wide uncertainty intervals is a valid prior — the model will downweight it appropriately if the data is weak.

2. **The incrementality experiment and the MMM are complementary, not competing.** The experiment gives you a local, short-run ROAS estimate; the MMM gives you a portfolio-level, long-run view. Calibrating the MMM with the experiment combines both.

3. **This is directly relevant to Ibotta's CPG audit findings.** The audit found CPG client tests showing ~5x inflated effects — a symptom of underpowering and possible observational bias. Calibrated MMMs are a more credible external measurement story for brand partners.

4. **Prior specification requires discipline.** The same risk flagged in `statsig-informed-bayesian-ab-testing.md` applies here: a stakeholder-influenced prior can make the model say what they want to hear. The prior must come from the experiment or documented industry data, not from the brand team's ROAS target.

5. **Uncertainty propagation matters.** Don't collapse your experimental ROAS to a point estimate when setting the prior. Use the full confidence interval as the prior's standard deviation — otherwise you're expressing false certainty.

## Scope Note
This paper is at the edge of this plugin's core scope (A/B testing program practices). It belongs here because it directly connects A/B experiment results to a practical measurement problem Ibotta faces with CPG clients. It is **not** a guide to running A/B tests — it's a guide to what to do with A/B results when the experiments themselves are underpowered.

## Action Items / Things to Read
- Read alongside `knowledge-base/papers/objective-bayesian-ab-testing-deng.md` — similar empirical Bayes philosophy applied to a different problem
- See `skills/experiment-strategy/references/incrementality.md` for the Ibotta incrementality measurement context
- The CPG post-hoc power analysis case study in Confluence (Emma English) is the direct Ibotta use case for this paper

## Tags
bayesian, incrementality, quasi-experimental, causal-inference, marketing-measurement, roas, mmm
