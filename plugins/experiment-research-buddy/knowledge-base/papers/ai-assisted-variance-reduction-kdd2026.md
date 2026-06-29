---
title: "AI-Assisted Variance Reduction in Randomized Experiments"
type: paper
tags: [variance-reduction, cuped, ml-covariate, regression-adjustment, prognostic-score, ai, kdd]
source_url: https://arxiv.org/abs/2606.08853
added: 2026-06-29
---

# AI-Assisted Variance Reduction in Randomized Experiments

## At a Glance
Arbour, Ben-Michael, Feller, Lal, & Yuan (KDD 2026). Any AI-generated prediction — from a fine-tuned LLM to a gradient-boosted model — can be dropped into standard regression adjustment as a covariate to reduce variance in randomized experiments, with a formal "do no harm" guarantee that the method degrades gracefully to the unadjusted estimator when the predictions are uninformative.

## Why They Matter
CUPED and CUPAC require a specific kind of covariate: one that correlates with the outcome and is available pre-experiment. That rules out rich text, images, behavioral sequences, and anything that requires an LLM or complex model to summarize. This paper removes that restriction entirely. If you can generate a prediction of the outcome using any model — including foundation models — you can use that prediction as a CUPED-style covariate without changing your estimator or making new assumptions. The "do no harm" property is the key practical contribution: teams don't need to vet whether their AI predictor is good enough before using it; if it's weak, it just doesn't help, it doesn't hurt.

The author list is exceptional: Arbour (Adobe Research), Ben-Michael (CMU), Feller (UC Berkeley), Lal (OpenAI), and Yuan (Airbnb) represent the practitioner-academic bridge that produces the most durable experimental methods work.

## Key Contributions
- **AI prediction as a prognostic score covariate**: include any model's prediction of the outcome as an additional covariate in OLS regression; the coefficient is estimated from data, so a bad predictor simply gets a near-zero weight
- **"Do no harm" property**: formally proved — the adjusted estimator has variance ≤ the unadjusted estimator in expectation; no minimum quality bar required before using AI predictions
- **No new estimator required**: this is standard regression adjustment (CUPED), not a new method; teams with existing CUPED pipelines can add AI predictions with no infrastructure changes
- **Empirical applications**: validated on three empirical settings — a survey mega-study, an email marketing A/B test, and a large-scale technology platform experiment; "efficiency gains are real if modest, with greater benefits in studies that contain substantial text and other unstructured data"
- **Foundation models as variance reducers**: LLMs that generate embeddings or scalar outcome predictions can be used as covariates; this is the first major paper to formalize that connection
- **KDD 2026 (camera ready)**: top-tier data mining conference with strong practitioner review standard

## Takeaways for Practice
1. **Add an AI-predicted outcome score to your CUPED pipeline and see what happens.** For Ibotta offer experiments, train a simple model on pre-experiment data predicting redemption probability, then add the model's prediction as an additional CUPED covariate. The "do no harm" guarantee means you can't make things worse, only better.
2. **LLM embeddings of offer copy or product descriptions are now valid covariates.** If offer creative quality predicts redemption, you can generate an LLM relevance or quality score for each unit's pre-experiment offer history and include it as a covariate — no additional statistical risk.
3. **For text-heavy experiments (e.g., A/B testing Ibotta offer copy or brand messaging), the efficiency gains are larger.** The paper explicitly notes that unstructured data (text) is where AI predictions contribute the most variance reduction, because linear CUPED can't capture it.
4. **This simplifies the CUPAC vs. CUPED decision.** CUPAC (DoorDash's approach) requires building and validating an ML pipeline before each experiment. The AI-assisted approach lets you use any available prediction without a dedicated pipeline — lower overhead, similar benefit.
5. **The "do no harm" guarantee changes the adoption calculus.** Teams that hesitated to adopt ML-based variance reduction because they weren't confident in their model quality can now adopt it freely — bad models are harmless, good models provide gains.

## Action Items / Things to Read
- Paper (arXiv): https://arxiv.org/abs/2606.08853
- HTML version: https://arxiv.org/html/2606.08853
- Related: CUPED paper (Deng et al., KDD 2013) — `papers/cuped-paper.md`
- Related: DoorDash CUPAC — `companies/doordash.md`
- Related: Post-stratification for heavy-tailed metrics (SIGIR 2026) — `papers/heavy-tailed-monetization-variance-poststrat-2026.md`
- Background: Feller & Holmes (2009) "Beyond Toplines" — prognostic score adjustment in clinical trials; the conceptual ancestor of this paper

## Tags
variance-reduction, cuped, ml-covariate, regression-adjustment, prognostic-score, ai, kdd
