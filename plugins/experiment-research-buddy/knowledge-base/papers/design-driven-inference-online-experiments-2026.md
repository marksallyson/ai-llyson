---
title: "Design-Driven Inference for Online Experiments: Jointly Optimal Evidence Collection, Testing, and Estimation"
type: paper
tags: [experimental-design, sequential-testing, variance-reduction, multiple-testing, sample-size, always-valid-inference, frequentist-vs-bayesian]
source_url: https://arxiv.org/abs/2610.07831
added: 2026-10-19
---

# Design-Driven Inference for Online Experiments: Jointly Optimal Evidence Collection, Testing, and Estimation

**Authors:** Jun Yu, Wenbiao Zhao, Lixing Zhu  
**Affiliations:** Beijing Institute of Technology; China University of Mining and Technology-Beijing; Beijing Normal University at Zhuhai  
**arXiv:** 2610.07831 (stat.ME) · Submitted October 6, 2026

## At a Glance
Proposes choosing the experimental allocation and the statistical evidence rule *together* as a joint optimization problem — so that both testing and estimation draw on the same evidence. Shows that for multifactor experiments, block-orthogonal designs remove nuisance contamination from treatment score statistics, and that the same allocation is universally optimal for maximum likelihood estimation of treatment effects.

## The Core Argument
Standard practice separates two decisions that are actually coupled:
1. **Design**: choose allocation ratio and sample size (done before the experiment)
2. **Inference**: choose a test statistic and analysis method (done after data collection)

Yu et al. show these interact: the optimal test depends on the design, and the optimal design depends on the planned inference procedure. If you choose them independently, you can end up with a suboptimal experiment — either less power than achievable, or a test that doesn't match the evidence the design actually provides.

**Three concrete results:**
1. **Jointly optimal evidence rule**: For a given allocation, there exists a uniquely optimal evidence rule (a likelihood-ratio-type statistic) that both tests and estimates treatment effects from the same sufficient statistic.
2. **Universal MLE optimality**: A specific allocation is simultaneously optimal for maximum likelihood estimation across all treatment parameters — not just one target contrast.
3. **Multifactor block-orthogonal designs**: In experiments that test multiple factors simultaneously (e.g., two different features in one experiment), block-orthogonal allocation removes cross-factor contamination from each factor's test statistic, making per-factor inference cleaner.

**Sequential extension**: The framework supports early stopping for negligible effects while controlling the false stopping rate under continuous monitoring — without requiring a separate sequential design phase.

## Why It Matters
Most practitioners learn experimental design and statistical analysis as separate disciplines. This paper provides the theoretical grounding for a principle experienced practitioners often arrive at intuitively: **design your experiment and your analysis procedure at the same time**. The result is that you don't have to choose between maximizing power for testing and minimizing variance for estimation — the same allocation achieves both.

The multifactor result is the most practically significant: if you're running a 2×2 factorial experiment (testing offer type × notification type, for example), using a block-orthogonal design means each factor's treatment effect estimate is uncorrelated with the other factor's effect — so you don't need to "control for" the other factor post-hoc, and the standard errors are cleaner.

**Caveat**: This is a theoretical stat.ME paper from academic researchers, not a practitioner guide. The methods are proven in theory and validated on simulated data, but not yet validated on large-scale production experiment corpora (as, e.g., the Schultzberg/Spotify papers are). Treat as conceptual foundation rather than immediately deployable recipe.

## Takeaways for Practice
1. **Design and analysis method should be chosen together** — before the experiment runs. If you plan to use CUPED variance reduction, your pre-experiment sample size calculation should account for the variance reduction expected from CUPED; standard calculators (which ignore covariates) will overstate the required sample.
2. **For multifactor (factorial) experiments at Ibotta** — e.g., testing offer discount level AND notification timing simultaneously — use orthogonal or block-orthogonal treatment allocation. This makes each factor's effect estimable independently, reducing confounding and cleaning up standard errors.
3. **The jointly optimal evidence rule is effectively a likelihood ratio test** — which is already standard in many sequential testing frameworks (mSPRT, GAVI). This paper provides the theoretical justification for why those frameworks pair well with specific allocation designs.
4. **If your team is building a sample size calculator**, incorporate the intended analysis method (CUPED with a specific covariate? A ratio metric? Winsorization?) into the calculator's power assumptions. A calculator that ignores analysis choices systematically misestimates power.

## Action Items / Things to Read
- arXiv:2610.07831: https://arxiv.org/abs/2610.07831 — full paper
- Compare with: Kohavi et al. (2014) "Seven Rules of Thumb for Web Site Experimenters" on practical allocation choices
- See also: `papers/ai-assisted-variance-reduction-kdd2026.md` (AI-assisted CUPED) and `papers/sequential-sample-size-correction-spotify-2026.md` (joint design/analysis for sequential tests)

## Tags
experimental-design, sequential-testing, variance-reduction, multiple-testing, sample-size, always-valid-inference, frequentist-vs-bayesian
