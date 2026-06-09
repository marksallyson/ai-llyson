---
title: LinkedIn
type: company
tags: [causal-inference, cluster-randomization, exposure-logging, interference, network-effects, platform, two-sided-markets, variance-reduction]
source_url: https://engineering.linkedin.com/blog/topic/experimentation
added: 2026-06-04
---

# LinkedIn

## At a Glance
LinkedIn runs ~400 experiments per day on their XLNT (eXperimentation and LiNkedIn Testing) platform. Under Ya Xu's leadership, they produced landmark papers on interference in social networks and causal inference — problems that are acutely relevant to any platform with network structure.

## Why They Matter
LinkedIn's network is fundamentally a two-sided marketplace (members + companies/recruiters), and their experimentation challenges map closely to Ibotta's: users influence each other (viral offers, referral mechanics), treatment assignment interacts with social structure, and naive intent-to-treat estimates understate true effects. Their published work on network interference and ego-cluster randomization is the clearest treatment of this problem available outside of academic literature.

## Key Contributions
- **XLNT platform**: handles ~400 experiments/day with automated metric computation, SRM checking, and exposure logging
- **Ego-cluster randomization**: assign experiments at the cluster level (a user + their connections) to reduce interference; LinkedIn operationalized this at scale
- **"Mediation modeling" and causal graphs** applied to social network experiments (Ya Xu et al.)
- **Ocelot**: causal inference platform for observational studies and quasi-experiments; handles cases where RCT is not feasible
- **Variance reduction via CUPED + covariate adjustment** extended to networked settings
- **"Improving the Sensitivity of Online Controlled Experiments: Case Studies at LinkedIn"** — engineering blog series documenting real lift improvements from variance reduction

## Takeaways for Practice
1. **If Ibotta runs referral or social-sharing experiments, cluster randomization is mandatory.** Assigning individual users to treatment/control in a referral program means control users get referred by treatment users — the groups aren't independent, and the ATE is biased. Randomize at the referral chain or household level.
2. **XLNT's design (exposure logging separate from assignment logging) is the right pattern** for any experiment where not all assigned users see the treatment. At Ibotta, a user may be "assigned" to a promoted offer but never open the app. Log exposure separately and compute intent-to-treat and treated-only estimates.
3. **For any experiment on a feature that's inherently viral (e.g., "share this offer"), pre-register that interference is expected and plan for it in the analysis.** Document this in your experiment design doc so stakeholders aren't surprised when effects look smaller than expected.
4. **Ocelot's approach — use observational causal methods when RCT is not possible** — is directly applicable to Ibotta situations like testing fee changes (can't randomize prices across users) or testing onboarding changes for a new cohort.
5. **Read Ya Xu's papers before building any network-aware metric.** Her work on defining "engagement" in the presence of spillovers is directly applicable to measuring the impact of offers on user activity beyond the redemption event itself.

## Action Items / Things to Read
- Xu et al. (2015) "From Infrastructure to Culture: A/B Testing Challenges in Large Scale Social Networks" — KDD 2015
- LinkedIn Engineering Blog: experimentation tag — https://engineering.linkedin.com/blog/topic/experimentation
- Gui et al. (2015) "Network A/B Testing: From Sampling to Estimation" — WWW 2015
- Ya Xu's Stanford PhD dissertation (available via ProQuest)

## Tags
causal-inference, cluster-randomization, exposure-logging, interference, network-effects, platform, two-sided-markets, variance-reduction
