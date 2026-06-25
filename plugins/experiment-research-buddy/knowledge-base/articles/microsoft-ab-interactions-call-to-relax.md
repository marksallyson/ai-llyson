---
title: "A/B Interactions: A Call to Relax"
type: article
tags: [concurrent-experiments, overlapping-experiments, interaction-effects, organizational-maturity, platform, multiple-testing]
source_url: https://www.microsoft.com/en-us/research/articles/a-b-interactions-a-call-to-relax/
author: Monwhea Jeng (Microsoft ExP)
added: 2026-06-24
---

# A/B Interactions: A Call to Relax

## At a Glance
Microsoft ExP's 2023 empirical study on whether concurrent A/B tests actually interfere with each other. Answer: almost never. Across four major Microsoft products running hundreds of simultaneous tests on millions of users, interaction effects were essentially nonexistent — 1 in 50,000 metric pairs on the one product that showed any signal at all, and zero on the other three. The recommendation: stop isolating tests into mutually exclusive buckets, run them in parallel.

## Why It Matters
The default assumption at many teams — including Ibotta — is that concurrent experiments on the same users are dangerous and must be prevented through mutual exclusion or strict layering. This paper is the most rigorous empirical refutation of that assumption. It doesn't say interactions never happen; it says they're so rare that the cost of isolation (slower learning, smaller test populations, longer queues) almost always outweighs the risk.

## Methodology
Examined every concurrent A/B test pair running simultaneously across four Microsoft products on a single day. For each pair, computed metrics across all possible control/treatment assignment combinations. Used chi-square test to assess whether treatment effects differed based on users' assignments in concurrent tests. Applied Benjamini-Hochberg FDR correction across hundreds of thousands of p-values to control for multiple comparisons.

## Key Findings
- **3 of 4 products:** Zero abnormal interaction signals detected
- **1 of 4 products:** 0.002% of metric pairs (1 in 50,000) showed a detectable interaction
- No cases where cross-test treatment effects moved in opposite directions (the most damaging type of interaction)
- Results align with prior experiences at Microsoft and Meta

## Main Conclusion
"A/B interactions are rare enough that you can usually run tests without worrying about them." The cost of mutual exclusion — smaller populations per test, longer runtimes, slower iteration — is almost always higher than the actual risk of interaction.

## Takeaways for Practice

1. **The default should be overlap, not isolation.** If you're holding tests out of each other's populations as standard practice, you're paying a real cost (slower tests, smaller N) for a risk that empirically rarely materializes.

2. **The exception: tests that share the same direct mechanism.** Two tests both trying to get a user to link their Walmart account operate on the same behavioral pathway — that warrants mutual exclusion or sequencing. Two tests on different surfaces (offer feed + notification) almost certainly don't.

3. **Interaction detection is a monitoring problem, not a design problem.** Rather than designing away the risk up front, detect interactions post-hoc using a 2×2 population split (see Statsig's 2025 method in the KB).

4. **This paper is your strongest argument for loosening isolation rules at Ibotta.** If stakeholders or PMs push back on running tests concurrently, cite the 1-in-50,000 finding.

## Limitations
- Microsoft's scale (millions of users per product) means interactions have more power to detect. At smaller scales, rare interactions may go undetected — the absence of evidence isn't evidence of absence.
- Products with strong network effects or shared resources (inventory, budget) are not covered — those are different from standard UI/feature tests.

## Tags
concurrent-experiments, overlapping-experiments, interaction-effects, organizational-maturity, platform, multiple-testing
