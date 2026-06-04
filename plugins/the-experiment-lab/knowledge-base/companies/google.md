---
title: Google
type: company
tags: [overlapping-experiments, platform, metric-design, organizational-maturity, causal-inference]
source_url: https://research.google/pubs/pub36500/
added: 2026-06-04
---

# Google

## At a Glance
Google runs hundreds of thousands of experiments per year across Search, Ads, YouTube, and other products. Their 2010 KDD paper by Diane Tang et al. established the conceptual foundation for layered, overlapping experiment infrastructure — the model most large experimentation platforms are built on.

## Why They Matter
The "41 shades of blue" story is the canonical example of why HiPPO decisions lose to data: Google tested 41 shades of link blue to optimize ad click-through and identified a measurable winner. More importantly, Google's overlapping experiment framework (domains, layers, segments) solved the core scaling problem: how do you run thousands of experiments simultaneously without them contaminating each other? Most modern experiment platforms — including internal ones at large tech companies — are architectural descendants of this paper.

## Key Contributions
- **Overlapping experiment framework**: experiments assigned to "layers"; users pass through multiple layers independently; enables massive concurrency without mutual exclusion
- **2010 KDD paper** "Overlapping Experiment Infrastructure: More, Better, Faster Experiments" (Tang, Longbotham, et al.): most cited infrastructure paper in experimentation
- **41 shades of blue**: operational example of how metric-driven testing beats intuition at scale
- **HEART framework** (Happiness, Engagement, Adoption, Retention, Task Success): Google Ventures / Google UX team's metric taxonomy for product quality
- **Google Optimize** (deprecated 2023): made A/B testing accessible outside engineering teams; wind-down reflects shift to GA4 integration
- **Ads experimentation at scale**: Google Ads campaign-level experiments are a widely-used quasi-experiment framework available to any advertiser

## Takeaways for Practice
1. **The overlapping layers model is the right mental model for thinking about simultaneous promotions.** If Ibotta is running an offer test and a notification test simultaneously, they need to be in independent layers or you'll have interaction effects that muddy both results. Think explicitly about which experiments can co-exist and which cannot.
2. **The HEART framework is a useful structure for defining non-revenue success metrics.** For user engagement experiments (e.g., testing onboarding flows or notification copy), map metrics to Happiness/Engagement before picking a single OEC.
3. **"41 shades of blue" is a useful story when stakeholders insist a test is "too small to matter."** Small, iterative improvements compound. Document this argument.
4. **Read the 2010 KDD paper before building or evaluating any experiment platform.** It answers the "can we run two tests at once?" question definitively.
5. **When running Google Ads campaign experiments for retailer or publisher partners, treat the built-in holdout as a real controlled experiment** — document it, track SRM, and report it the same way you'd report an internal A/B.

## Action Items / Things to Read
- Tang et al. (2010) "Overlapping Experiment Infrastructure: More, Better, Faster Experiments" — KDD 2010; free on Google Research
- Rodden et al. (2010) "Measuring the User Experience on a Large Scale: User-Centered Metrics for Web Applications" — HEART framework paper
- Google's A/B testing guide in Google Optimize documentation (archived) — practical setup walk-through even if the product is deprecated

## Tags
overlapping-experiments, platform, metric-design, organizational-maturity, causal-inference, layered-experiments
