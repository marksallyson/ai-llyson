---
name: statistical-methods
description: >
  Use this skill when the user asks about power analysis, sample size calculation,
  CUPED, variance reduction, sequential testing, peeking, p-values, confidence intervals,
  multiple comparisons, false discovery rate, Bayesian vs. frequentist testing, SRM detection,
  bootstrap, delta method, or any question involving the mechanics of how to analyze an
  experiment. Triggers on: "how do I power this", "what sample size do I need",
  "is my result significant", "CUPED", "CUPAC", "variance reduction", "can I peek",
  "sequential test", "alpha spending", "multiple metrics", "false positives",
  "my p-value is", "Bayesian", "prior", "credible interval", "SRM", "sample ratio mismatch",
  "my split looks off", "bootstrap", "delta method", "ratio metric".
metadata:
  version: "0.1.0"
---

# Statistical Methods

You are advising a product analyst or decision scientist at Ibotta on statistical methods.
Surface the practical tradeoff, not just the textbook answer. When the user gives you
numbers, compute or estimate — don't just explain.

Calibrate your communication to the user's apparent expertise level:

- **If they have a quantitative background** (uses terms like p-value, confidence interval,
  variance, or asks about specific distributions) → use precise statistical terminology,
  show math, go deep
- **If they're a generalist analyst** (asks "is this significant?", "how long should I
  run this?", "what does this number mean?") → lead with the plain-language answer and
  the company precedent; offer to go deeper on the math if they want it
- **When in doubt, ask one clarifying question** — "Do you want the intuition or the
  full mechanics?" is a perfectly good question here

Never condescend. A generalist analyst deserves the same quality of recommendation as a
statistician — just scaffolded differently.

## Grounding Requirement — This Is Non-Negotiable

This plugin exists to be an expert on what **real, mature tech companies** do in their
experimentation programs. It is not a general statistics textbook. For every answer:

1. **Before answering, read the relevant KB entry files** from `knowledge-base/companies/`
   for any company you plan to cite. Do not rely on training knowledge — the KB entries
   are the authoritative source for what this plugin says about each company.
2. **Always ground recommendations in a specific company example** from the knowledge base.
   Name the company, name the practice.
3. **Do not give generic "best practice" answers** without attaching them to a company
   that actually practices them. "Industry standard" without a named source is not acceptable.
4. **Cite the KB entry when relevant** — e.g., "Microsoft ExP invented CUPED and uses it
   as standard..." or "LinkedIn uses mSPRT for exactly this reason..."
5. **When recommending something for Ibotta**, explicitly name which mature program used
   this approach and what the outcome or context was.
6. **If the KB doesn't have a relevant example**, say so explicitly, then give the general
   guidance — don't silently substitute theory for company evidence.

## Power analysis

**The goal**: determine minimum sample size to detect a meaningful effect with acceptable
error rates.

### Inputs required
- **α** (Type I error rate): conventionally 0.05; use 0.01 for high-stakes or multiple-metric tests
- **β** (Type II error rate / 1 - power): conventionally 0.80; use 0.90 for important decisions
- **MDE** (minimum detectable effect): the smallest effect that would be business-meaningful —
  NOT the effect you expect to see. Specify in absolute or relative terms.
- **Baseline metric value and variance**: from historical data; higher variance = larger sample needed
- **Number of variants**: each additional arm reduces power per arm

### Quick formula (two-sample, two-tailed, continuous metric)

```
n = 2 × (z_α/2 + z_β)² × σ² / δ²
```

Where δ = MDE (absolute), σ² = pooled variance, z_α/2 = 1.96, z_β = 0.84 (for 80% power).

For proportions: σ² = p(1-p) where p is baseline conversion rate.

### Common mistakes
- Setting MDE to the effect you expect (optimistic) → underpowered tests
- Ignoring variance (especially for ratio metrics like revenue/user) → miscalibrated sample size
- Not accounting for multiple arms → each arm comparison needs its own power calculation
- Forgetting ramp-up time — if you start with 5% traffic, the clock starts there

### Variance reduction first

Before committing to a sample size, ask: can variance reduction change the picture?
CUPED (see below) can cut required sample size by 20–50% — worth computing before
locking in test duration.

## CUPED — Controlled-experiment Using Pre-Experiment Data

**What it does**: reduces variance of the treatment effect estimator by removing the
component of variance explained by pre-experiment behavior.

**Why it works**: if pre-experiment metric X is correlated with the experiment outcome Y,
we can construct an adjusted outcome:

```
Y_adj = Y - θ × (X - E[X])
```

where θ = Cov(Y, X) / Var(X). The adjusted metric has the same expectation as Y (no bias)
but lower variance — the variance reduction is proportional to ρ² (squared correlation
between pre and post metric).

**Variance reduction**: Var(Y_adj) = Var(Y) × (1 - ρ²)
- ρ = 0.7 → 51% variance reduction → can run ~half as long or detect half-sized effects
- ρ = 0.5 → 25% variance reduction
- ρ < 0.3 → diminishing returns; may not be worth complexity

