---
title: Ya Xu
type: individual
tags: [causal-inference, network-effects, interference, variance-reduction, platform, two-sided-markets]
source_url: https://www.linkedin.com/in/ya-xu-stats/
added: 2026-06-04
---

# Ya Xu

## At a Glance
Ya Xu holds a PhD in Statistics from Stanford and has led experimentation and causal inference at Microsoft, LinkedIn (as Head of Data Science), and Google DeepMind. She is co-author of *Trustworthy Online Controlled Experiments* and produced landmark work on causal inference in social networks — the clearest practitioner treatment of interference in networked settings.

## Why They Matter
Xu's work sits at the intersection of rigorous statistics and production scale. Her papers on interference in social networks are the primary reference for any team running experiments where treated users can affect control users through a network (referrals, social features, virality). Her variance reduction work extends CUPED to more complex settings (networks, non-continuous outcomes). For Ibotta, her work is most relevant for referral program experiments, social sharing features, and situations where offer uptake is influenced by peer behavior.

## Key Contributions
- **Co-authored *Trustworthy Online Controlled Experiments*** (2020): contributed LinkedIn's institutional knowledge and network-specific challenges
- **"From Infrastructure to Culture: A/B Testing Challenges in Large Scale Social Networks"** (Xu et al., KDD 2015): the foundational paper on network interference for practitioners
- **XLNT platform** at LinkedIn: built the system that handles ~400 experiments/day; documented the architecture and statistical methods
- **Ego-cluster randomization**: operationalized cluster-based experiment designs for social network settings at LinkedIn scale
- **Causal inference under network interference**: developed estimators that account for spillover effects between connected users
- **Variance reduction in networked settings**: extended CUPED-style methods to settings where pre-experiment covariates include network features
- **Stanford Statistics PhD** and prolific academic-practitioner bridge: her work is rigorous enough to cite academically and practical enough to implement

## Takeaways for Practice
- **Read her 2015 KDD paper if Ibotta has any feature with social/network properties.** Even if Ibotta isn't a social network, referral mechanics create a small network. This paper tells you exactly how to design around it.
- **Her LinkedIn Engineering Blog posts are more digestible than the academic papers** for initial understanding — read those first, then go to the papers for details.
- **Xu's variance reduction extensions matter for Ibotta because pre-experiment covariates for social features include network-level variables** (number of referred friends, referral chain depth). Standard CUPED uses individual covariates; her extensions handle network features.
- **Her career arc (academic PhD → Microsoft → LinkedIn → Google DeepMind) is a useful reference point** for how a DS moves from practitioner to research leader. Her talks describe what skills matter at each stage.
- Follow her on LinkedIn for current work at Google DeepMind.

## Action Items / Things to Read
- Xu et al. (2015) "From Infrastructure to Culture: A/B Testing Challenges in Large Scale Social Networks" — KDD 2015
- *Trustworthy Online Controlled Experiments* — Kohavi, Tang, Xu (2020) — her sections on LinkedIn and network experiments
- LinkedIn Engineering Blog posts by Ya Xu (search LinkedIn Engineering)
- Ya Xu's Stanford PhD dissertation — ProQuest

## Tags
causal-inference, network-effects, interference, variance-reduction, platform, two-sided-markets, cluster-randomization, xlnt
