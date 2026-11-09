---
title: "GrowthBook 5.2: Interleaving Experiments and Human-in-the-Loop for Agents"
type: article
tags: [agentic-experimentation, agentic-ai, interleaving, open-source, platform, ranking, human-in-the-loop]
source_url: https://www.growthbook.io/blog/growthbook-version-5-2
added: 2026-11-09
---

# GrowthBook 5.2: Interleaving Experiments and Human-in-the-Loop for Agents

## At a Glance
GrowthBook — the leading open-source experimentation platform — released version 5.2 on November 3, 2026, shipping two notable features: native support for interleaving experiments (the gold-standard method for ranking/recommendation algorithm comparisons) and "Human in the Loop" (HITL), a governance layer for agentic A/B testing workflows that requires human sign-off before an AI agent takes a consequential action.

## Why It Matters
GrowthBook 5.2 brings two previously enterprise-only or academic-only capabilities to an open-source platform for the first time:

**Interleaving experiments:** Interleaving (also called interleaved evaluation) is a technique for comparing two ranking algorithms by mixing their results on a per-user, per-session basis and observing which algorithm's items are clicked more. It is 10–100× more statistically efficient than a standard A/B test for ranking comparisons because the two variants compete directly within the same session rather than across separate user groups. Netflix, LinkedIn, Airbnb, and Pinterest all use interleaving for their recommendation systems. GrowthBook 5.2 ships this as a first-class experiment type, making it accessible to teams without the engineering resources to build it in-house.

**Human in the Loop (HITL) for agents:** As AI agents begin to participate in experiment operations — reading results, flagging regressions, recommending launches — the question of oversight becomes critical. GrowthBook's HITL layer defines checkpoints where an AI agent must pause and get human confirmation before proceeding. The examples given: an agent flagging a stat-sig win on a secondary metric must confirm before auto-advancing the rollout percentage; an agent detecting a guardrail violation must wait for human acknowledgment before killing the experiment. This is governance design for the agentic experiment workflow, not just a feature — it reflects a broader question the industry is starting to ask: how much can an agent do autonomously before the human DS must check in?

## Key Contributions
- **Interleaving as a native experiment type**: select "Interleaving" from the experiment designer; GrowthBook handles position-debiased metrics, within-session assignment, and result aggregation automatically
- **HITL checkpoints**: define human review gates at any stage of an agentic loop (rollout advancement, experiment killing, metric flagging); agents operate within defined boundaries
- **Remote saved groups**: reusable audience targeting definitions shareable across experiments without duplicating logic
- **UX overhaul**: experiment review flow redesigned to reduce time from "result ready" to "launch or kill decision"

## Takeaways for Practice
1. **If Ibotta ranks offers in a feed, interleaving is the right tool for evaluating ranking algorithm changes — not a standard A/B test.** A standard A/B test on a ranking change requires a large sample to detect a meaningful effect because the variance comes from inter-user differences. Interleaving detects within-session preference, cutting required sample dramatically. GrowthBook 5.2 makes this accessible without building it from scratch.
2. **The HITL concept is worth adopting as a design principle even if not using GrowthBook.** For any agentic workflow that touches live experiments — Claude reading dashboards and recommending next steps — define explicitly which actions require a human sign-off (rollout changes, kills, launches) vs. which can be automated (fetching results, flagging outliers, drafting write-ups).
3. **GrowthBook's open-source nature makes 5.2 a low-friction upgrade** compared to vendor platform evaluations. If Ibotta runs experiments on Databricks with bespoke analysis notebooks, GrowthBook can sit on top as the assignment + metric layer without displacing the warehouse.
4. **Watch the interleaving + HITL combination closely.** An agent that can run interleaving comparisons and report back to a human for the launch decision is a plausible near-term agentic workflow for ranking experiments at Ibotta.

## Action Items / Things to Read
- GrowthBook 5.2 release blog: https://www.growthbook.io/blog/growthbook-version-5-2
- GrowthBook docs on interleaving: https://docs.growthbook.io/experiments/interleaving (search if URL changes)
- LinkedIn's original interleaving paper for the statistical foundations: Chapelle et al., "Large-Scale Validation and Analysis of Interleaved Search Evaluation" (2012)
- DoorDash's interleaving write-up for a marketplace context: https://doordash.engineering/2024/08/27/doordash-experimentation-with-interleaving-designs/

## Tags
agentic-experimentation, agentic-ai, interleaving, open-source, platform, ranking, human-in-the-loop
