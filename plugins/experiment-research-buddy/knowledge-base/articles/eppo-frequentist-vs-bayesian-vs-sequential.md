---
title: "Comparing Frequentist, Bayesian, and Sequential Approaches to A/B Testing"
type: article
tags: [always-valid-inference, bayesian, booking-com, frequentist-vs-bayesian, sequential-testing, spotify]
source_url: https://www.geteppo.com/blog/comparing-frequentist-vs-bayesian-approaches
added: 2026-06-15
---

# Comparing Frequentist, Bayesian, and Sequential Approaches to A/B Testing

**Author**: Eppo Engineering
**Venue**: Eppo Blog
**Source**: https://www.geteppo.com/blog/comparing-frequentist-vs-bayesian-approaches

## At a Glance
Eppo's structured comparison of the three dominant statistical approaches in modern experimentation platforms — frequentist (fixed sample), Bayesian, and sequential testing — with tradeoff analysis and attribution of which major companies use which approach.

## Why They Matter
Eppo (acquired by Datadog in 2025, founded by Chetan Sharma) publishes some of the most rigorous practitioner content in the field. This post is the clearest single-source comparison of the three approaches for someone deciding what to use at Ibotta. Notably: Eppo itself chose sequential testing as its default, not Bayesian.

## Key Contributions
- **Company attribution**: explicitly names Spotify and Booking.com as adopters of group sequential testing; Meta as running at scale with fixed frequentist runtimes
- **Bayesian weaknesses at scale**: "more challenging to implement and compute at scale for complex models"; prior selection requires documented historical data; weaker statistical guarantees than sequential
- **Sequential testing as the industry convergence point**: framed as the practical solution that combines frequentist rigor (exact Type I error control) with Bayesian flexibility (valid early stopping)
- **Tradeoff table**: tightest CIs and highest power → frequentist; most interpretable → Bayesian; best balance for production → sequential
- **No pilot/transition stories**: the post does not describe how companies moved from one approach to another — purely comparative

## Takeaways for Practice
1. **If Ibotta is choosing between approaches, sequential testing is the practical consensus** among the best experimentation teams (Spotify, Booking.com, Eppo). It solves the peeking problem with frequentist guarantees and doesn't require a prior.
2. **Bayesian's main advantage is stakeholder communication, not statistical rigor.** "87% chance B beats A" resonates with PMs. If that's the primary pain point, consider a Bayesian communication layer on top of sequential inference.
3. **Frequentist fixed-sample works well when you can enforce runtime.** If Ibotta's experiments have pre-committed end dates and nobody peeks, frequentist is fine. The problem is enforcement, not the method.
4. **Booking.com and Spotify didn't choose Bayesian despite their scale and resources.** This is a strong signal. If these teams — who have the engineering capacity to implement anything — chose sequential, that's the recommendation to take seriously.
5. **Google's reversal is worth noting.** Google Optimize used Bayesian; when they sunset it and migrated to Firebase A/B Testing in 2023, they switched to frequentist. That's a public signal that Bayesian didn't scale or satisfy their needs at that level.

## Action Items / Things to Read
- [Full Eppo post](https://www.geteppo.com/blog/comparing-frequentist-vs-bayesian-approaches)
- Johari et al. mSPRT paper — the sequential testing foundation; see `papers/peeking-problem.md`
- Spotify Confidence platform — the best sequential testing product available externally; see `companies/spotify.md`
- Chetan Sharma's Substack — more rigorous practitioner content from Eppo's founder; see `individuals/chetan-sharma.md`

## Tags
always-valid-inference, bayesian, booking-com, frequentist-vs-bayesian, sequential-testing, spotify
