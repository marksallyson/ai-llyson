# Switchback Experiment Design — Deep Dive

## What it is

A switchback experiment randomizes treatment assignment across **time periods** rather than
across users. A unit (geo, market, cohort) alternates between treatment and control across
windows — e.g., hour 1 = treatment, hour 2 = control, hour 3 = treatment, etc.

## When it's the right call

The canonical case: **two-sided marketplace interference**.

If you randomize users in a rideshare or delivery marketplace:
- A driver serving a treatment user is unavailable to serve a control user
- A promo that increases demand in treatment draws supply away from control
- User-level A/B produces biased estimates because SUTVA is violated

Switchback sidesteps this by making the entire market treatment or control at any given time —
so there's no cross-contamination within a period.

## Key design decisions

### 1. Period length
- Too short: insufficient time for the system to reach steady state; carryover from prior period dominates
- Too long: fewer switches = less power; seasonal confounding within period
- Rule of thumb: period length ≥ 2–3x the system's equilibration time
  - Delivery marketplace: ~30–60 min periods
  - Weekly engagement features: day-level periods

### 2. Burn-in / washout
- Exclude observations immediately after a switch to let the system equilibrate
- Typical: drop first 10–20% of each period
- Must be pre-specified, not chosen post-hoc

### 3. Randomization of switch timing
- Don't alternate deterministically (ABAB...) — seasonal confounds will corrupt estimates
- Randomly assign treatment/control to each period; document the randomization seed

### 4. Standard errors
- Observations within a period are correlated — naive SE is too small → inflated Type I error
- Use **cluster-robust standard errors** clustered at the period level
- DoorDash published this explicitly: "Analyzing Switchback Experiments by Cluster Robust Standard Error to Prevent False Positive Results" (2021)

### 5. Power
- Switchback power depends on: number of switches, variance within vs. between periods, autocorrelation
- Simulate power using historical data; don't rely on standard A/B power calculators

## Estimation

Basic estimator: **difference in means across periods**

```
ATE = mean(outcome | treatment periods) - mean(outcome | control periods)
```

Better: **regression with period fixed effects**

```
Y_t = α + β·Treatment_t + γ_t + ε_t
```

Where `γ_t` are time fixed effects (e.g., hour-of-day, day-of-week) — soaks up temporal
confounding while β identifies the treatment effect.

## Common mistakes

- Ignoring within-period autocorrelation → standard errors too small → false positives
- Periods too short → carryover dominates → effect estimate attenuated
- Not randomizing switch order → day-of-week or hour-of-day confounds estimate
- Running too few switches → insufficient power

## Academic grounding

- Bojinov & Shephard (2019) — "Time Series Experiments and Causal Estimands" — formal
  framework for temporal interference and switchback validity
- Viviano & Bradic (2023) — optimal period length selection
- Hu et al. (2022, DoorDash) — cluster robust SE for switchback analysis
