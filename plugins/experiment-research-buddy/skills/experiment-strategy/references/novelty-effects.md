# Novelty and Primacy Effects — Detection and Correction

## Definitions

**Novelty effect**: users engage more with a change simply because it's new and
different. The effect inflates during the first days/weeks of the experiment, then
decays toward the true steady-state effect.

**Primacy effect** (also: learning effect): users have habituated to the old
experience. When exposed to a new interface, they're slower, make more errors,
and show lower engagement initially. The treatment effect is suppressed early;
it grows as users adapt.

Both effects mean that the first 1–2 weeks of data may not reflect the true
long-run treatment effect.

## Detection

### Time-series plot of daily treatment effects

```python
# Compute treatment effect by experiment day
daily_effects = (
    df.groupby(['experiment_day', 'variant'])['metric']
    .mean()
    .unstack()
    .assign(effect=lambda x: x['treatment'] - x['control'])
)
daily_effects['effect'].plot()
```

Patterns:
- **Novelty**: large positive effect early, decays toward zero or lower value
- **Primacy**: negative or flat effect early, grows to positive steady state
- **Neither**: stable effect throughout — take the full-window estimate

### Statistical test for time trend

Fit a regression of the treatment effect on experiment day:

```python
from scipy.stats import linregress

days = daily_effects.index.values
effects = daily_effects['effect'].values
slope, intercept, r, p, se = linregress(days, effects)

# Negative slope → novelty (effect decaying)
# Positive slope → primacy (effect growing)
# p < 0.05 → statistically significant time trend
```

## Correction approaches

### 1. Exclude early days ("burn-in")

Drop the first 3–7 days of experiment data from the analysis:
- Simple but wasteful (loses data and statistical power)
- Appropriate when novelty is clear and effect stabilizes after day 5–7

### 2. Use new users only (for novelty)

Novelty affects returning users who know the old experience. New users see only
the new experience — no comparison point, no novelty response.

Analyze new-user-only cohort as a lower bound on long-run effect:
- More interpretable: represents the world after full rollout (all users are "new users" to the treatment)
- Less power (smaller sample)
- May not generalize if new and existing users behave very differently

### 3. Long-run holdout

After the experiment ends, maintain a holdback group and measure effects at
30, 60, 90 days. The holdback estimate is the steady-state effect.

- Gold standard for novelty/primacy quantification
- Cost: opportunity cost of withholding a feature; operational complexity

### 4. Cohort analysis within the experiment

Segment users by the day they first entered the experiment. Compare treatment
effects for day-1 cohort vs. day-7 cohort vs. day-14 cohort at the same
exposure duration (e.g., all measured after 7 days of exposure).

If day-14 cohort shows smaller effects than day-1 cohort at same exposure →
novelty is inflating the day-1 estimate.

## When does it matter?

Novelty/primacy effects are most consequential when:
- The change is visually prominent (UI redesigns, navigation changes)
- Users have strong prior habits with the old experience
- The experiment is short (< 2 weeks)
- The detected effect is small (close to the MDE) — novelty could be the entire signal

They're less consequential for:
- Backend changes users can't see (algorithm changes, ranking)
- New features with no prior baseline behavior
- Experiments longer than 4 weeks

## Reporting

Always report:
1. Full-window treatment effect estimate (with CI)
2. Whether a time trend was detected (slope, p-value)
3. If novelty/primacy suspected: the stabilized estimate (post burn-in or final week)
4. Recommendation on which estimate to use for the ship decision

## References

- Kohavi & Longbotham (2017). "Online Controlled Experiments and A/B Tests" — novelty
  effect treatment in encyclopedia chapter
- Hohnhold et al. (2015). "Focusing on the Long-term" — Google's primacy effect experience
  in ad quality experiments
- Borgs et al. (2021). "Multi-armed Bandits and the Novelty Effect"
