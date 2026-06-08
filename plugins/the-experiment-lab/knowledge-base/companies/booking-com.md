---
title: Booking.com
type: company
tags: [organizational-maturity, democratization, platform, metric-design, sequential-testing, two-sided-markets]
source_url: https://booking.ai
added: 2026-06-04
---

# Booking.com

## At a Glance
Booking.com runs 25,000+ concurrent experiments — one of the highest densities of any company globally. Lukas Vermeer built both the technical infrastructure and the organizational culture that made this possible, including giving non-technical product and marketing teams access to run experiments without engineering support.

## Why They Matter
Booking.com is the canonical case study for "democratized experimentation at scale." Their story is especially relevant to Ibotta because promotions and offer design decisions are often made by brand/marketing teams, not engineers — and the gap between "who runs experiments" and "who makes decisions" is where experimentation culture either grows or dies. Booking's approach of building trust through education, clear metric ownership, and guardrail systems is directly replicable.

## Key Contributions
- **25k+ concurrent experiments**: achieved through strict layering, automated guardrail checking, and decentralized ownership
- **Non-technical experiment authoring**: product managers and marketers can define and launch experiments via UI without engineering tickets
- **"Democratizing Online Controlled Experiments at Booking.com"** (Vermeer et al., 2019): academic paper documenting the culture and infra work
- **Guardrail metrics system**: automated alerts if any business-critical metric degrades below a threshold during an experiment, regardless of the primary metric
- **Conversion funnel experimentation**: Booking runs experiments at every stage of the booking funnel — including pricing, trust signals, and urgency messaging — with clear incrementality framing
- **Trust-building through education**: internal certification programs, experiment review boards, and mandatory training before teams can own experiments

## Takeaways for Practice
1. **Guardrail metrics are non-negotiable.** For every Ibotta experiment, define 2-3 guardrails (e.g., app crash rate, unsubscribe rate, brand-funded offer budget burn) that trigger a stop if breached, regardless of whether the primary metric improves. Booking bakes this into the platform; if Ibotta doesn't have it, document it manually in every experiment design.
2. **If brand/category managers want to test offer design but can't get engineering time, the bottleneck is cultural and tooling, not statistical.** Booking's answer was self-serve experiment tooling. Ibotta's short-term answer might be templatized experiment requests with pre-built analysis notebooks.
3. **Democratization without education creates bad experiments.** Booking required training before teams could launch. Any push to expand experiment access at Ibotta should be paired with a "what makes an experiment trustworthy" guide.
4. **For offer experiments with urgency or scarcity messaging (e.g., "Offer expires in 3 days"), Booking's conversion funnel testing is directly relevant.** They've run thousands of these and have a clear framework for measuring funnel lift vs. baseline churn.
5. **Read Vermeer's 2019 paper as a blueprint for building internal experimentation culture.** It's one of the most practical org-building documents in the field.

## Action Items / Things to Read
- Vermeer et al. (2019) "Democratizing Online Controlled Experiments at Booking.com" — arXiv:1710.08217
- booking.ai blog — https://booking.ai
- Lukas Vermeer's conference talks (search YouTube: "Lukas Vermeer experimentation")
- "It's All A/Bout Testing: The Netflix Experimentation Platform" vs. Booking.com blog post comparison — good contrast in cultures

## Tags
organizational-maturity, democratization, platform, metric-design, guardrail-metrics, two-sided-markets, funnel, non-technical-access

---

## Recent: 2026-05-22 — Meta-experiments: Improving Experimentation Through Experimentation

**Sources:** [Booking.com ML & DS Blog](https://booking.ai/meta-experiments-improving-experimentation-through-experimentation-6bdee314c512) · [arXiv:2406.16629](https://arxiv.org/abs/2406.16629) — Melanie Mueller (Senior PM - Experimentation, Booking.com)

### What It Is
A blog post and associated academic paper describing how Booking.com runs A/B tests on the experimentation *process itself* — what they call "meta-experiments." Instead of testing a product feature, a meta-experiment tests a change to how experiments are designed, powered, or managed. The concrete example: a meta-experiment testing a change to the power-calculation UX that helped product teams run more sufficiently powered experiments.

The post also makes a "dogfooding" argument: when the experimentation platform team runs meta-experiments, they encounter firsthand the same friction their users face — choosing the right randomization unit, picking metrics, interpreting results under uncertainty. This reveals platform pain points that user support tickets don't surface.

Booking.com's experimentation model is decentralized (product teams run their own experiments) with a centralized platform team maintaining methodology standards. Meta-experiments are how the platform team validates its own interventions — a clean application of the scientific method to organizational process.

### Why It Matters for Ibotta
If Ibotta experiments are frequently underpowered (common when offer-level traffic is thin), the right fix may not be "run experiments longer" but "test whether a better power calculator or design review process changes behavior." A meta-experiment on Ibotta's pre-experiment checklist could directly measure whether it reduces underpowered launches. This is also an argument for the experimentation platform team to eat their own cooking — if the team that defines experiment standards hasn't run an experiment on their own standards, they're operating on intuition.
