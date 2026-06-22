---
title: DoorDash
type: company
tags: [causal-inference, cupac, cuped, interleaving, marketplace, ml-covariate, platform, ranking, two-sided-markets, variance-reduction]
source_url: https://doordash.engineering/category/data-science/
added: 2026-06-04
---

# DoorDash

## At a Glance
DoorDash's experimentation team invented CUPAC (CUPED Using Predicted As Control), a variance reduction method that replaces the pre-experiment outcome with an ML-predicted outcome, achieving larger variance reduction than standard CUPED. They also built Dash-AB, their stats engine, and published extensively on interleaving for ranking experiments.

## Why They Matter
CUPAC is the highest-signal contribution from DoorDash for Ibotta's work. Ibotta's offer experiments often have relatively small eligible user populations per experiment cell — variance reduction is critical for achieving adequate power. CUPAC extends CUPED by using a model-predicted outcome (rather than just the pre-period mean) as the covariate, which explains more variance and gives you more effective power. Their interleaving work is also relevant for any ranking/personalization experiments on the Ibotta offer feed.

## Key Contributions
- **CUPAC (CUPED Using Predicted As Control)**: replace pre-experiment mean with an ML model's prediction of the outcome; reduces variance more than standard CUPED; published as an engineering blog post and later formalized
- **Dash-AB**: DoorDash's internal stats engine; handles sequential testing, variance reduction, and metric computation at scale
- **"Improving Experimental Power Through Control Using Predictions as Covariate"** — DoorDash Engineering Blog (2021): the CUPAC post
- **Interleaving for ranking experiments**: instead of A/B testing two ranking algorithms, show each user an interleaved result list and measure which items get clicked — far more sensitive for recommendation system evaluation
- **"1000% experiment capacity" post**: documents how they scaled experiment throughput from 20/month to hundreds/month through tooling, variance reduction, and org changes
- **Two-sided marketplace experiments**: consumer-side vs. dasher-side vs. merchant-side experiment coordination

## Takeaways for Practice
1. **Implement CUPAC for Ibotta's core offer experiments.** Train an ML model to predict the experiment outcome (e.g., redemption probability) using pre-experiment features. Use the model's prediction as the CUPED covariate instead of the pre-period mean. DoorDash reports ~40-60% variance reduction vs. ~20-30% for standard CUPED.
2. **If Ibotta tests different offer feed ranking algorithms, use interleaving instead of A/B testing.** Interleaving is 10-100x more sensitive for ranking comparison because it uses within-user comparisons. Show each user a list that interleaves results from algorithm A and algorithm B; track which items get redeemed.
3. **The "1000% experiment capacity" post is a useful template for a quarterly roadmap pitch** on scaling Ibotta's experimentation infrastructure. Adapt their before/after framing to Ibotta's current state.
4. **For two-sided experiments (offer change affects both consumer behavior and brand budget), DoorDash's framework of coordinating consumer/dasher/merchant experiments is directly applicable** to Ibotta's consumer/brand/retailer structure.
5. **CUPAC requires a trained prediction model, which requires enough historical data.** For new offer types or new brand partners, CUPAC may not be applicable — fall back to standard CUPED or no variance reduction.

## Action Items / Things to Read
- "Improving Experimental Power Through Control Using Predictions as Covariate (CUPAC)" — DoorDash Engineering Blog, 2021
- "Scaling Experimentation at DoorDash" — Engineering Blog series
- "How DoorDash Uses ML, Simulation, and Optimization to Handle Coupon Fraud" — adjacent but relevant to incentive design
- Interleaving methods: "Large-Scale Validation and Analysis of Interleaved Search Evaluation" (Chapelle et al., 2012) — background reading

## Tags
causal-inference, cupac, cuped, interleaving, marketplace, ml-covariate, platform, ranking, two-sided-markets, variance-reduction

---

## Recent: 2026-06-22 — DoorDash's 3-Sided Experimentation Problem

**Source:** GrowthBook Blog, ~May 2026 · https://www.growthbook.io/blog/doordash-runs-12-000-experiments-per-year-across-3-sided-marketplace  
**Speaker:** Ilya Izrailevsky, Senior Engineering Manager, DoorDash Experimentation Platform (previously Amazon, Robinhood, Uber, Intuit, PayPal)

**What they describe:** A practitioner interview covering how DoorDash scales 12,000 experiments/year at 300M feature flag evaluations/second across a three-sided marketplace. The core challenge: every experiment must protect three distinct constituencies simultaneously — consumers (order quality, satisfaction, retention), Dashers (earnings, utilization, fairness), and merchants (unit economics, long-term business growth). DoorDash uses separate success metrics and guardrail metrics for each side, which means a feature that wins on consumer satisfaction might fail the Dasher earnings guardrail and never ship.

**Why it matters:** This is the clearest public description of how a multi-sided marketplace structures experiment decision criteria to avoid harming any side of the platform. The three-bucket metric taxonomy (consumer / dasher / merchant) is directly transferable to Ibotta's structure (consumer / brand partner / retailer).

**Ibotta relevance:** Ibotta is structurally a 3-sided marketplace: consumers who redeem offers, brands that fund promotions, and retailers that host offers in-store/online. An Ibotta experiment that improves consumer redemption rate might simultaneously degrade brand partner ROI (if consumers switch to cheaper alternatives) or retailer traffic patterns. DoorDash's per-constituency guardrail framework is the right architecture for Ibotta to adopt when testing offer-level changes.

**Tags added:** three-sided-marketplace, guardrail-metrics, democratization, platform-scale
