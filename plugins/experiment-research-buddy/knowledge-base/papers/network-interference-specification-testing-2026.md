---
title: "Randomization Tests for Model Specification in Causal Inference under Network Interference"
type: paper
tags: [interference, network-effects, two-sided-markets, exposure-mapping, randomization-tests, model-specification, causal-inference, marketplace, sutva]
source_url: https://arxiv.org/abs/2608.22890
added: 2026-08-31
---

# Randomization Tests for Model Specification in Causal Inference under Network Interference

## At a Glance
When you run experiments in a network — a social platform, a two-sided marketplace, a retailer with shared inventory — treating one unit affects others (interference). The standard solution is to define an "exposure mapping": a function that says exactly how much each unit's outcome is shaped by its neighbors' treatments. This paper provides the first practical statistical test to check whether that mapping is correctly specified — addressing a key assumption that practitioners almost never verify.

## Why It Matters
Interference-aware estimators (cluster-randomized experiments, bipartite graph experiments, switchback tests) all stand on the same foundation: you've correctly modeled who influences whom. If the exposure mapping is wrong, your treatment effect estimates are biased in ways that are hard to detect from results alone — the experiment just looks noisy. Supriya Tiwari and Pallavi Basu (arXiv 2608.22890, August 24, 2026) develop a randomization-testing procedure with asymptotic validity guarantees that lets you formally test specification: you can now diagnose whether your exposure mapping is plausible before trusting your interference-corrected estimates.

## Key Contributions
- **Randomization test for exposure mapping specification**: a formal hypothesis test that asks "is this exposure mapping consistent with the data?" using only the randomization distribution, not parametric assumptions about outcomes. If the test rejects, your current interference model is misspecified and your estimates are suspect.
- **Asymptotic validity guarantees**: the test controls Type I error asymptotically, with favorable power properties validated in extensive simulation.
- **Network-agnostic design**: the procedure applies to any network structure and any exposure mapping function — not limited to specific network topologies or experimental designs.
- **Field experiment validation**: illustrated on an experiment measuring the effect of anti-conflict norms among adolescents, a classic social network interference setting.
- **Complements recent impossibility results**: addresses (and refines) earlier work (arXiv 2605.09726) that showed specification testing under certain conditions is impossible — this paper identifies the conditions under which it *is* possible and what you can learn from a failed test.

## Takeaways for Practice
1. **Before reporting interference-adjusted estimates, run this test.** If you've used cluster randomization or a network-aware design, you've implicitly assumed an exposure mapping. Test it. A rejection doesn't mean your experiment is worthless — it means your interference model needs refinement.
2. **The right prior is skepticism.** Exposure mappings are typically constructed by analysts based on domain intuition ("your outcome depends on how many of your first-degree connections are treated"). These intuitions are often wrong or oversimplified. The test makes that visible.
3. **For two-sided marketplaces, interference is the default, not the exception.** In a cashback or promotions platform, treating one cohort of buyers changes the effective redemption pool for offers, potentially affecting other buyers' behavior and offer availability. Any experiment that ignores this is making an implicit SUTVA assumption. Test whether it's plausible.
4. **Use failed tests to guide redesign.** If the specified mapping is rejected, try alternative exposure definitions — degree-weighted exposure, spatial proximity, temporal windows — and re-test. The test is a diagnostic, not just a binary pass/fail.
5. **Pair with the Jeunen (2026) paper on policy overlap** (`policy-overlap-variance-reduction-jeunen-2026.md`): Jeunen's Δ-OPE approach reduces variance when policies agree; this paper tests whether the interference model underlying your policy is correct. Together they form a more complete interference-aware analysis workflow.

## Action Items / Things to Read
- arXiv:2608.22890 — full paper: https://arxiv.org/abs/2608.22890
- Related: arXiv:2605.09726 — "On the Impossibility of Specification Testing of Interference Models Based on Exposure Mappings" — the earlier impossibility result this paper resolves
- Related: `policy-overlap-variance-reduction-jeunen-2026.md` in KB — variance reduction via policy overlap for recommender/ranking experiments
- Related: `multi-experiment-analysis-linkedin-2026.md` in KB — joint estimation across overlapping experiments (interference from concurrent tests)
- Aronow & Samii (2017) "Estimating Average Causal Effects Under Interference Between Units" — foundational exposure mapping framework this paper builds on

## Tags
interference, network-effects, two-sided-markets, exposure-mapping, randomization-tests, model-specification, causal-inference, marketplace, sutva
