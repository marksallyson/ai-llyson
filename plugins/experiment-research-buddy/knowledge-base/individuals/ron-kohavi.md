---
title: Ron Kohavi
type: individual
tags: [book, causal-inference, metric-design, oec, organizational-maturity, platform, sample-size, srm, surprising-findings, two-sided-markets, variance-reduction]
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
book, causal-inference, metric-design, oec, organizational-maturity, platform, sample-size, srm, surprising-findings, two-sided-markets, variance-reduction

---

## Recent: 2026-09-07 — Trustworthy A/B Patterns and the Winner's Curse: Lessons from Eight Large-Scale Replications (KDD 2026)

**Source:** Proceedings of the 32nd ACM SIGKDD Conference on Knowledge Discovery and Data Mining V.2, August 2026 · https://doi.org/10.1145/3770855.3818498  
**Authors:** Ron Kohavi, Jakub Linowski, Lukas Vermeer, Andrey Andreev, Majed Dodin, Joachim Furuseth

**What they did:** Ran eight large-scale replications of popular UX patterns (rounded buttons, page performance improvements, coupon-code field visibility, sticky call-to-action) with a median of 2.4M users per experiment and 80% statistical power. The patterns chosen were widely circulated "proven" patterns in conversion optimization communities.

**Key results:** Only 2 of 8 replications found a significant effect in the expected direction. One replication found a significant effect in the *opposite* direction. Exaggeration factors were quantified empirically: at 20% power, significant results overstate the true effect by 130%; at 50% power, by 40%; at 80% power, by 13%. These are not theoretical projections — they are estimated from the replication corpus itself.

**Why it matters:** This is the most direct empirical challenge to "UX best practices as validated evidence" in the experimentation literature. It confirms that most popular patterns are built on underpowered, low-credibility evidence, and provides practitioners with a specific mental correction factor based on their experiment's power level.

**Ibotta relevance:** For offer-level experiments with limited traffic (a new CPG brand, a low-penetration category), this is the most relevant finding in this week's literature: if your experiment was underpowered and you got a significant result, discount the observed effect size by ~28% (at 50% power) or ~57% (at 20% power) before projecting revenue impact.

**Tags added:** winner's-curse, replication, statistical-power, underpowered-tests
