---
title: Chetan Sharma
type: individual
tags: [sequential-testing, bayesian, warehouse-native, platform, causal-inference, organizational-maturity]
source_url: https://www.geteppo.com/blog
added: 2026-06-04
---

# Chetan Sharma

## At a Glance
Chetan Sharma was an early data scientist at Airbnb and is co-founder and CEO of Eppo, a warehouse-native experimentation platform acquired by Datadog in 2025. His Substack is one of the most technically rigorous practitioner publications on experimentation statistics, covering sequential testing, Bayesian methods, and warehouse-native architecture.

## Why They Matter
Sharma's background (Airbnb DS → built an experimentation platform) means he's encountered both the practitioner's daily problems and the platform builder's architectural challenges. His Substack posts are the best current writing on sequential testing in production — specifically, always-valid inference methods that let you monitor experiments continuously without p-value inflation. For Ibotta, this matters because stakeholders will check dashboards before experiments end; sequential testing is the statistically correct solution.

## Key Contributions
- **Eppo platform**: warehouse-native experimentation built on your existing data warehouse; supports CUPED, sequential testing, and Bayesian decision rules; acquired by Datadog 2025
- **Substack on experimentation statistics**: deep technical posts on sequential testing (always-valid inference, mSPRT), Bayesian methods, and warehouse-native architecture; one of the best current sources
- **Sequential testing for production experiments**: clear explanations of mixture Sequential Probability Ratio Tests (mSPRT) and when to use frequentist vs. Bayesian sequential methods
- **"The Case for Warehouse-Native Experimentation"**: documented argument for why experiments should run on your existing data warehouse rather than a separate SaaS data pipeline
- **Early Airbnb DS work**: contributed to the experimentation culture that Kohavi later scaled

## Takeaways for Practice
- **Read Sharma's Substack post on mSPRT before choosing a sequential testing method.** There are multiple valid approaches (Bayesian, frequentist sequential, always-valid inference) and they have different properties. His post is the clearest practitioner-level comparison.
- **The warehouse-native argument is directly relevant to Ibotta's data governance requirements.** If Ibotta has brand partner data agreements that restrict data egress, warehouse-native experimentation (Eppo or Statsig) means experiment computation happens inside your Databricks or Snowflake environment. Read Sharma's architecture posts before evaluating any experimentation platform.
- **Sharma's coverage of "what happens when stakeholders peek" is the best framing for making the case for sequential testing internally.** His posts use concrete examples with inflated false positive rates — more persuasive than abstract statistics.
- **Eppo's open documentation** (even post-Datadog acquisition) includes the statistical methods used, which is useful for evaluating whether the platform's methods match your requirements.
- Follow him on Substack and LinkedIn for current work.

## Action Items / Things to Read
- Eppo Blog: geteppo.com/blog — especially posts on sequential testing and warehouse-native architecture
- Chetan Sharma's Substack (search "Chetan Sharma experimentation Substack")
- "Sequential Testing for Online Experiments" — any Eppo blog post on this topic
- Johari et al. (2017) "Peeking at A/B Tests: Why It Matters and What to Do About It" — foundational paper; Sharma's posts expand on this

## Tags
sequential-testing, bayesian, warehouse-native, platform, causal-inference, msprt, always-valid-inference, eppo