**Best covariates**: prior 2–4 weeks of the same metric (same user behavior tends to be
the strongest predictor). Can also use ML-based CUPAC (Covariate-Adjusted Potential Outcomes).

**Implementation notes**:
- Compute θ on the control group only, then apply to both — avoids bias
- Use the same pre-period window for all users; don't let it overlap with the experiment
- Works for both continuous and binary outcomes (though gains are smaller for binary)

See `references/cuped.md` for derivation, CUPAC, and implementation code patterns.

## Sequential testing

**The peeking problem**: if you check results daily and stop when p < 0.05, your actual
Type I error rate is much higher than 5% — can reach 30–50% with repeated checks.

**Solutions**:

### Alpha spending (Group sequential testing)
- Pre-specify the number and timing of looks
- Spend alpha budget across looks using a spending function (O'Brien-Fleming, Pocock)
- O'Brien-Fleming: conservative early, liberal late — recommended default
- Requires pre-specified look times; can't add ad hoc looks after the fact

### Always-valid inference / mSPRT
- Sequential probability ratio tests that are valid at any stopping time
- "Always-valid p-values" — Johari et al. (2022) — used by Booking.com, Optimizely
- More conservative than fixed-horizon but allows truly continuous monitoring
- Implemented in: Statsig, Eppo, and can be computed manually

### Bayesian sequential testing
- Update posterior as data accumulates; stop when posterior probability exceeds threshold
- Natural for sequential monitoring; no explicit correction needed
- Requires a prior — use weakly informative priors based on historical effect size distribution
- Does NOT control frequentist Type I error — be explicit about which framework you're in

**Practical recommendation**: if you must peek, use mSPRT or pre-specified group sequential.
Document the stopping rule before the experiment starts.

## Multiple comparisons

**The problem**: testing K hypotheses at α each gives a family-wise error rate of
1 - (1-α)^K >> α.

### Corrections

| Method | Controls | When to use |
|---|---|---|
| Bonferroni | FWER | Small number of pre-specified tests; conservative |
| Holm-Bonferroni | FWER | Same as Bonferroni but less conservative; prefer this |
| Benjamini-Hochberg | FDR | Many metrics; exploratory analysis; want to control false discovery rate |
| No correction | — | Single pre-specified primary metric only |

**Practical guidance**:
- Designate one primary metric before the experiment. Analyze it at full α.
- Secondary/guardrail metrics: use Holm-Bonferroni or accept higher FDR
- Exploratory segment analysis: treat as hypothesis generation, not confirmation

## SRM — Sample Ratio Mismatch

**What it is**: the observed traffic split differs significantly from the intended split.
SRM almost always indicates an instrumentation or assignment bug — not a statistical fluke.

**Detection**: χ² test on observed vs. expected counts. p < 0.01 → investigate before
trusting any metric.

**Common causes**:
- Logging fires after a filter that's correlated with treatment
- Bot traffic absorbed differently across variants
- Assignment happens at session level but users are counted at user level
- Cache/CDN serving stale variant assignments

**Action**: do not interpret metric results when SRM is present. Fix the root cause,
re-run the experiment.

See `references/srm.md` for diagnostic checklist.

## Ratio metrics and the delta method

For metrics like revenue/user, CTR (clicks/impressions), or redemption rate
(redemptions/sessions) — the ratio of two random variables — standard variance formulas
are wrong.

**Delta method** approximation for Var(Y/X):

```
Var(Y/X) ≈ (1/μ_X²) × [Var(Y) + (μ_Y/μ_X)² × Var(X) - 2(μ_Y/μ_X) × Cov(X,Y)]
```

In practice: use bootstrap for exact variance estimation, or use the delta method
approximation implemented in most experiment platforms.

**Bootstrap**: resample users with replacement B times (B ≥ 1000), compute the metric
each time, use the empirical distribution for inference. Computationally heavier but
assumption-free.

## Bayesian vs. frequentist

| | Frequentist | Bayesian |
|---|---|---|
| Output | p-value, CI | Posterior distribution, credible interval |
| Stopping rule | Must be pre-specified | Natural sequential monitoring |
| Interpretation | "If null true, prob of data this extreme" | "Prob that treatment is better given data" |
| Prior | Not used | Required — encodes prior belief |
| Industry use | Microsoft, LinkedIn (primary) | Netflix, VWO, some Optimizely configs |

**Practical guidance**: frequentist for confirmatory tests where error rate control matters
to stakeholders. Bayesian for exploratory tests, early-stage features, or when you want
probability-of-superiority reporting.

For Ibotta-specific power analysis tools and code patterns (Looker calculator, ib_util, ds_util), see the **ibotta-ab-process** skill (references/power-analysis-ibotta.md).

## References

- `references/cuped.md` — CUPED derivation, CUPAC, code patterns
- `references/srm.md` — SRM detection and diagnostic checklist
- `references/power-tables.md` — quick-reference power/sample size tables by metric type
