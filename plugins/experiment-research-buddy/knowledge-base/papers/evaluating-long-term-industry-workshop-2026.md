---
title: "Evaluating for the Long Term: Learnings from Industry"
type: paper
tags: [long-term-effects, surrogate-metrics, causal-inference, multi-experiment, sequential-testing, novelty-effects, industry-consensus, holdout]
source_url: https://arxiv.org/abs/2608.08043
added: 2026-08-17
---

# Evaluating for the Long Term: Learnings from Industry

## At a Glance
A daylong workshop with 26 experts from 15 online platforms and 4 universities produced consensus propositions on the central problem in industry experimentation: how do you make decisions from short-term experiments when the outcomes you actually care about play out over months or years? The paper collects and synthesizes industry knowledge on when short-term results can be trusted and when they can't.

## Why They Matter
This is the closest thing the industry has to a collective answer to the long-term evaluation problem — authored jointly by practitioners from Pinterest, Netflix, Meta (Eytan Bakshy), Airbnb, Statsig, Uber, Lyft, Google, Booking.com, Roblox, UC Berkeley, MIT CSAIL, and others. The conclusions are grounded in real production experiments, not simulations. For Ibotta, this paper directly addresses the question of whether a 2-week offer redemption lift predicts longer-term user value.

## Key Contributions
- **Sign reversals are rare**: across nearly all platforms represented, treatment effects that are positive in the short run rarely flip to negative in the long run; the primary concern is magnitude shifts, not direction reversals
- **Autosurrogate is hard to beat**: using the same metric measured at an earlier time (e.g., 7-day redemption rate as a proxy for 60-day redemption rate) is often the best practical surrogate — simple, defensible, and hard to beat with more complex approaches
- **Experimentally-learned surrogates > observationally-learned surrogates**: surrogates learned from a portfolio of past experiments are more transportable than surrogates learned from observational data; confounding makes observational surrogates unreliable
- **Novelty effects concentrate in specific domains**: sign reversals and magnitude reversals concentrate in content quality signals (recommendations, feed algorithms), hyper-monetization interventions, and pricing — not in standard feature experiments
- **The full mediation assumption is dubious in practice**: surrogate index approaches require the short-term proxy to fully mediate the long-term effect; participants from media platforms found this assumption especially hard to defend for engagement metrics
- **No substitute for long-run experiments**: consensus was that learning from surrogate approaches requires a reference set of long-run experiments that most platforms don't have at scale; the paper includes strategies for building this portfolio
- **Authors**: Leif Sigerson, Tom Cunningham, Winston Chou, Sana Pandey, Jonathan Stray, Lo-Hua Yuan, Eytan Bakshy, Timothy Chan, Molly Davies, Maria Dimakopoulou, Simon Ejdemyr, Kenneth Hung, Nathan Kallus, Madhav Kumar, Thu Le, A. Demetri Pananos, Lee Richardson, Brennan Schaffner, Rose Tan, Martin Tingley, Nadia Tomova, Panagiotis Toulis, Wenjing Zheng, Zander Arnao, Dean Eckles

## Takeaways for Practice
1. **For standard Ibotta offer tests, don't panic about short-term vs. long-term divergence.** The consensus across 15 platforms is that sign reversals are rare for typical product interventions. A 2-week redemption lift is very likely to remain a lift at 60 days — the main risk is that the effect size shrinks due to novelty decay, not that it reverses.
2. **Use an autosurrogate for long-term retention proxies.** For an offer test where you care about 90-day user retention, the best proxy is probably 14-day or 30-day retention rate — the same metric, measured earlier. The paper's consensus is that this simple approach frequently outperforms elaborate ML-based surrogate indices.
3. **Treat pricing and hyper-monetization experiments differently.** If Ibotta tests changes to cashback reward amounts, offer stacking rules, or premium subscription terms, the risk of short-term/long-term divergence is meaningfully higher. Run these tests longer or build a surrogate validation pipeline before trusting short-run results.
4. **Don't invest heavily in observationally-learned surrogates.** The workshop consensus is that confounding makes these unreliable. If you need a surrogate, learn it from a portfolio of past long-run experiments — which means start building that portfolio now.
5. **Content quality signals (feed ranking, recommendation algorithm changes) deserve extra scrutiny.** If Ibotta introduces a recommendation algorithm for which offers to show users, run the experiment at least 4-6 weeks; novelty effects are real and can mask eventual negative effects on retention.

## Action Items / Things to Read
- Paper (arXiv): https://arxiv.org/abs/2608.08043
- HTML version: https://arxiv.org/html/2608.08043
- Related: Netflix Surrogate Index evaluation — "Evaluating the Surrogate Index as a Decision-Making Tool Using 200 A/B Tests at Netflix" (arXiv:2311.11922)
- Related: Netflix long-term effects — `companies/netflix.md`
- Related: Statsig blog on long-term effects and surrogate metrics — `companies/statsig.md`
- Related: Multi-experiment analysis (LinkedIn) — `papers/multi-experiment-analysis-linkedin-2026.md`
- Background: Athey et al. "The Surrogate Index" (NBER 2020) — foundational surrogate index paper

## Tags
long-term-effects, surrogate-metrics, causal-inference, multi-experiment, sequential-testing, novelty-effects, industry-consensus, holdout
