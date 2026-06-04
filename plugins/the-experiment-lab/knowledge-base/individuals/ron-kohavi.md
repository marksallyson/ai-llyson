---
title: Ron Kohavi
type: individual
tags: [organizational-maturity, metric-design, sample-size, causal-inference, two-sided-markets, platform, variance-reduction]
source_url: https://exp-platform.com
added: 2026-06-04
---

# Ron Kohavi

## At a Glance
Ron Kohavi is the most cited practitioner in product experimentation, with 55,000+ Google Scholar citations. He has led experimentation programs at Amazon, Microsoft (as Technical Fellow and CVP of the ExP team), and Airbnb (as VP), and is co-author of *Trustworthy Online Controlled Experiments* (Cambridge University Press, 2020).

## Why They Matter
Kohavi's work is foundational — not "foundational" as in "historically interesting" but as in "you will make systematic errors in your experiments if you haven't read it." His 30+ papers catalog the ways well-intentioned experiments go wrong: instrumentation errors, sample ratio mismatches, novelty effects, carryover, misaligned metrics. His book is the single best reference for a DS running product experiments at a company like Ibotta.

## Key Contributions
- **Co-authored *Trustworthy Online Controlled Experiments*** (2020): the definitive practitioner textbook; covers experimental design, metric design, pitfalls, organizational maturity, and case studies
- **30+ papers** on controlled experiments, including the 2007 "Practical Guide to Controlled Experiments on the Web" (most cited controlled experiments paper)
- **Surprising findings catalog**: documented dozens of cases where experiment results contradicted expert intuition — the case for always testing
- **Overall Evaluation Criterion (OEC)**: formalized the concept of a single pre-specified decision metric combining multiple signals
- **Sample Ratio Mismatch (SRM) detection**: formalized and popularized SRM as a standard data quality check
- **Organizational maturity model**: co-developed the framework for assessing and growing an org's experimentation capabilities
- **exp-platform.com**: free knowledge base of papers, slides, and tools from the Microsoft ExP team
- **Amazon → Microsoft → Airbnb career arc**: demonstrates applicability of principles across e-commerce, software, and marketplace contexts

## Takeaways for Practice
- **Read chapters 3 (metrics), 5 (sample size), 7 (pitfalls), and 19 (two-sided markets) of *Trustworthy Online Controlled Experiments* first.** These are directly applicable to Ibotta. Do not read sequentially — prioritize by urgency.
- **Watch Kohavi's KDD and NeurIPS keynotes on YouTube.** His talks compress years of lessons into 45 minutes and are aimed at practitioners, not academics. Start with "Online Controlled Experiments: Lessons from Running A/B/n Tests for 15 Years" (KDD 2015).
- **The OEC concept is worth operationalizing at Ibotta today.** Before any experiment launches, document: what is the single number we'll use to make the go/no-go decision? This prevents post-hoc metric selection.
- **Kohavi's "Surprising Findings" series is the best argument for mandatory pre-registration.** Read it when you're about to skip a formal experiment because "we know this will work."
- His email and LinkedIn are public — he responds to practitioners with substantive questions.

## Action Items / Things to Read
- *Trustworthy Online Controlled Experiments* — Kohavi, Tang, Xu (Cambridge 2020) — buy it
- "Practical Guide to Controlled Experiments on the Web" — Kohavi et al. (2007) — free on exp-platform.com
- "Online Controlled Experiments: Lessons from Running A/B/n Tests for 15 Years" — KDD 2015 keynote (YouTube)
- exp-platform.com — papers section; read in reverse chronological order
- "A/B Testing Intuition Busters" — Kohavi & Deng (2022) — search arXiv

## Tags
organizational-maturity, metric-design, sample-size, causal-inference, two-sided-markets, oec, srm, surprising-findings, book
