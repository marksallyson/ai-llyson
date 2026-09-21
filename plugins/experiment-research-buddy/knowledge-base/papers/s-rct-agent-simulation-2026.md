---
title: "Can AI Agents Simulate A/B Test Outcomes? A Validation Framework for Agentic Experimentation"
type: paper
tags: [agentic-ai, llm-evals, platform-evaluation, variance-reduction, experiment-quality, pre-experiment-screening, marketing-measurement]
source_url: https://arxiv.org/abs/2608.02345
added: 2026-08-24
---

# Can AI Agents Simulate A/B Test Outcomes? A Validation Framework for Agentic Experimentation

## At a Glance
Can you use an AI agent to predict the outcome of an A/B test before running it on real users — skipping the traffic cost, the engineering effort, and the weeks of wall-clock time? Stefan Hut and Lorenzo Masoero (Amazon Science / COLM 2026) formalize this as a Simulated Randomized Controlled Trial (S-RCT) and find: an off-the-shelf foundation model gets the *direction* right 70% of the time but systematically overstates the *magnitude* of effects.

## Why It Matters
Running every candidate feature as a full A/B test is expensive. Teams with constrained traffic — say, a small brand's offer on a cashback platform — often can't achieve adequate power for more than a few experiments per quarter. If an AI simulation can reliably screen out the 60–70% of treatments that would have no effect, it effectively multiplies experiment capacity without touching the infrastructure. The catch: the simulation must be calibrated, not just directionally correct.

## Key Contributions
- **S-RCT framework**: formalizes "simulated randomized controlled trial" as a first-class experimental primitive. An AI agent is conditioned on a behavioral profile (user history, context) and a description of the intervention, then asked to simulate the outcome. The resulting distribution is treated like an experimental sample.
- **Two-layer error decomposition**: separates *agent approximation error* (how closely the model matches real human behavior) from *subsampling error* (statistical noise from finite simulation draws). This lets practitioners target improvements: get more simulations to reduce the latter, get a better model to reduce the former.
- **Empirical validation on 67 marketing A/B tests**: a baseline S-RCT using an off-the-shelf foundation model achieves sign overlap 0.70 with real experimental outcomes. However, it overshoots effect magnitude — if the real uplift was 2%, the simulation might predict 6%. Calibration is required before simulation can drive go/no-go decisions.
- **Agent-agnostic design**: any behavioral model — fine-tuned specialist, general-purpose LLM, or a retrieval-augmented system — can serve as the simulation engine. The framework doesn't depend on a specific model architecture.
- **COLM 2026 presentation**: accepted to the Conference on Language Models 2026, indicating peer review from both the NLP and experimentation communities.

## Takeaways for Practice
1. **Use S-RCTs to prioritize, not replace, real experiments.** A simulated sign agreement rate of 70% means 30% of the time the model points in the wrong direction. Don't kill an experiment because the simulation says "no effect" — use it to deprioritize weak candidates, not to approve launches.
2. **Calibrate simulation magnitudes before trusting them.** The systematic magnitude overshoot is predictable: apply a post-hoc correction factor derived from a held-out historical calibration set. If Ibotta runs dozens of similar offer types, historical A/B results can be used to calibrate the simulation for offer-level tests.
3. **The subsampling error term is free to reduce.** Running more simulation draws from the AI agent costs only compute — not traffic. If you have uncertainty about a prediction, increase draws before concluding the simulation is uninformative.
4. **This is the right moment to experiment with S-RCTs.** The framework is new enough that teams who invest in calibration now will have a proprietary advantage in 12 months — especially for fast-cycle testing (promotions, copy, offer structure) where real experiments are traffic-constrained.
5. **For Ibotta offer tests**: AI simulation of offer redemption behavior is plausible — LLMs trained on consumer behavior patterns could serve as behavioral proxies. The magnitude calibration problem is the key unsolved piece; solve it on historical data before deploying.

## Action Items / Things to Read
- arXiv:2608.02345 — full paper: https://arxiv.org/abs/2608.02345
- Amazon Science publication page: https://www.amazon.science/publications/can-ai-agents-simulate-a-b-test-outcomes-a-validation-framework-for-agentic-experimentation
- Related: arXiv:2606.17165 — "Statistical Foundations of LLM-based A/B Testing" (already in KB) — complementary framing of when LLM simulation is valid
- Related: SimGym (arXiv:2605.19219) — A/B test simulation framework for e-commerce using vision-language model agents

## Tags
agentic-ai, llm-evals, platform-evaluation, experiment-quality, pre-experiment-screening, marketing-measurement, agentic-experimentation
