# OEC Design — Patterns and Long-term Proxy Validation

## The OEC design problem

The OEC must be measurable in the short run but representative of long-run value.
These goals are in tension: the metrics that matter most (LTV, retention at 6 months)
are the hardest to measure in a 2-week experiment.

## Proxy validation

Before adopting a short-term metric as OEC, validate that it predicts the long-term
outcome you actually care about. Method:

1. Pull historical experiment data (or natural variation)
2. For each unit (user cohort, time period), compute:
   - Short-term metric value (e.g., D7 retention)
   - Long-term outcome (e.g., D90 retention, 6-month LTV)
3. Regress long-term on short-term — the R² tells you how much predictive power the proxy has
4. If R² is low (<0.5), the proxy is weak — either find a better one or accept that you're
   measuring something different from what you care about

This is the "surrogate index" approach formalized by Athey et al. (2019):
"Using Wasserstein Generative Adversarial Networks for the Design of Monte Carlo Simulations."

## OEC patterns by consumer product type

### Engagement / social products
- **Weak OEC**: DAU, page views, session count
- **Stronger OEC**: meaningful actions per session (shares, comments, saves — not impressions)
- **Best**: composite of engagement quality × frequency, validated against D30 retention

### Retention-focused products (subscriptions, gamification)
- **OEC**: D7 or D14 retention rate (for new user experiments); rolling retention for existing users
- **Avoid**: D1 retention (too noisy); D30 (too slow for most experiments)
- **Duolingo approach**: Current User Retention Rate (CURR) — percent of users active
  in current week who were also active last week. More sensitive than D7 for mature cohorts.

### Marketplace / transactional products
- **OEC**: conversion rate × order value composite, or GMV per eligible user
- **Watch**: conversion rate alone can be gamed (promote low-value orders to hit metric)
- **Incrementality caveat**: OEC should measure net-new value, not shifted value

### Content / recommendation surfaces
- **OEC**: downstream engagement post-click (not CTR alone)
- **Netflix approach**: hours viewed per user (quality-adjusted for completion rate)
- **Watch**: engagement metrics can be maximized by addictive/low-quality content — add
  satisfaction/survey signal as guardrail

## Composite OEC design

When no single metric is sufficient, use a weighted composite:

```
OEC = w1 × metric1_normalized + w2 × metric2_normalized + ...
```

Normalization: z-score each metric using historical variance (not experiment variance —
avoids circular dependence).

Weights: derive from regression of composite components on long-term outcome, or from
explicit business value weights (e.g., a conversion is worth 3× a session start).

**Risks**: composite OEC is harder to explain to stakeholders; weights are subjective;
can mask individual metric degradation. Use sparingly.

## Sensitivity analysis for OEC choice

Before committing to an OEC, compute estimated detectable effects given your expected
traffic and duration for multiple candidate OECs. Pick the one that is:
1. Most sensitive (lowest required n)
2. Most predictive of long-run value (proxy validation R²)
3. Least gameable

If these criteria conflict, default to the most predictive even if less sensitive.
Accept that you need more traffic or longer experiments.

## Academic references

- Kohavi et al. (2004). "Responsible Experimentation" — original OEC formulation at Microsoft
- Deng et al. (2016). "Continuous Evaluation of Experimentation Platforms" — metric sensitivity
- Athey & Imbens (2017). "The Econometrics of Randomized Experiments" — proxy validation theory
- Hohnhold et al. (2015). "Focusing on the Long-term: It's Good for Users and Business" — Google's
  experience distinguishing short and long-term OEC
