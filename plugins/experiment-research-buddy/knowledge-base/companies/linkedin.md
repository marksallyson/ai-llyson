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

---

## Recent: 2026-04-17 — Multi-Experiment Analysis (MEA): Joint Estimation Across Overlapping Experiments

**Source:** arXiv 2604.16671, April 17, 2026 (LinkedIn Corporation) · https://arxiv.org/abs/2604.16671  
**Author:** Reza Hosseini (LinkedIn)

**What they propose:** LinkedIn published a paper introducing Multi-Experiment Analysis (MEA), a methodology for consistent joint estimation when multiple A/B experiments overlap on the same user traffic — and producing effect estimates that correspond to actionable real-world decisions. The core problem MEA solves: when experiment A and experiment B both run on the same users, the estimated effect of A is confounded by the presence of B. Neither estimate corresponds to the actual launch scenario ("ship A while B stays running"), so teams face a choice between serializing experiments (slow) or accepting biased estimates (risky). MEA produces three types of estimates:

1. **Corrected individual effects** — each experiment's true effect, adjusted for the presence of overlapping experiments running simultaneously
2. **Combined launch effects** — "if we launch variants A2 and B3 together, what's the expected total impact?" — without requiring a factorial experiment pre-design
3. **Conditional effects** — "what is A's effect *given that* B's variant will continue running?" — the most decision-actionable form; answers "should we launch A knowing B is permanent?"

MEA requires no factorial pre-design, no traffic restrictions, and no mutual exclusion of experiment groups. It's validated through simulation and deployed in LinkedIn's production experimentation system.

**Why it matters:** This is the most rigorous published treatment of the overlapping experiments problem for practitioners — more actionable than the Microsoft "1-in-50,000" empirical result (which tells you interaction rates are low) because MEA gives you a method to *estimate* what those interactions are when they do exist. The conditional effects estimate is the key innovation: before launching a feature, you can ask "given the experiment landscape as it currently stands, what's the true marginal lift of this feature?" That's the question product teams actually need answered, and MEA answers it.

**Ibotta relevance:** Ibotta likely runs simultaneous experiments on offer algorithm, notification cadence, UI layout, and onboarding — all affecting the same users. MEA would let Ibotta: (1) estimate the true lift of an offer recommendation change corrected for whatever else is running; (2) calculate "if we launch the new notification cadence *and* the new offer layout, what's the expected combined effect?"; (3) answer "what's the offer algorithm's effect assuming the current notification experiment is permanent?" — the real question before a launch decision.

**Tags added:** overlapping-experiments, concurrent-experiments, multi-experiment, joint-estimation, causal-inference

---

## Recent: 2026-07-13 — Choosing Online Experiment Designs under Interference: A Robust Decision Framework

**Source:** arXiv 2605.25290, May 24, 2026 (LinkedIn authors) · https://arxiv.org/abs/2605.25290  
**Authors:** Prashant Shekhar and Caroline Howard (LinkedIn)

**What they propose:** LinkedIn researchers published a framework for *choosing* which experiment design to use when you don't know in advance which interference mechanism will dominate. The problem they address: teams in ads, recommendations, and member-experience systems often plan experiments before they know whether the dominant spillover is through budgets, through graph connections, through temporal carryover, or through some combination. Each interference mechanism calls for a different design — but you typically commit to a design before you know which one is right.

The paper formalizes this as a **robust design selection problem over an ambiguity set**: rather than optimizing for a single assumed interference model, you minimize *worst-case planning risk* over a range of plausible interference mechanisms. Six implementable designs are compared: standard RCT, cluster randomization, ego-cluster randomization, switchback (time-based), geo-holdout, and fractional factorial. Each design is scored on a composite risk that weighs exposure bias, assignment-unit variance, minimum detectable effect, contamination or carryover, operational cost, and estimand mismatch.

**Key result:** No single design dominates across all interference mechanisms — which is why a decision framework is needed. For ads and recommendation systems (where budget and inventory interference is common), ego-cluster designs often win. For temporal systems with carryover (like notification cadence or feed ranking), switchback designs are more robust. The framework outputs a ranked set of designs given any prior over the interference ambiguity set.

**Why it matters:** This is the most practically useful treatment of the "which design should I use?" question for teams running experiments with any form of network or marketplace interference. Most practitioners treat this as an art — they pick cluster randomization "because we have network effects" without formally comparing it to alternatives. This paper gives you a decision procedure.

**Ibotta relevance:** Ibotta has at least two interference mechanisms in play: (1) **household spillover** — when one household member links their loyalty card (e.g., Walmart), the discount applies to household-level behavior that a user-level randomization can't isolate; (2) **temporal carryover** — a user exposed to a high-value offer this week may have elevated purchase intent next week regardless of treatment assignment. The robust design selection framework gives Ibotta a structured way to pick the right experiment design for each offer category rather than defaulting to user-level randomization for everything.

**Tags added:** interference, cluster-randomization, switchback, ego-cluster, robust-design, marketplace, two-sided-markets
