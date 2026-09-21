---
title: Airbnb
type: company
tags: [causal-inference, interference, marketplace, ml-integration, organizational-maturity, platform, sutva, switchback, two-sided-markets]
source_url: https://medium.com/airbnb-engineering/experimentation-and-testing
added: 2026-06-04
---

# Airbnb

## At a Glance
Airbnb built their experimentation culture largely from scratch, accelerating when Ron Kohavi joined as VP of Research, Data Science & Engineering. Their engineering blog documents the challenges of running experiments on a two-sided marketplace where hosts and guests interact — and where you can't randomize price without violating marketplace integrity.

## Why They Matter
Airbnb's two-sided marketplace structure (hosts + guests) is the closest public analog to Ibotta's structure (brands/retailers + consumers). Offer experiments at Ibotta face the same problem: you can't randomize an offer's value to individual users without affecting the brand's budget and the retailer's margins. Airbnb's work on SUTVA violations in marketplace experiments, and their framework for when to use switchback vs. user-level randomization, is directly applicable.

## Key Contributions
- **Two-sided marketplace experiment framework**: documented which experiments can be randomized at the user level vs. which require market-level or time-based (switchback) designs
- **SUTVA violation taxonomy**: clear documentation of when and why the Stable Unit Treatment Value Assumption fails in marketplace settings
- **ML × experiment integration**: Airbnb integrated experiment results into ML feature pipelines — treatment effect estimates inform model training
- **"Scaling Airbnb's Experimentation Platform"** (Medium/Airbnb Engineering): multi-part series on their infra evolution
- **Cohort-based holdouts** for measuring long-term host and guest behavior changes
- **Chetan Sharma's early data science work**: foundational experimentation culture before Kohavi; Eppo's current design reflects those learnings

## Takeaways for Practice
1. **Before designing any offer experiment, explicitly check whether SUTVA holds.** If you randomize an Ibotta offer's discount value at the user level (group A sees 10%, group B sees 20%), does that change the brand's campaign budget allocation? If yes, the randomization is compromised.
2. **Use time-based switchback designs for experiments where user-level randomization is impossible.** Airbnb used this for pricing experiments; Ibotta can use it for offer feed ranking experiments where showing different rankings to different users on the same night would be incoherent.
3. **Separate "did the experiment work?" from "should we ship it?"** Airbnb's culture under Kohavi separated statistical significance from business decision — a statistically significant 0.1% lift on a feature that costs 10 engineers 6 months to maintain is still a no.
4. **ML model training that uses experiment results as features creates a feedback loop.** If Ibotta trains personalization models on experiment data, document which experiments informed which model versions, or you'll lose the ability to attribute future performance changes.
5. **The Airbnb Engineering blog's experimentation series is worth reading end-to-end** — it's one of the most honest accounts of how messy real-world experiment infrastructure gets before it gets clean.

## Action Items / Things to Read
- Airbnb Engineering Blog: medium.com/airbnb-engineering — search "experimentation"
- "Experiments at Airbnb" — original blog post, 2014
- Kohavi, Tang, Xu (2020) *Trustworthy Online Controlled Experiments* — Ch. 22 on two-sided markets
- Johari et al. (2015) "Peeking at A/B Tests: Why It Matters and What to Do About It" — Airbnb + Stanford collaboration

## Tags
causal-inference, interference, marketplace, ml-integration, organizational-maturity, platform, sutva, switchback, two-sided-markets

---

## Recent: 2025-08 — Harnessing the Power of Interleaving and Counterfactual Evaluation for Airbnb Search Ranking

**Source:** KDD 2025 (31st ACM SIGKDD Conference on Knowledge Discovery and Data Mining) · arXiv:2508.00751  
**Authors:** Qing Zhang, Alex Deng, Michelle Du, Huiji Gao, Liwei He, Sanjeev Katariya (Airbnb Relevance Team)  
**URL:** https://arxiv.org/abs/2508.00751

**The problem:** For search ranking experiments, measuring success via booking conversion requires enormous sample sizes and long runtimes — a standard A/B test for a ranking change at Airbnb could take weeks to power. Offline evaluation (ranking metrics like NDCG) is fast but poorly correlated with actual booking outcomes.

**What they built and measured:**
- **Interleaving**: instead of splitting users into treatment and control groups, both ranking algorithms compete directly in each session — the treatment algorithm ranks some results, the control ranks others, and user clicks reveal which ranking is better. Achieved approximately **50x speedup** in sensitivity vs. standard A/B testing for the same traffic volume.
- **Counterfactual Evaluation (ULCB — Unbiased Learning to rank with Click Behavioral feedback)**: a more generalizable approach that uses click data from production to estimate what would have happened under a different ranking policy, without requiring any simultaneous interleaving. Achieved up to **100x sensitivity improvement** vs. standard A/B testing in the traffic needed to achieve equivalent statistical power.
- **Both in production simultaneously**: the paper is notable for being the first documented case where interleaving and counterfactual evaluation are running side-by-side in production at scale, with performance evaluated comparatively.

**Why it matters:** Most teams treating search ranking as a standard A/B testing problem are dramatically over-investing in traffic and time to reach statistical significance. A 50x sensitivity improvement means what would have taken a 10-week A/B test with 1M users now takes a 1-week test with 20k users — that's a qualitative difference in how many ranking iterations a team can explore per quarter. The counterfactual evaluation approach is especially powerful because it doesn't require changing the experiment assignment mechanism at all: you log click behavior in production and retroactively score what other rankers would have produced.

**Ibotta relevance:** Offer feed ranking at Ibotta (the order in which offers appear in the app) is a ranking experiment. If Ibotta tests ranking algorithm changes via standard A/B testing on redemption rate, runtime will be extremely long due to the conversion lag. Interleaving (showing competing offer orders in the same session and watching which offers get saved/clicked) or counterfactual evaluation (using observed offer interaction data to score what a different ranker would have produced) are both applicable and could dramatically shorten iteration cycles.

**Tags added:** interleaving, off-policy-evaluation, sensitivity, ranking, search-ranking, counterfactual
