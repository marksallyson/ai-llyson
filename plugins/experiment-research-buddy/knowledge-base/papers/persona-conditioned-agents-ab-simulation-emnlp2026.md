---
title: "Data-Driven Persona-Conditioned Agents for A/B Test Simulation"
type: paper
tags: [agentic-experimentation, agentic-ai, simulation, surrogate-metrics, llm-evals, behavioral-data, pre-screening, platform-evaluation]
source_url: https://arxiv.org/abs/2609.01038
added: 2026-09-21
---

# Data-Driven Persona-Conditioned Agents for A/B Test Simulation

**Authors:** Ziyad Benomar, Weronika Łajewska, Leonardo Perilli, Saab Mansour (Amazon)  
**Venue:** EMNLP 2026 Industry Track  
**arXiv:** 2609.01038 (submitted September 1, 2026)

## At a Glance

Amazon researchers propose a simulation framework that uses LLM-powered agents — each conditioned on *real* user behavioral data, not synthetic personas — to predict which A/B test variant users will prefer. On a benchmark of 40 A/B tests spanning two outcome types, the best configuration achieves 0.75–0.90 directional accuracy. The goal is pre-screening: quickly filtering many design candidates to a short list before running live traffic experiments.

## Why They Matter

This paper directly advances the line of research that asks: *can AI simulation replace or reduce the cost of live A/B testing?* The critical innovation over prior work (including the Amazon S-RCT paper in this KB) is the persona grounding — agents are built from each user's own anonymized activity patterns, engagement signals, and inferred demographics, rather than from synthetic or rule-based characterizations. More faithful population modeling means the simulation is less likely to diverge from real behavior in the ways that matter most for directional decisions.

The EMNLP Industry Track acceptance signals peer-reviewed, practical orientation — this is meant to be deployed, not just theorized.

## Key Contributions

- **Behavioral-data-grounded personas:** Agents are constructed from anonymized user behavioral data (activity patterns, engagement signals, inferred demographics), not generic descriptions or synthetic profiles. Makes agents store- or platform-specific rather than generic.
- **Structured task framing:** A/B test simulation is framed as a structured question task — agents are asked to compare variants directly rather than generate open-ended responses, making outputs consistent and measurable.
- **Directional accuracy benchmark:** 0.75–0.90 directional accuracy on 40 A/B tests (two metric types). Honest framing: this is a filter, not a replacement. The paper recommends pairing simulation pre-screening with a live validation on finalist variants.
- **Question design analysis:** Systematic study of how question framing affects simulation accuracy — a practical guide for teams adopting the approach.
- **Persona data ablation:** Shows that behavioral data improves over generic personas, quantifying the contribution of each data type (activity vs. engagement vs. demographic signals).

## Takeaways for Practice

1. **Use agent-based simulation as a pre-screener, not a replacement.** At 0.75–0.90 directional accuracy, simulation correctly identifies the better variant 3 in 4 to 9 in 10 times. Run simulation on 5-10 design candidates; eliminate clear losers; test the 2-3 finalists with real traffic. You save experiment slots and runtime on the candidates that would have lost anyway.
2. **Ground personas in your own behavioral data.** Generic LLM personas — "budget-conscious shopper" or "brand-loyal user" — are less predictive than personas built from actual activity logs. Ibotta has rich behavioral signals (redemption history, category affinities, session patterns, engagement with notification types) that could ground a set of offer-specific user archetypes.
3. **Question design matters for accuracy.** How you frame the simulation question to the agent affects directional accuracy substantially. Invest in a calibration run on historical experiments before using simulation for live decisions.
4. **Track calibration over time.** User behavior drifts, and personas built on historical data become stale. Treat the simulation system like a model: monitor its directional accuracy against actual experiment outcomes and refresh personas on a regular cadence.
5. **The 10-25% wrong-direction rate is not negligible for high-stakes decisions.** Simulation is safe for early-stage screening of many low-stakes variants. For major offer mechanic changes or high-budget brand partnership decisions, still run the live experiment.

## Action Items / Things to Read

- Full paper: https://arxiv.org/abs/2609.01038
- Related in this KB: `papers/s-rct-agent-simulation-2026.md` (Amazon Science, earlier S-RCT framework)
- Related in this KB: `companies/shopify.md` (SimGym — traffic-grounded VLM agents for storefront A/B testing)
- Related in this KB: `papers/llm-ab-testing-surrogacy-2026.md` (formalizes when LLM-based evaluation is valid vs. assumption-dependent)

## Tags
agentic-experimentation, agentic-ai, simulation, surrogate-metrics, llm-evals, behavioral-data, pre-screening, platform-evaluation
