# Experiment Lab Glossary

Key terms used across skills and knowledge base entries. 2-3 sentence definitions with pointers to where each concept is covered in depth.

---

**SUTVA (Stable Unit Treatment Value Assumption)**
The assumption that the treatment applied to one unit does not affect the outcome of any other unit. SUTVA violations occur in marketplaces (supply/demand spillover), social networks (network effects), and shared-resource systems. When SUTVA fails, user-level A/B tests produce biased estimates — see the **experiment-design** skill (references/interference.md) and `knowledge-base/companies/airbnb.md`.

**OEC (Overall Evaluation Criterion)**
The single primary metric that determines whether an experiment ships or not. A good OEC is sensitive (moves within the experiment window), causally predictive of long-term value, and not gameable. Covered in depth in the **experiment-strategy** skill (references/oec-design.md).

**SRM (Sample Ratio Mismatch)**
A validity check that fails when the observed traffic split significantly differs from the intended split (tested with χ² at p < 0.01). SRM almost always indicates an instrumentation or assignment bug — never interpret metric results when SRM is present. Covered in the **statistical-methods** skill (references/srm.md) and `knowledge-base/papers/srm-paper.md`.

**MDE (Minimum Detectable Effect)**
The smallest effect size that an experiment is powered to detect with the specified Type I and Type II error rates. MDE should be the smallest effect that is *business-meaningful*, not the effect you expect to see. Setting MDE optimistically (too small) leads to systematically underpowered tests. Covered in the **statistical-methods** skill.

**CUPED (Controlled-experiment Using Pre-Experiment Data)**
A variance reduction technique that uses pre-experiment behavior as a covariate to reduce the variance of treatment effect estimators. The adjusted estimator Y_adj = Y - θ(X - E[X]) has the same expected value as Y but lower variance by a factor of (1 - ρ²), where ρ is the correlation between pre- and post-experiment metrics. Now industry standard at Microsoft, Netflix, Airbnb, DoorDash, and many others. See `knowledge-base/papers/cuped-paper.md` and the **statistical-methods** skill.

**CUPAC (Covariate-Adjusted Potential Outcomes using ML Predictions as Covariate)**
DoorDash's extension of CUPED that uses ML model predictions (rather than raw prior metrics) as the covariate — capturing nonlinear pre-experiment patterns for larger variance reduction than standard CUPED. Typical improvement: 40–60% variance reduction vs. 20–40% for standard CUPED. See `knowledge-base/companies/doordash.md` and `knowledge-base/articles/doordash-experiment-capacity.md`.

**iROAS (Incremental Return on Ad Spend)**
The standard performance marketing metric for measuring true causal lift from an advertising or promotional intervention. iROAS = (revenue from treated users - revenue from matched control users) / ad spend. Requires a clean holdout or control group; see the **experiment-strategy** skill (incrementality section).

**Holdout / Holdback**
A persistent control group excluded from a feature after it has launched to the general population. Holdouts measure long-run causal effects beyond the initial test window and detect novelty/primacy effects. The cost is opportunity cost of withholding a presumed-good feature. Covered in the **experiment-design** skill and `knowledge-base/companies/netflix.md`.

**Switchback**
A time-based experiment design where a unit (geo, market, cohort) alternates between treatment and control across time windows. Used when user-level randomization is impossible due to two-sided marketplace interference. Requires cluster-robust standard errors and wash-out windows between periods. Covered in depth in the **experiment-design** skill (references/switchback.md) and `knowledge-base/companies/uber.md`.

**Sequential testing**
Statistical methods that allow valid inference at interim analyses without inflating the Type I error rate. Approaches include alpha spending (O'Brien-Fleming, Pocock), always-valid inference/mSPRT, and Bayesian sequential monitoring. The alternative to pre-specifying a fixed horizon and never peeking. Covered in the **statistical-methods** skill and `knowledge-base/papers/peeking-problem.md`.

**mSPRT (mixture Sequential Probability Ratio Test)**
A specific always-valid sequential test that allows valid inference at any stopping time. Unlike alpha spending, mSPRT does not require pre-specifying the number or timing of looks. Implemented in Statsig, Eppo, and Booking.com's platform. Introduced by Johari et al. (2017); see `knowledge-base/papers/peeking-problem.md` and `knowledge-base/individuals/chetan-sharma.md`.

**Novelty effect**
The phenomenon where users engage more with a new feature simply because it's new — inflating the treatment effect estimate beyond the true steady-state effect. The effect decays as users habituate. Characterized by a declining treatment effect over the experiment window. Covered in the **experiment-strategy** skill (references/novelty-effects.md).

**Primacy effect**
The opposite of novelty: users have learned the old interface and perform worse with the new one initially. The true treatment effect is lower early in the experiment and grows as users adapt. Characterized by an increasing treatment effect over the experiment window. Covered in the **experiment-strategy** skill (references/novelty-effects.md).

**Network interference**
A form of SUTVA violation where treating one user affects connected users through social or economic ties — common in social networks, two-sided marketplaces, and communication products. Standard A/B tests are invalid under network interference. Remedies include cluster randomization (assign communities together), ego-network designs, and graph-cluster methods. Covered in the **experiment-design** skill (references/interference.md) and `knowledge-base/companies/linkedin.md`, `knowledge-base/individuals/ya-xu.md`.

**Cluster randomization**
An experiment design that randomizes at the group level (clusters) rather than the individual level, to prevent interference within clusters. Used when units within a cluster interact strongly. Reduces effective sample size (power) relative to individual randomization — a key tradeoff to quantify. Covered in the **experiment-design** skill (references/interference.md).

**Synthetic control**
A quasi-experimental method that constructs a weighted combination of untreated units to serve as a counterfactual for a treated unit. Used when only one or a few units are treated (e.g., one market, one retailer). Requires a long pre-treatment period and a stable donor pool. Validated via placebo tests. Covered in the **experiment-design** skill and `knowledge-base/companies/shopify.md`.

**DID (Difference-in-Differences)**
A quasi-experimental estimator that compares the change in outcome for treated units to the change for control units before vs. after treatment. Identifies causal effects under the parallel trends assumption. With staggered rollouts, use Callaway & Sant'Anna (2021) or Sun & Abraham (2021) estimators rather than classic 2x2 DiD. Covered in the **experiment-design** skill (references/quasi-experimental.md).

**Interleaving**
An experiment design for ranking/recommendation systems that exposes a user to a blend of results from two ranking algorithms simultaneously, rather than assigning users to separate ranked lists. More sensitive than A/B for ranking evaluation because each user serves as their own control. Used at Pinterest, DoorDash, Netflix. Covered in `knowledge-base/companies/pinterest.md` and `knowledge-base/companies/doordash.md`.

**Guardrail metric**
A metric that must not significantly degrade during an experiment, even if the OEC improves. Guardrails are safety checks, not decision metrics. An experiment should not ship if any guardrail degrades at the pre-specified significance threshold, regardless of OEC result. Covered in the **experiment-strategy** skill and `knowledge-base/companies/booking-com.md`.
