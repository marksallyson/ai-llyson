# Quasi-Experimental Methods

Use when randomization is impossible or unethical. These are always second-best to RCTs —
be explicit about the identifying assumptions and their plausibility.

## Difference-in-Differences (DiD)

**Identifying assumption**: parallel trends — in the absence of treatment, treated and control
units would have followed the same trajectory.

**When to use**: staggered rollouts, market-level interventions, before/after with a control group.

**Key considerations**:
- Test parallel pre-trends visually and statistically (event study plot)
- With staggered adoption, standard 2x2 DiD is biased — use Callaway & Sant'Anna (2021)
  or Sun & Abraham (2021) estimators
- Heterogeneous treatment effects across cohorts cause the classic estimator to have
  negative weights (Goodman-Bacon decomposition)

**When parallel trends is implausible**: use synthetic control instead.

## Regression Discontinuity (RD)

**Identifying assumption**: units just above and just below a threshold are comparable —
assignment is "as good as random" near the cutoff.

**When to use**: sharp thresholds exist in the data (loyalty tiers, eligibility rules,
score cutoffs, purchase milestones).

**Key considerations**:
- Bandwidth selection is critical — use Calonico, Cattaneo & Titiunik (2014) optimal bandwidth
- Test for manipulation at the cutoff (McCrary density test)
- Local validity only — effects may not generalize away from the threshold
- Fuzzy RD (imperfect compliance at threshold) requires IV-style estimation

## Instrumental Variables (IV)

**Identifying assumption**: instrument affects outcome only through the treatment (exclusion
restriction) and is correlated with treatment (relevance).

**When to use**: endogenous treatment assignment; selection into features; when you have
a natural experiment that affected some users but not others.

**Common instruments in tech**:
- Random assignment of UI variants that affect feature discovery (for studying feature use)
- Exogenous variation in notification delivery (timing, push failures)
- Geographic variation in feature launch timing

**Key considerations**:
- Weak instruments (F < 10) produce badly biased IV estimates — report first-stage F
- Identifies LATE (Local Average Treatment Effect) for compliers only, not ATE
- Exclusion restriction is untestable — argue it carefully

## Interrupted Time Series (ITS)

**When to use**: single treated unit, no control group, treatment at a known time point.

**Key considerations**:
- Model autocorrelation explicitly (ARIMA or segmented regression with autocorrelation correction)
- Threats: simultaneous events at the intervention time; regression to the mean
- Stronger with a control series (comparative ITS / synthetic control hybrid)

## Synthetic Control

**Geo holdout with synthetic control**: When you have fewer than ~20 markets, construct a synthetic control by weighting untreated markets to match the pre-treatment trend of the treated market(s). The weight vector is solved via constrained regression (minimizing pre-treatment RMSE). Validate by running placebo tests — apply the same method to untreated units and confirm effect estimates are near zero. This is the standard approach at Uber, Google, and Shopify for single-market or few-market interventions.

## Hierarchy of evidence

When choosing a method, be explicit about where you sit:

```
RCT (gold standard)
  ↓ weaker
Regression Discontinuity (sharp, well-defended)
  ↓
Difference-in-Differences (parallel trends defensible)
  ↓
Synthetic Control (few treated units, long pre-period)
  ↓
Instrumental Variables (valid instrument available)
  ↓
Interrupted Time Series
  ↓
Observational regression (weakest — confounding likely)
```

Always report the identifying assumption, what would falsify it, and any available tests.
