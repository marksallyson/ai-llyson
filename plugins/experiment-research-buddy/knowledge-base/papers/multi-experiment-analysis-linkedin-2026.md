---
title: "Multi-Experiment Analysis"
type: paper
tags: [overlapping-experiments, concurrent-experiments, causal-inference, joint-estimation, multi-experiment, interference, linkedin]
source_url: https://arxiv.org/abs/2604.16671
added: 2026-07-06
---

# Multi-Experiment Analysis

## At a Glance
Reza Hosseini (LinkedIn Corporation), arXiv 2604.16671, April 17, 2026. Proposes Multi-Experiment Analysis (MEA): a method for consistently estimating treatment effects when multiple overlapping A/B experiments run concurrently on the same traffic, producing estimates that correspond to actionable launch decisions — without requiring factorial pre-design or mutual exclusion. Deployed in LinkedIn's production experimentation system.

## Why They Matter
Most large experimentation platforms face the overlapping experiments problem: users are simultaneously exposed to multiple experiments, meaning individual effect estimates are confounded by the presence of other tests. The standard responses are (a) serialize experiments — slow, reduces velocity — or (b) use mutual exclusion layers — forces traffic fragmentation and reduces power — or (c) ignore the problem and accept potentially biased estimates. MEA is a principled fourth option that requires no changes to experiment design: run experiments concurrently as-is, then use MEA to jointly estimate correct effects from the overlapping data.

The practical advance over prior work (e.g., Google's overlapping experiment infrastructure) is that MEA produces three types of estimates that directly answer the questions product teams actually ask before shipping decisions, not just average treatment effects.

## Key Contributions
- **Corrected individual effects**: each experiment's true treatment effect, adjusted for the presence of all other overlapping experiments running simultaneously; these are the "clean" per-experiment estimates you'd get if you'd run the tests sequentially
- **Combined launch effects**: "if we launch variant A2 from experiment A *and* variant B3 from experiment B together, what's the expected total impact on the primary metric?" — answers the joint launch question without requiring a pre-designed factorial experiment
- **Conditional effects**: "what is experiment A's effect *given that* a specific variant of experiment B will remain permanently launched?" — the most actionable estimate; directly answers the real pre-launch question
- **No pre-design requirement**: works with any overlap pattern — partial overlap, full overlap, different sizes — without requiring factorial cells or traffic restrictions
- **Production deployment**: validated through simulation confirming consistency and correct coverage, then deployed at LinkedIn scale with documented system design and adoption patterns
- **Practical lessons**: paper includes guidance on integration with existing experimentation infrastructure and observed adoption patterns from LinkedIn's rollout

## Takeaways for Practice
1. **Use MEA's conditional effects before any launch decision.** The question "should we ship feature A?" implicitly assumes a world where everything else stays constant. MEA's conditional estimate gives you the effect of A *given the current experiment landscape* — the true counterfactual you care about, not the idealized individual effect from a sequential test.
2. **MEA eliminates the tradeoff between experiment velocity and estimate validity.** You no longer need to choose between running experiments concurrently (fast, biased estimates) and serializing them (slow, unbiased estimates). MEA gives you concurrent speed with unbiased estimates.
3. **The combined launch effect is essential for coordinated product releases.** When multiple teams are launching simultaneously (as happens at the end of a sprint), MEA lets you estimate the joint effect of the combined launch — important for setting stakeholder expectations and for post-hoc attribution.
4. **This complements, not replaces, the Microsoft "interactions are rare" finding.** Microsoft's empirical result (that 1 in 50,000 metric pairs show a significant interaction) tells you *how often* interactions occur. MEA tells you *what the interaction is* when it does occur. Both are needed.
5. **For Ibotta, the most immediate application is offer algorithm experiments.** Offer recommendation, offer display, and notification experiments all affect the same users simultaneously. MEA would produce corrected estimates for each that account for the others — particularly useful when an offer algorithm change and a notification change are both in flight.

## Action Items / Things to Read
- Paper (arXiv): https://arxiv.org/abs/2604.16671
- HTML version: https://arxiv.org/html/2604.16671
- Related in KB: Microsoft "A/B Interactions: A Call to Relax" — `articles/microsoft-ab-interactions-call-to-relax.md` (empirical baseline on interaction rates)
- Related in KB: Statsig "Detecting Interaction Effects of Concurrent Experiments" — `articles/statsig-detecting-interaction-effects.md` (2×2 factorial approach)
- Google's overlapping experiment infrastructure (Tang et al., KDD 2010) — `papers/overlapping-experiments.md` (architectural context; MEA is a complementary statistical solution)
- LinkedIn's engineering blog for production deployment notes: https://engineering.linkedin.com/blog/topic/experimentation

## Tags
overlapping-experiments, concurrent-experiments, causal-inference, joint-estimation, multi-experiment, interference, linkedin
