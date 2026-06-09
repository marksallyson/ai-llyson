---
title: "How Not To Run an A/B Test"
type: article
tags: [peeking, sequential-testing, false-positive, type-i-error, sample-size]
source_url: https://www.evanmiller.org/how-not-to-run-an-ab-test.html
added: 2026-06-08
---

# How Not To Run an A/B Test

## At a Glance
Evan Miller (~2010). The canonical post explaining why checking statistical significance repeatedly during a test inflates false positive rates. The most-read single piece on the peeking problem — accessible, non-mathematical, and directly actionable.

## Why They Matter
This post has probably prevented more false positives in A/B testing than any academic paper. It explains the peeking problem to a practitioner audience without requiring knowledge of sequential probability ratio tests. When a stakeholder asks "can we look at results yet?", this post is the answer.

## Key Contributions
- Clear, accessible explanation of why stopping a test when p < 0.05 is first reached produces false positives far above 5%
- Simulation-based demonstration: checking significance daily on a zero-effect experiment leads to "significant" results in ~25% of cases
- Concrete prescription: set your sample size before starting; don't look until the end
- Introduced the idea (for many readers) that sequential monitoring requires a different statistical framework

## Takeaways for Practice
1. **Share this post with any PM or stakeholder who asks about early results.** It's 500 words, no equations, and immediately convincing.
2. **"Don't stop a test early because it looks significant"** is the single most actionable takeaway. The Monday launch rule at Ibotta operationalizes this.
3. **Set sample size before starting.** The post makes clear that the sample size calculation is inseparable from the stopping rule — they must be decided together.
4. **If you must monitor, use sequential methods** (mSPRT, Johari et al.) — Miller doesn't cover these but they're the correct solution.

## Action Items / Things to Read
- Post: https://www.evanmiller.org/how-not-to-run-an-ab-test.html
- Miller's sample size calculator: https://www.evanmiller.org/ab-testing/sample-size.html
- See also: `knowledge-base/individuals/evan-miller.md`, `knowledge-base/papers/peeking-problem.md`

## Tags
peeking, sequential-testing, false-positive, type-i-error, sample-size
