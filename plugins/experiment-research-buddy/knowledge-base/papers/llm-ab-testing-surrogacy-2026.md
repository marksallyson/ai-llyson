---
title: "Statistical Foundations of LLM-based A/B Testing: A Surrogacy Framework for Human Causal Inference"
type: paper
tags: [causal-inference, llm-evals, surrogate-metrics, empirical-bayes, ml-covariate, agentic-ai, experimental-meta-analysis]
source_url: https://arxiv.org/abs/2606.17165
added: 2026-07-13
---

# Statistical Foundations of LLM-based A/B Testing: A Surrogacy Framework for Human Causal Inference

## At a Glance
This June 2026 arXiv paper formalizes what happens when teams try to use large language models as stand-ins for human participants in A/B tests — and finds a hard statistical limit: **LLM outputs recover only 39% of the true human treatment effect in raw form**, and the conditions under which LLM-based testing is valid are hardest to satisfy precisely when LLMs seem most useful. The central takeaway: "A/B testing on LLM responses is correct only by assumption, whereas A/B testing on humans is correct by design."

## Why It Matters
As teams accelerate product development using AI, there's an understandable temptation to run "LLM experiments" — evaluate variants by having an LLM judge which one is better, rather than waiting for real user data. This paper provides the first formal statistical framework for determining *when* that substitution is valid and *how much bias* it introduces when it's not. The findings should be required reading for any DS or product team exploring LLM-powered evaluation workflows.

## Key Contributions
- **Surrogacy framework adapted from clinical trials**: Borrows the surrogate endpoint framework from medicine (where a lab test is used as a proxy for a long-term clinical outcome) and applies it to LLM outcomes as proxies for human behavioral outcomes
- **Two key conditions for validity**: LLM surrogacy is valid only when (1) LLM outcomes are conditionally independent of the treatment given human outcomes (surrogacy condition), and (2) the LLM sample is comparable to the human population (comparability condition) — both assumptions that cannot be verified on new interventions
- **Bias from stochasticity**: LLMs produce different outputs on repeated calls for the same input (stochasticity). This introduces both bias and additional variance in treatment effect estimates. Averaging multiple LLM draws per unit mitigates both, but requires more compute
- **Nonparametric calibration closes the gap**: On the Upworthy Research Archive (4,800+ A/B tests), raw LLM outputs recovered only 39% of the human treatment effect. After nonparametric calibration to historical human outcomes, the gap closes substantially — but calibration requires historical paired data
- **Falsification test**: The paper provides a test that can detect when surrogacy fails for *past* treatments — but emphasizes that this cannot verify surrogacy for *new* treatments, so human experiments remain essential for novel interventions
- **Worst-case is the most interesting case**: The assumptions are hardest to satisfy precisely where LLMs are most appealing — novel interventions for which historical calibration data doesn't exist

## Takeaways for Practice
1. **Do not run "LLM experiments" as a replacement for real A/B tests on novel interventions.** LLM outputs systematically underestimate true human effects and the required assumptions cannot be verified in advance. Use LLMs to *generate* test hypotheses, not to *evaluate* them.
2. **LLM-based pre-screening is defensible with calibration.** If Ibotta has a corpus of historical A/B tests with matched LLM evaluation scores, calibration can make LLM-based pre-screening useful for filtering out clearly bad variants before running real tests. The 39% → near-100% calibration result shows this is achievable.
3. **Average multiple LLM draws per item, not just one.** If using LLMs in any evaluation role (not replacing A/B tests, but for internal QA or copy scoring), averaging 3–5 draws per item materially reduces variance.
4. **The right mental model**: LLM evaluation is like a survey with a biased respondent pool — useful directional signal, not causal measurement. Plan accordingly.
5. **For Ibotta specifically**: If the team is using LLMs to score offer copy, rank promotions, or evaluate creative before testing, treat those scores as inputs to hypothesis generation, not as experiment outcomes.

## Action Items / Things to Read
- Full paper: https://arxiv.org/abs/2606.17165
- Upworthy Research Archive (the empirical dataset used): https://osf.io/vy2hk/
- Related: "AI-Assisted Variance Reduction in Randomized Experiments" (KDD 2026) — the constructive counterpart; about using AI *predictions* as CUPED covariates to reduce variance in real human experiments, which this paper implicitly endorses as the right role for AI
- Surrogate endpoint literature from clinical trials for deeper grounding on the theoretical framework

## Tags
causal-inference, llm-evals, surrogate-metrics, empirical-bayes, ml-covariate, agentic-ai, experimental-meta-analysis
