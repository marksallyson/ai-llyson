---
title: "Peeking at A/B Tests: Why It Matters and What to Do About It"
type: paper
tags: [peeking, sequential-testing, always-valid-inference, msprt, false-positive, type-i-error, sample-size]
source_url: https://arxiv.org/abs/1512.04922
added: 2026-06-08
---

# Peeking at A/B Tests: Why It Matters and What to Do About It

## At a Glance
Johari, R., Koomen, P., Pekelis, L., & Walsh, D. (KDD 2017; extended in Operations Research 2022 as "Always Valid Inference: Continuous Monitoring of A/B Tests"). Formalizes why peeking (checking p-values before the experiment ends) inflates false positive rates dramatically, and introduces always-valid inference / mSPRT as the rigorous solution.

## Why They Matter
Peeking is the most common statistical error in A/B testing at companies without a formal sequential testing framework. When analysts or stakeholders check results daily and stop when "it looks significant," they are running a procedure with a true false positive rate of 30–50%, not 5%. This paper is the formal foundation for any discussion of when you can (and can't) stop an experiment early.

## Key Contributions
- Proved that the false positive rate of peeking grows with the number of looks — O(log n) with continuous monitoring under the null
- Introduced **mSPRT (mixture Sequential Probability Ratio Test)** as an always-valid alternative: p-values are valid at any stopping time
- The 2022 Operations Research extension proves the continuous monitoring result more rigorously and generalizes to a broader class of test statistics
- Directly motivated the "always-valid p-values" implementations in Booking.com, Optimizely, Statsig, and Eppo

## Takeaways for Practice
1. **Never stop a running Ibotta experiment because it "looks significant" in the first week.** The false positive rate from daily peeking over 4 weeks at nominal α=0.05 can exceed 25%.
2. **If early stopping is operationally required** (e.g., the test is obviously harmful), use mSPRT or Holm-Bonferroni alpha spending — document this before the experiment starts.
3. **The Monday launch rule at Ibotta** (fixed experiment duration, no early stopping) is a direct mitigation of the peeking problem.
4. **Statsig and Eppo both implement always-valid inference** — if Ibotta ever adopts one of these platforms, this feature is built in.
5. **The 2022 Operations Research paper** ("Always Valid Inference") is the more rigorous reference if stakeholders want the formal statistical argument.

## Action Items / Things to Read
- KDD 2017 paper (arXiv): https://arxiv.org/abs/1512.04922
- Operations Research 2022 (always-valid inference): https://pubsonline.informs.org/doi/10.1287/opre.2021.2135
- Evan Miller's accessible version: "How Not To Run an A/B Test" — https://www.evanmiller.org/how-not-to-run-an-ab-test.html
- See also: `knowledge-base/individuals/evan-miller.md`, `knowledge-base/individuals/chetan-sharma.md`

## Tags
peeking, sequential-testing, always-valid-inference, msprt, false-positive, type-i-error, sample-size
