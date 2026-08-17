---
title: Spotify
type: company
tags: [always-valid-inference, bayesian, long-term-effects, metric-design, organizational-maturity, personalization, platform, sequential-testing, warehouse-native]
source_url: https://confidence.spotify.com
added: 2026-06-04
---

# Spotify

## At a Glance
Spotify built and eventually spun out their internal experimentation platform as Confidence (confidence.spotify.com). Their "learning framework" reframes experiments not as pass/fail decisions but as opportunities to understand the space — particularly important for teams that run experiments expecting null results as much as positive ones.

## Why They Matter
Spotify's organizational contribution — the idea that "learning" from a null result is as valuable as a positive result — is culturally important for DS teams that face pressure to ship winning features every sprint. Their technical contribution, the Confidence platform (now available externally), is relevant for any team evaluating warehouse-native experimentation tools. Their separation of the personalization stack from the experimentation stack is also a useful architectural pattern.

## Key Contributions
- **Confidence platform**: warehouse-native experimentation platform; supports sequential testing, Bayesian decision rules, and custom metric computation; spun out from Spotify as a standalone product
- **"The Spotify Learning Framework"**: internal philosophy that experiments are not just "did it win?" but "what did we learn?" — includes negative results reporting
- **Separated personalization and experimentation stacks**: the recommendation algorithm and the experiment assignment system are decoupled; this prevents personalization from biasing experiment assignment
- **Sequential testing at scale**: Spotify implemented always-valid inference (sequential probability ratio tests) to allow early stopping without inflating Type I error
- **"Engineering Experimentation at Spotify"** series: detailed engineering blog posts on platform architecture
- **Bayesian decision rules for long-tail experiments**: for experiments where frequentist power is unachievable, Spotify uses Bayesian methods with informative priors

## Takeaways for Practice
1. **If Ibotta's personalization algorithm influences which users see which offers, it must be decoupled from experiment assignment.** If the personalization model routes "high-value users" to treatment, the treatment and control groups are not comparable — you're measuring the interaction of personalization × treatment, not treatment alone.
2. **Sequential testing (always-valid inference) is the right solution to the peeking problem.** Spotify's implementation allows analysts to check results mid-experiment without inflating Type I error. If Ibotta stakeholders check dashboards before experiments end, sequential testing is the fix.
3. **Adopt a "learning from null results" norm.** For every Ibotta experiment that shows no significant effect, document what you learned about user behavior, not just that the feature didn't work. This makes null results valuable artifacts rather than failures.
4. **Evaluate Confidence as an off-the-shelf platform** if Ibotta is considering warehouse-native experimentation tooling. It's built on real production experience, not a vendor's best guess.
5. **Bayesian methods are appropriate when sample sizes are too small for frequentist power** — common in offer-level experiments with a small brand partner. Define your prior based on historical conversion rates for similar offer types.

## Action Items / Things to Read
- confidence.spotify.com — platform documentation and blog
- "Spotify's New Experimentation Platform" — Spotify Engineering Blog
- "The Spotify Learning Framework" — search Spotify R&D blog
- Johari et al. (2017) "Peeking at A/B Tests: Why It Matters, and What to Do About It" — foundational sequential testing paper; Spotify's implementation is based on this
- Deng et al. (2016) "Continuous Monitoring of A/B Tests without Pain: Optional Stopping in Bayesian Testing" — complementary approach

## Tags
always-valid-inference, bayesian, long-term-effects, metric-design, organizational-maturity, personalization, platform, sequential-testing, warehouse-native

---

## Recent: 2026-05-18 — Better Experiments with LLM Evals — A Funnel, Not a Fork

**Source:** Spotify Engineering Blog, May 18, 2026 · https://engineering.atspotify.com/2026/5/better-experiments-with-llm-evals-a-funnel-not-a-fork  
**Authors:** Matilda Ankargren, Mårten Schultzberg

**What they argue:** LLM-based evaluations (automated judges that score relevance, coherence, tone, and intent alignment at scale) should sit *upstream* of A/B tests, not replace them. The right relationship is a funnel: use LLM evals to validate that a change does what you intended before you commit to an A/B test; use the A/B test to validate that the change drives business outcomes. Spotify reports that only ~12% of their A/B tests result in a shipped positive feature, while ~64% produce valid learning (a regression caught, a hypothesis ruled out). LLM evals can raise the quality bar on what enters the test queue.

**Why it's interesting:** Most teams treat evals and experiments as alternatives — "we'll use evals for LLM features, experiments for everything else." Spotify's framing correctly identifies the flaw: evals can tell you if the model does what you intended; only an experiment can tell you if what you intended actually moves the metric. The 12% ship rate stat is a useful benchmark — if Ibotta's ship rate is significantly higher, either the team is running underpowered tests, or the experiment bar is too low.

**Ibotta relevance:** Ibotta increasingly tests AI-generated offer copy, personalized messaging, and recommendation algorithms. LLM evals as a pre-experiment filter — scoring copy quality or offer relevance before committing a variant to a multi-week A/B test — could significantly improve test queue quality and reduce wasted experiment capacity.

**Tags added:** llm-evals, ai-products, experiment-quality, pre-experiment-screening

---

## Recent: 2026-08-13 — Bayesian Inference Procedures for A/B Testing: An Overview

**Source:** arXiv:2608.12949, August 13, 2026 · https://arxiv.org/abs/2608.12949  
**Authors:** Mårten Schultzberg and Mattias Frånberg (Spotify Confidence team)

**What they argue:** "Bayesian A/B testing" is not a single method — it's a family of configurations with fundamentally different statistical guarantees. The paper organizes these into a three-tier hierarchy: Tier 1 (posterior coherence, no error control), Tier 2 (Bayes factor stopping, bounded false positive rate), and Tier 3 (empirical Bayes with FDR control). The critical finding: many commercial experimentation platforms default to Tier 1, which provides no protection against repeated peeking — despite being marketed as a Bayesian alternative to frequentist testing.

**Why it's notable:** The authors prove that Bayes factor stopping (Tier 2) is near-optimal for virtually any reasonable cost function used in A/B testing — including those proposed in the academic literature. This is the first paper to provide a systematic overview and clear vocabulary for the Bayesian A/B testing landscape, giving DS teams the framework to ask vendors the right questions.

**Ibotta relevance:** If Ibotta evaluates warehouse-native experimentation platforms (Confidence, Eppo/Datadog Experiments, or others), this paper is required reading before making a choice. Ask specifically: which tier does your Bayesian implementation operate at? A Tier 1 platform with daily result checks still inflates your false positive rate.

**Full entry:** `papers/bayesian-ab-testing-overview-spotify-2026.md`

**Tags added:** bayesian, false-positive, tier-framework, platform-evaluation
