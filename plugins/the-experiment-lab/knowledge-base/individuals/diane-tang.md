---
title: Diane Tang
type: individual
tags: [overlapping-experiments, platform, causal-inference, organizational-maturity]
source_url: https://research.google/people/DianeGTang/
added: 2026-06-04
---

# Diane Tang

## At a Glance
Diane Tang is a Principal Scientist at Google Research and co-author of both *Trustworthy Online Controlled Experiments* (2020) and the 2010 KDD paper "Overlapping Experiment Infrastructure: More, Better, Faster Experiments" — one of the most cited papers in product experimentation.

## Why They Matter
Tang's 2010 KDD paper solved a problem that every team running more than a handful of concurrent experiments faces: how do you run thousands of experiments at the same time without them contaminating each other? Her overlapping layers framework is the architectural foundation for most modern experimentation platforms. If you ever design or evaluate an experiment platform, you need to understand this paper.

## Key Contributions
- **"Overlapping Experiment Infrastructure: More, Better, Faster Experiments"** (Tang, Longbotham, et al., KDD 2010): introduced the concept of experiment layers and domains; solved the concurrent experiment contamination problem at scale
- **Co-authored *Trustworthy Online Controlled Experiments*** (2020): brought Google's institutional knowledge to the book alongside Microsoft and LinkedIn perspectives
- **Google Ads experimentation**: contributed to the framework for running concurrent experiments across Google's advertising systems — a high-stakes environment where contamination has direct revenue consequences
- **Practical infrastructure design**: Tang's work is notable for being grounded in engineering reality, not just statistical theory — the 2010 paper describes actual implementation tradeoffs

## Takeaways for Practice
- **Read the 2010 KDD paper before evaluating or designing any experiment assignment system.** It's 12 pages; it answers the "can we run two experiments on the same users at the same time?" question definitively.
- **The layers concept directly applies to Ibotta's experiment scheduling.** If an offer value test and a notification test are running simultaneously, they should be in independent layers so users can be in both without the combination being a confound. Explicitly map this out in your experiment calendar.
- **Tang's contribution to the book is the Google perspective on infrastructure** — read her sections alongside Kohavi's Microsoft sections to understand how similar principles manifest differently at different companies.
- **The 2010 paper's "orthogonality" concept** — experiments in different layers are statistically independent because users are re-randomized at each layer — is a key insight for understanding why having many concurrent experiments doesn't inherently bias results if the system is designed correctly.

## Action Items / Things to Read
- Tang et al. (2010) "Overlapping Experiment Infrastructure: More, Better, Faster Experiments" — KDD 2010; free via Google Research
- *Trustworthy Online Controlled Experiments* — Kohavi, Tang, Xu (2020) — read alongside her papers for context
- Google Research profile: research.google/people/DianeGTang — for paper list

## Tags
overlapping-experiments, platform, causal-inference, organizational-maturity, layers, concurrent-experiments, infrastructure
