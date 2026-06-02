---
name: experiment-design
description: >
  Use this skill when the user asks how to design an experiment, what test type to use,
  how to set up a holdout, whether to use a bandit or A/B test, how to handle marketplace
  interference, what the randomization unit should be, how to structure a switchback,
  when to use quasi-experimental methods, or any question starting with "how should I
  design this test", "what kind of experiment", "should I use a holdout", "how do I
  randomize", or "can I even run an A/B test for this". Also triggers on "network effects",
  "interference", "SUTVA", "two-sided", or "geo experiment".
metadata:
  version: "0.1.0"
---

# Experiment Design

You are advising a Decision Scientist with strong stats instincts who is familiar with A/B
testing fundamentals. Be precise and direct. Skip basics unless asked. Flag tradeoffs
explicitly — there is almost always a tension between speed, power, and validity.

## Step 1: Diagnose the design problem first

Before recommending a design, identify:

1. **What is being randomized?** (user, session, geography, time period, offer)
2. **Is there interference risk?** (do units affect each other — network, marketplace, shared inventory)
3. **What is the unit of analysis?** (may differ from randomization unit — watch for variance underestimation)
4. **Is the treatment persistent or transient?** (persistent = user-level; time-varying = consider switchback)
5. **Is there a holdback concern?** (ethical, legal, business constraints on who can be in control)

Only after diagnosing these should a design be recommended.

## Design decision tree

```
Is there interference between units?
├── No → Standard A/B (user- or session-level)
│         └── Is sample size sufficient? → Power analysis before committing
└── Yes → What kind of interference?
          ├── Network / social → Cluster randomization or graph-cluster design
          ├── Marketplace (supply/demand spillover) → Switchback or geo holdout
          ├── Shared inventory / budget → Geo split or synthetic control
          └── Time-varying treatment → Switchback design
```

## Design types — when to use each

**Standard A/B (user-level randomization)**
- Default for most consumer product experiments (UI, notifications, onboarding, feature flags)
- SUTVA must hold: treatment of user A cannot affect user B
- Randomize on stable ID (user_id, not session or device where possible)
- Watch for: novelty effects, SRM, cookie churn

**Holdout / Holdback**
- A persistent control group excluded from a feature after launch
- Use when: you need long-run causal estimates beyond the initial test window; novelty effects suspected; stakeholder requires ongoing baseline
- Cost: opportunity cost of withholding a presumed-good feature; population drift over time
- Best practice: pre-register holdout size and duration before launch

**Switchback (time-based randomization)**
- Alternate treatment/control across time periods within a unit (geo, market, cohort)
- Use when: two-sided marketplace interference makes user-level impossible; treatment affects supply and demand simultaneously
- DoorDash and Lyft canonical use case: driver/consumer spillover
- Key requirement: randomize switch timing; use cluster-robust standard errors; burn-in period between switches
- See `references/switchback.md` for detailed implementation

**Geo / Market holdout**
- Randomly assign geographic markets to treatment vs. control
- Use when: network effects are regional; product changes affect supply-side behavior; user-level ID is unavailable or unreliable
- Power is much lower — typically need 20–50+ markets for adequate power
- Synthetic control is a stronger alternative when market count is small (<20)

**Synthetic control**
- Construct a weighted combination of control units to match the pre-treatment trend of the treated unit
- Use when: only one or a few units treated (e.g., one market, one retailer partner goes live)
- Academic origin: Abadie, Diamond & Hainmueller (2010) — widely used at Uber, Google, Lyft
- Requires: long pre-treatment period (ideally 2x the treatment period); stable donor pool
- Validates via placebo tests on untreated units

**Bandit / Adaptive experiments**
- Multi-armed bandit (Thompson sampling, UCB) continuously reallocates traffic toward better-performing arms
- Use when: many variants to test; regret minimization matters more than causal inference; short decision horizon
- Do NOT use when: you need clean causal estimates for reporting; treatment effects take time to materialize; novelty effects likely
- Epsilon-greedy is simple but inferior to Thompson sampling for most product cases

**Quasi-experimental / Observational fallbacks**
Use only when randomization is impossible:
- **Diff-in-diff**: requires parallel trends assumption; use with staggered rollout
- **Regression discontinuity**: requires sharp threshold (e.g., users who hit exactly N purchases); strong local validity, weak external validity
- **Instrumental variables**: requires a valid instrument (rare); used at Airbnb, LinkedIn for network effect estimation
- **Interrupted time series**: single-unit treatment; controls for autocorrelation; weaker than RCT

## Randomization unit — the most common mistake

Mismatch between randomization unit and analysis unit inflates false positives.

| Situation | Recommended unit | Why |
|---|---|---|
| Feature/UI change | user_id | Stable, avoids within-user contamination |
| Push notification | user_id | One user = one treatment assignment |
| Session-level personalization | user_id still | Session randomization causes within-user mixing |
| Marketplace algorithm | geo or time period | User-level has interference |
| Offer ranking | user_id with triggered analysis | Only analyze users who saw the surface |

**Triggered analysis**: when not all randomized users are exposed to the treatment, analyze only
the triggered (exposed) subset. Preserves intent-to-treat for the full population but gives
higher power for the exposed subgroup. Document both.

## Key validity threats to flag proactively

- **SUTVA violation**: treatment of one unit affects another — the most common hidden invalidator
- **SRM (sample ratio mismatch)**: actual traffic split ≠ intended split — always check before analysis
- **Novelty / primacy effects**: users behave differently because it's new (novelty) or because they learned a pattern (primacy) — both decay; consider holdout to separate
- **Survivorship bias**: if assignment happens post-event (e.g., first purchase), results are biased
- **Carryover**: in switchback, previous period treatment bleeds into current — enforce wash-out windows

## References

- `references/switchback.md` — switchback design deep dive
- `references/quasi-experimental.md` — when and how to use observational methods
- `references/interference.md` — network effects and SUTVA violations in detail
