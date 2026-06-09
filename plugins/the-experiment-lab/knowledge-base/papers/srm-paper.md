---
title: "Diagnosing Sample Ratio Mismatch in Online Controlled Experiments"
type: paper
tags: [srm, causal-inference, platform, organizational-maturity, feature-flags]
source_url: https://dl.acm.org/doi/10.1145/3292500.3330722
added: 2026-06-08
---

# Diagnosing Sample Ratio Mismatch in Online Controlled Experiments

## At a Glance
Fabijan, A., Gupchup, J., Gupta, S., Omhover, J., Qin, W., Vermeer, L., & Dmitriev, P. (KDD 2019). Defines SRM (Sample Ratio Mismatch) as a critical experiment validity check: when the observed traffic split doesn't match the intended split. Lists the most common causes and provides a diagnostic checklist.

## Why They Matter
SRM is the validity check that is most commonly skipped and most damaging when missed. When SRM is present, every metric in the experiment is potentially biased in unpredictable directions — a 10% conversion lift from an SRM experiment is meaningless. This paper is the definitive reference for why SRM matters and how to diagnose it.

## Key Contributions
- Defined SRM formally: χ² test of observed vs. expected counts, p < 0.01 threshold for investigation
- Catalogued the most common causes: bot traffic absorbed differently across variants; cache/CDN effects; logging fires after a filter correlated with treatment; redirect bugs; SDK initialization timing
- Proposed a diagnostic decision tree for root-cause analysis
- Showed that SRM is surprisingly common — detected in a non-trivial fraction of experiments at Microsoft's large-scale platform
- Demonstrated that metric results from SRM experiments can be directionally wrong (not just inflated)

## Takeaways for Practice
1. **Run SRM check before ANY analysis at Ibotta.** χ² test on variant counts vs. expected split. If p < 0.01, stop and investigate before touching metric results.
2. **The most likely SRM cause at Ibotta is LaunchDarkly SDK initialization timing.** If the LD flag evaluates after some users have already hit the tracked event, control and treatment will look unbalanced.
3. **"Never turn off the LD flag between test end and analysis"** (from the ibotta-ab-process skill) is directly related — turning off the flag before analysis can cause SRM in retrospective counts.
4. **SRM ≠ balanced counts by platform.** If iOS and Android have different SDK versions with different flag evaluation timing, you can have SRM within each platform even if overall counts look fine.
5. **A small SRM (99:101 when expecting 100:100) is still an SRM.** The threshold is statistical significance, not a percentage difference.

## Action Items / Things to Read
- ACM DL paper: https://dl.acm.org/doi/10.1145/3292500.3330722
- See also: `references/srm.md` in the statistical-methods skill for the diagnostic checklist
- See also: `knowledge-base/individuals/aleksander-fabijan.md` — Fabijan is a co-author

## Tags
srm, causal-inference, platform, organizational-maturity, feature-flags
