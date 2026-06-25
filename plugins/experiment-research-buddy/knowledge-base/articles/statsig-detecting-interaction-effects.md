---
title: "Detecting Interaction Effects of Concurrent Experiments"
type: article
tags: [concurrent-experiments, overlapping-experiments, interaction-effects, platform, statistical-methods, multiple-testing]
source_url: https://www.statsig.com/blog/detecting-interaction-effects-of-concurrent-experiments
author: Statsig Engineering
added: 2026-06-24
---

# Detecting Interaction Effects of Concurrent Experiments

## At a Glance
Statsig's 2025 practical method for detecting interaction effects between concurrent experiments — without requiring mutual exclusion. The technique: split the overlapping population into 4 groups (control/control, treatment A/control, control/treatment B, treatment A/treatment B) and test whether the combined effect differs from the sum of the individual lifts. Recommendation: allow overlap, monitor for interactions.

## Why It Matters
Provides a concrete, implementable alternative to the "just isolate everything" approach. Rather than paying the cost of mutual exclusion up front, you run tests concurrently and use this detection method to catch the rare case where an interaction actually exists.

## Methodology

**The 2×2 factorial design for interaction detection:**

Split the users who are eligible for both experiments into four groups:
- Control A × Control B
- Treatment A × Control B
- Control A × Treatment B
- Treatment A × Treatment B

Compute the effect of each experiment independently. Then test:

`Interaction = Effect(A+B combined) - Effect(A alone) - Effect(B alone)`

If this difference is statistically significant, a real interaction exists. If not, the experiments are operating independently and the concurrent design is valid.

This is a post-hoc check — you run the tests concurrently, then verify after the fact that no interaction occurred.

## Key Findings
- Interactions are rare in practice (consistent with Microsoft ExP's 1-in-50,000 finding)
- The 4-group detection method is statistically valid and practical to implement
- Overlap + monitoring is superior to mutual exclusion as a default policy

## Main Conclusion
Don't use mutual exclusion as a blanket rule. Run experiments concurrently, and use interaction detection as a monitoring layer. Flag and investigate the rare cases where an interaction is detected.

## Takeaways for Practice

1. **This is the practical implementation of Microsoft's "call to relax."** Microsoft said interactions are rare; Statsig shows you how to confirm that in your own data.

2. **The 4-group split requires the overlapping population to be large enough.** If your concurrent tests have small eligible populations (e.g., both targeting ~3,000 users), the interaction detection cell (treatment A × treatment B) may be too small to have power. At Ibotta, this is worth checking before relying on the method.

3. **Implement this as a standard post-analysis check**, not a special investigation. Any time two tests ran concurrently on overlapping populations, run the 2×2 as part of the standard readout.

4. **The test that matters most: did the combined effect differ significantly from the sum?** A non-significant difference is a clean bill of health for the concurrent design.

## Ibotta Application
For the Walmart linking tests specifically: the eligible populations (unlinked users vs. expiring-linked users) are mutually exclusive by definition, so this detection method isn't needed there. But for any two tests running simultaneously on the general user population (e.g., home screen test + notification test), this is the right tool to verify independence.

## Tags
concurrent-experiments, overlapping-experiments, interaction-effects, platform, statistical-methods, multiple-testing
