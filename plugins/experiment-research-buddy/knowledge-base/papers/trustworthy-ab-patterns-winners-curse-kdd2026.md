---
title: "Trustworthy A/B Patterns and the Winner's Curse: Lessons from Eight Large-Scale Replications"
type: paper
tags: [winner's-curse, replication, statistical-power, sample-size, underpowered-tests, ux-patterns, experimental-meta-analysis, regression-to-mean]
source_url: https://doi.org/10.1145/3770855.3818498
added: 2026-09-07
---

# Trustworthy A/B Patterns and the Winner's Curse: Lessons from Eight Large-Scale Replications

## At a Glance
Kohavi, Linowski, Vermeer, Andreev, Dodin, and Furuseth ran eight large-scale replications of popular UX patterns (rounded buttons, page performance, coupon-code field, sticky call-to-action) at 80% power with 2.4M users per experiment. Only 2 of 8 effects were significant in the expected direction; 1 was significant in the *opposite* direction. The core takeaway: underpowered tests systematically overstate effect sizes, and most "proven UX patterns" are built on underpowered evidence.

## Why It Matters
This paper provides the first large-scale empirical evidence for something statisticians knew theoretically but practitioners rarely internalized: if you run underpowered experiments, the effects you observe when you do find significance are inflated estimates of the true effect. The exaggeration factors quantified here are alarming — a test run at 20% power that returns a significant result has an expected effect size 130% larger than the true effect. At 50% power, 40% larger. Even at the conventionally "acceptable" 80% power, effects are exaggerated by 13% on average.

The Trustworthy A/B Patterns project is a community initiative organized by Kohavi, Vermeer, and Jakub Linowski, which recruits organizations to replicate canonical UX patterns at properly powered scale. The eight replications reported at KDD 2026 cover four pattern types:

- **Rounded buttons vs. sharp corners**: popularized as increasing clicks; high-powered replication found no significant effect
- **Page performance improvements**: large effects claimed by many case studies; replications showed varied results depending on baseline performance
- **Coupon-code field visibility**: long assumed to reduce cart abandonment when hidden; replications showed small or null effects
- **Sticky call-to-action**: persistent scrolling CTA assumed to improve conversion; mixed results across replication sites

## Key Contributions

- **Empirical exaggeration factors**: At 80% power, significant effects overestimate truth by 13% on average; at 50% power, 40%; at 20% power, 130%. These are not theoretical — they are estimated from the replication corpus.
- **Replication at scale**: Median 2.4M users per experiment, with 80% power at MDEs of 0.3%–2.2%. This is the standard most industry A/B tests do not meet.
- **Pattern-level heterogeneity**: Not all patterns fail equally. Page performance and sticky CTA showed more evidence of real effects than rounded buttons. The heterogeneity underscores that even "well-established" patterns need context-specific validation.
- **The community replication model**: The project infrastructure (Trustworthy A/B Patterns, trustworthyabpatterns.com) allows any sufficiently-trafficked organization to contribute replications, building toward a meta-analytic evidence base across the industry.

## Takeaways for Practice

1. **If your experiment ran at less than 80% power and found a significant result, apply a mental correction.** The true effect is likely smaller — possibly substantially. At 50% power, discount the observed lift by ~28%. At 20% power, discount by ~57%.

2. **"Best practices" copied from conference talks are not validated evidence.** The rounded buttons finding is emblematic: a pattern widely circulated in conversion optimization communities showed zero effect at scale. Do not spend experiment capacity replicating industry folklore — test your actual hypotheses.

3. **For Ibotta's offer-level tests, where sample sizes are often limited by category or brand**, the exaggeration factor is directly relevant. Significant results from small-traffic experiments (a new CPG brand, a low-penetration category) should be treated as directional signals, not reliable effect size estimates. Use those estimates conservatively when projecting revenue impact.

4. **Pre-register your MDE before running.** The exaggeration factor inflates with any underpowering. If you set your MDE after seeing the data ("oh, it turned out we were powered for 0.8% lift"), the exaggeration factor applies.

5. **Recommend the Trustworthy A/B Patterns project to Ibotta's brand partners.** For CPG brands asking "does this creative work?", pointing to the project and its standards sets an honest baseline for what "proven" should mean.

## Action Items / Things to Read

- Paper: https://doi.org/10.1145/3770855.3818498 (KDD 2026 proceedings)
- Trustworthy A/B Patterns project: trustworthyabpatterns.com (Linowski, Vermeer, Kohavi)
- Related KB entry: [winner's-curse theory] → [etsy-winners-curse-mitigation.md](etsy-winners-curse-mitigation.md) (Bayesian shrinkage approach)
- Related KB entry: [effect-size-exaggeration] → Gelman & Carlin "Beyond Power Calculations" (2014)

## Tags
winner's-curse, replication, statistical-power, sample-size, underpowered-tests, ux-patterns, experimental-meta-analysis, regression-to-mean
