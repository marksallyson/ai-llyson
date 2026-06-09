# CUPED — Deep Dive

## Original paper

Deng, A., Xu, Y., Kohavi, R., & Walker, T. (2013). "Improving the Sensitivity of Online
Controlled Experiments by Utilizing Pre-Experiment Data." WSDM 2013.

## Mathematical derivation

Let Y_i be the outcome for user i in the experiment period.
Let X_i be a covariate observed before the experiment (e.g., same metric in prior 2 weeks).

Standard estimator of ATE:
```
τ̂ = Ȳ_t - Ȳ_c
Var(τ̂) = Var(Y)/n_t + Var(Y)/n_c ≈ 2·Var(Y)/n (for equal splits)
```

CUPED adjusted outcome:
```
Y_adj = Y - θ·(X - E[X])
```

where θ = Cov(Y, X) / Var(X) is estimated from data (typically from control group only).

CUPED estimator:
```
τ̂_cuped = Ȳ_adj_t - Ȳ_adj_c = (Ȳ_t - Ȳ_c) - θ·(X̄_t - X̄_c)
```

Since E[X̄_t - X̄_c] = 0 under randomization, CUPED is unbiased.

Variance reduction:
```
Var(Y_adj) = Var(Y) - Cov(Y,X)²/Var(X) = Var(Y)·(1 - ρ²)
```

**Key insight**: ρ (correlation between pre and post metric) determines everything.
The higher ρ, the more variance reduction, the shorter your required experiment duration.

## Choosing the covariate X

Best practices (in order of typically observed ρ):

1. **Same metric, prior 2–4 weeks**: usually ρ = 0.5–0.8 for engagement/retention metrics
2. **Same metric, longer window**: marginal gains after 4 weeks; don't use too long (captures
   different user lifecycle stage)
3. **Related metric**: e.g., use sessions as covariate when outcome is conversions
4. **Multiple covariates**: use OLS residualization — regress Y on [X1, X2, ...] in control,
   apply coefficients to everyone. This is equivalent to CUPED with a vector covariate.

## CUPAC — ML-based covariate

CUPAC (Covariate-Adjusted Potential Outcomes Using a Covariate) replaces the linear
covariate with a machine learning model prediction.

- Train a model to predict Y from pre-experiment features on a holdout set
- Use model predictions Ŷ as the covariate in place of X
- If the model is good (high R²), ρ between Ŷ and Y will be higher than raw X → more variance reduction
- Netflix and Airbnb have published on this approach
- Risk: overfitting if model trained on same data as experiment — use strict holdout

Reference: Chen & Tian (2023) "CUPAC: Using Machine Learning to Reduce Variance in Online
Controlled Experiments." LinkedIn Engineering Blog.

## Implementation pattern

```python
# 1. Compute theta on control group only
control = df[df['variant'] == 'control']
theta = control['Y'].cov(control['X']) / control['X'].var()

# 2. Apply adjustment to all users
E_X = df['X'].mean()  # or control['X'].mean() — both valid
df['Y_adj'] = df['Y'] - theta * (df['X'] - E_X)

# 3. Run t-test on Y_adj instead of Y
from scipy import stats
treatment = df[df['variant'] == 'treatment']
control = df[df['variant'] == 'control']
t_stat, p_val = stats.ttest_ind(treatment['Y_adj'], control['Y_adj'])
```

## When CUPED underperforms

- Low ρ (metric is volatile or users have short history): gain is small; not worth complexity
- Very short experiment (< 3 days): pre-period may not exist or be meaningful
- New users dominate: no pre-experiment history available
  - Workaround: use user features (device type, acquisition channel) as covariate instead

## CUPED for binary metrics

Works but variance reduction is smaller. For binary Y (converted/not):
- ρ between binary Y and continuous X is naturally lower than continuous Y and continuous X
- Still worth applying if pre-period binary behavior exists (e.g., "converted last week")
- Alternative: logistic regression with covariate adjustment

## Extension: stratified CUPED

For high-variance user segments (e.g., power users vs. casual), fit θ separately by stratum:

```python
for stratum in df['segment'].unique():
    mask = df['segment'] == stratum
    control_mask = mask & (df['variant'] == 'control')
    theta_s = df[control_mask]['Y'].cov(df[control_mask]['X']) / df[control_mask]['X'].var()
    df.loc[mask, 'Y_adj'] = df.loc[mask, 'Y'] - theta_s * (df.loc[mask, 'X'] - df.loc[mask, 'X'].mean())
```
