---
title: Meta
type: company
tags: [causal-inference, cluster-randomization, interference, mlrate, network-effects, platform, social-graph, surrogate-metrics, two-sided-markets, variance-reduction]
source_url: https://research.facebook.com/publications/
added: 2026-06-04
---

# Meta

## At a Glance
Meta (Facebook) runs experiments at a scale matched only by Google, with particular depth in network effects research, social graph interference, and surrogate metrics for long-term outcomes. Their published research spans hundreds of papers and is among the most technically rigorous in the industry.

## Why They Matter
Meta's core experimentation challenges — interference through social graphs, surrogate metrics for engagement, and the difficulty of measuring long-term effects in a short experiment window — are all problems Ibotta faces. Specifically, if Ibotta runs experiments on referral programs, social sharing features, or viral offer mechanics, Meta's network interference work is the primary reference. Their surrogate metric work is also directly applicable to measuring 30-day retention from a 7-day experiment.

## Key Contributions
- **Network interference at scale**: published multiple papers on how social graph connections between treated and control users bias standard ATE estimates
- **Cluster-randomized experiments**: operationalized ego-network and city-level cluster randomization for social experiments
- **Surrogate metrics**: developed and validated short-term proxies for long-term outcomes (engagement, retention) using historical holdout data
- **"A/B Testing Intuition Busters"** (co-authored with Microsoft ExP): catalog of experiments where intuition was systematically wrong
- **Quasi-experimental methods**: published on synthetic control and difference-in-differences for situations where RCT isn't feasible
- **Experimentation at scale**: documented the technical challenges of running 10,000+ experiments simultaneously on 3B+ users
- **Variance reduction via MLRATE**: machine-learning-based covariate adjustment that outperforms CUPED when the outcome-covariate relationship is nonlinear

## Takeaways for Practice
1. **For any Ibotta experiment involving social features (sharing, referrals, leaderboards), use Meta's cluster randomization framework.** Individual randomization in a social graph creates spillover. Even if Ibotta's social graph is sparse, document the assumption and check it empirically.
2. **MLRATE (ML-based covariate adjustment) is worth evaluating as an alternative to CUPED** when you have rich user feature data. For Ibotta users with complex behavioral histories, a gradient-boosted model predicting the outcome may explain more variance than a linear CUPED adjustment.
3. **Surrogate metric validation requires historical holdout data.** Before using a short-term metric as a proxy for long-term retention, you need historical experiments where both were measured. If Ibotta doesn't have that data, start building it now by logging long-term outcomes for current experiments.
4. **Meta's work on "experiment velocity vs. experiment quality" is worth reading.** Running more experiments is only valuable if they're trustworthy. Their internal processes for experiment review are described in conference talks.
5. **Interference effects in social graphs are typically smaller than you'd expect for non-social products** — but viral offer mechanics are a meaningful exception. Check for SUTVA violations by comparing treatment effects in high-degree vs. low-degree user subgroups.

## Action Items / Things to Read
- Backstrom & Kleinberg (2011) "Network bucket testing" — foundational network experiment paper from Facebook
- Eckles et al. (2017) "Estimating Peer Effects in Networks with Peer Encouragement Designs"
- Dimmery et al. (2019) "Shrinkage Estimators in Online Experiments" — Netflix + Meta collaboration
- Meta Research Blog: research.facebook.com — search "experimentation" and "causal inference"
- Kohavi & Deng (2022) "A/B Testing Intuition Busters" — includes Meta examples
- **Analytics at Meta (Medium):** https://medium.com/@AnalyticsAtMeta — practitioner blog covering experiment methodology, data infrastructure, and analytics leadership

## Tracked Sources
- https://medium.com/@AnalyticsAtMeta — check weekly for new articles

## Recent Articles (Analytics at Meta — Medium)

### Nov 2025 — "Why We Shouldn't Condition on Posttreatment Variables in Experiments"
Author: Anja Kilibarda. Covers a common but subtle experiment analysis mistake — conditioning on variables that are causally downstream of the treatment. Directly relevant to any experiment where you're tempted to filter your analysis population by post-assignment behavior (e.g., "only users who opened the app after being assigned"). **Ibotta-relevant:** applies directly to the triggered analysis discussion — filtering to "exposed" users is valid only when exposure is independent of treatment; this article explains what goes wrong when it isn't.

### Oct 2025 — "Ladder of Evidence in Understanding Effectiveness of New Products — Part I"
Author: Sarayu Sarangan. Framework for matching the right causal method (RCT, observational, quasi-experimental) to the question at hand, based on how much evidence you need and what's feasible. **Ibotta-relevant:** useful framing for when Ibotta can't run a clean A/B test (e.g., platform-wide changes, brand partner launches) and needs to choose between synthetic control, DiD, and observational methods.

### May 2026 — "A Blueprint for Valuing Content When A/B Tests Are Not an Option"
Authors: Asher Zafar and Anuj Kapoor. Meta's approach to causal inference for content valuation when randomization isn't possible — covers instrumental variables and natural experiments at scale. **Ibotta-relevant:** applicable to measuring the incremental value of offer content (brand creative, offer copy) when you can't randomize at the offer level cleanly.

## Tags
causal-inference, cluster-randomization, interference, mlrate, network-effects, platform, social-graph, surrogate-metrics, two-sided-markets, variance-reduction
