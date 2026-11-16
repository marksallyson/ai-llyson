---
title: Ya Xu
type: individual
tags: [causal-inference, cluster-randomization, interference, network-effects, platform, two-sided-markets, variance-reduction, xlnt]
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
causal-inference, cluster-randomization, interference, network-effects, platform, two-sided-markets, variance-reduction, xlnt

---

## Recent: 2026-11-16 — From More to Better: Causal Inference and Digital Experimentation in the Age of AI (CIDER Roundtable, arXiv:2611.16335)

**Source:** arXiv:2611.16335, submitted November 12, 2026 · https://arxiv.org/abs/2611.16335  
**Authors:** Winston Chou + 20 co-authors including Ronny Kohavi, Diane Tang, Ya Xu, Somit Gupta, David Holtz, Nathan Kallus, Mårten Schultzberg, Avi Feller

**What they did:** Ya Xu is a co-author of the 2026 CIDER Roundtable perspective paper, the most significant experimentation-focused publication since her 2020 book. Given her work on network interference and variance reduction, her contribution likely covers the "triangulating evidence types" and "generalization" challenges in the paper's three-part framework.

**Key results:** See full entry in papers/from-more-to-better-cider-2026.md. The paper's argument that AI makes the generalization problem harder is consistent with Xu's longstanding focus on when experiment results can be trusted to transfer — from her network interference work, she knows well that local experiment results don't always generalize to the full population.

**Why it matters:** Xu's voice on AI-era experimentation carries particular weight because she has seen the full arc from academic statistics to LinkedIn-scale platform to Google DeepMind. Her endorsement of the "credibility auditor" framing signals it's the professional identity DS teams should be building toward.

**Tags added:** industry-consensus, agentic-ai, generalization, scientific-methodology
