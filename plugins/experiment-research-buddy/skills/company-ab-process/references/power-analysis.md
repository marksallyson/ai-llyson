# Power Analysis

Read `${CLAUDE_PLUGIN_ROOT}/config/company-profile.md` for the company's standard power and
alpha, minimum runtime, internal calculator or libraries, and known baseline rates. Use the
defaults below only where the profile is silent, and say which numbers are defaults.

## Standard parameters

- **Power** = 0.80
- **Alpha** = 0.05, two-tailed
- **Minimum runtime** = 2 weeks, to capture a full weekly seasonality cycle

## Inputs you need

| Input | Where to get it |
|---|---|
| Baseline mean or rate | Historical warehouse data for the exact population you'll expose |
| Standard deviation | Same query, same time window as the baseline |
| MDE (minimum detectable effect) | Business stakeholder + DS judgment — the smallest lift worth shipping for |
| Alpha | Profile, else 0.05 |
| Power | Profile, else 0.80 |
| Daily eligible users | To convert sample size into days |

Pull the baseline from the **same surface, same population, same season** as the planned
test. A sitewide baseline applied to a single surface is the most common power-analysis
error, and it always makes the test look shorter than it is.

If the company profile points to a past-experiment inventory, use the control rate from the
closest prior test as your baseline. That is a far better prior than a generic benchmark.

## Python (statsmodels)

```python
from statsmodels.stats.power import TTestIndPower, NormalIndPower
from statsmodels.stats.proportion import proportion_effectsize

# Continuous metric
analysis = TTestIndPower()
n = analysis.solve_power(
    effect_size=mde / std_dev,   # Cohen's d
    alpha=0.05,
    power=0.80,
    alternative="two-sided",
)
print(f"Required n per variant: {n:.0f}")

# Rate / proportion metric
effect = proportion_effectsize(baseline_rate * (1 + relative_lift), baseline_rate)
n_rate = NormalIndPower().solve_power(
    effect_size=effect, alpha=0.05, power=0.80, alternative="two-sided"
)
print(f"Required n per variant: {n_rate:.0f}")
```

## R (pwr)

```r
library(pwr)

# Continuous
pwr.t.test(d = mde / std_dev, sig.level = 0.05, power = 0.80,
           type = "two.sample", alternative = "two.sided")$n

# Proportion
pwr.2p.test(h = ES.h(p1 = baseline * (1 + lift), p2 = baseline),
            sig.level = 0.05, power = 0.80)$n
```

## Internal tooling

If the company profile names an internal calculator (a BI-tool calculator, a notebook, a
shared library), prefer it — it encodes the company's conventions and its numbers are what
reviewers expect to see. Still sanity-check the result against the code above; an internal
calculator with the wrong baseline is wrong confidently.

## CUPED integration

CUPED reduces the variance of the primary metric, which raises power at a fixed sample
size. If you will use CUPED in the analysis — and for continuous metrics you should — use
the CUPED-adjusted variance in the power calculation to get a smaller required sample.

Estimate the adjusted variance from historical data: regress the metric on its pre-period
value, and the residual variance is what you power on. Typical reduction is 10–50%
depending on how autocorrelated the metric is. See `statistical-methods/references/cuped.md`.

## Test duration

1. Convert required sample size per variant to days using daily eligible users × allocation
2. **Always round up to whole weeks** to avoid day-of-week bias
3. Enforce the profile's minimum runtime regardless of when sample size is reached
4. If the test needs more than ~8 weeks, the MDE or the metric is wrong — renegotiate
   rather than running it. A test nobody waits for is worse than no test.

## Multiple comparisons

If the decision depends on more than one metric, adjust alpha **before** calculating power,
not after the results arrive:

- **Bonferroni**: `alpha_adjusted = alpha / number_of_metrics`
- **Holm**: stepwise, less conservative, same family-wise error guarantee

Apply the identical adjustment in both the power analysis and the final analysis. Powering
at 0.05 and then testing at 0.0125 gives you an underpowered test you will misread as null.

## Multi-variant tests

Each additional treatment arm splits traffic and adds a comparison. Three arms against one
control means a third of the traffic each and a 3-way Bonferroni correction — commonly 2.5×
to 3× the duration of a simple A/B. Say this number out loud before anyone commits to a
four-variant test.
