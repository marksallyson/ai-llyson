# Power Analysis at Ibotta

## Standard Parameters
- **Power** = 0.80 (80%)
- **Alpha** = 0.05 (two-tailed)
- **Minimum runtime** = 2 weeks (to capture full weekly seasonality cycle)

## Tools

### Looker Power Calculator
Ibotta's internal Looker calculator for 2-sample t-tests. Use this as the primary tool
for standard experiments. Inputs: baseline mean, std dev, MDE, alpha, power.

### Python (statsmodels)
```python
from statsmodels.stats.power import TTestIndPower

analysis = TTestIndPower()
n = analysis.solve_power(
    effect_size=mde / std_dev,  # Cohen's d
    alpha=0.05,
    power=0.80,
    alternative='two-sided'
)
print(f"Required n per variant: {n:.0f}")
```

### R (pwr package)
```r
library(pwr)
result <- pwr.t.test(
  d = mde / std_dev,
  sig.level = 0.05,
  power = 0.80,
  type = "two.sample",
  alternative = "two.sided"
)
print(result$n)  # per variant
```

## Inputs You Need
| Input | Where to get it |
|---|---|
| Baseline mean | Historical data from Databricks / Looker |
| Std deviation | Historical data — same time window as baseline |
| MDE (minimum detectable effect) | Business stakeholder + DS judgment |
| Alpha | 0.05 (standard) |
| Power | 0.80 (standard) |

## CUPED Integration
Running CUPED reduces variance on the primary metric, which effectively increases
power. If you plan to use CUPED in analysis (which you should for continuous metrics),
you can use the CUPED-adjusted variance in your power calculation to get a smaller
required sample size. The `ds_util` library has CUPED utilities.

## Test Duration
- Convert required sample size to days using daily active user counts
- **Always round up** to full weeks to avoid day-of-week bias
- Minimum 2 weeks regardless of when sample size is reached
- If test requires > 8 weeks, reconsider the MDE or metric

## Multiple Comparisons Adjustment
If testing multiple metrics, adjust alpha before calculating power:
- **Bonferroni**: alpha_adjusted = 0.05 / number_of_metrics
- **Holm**: stepwise procedure, less conservative than Bonferroni
Apply the same adjustment in both power analysis and final analysis.
