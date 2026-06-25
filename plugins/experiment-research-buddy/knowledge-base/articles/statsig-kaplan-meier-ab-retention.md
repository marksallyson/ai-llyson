---
title: "Kaplan-Meier: Visualizing A/B Test Retention"
type: article
tags: [retention, survival-analysis, kaplan-meier, metric-design, variance-reduction, right-censoring, long-term-effects, statsig]
source_url: https://www.statsig.com/perspectives/kaplanmeier-abtest-retention
author: Statsig Team
published: 2025-06-23
added: 2026-06-24
---

# Kaplan-Meier: Visualizing A/B Test Retention

## At a Glance
Statsig's 2025 case for using Kaplan-Meier survival curves instead of traditional point-in-time retention metrics in A/B tests. The core problem: standard retention analysis (e.g., "30-day retention = X%") treats all users as if they've been exposed for the same duration, which produces misleading comparisons when users enter the experiment at different times. Kaplan-Meier handles this correctly by adjusting for censored data — users too new to have had a chance to churn yet.

The practical payoff: 20–30% improvement in test sensitivity for retention metrics, and detection of variant differences that a single retention percentage would miss entirely.

## The Problem with Standard Retention Metrics in A/B Tests

When you run an A/B test and measure "30-day retention," users who enrolled on day 1 have had 30 days to churn. Users who enrolled on day 25 have only had 5 days. A naive average treats both the same — an apples-to-oranges comparison that systematically biases results.

The standard workaround (only include users who enrolled early enough to hit the full window) throws away data from late enrollees, reduces effective sample size, and can introduce selection bias if enrollment rates differ by variant.

Kaplan-Meier solves this by incorporating all users, including those not yet at the full retention window ("censored" observations), into the survival probability calculation at each time point.

## How Kaplan-Meier Works for A/B Testing

**What it produces:**
- A survival curve: y-axis = probability a user is still active, x-axis = time elapsed since enrollment
- Computed separately for each variant
- At each time point, the survival probability is recalculated using only users who have been observed long enough to be "at risk" of churning

**Censored data handling:**
Users who haven't yet hit a time threshold aren't excluded — they contribute to the denominator at time points they have been observed, and are removed from the denominator (not counted as churned) once their observation window ends. This is the key improvement over naive retention calculations.

**Statistical testing:**
Use the **log-rank test** to determine whether the survival curves for treatment vs. control are statistically significantly different. This tests the entire curve, not just a single retention snapshot.

**Winsorization:**
Cap extreme outliers at the 99th percentile before computing survival estimates to prevent heavy-tailed users from distorting the curves.

## Key Findings

**Early winners ≠ long-term winners.** One example in the article showed a variant winning on 7-day retention but losing on 30-day retention. A standard A/B test checking only 7-day retention would have shipped the wrong variant.

**20–30% sensitivity improvement.** Teams switching to Kaplan-Meier for retention metrics reported detecting real effects that point-in-time retention analysis missed — equivalent to a meaningful sample size increase at no cost.

**Segment-specific patterns are visible.** Survival curves can be stratified by user segment. One example: a feature helped content creators but hurt power users — a net-null result in aggregate that masked two opposite real effects. Stratified Kaplan-Meier curves made this immediately visible.

**Visualization is the point.** When two curves diverge on the graph, you can see *exactly when* the variants start performing differently — not just whether they do. This is operationally valuable for diagnosing which phase of the user lifecycle a treatment affects.

## Main Conclusion
Don't evaluate retention experiments using a single percentage at a fixed time window. Kaplan-Meier gives you the full retention trajectory for each variant, handles the data structure correctly, and detects effects that point-in-time metrics miss.

## Takeaways for Practice

1. **Retention experiments at Ibotta should use Kaplan-Meier, not just X-day retention snapshots.** Any test where the primary metric is retention (user activation, Walmart linking, rebuild rate) is a candidate. The censored data problem is real whenever users enroll throughout the test window — which is always.

2. **The log-rank test is the right companion statistic.** Don't just eyeball the curves — use the log-rank test to get a p-value on whether the curves differ across the full observation window.

3. **Segment your survival curves.** If a test affects the general population, stratify by new vs. returning users, or by key behavioral segments. Aggregate null results often hide opposite effects in subgroups.

4. **Early retention signal is not sufficient for ship/no-ship decisions.** If a test shows a positive 7-day retention lift, extend analysis to 30-day before shipping — especially for features that change a habit-forming surface (onboarding, home screen, recurring offers).

5. **This is the correct method for Walmart linking retention experiments.** The two concurrent linking tests (new users vs. expiring-linked users) both have retention-flavored outcomes. Kaplan-Meier is the right analysis framework for both.

6. **Implementation is available in standard tools.** Python (`lifelines` library), R (`survival` package), and Statsig's platform all support Kaplan-Meier natively. The `lifelines` library in Python is the easiest entry point.

## Implementation Sketch (Python)
```python
from lifelines import KaplanMeierFitter
from lifelines.statistics import logrank_test

# T = time until churn (or end of observation window)
# E = event observed (1 = churned, 0 = censored/still active)
kmf_control = KaplanMeierFitter()
kmf_treatment = KaplanMeierFitter()

kmf_control.fit(T_control, E_control, label='Control')
kmf_treatment.fit(T_treatment, E_treatment, label='Treatment')

# Plot
ax = kmf_control.plot_survival_function()
kmf_treatment.plot_survival_function(ax=ax)

# Test
results = logrank_test(T_control, T_treatment, E_control, E_treatment)
print(results.p_value)
```

## Related Reading
- `articles/statsig-speeding-up-ab-tests.md` — proxy metrics and variance reduction for faster tests
- `knowledge-base/papers/cuped-paper.md` — CUPED variance reduction (complements Kaplan-Meier for retention)

## Tags
retention, survival-analysis, kaplan-meier, metric-design, variance-reduction, right-censoring, long-term-effects, statsig
