# Power / Sample Size Quick Reference

All tables assume: two-tailed test, α = 0.05, 80% power, equal split.
For 90% power, multiply n by 1.33. For α = 0.01, multiply n by 1.56.

## Proportions (conversion rates, binary metrics)

Formula: n = 2 × 16 × p(1-p) / δ²  (approximation for small MDE)

| Baseline rate | MDE (relative) | MDE (absolute) | n per arm |
|---|---|---|---|
| 5% | 20% | 1.0pp | ~8,000 |
| 5% | 10% | 0.5pp | ~30,000 |
| 5% | 5% | 0.25pp | ~120,000 |
| 10% | 20% | 2.0pp | ~4,000 |
| 10% | 10% | 1.0pp | ~16,000 |
| 10% | 5% | 0.5pp | ~63,000 |
| 20% | 10% | 2.0pp | ~8,000 |
| 20% | 5% | 1.0pp | ~32,000 |
| 20% | 2% | 0.4pp | ~200,000 |
| 50% | 5% | 2.5pp | ~16,000 |
| 50% | 2% | 1.0pp | ~100,000 |

## Continuous metrics (revenue, session length, etc.)

n per arm = 2 × (1.96 + 0.84)² × σ² / δ²  ≈  16 × CV² / relative_mde²

Where CV = σ/μ (coefficient of variation).

| CV (σ/μ) | MDE (relative 10%) | MDE (relative 5%) | MDE (relative 2%) |
|---|---|---|---|
| 0.5 | ~400 | ~1,600 | ~10,000 |
| 1.0 | ~1,600 | ~6,400 | ~40,000 |
| 2.0 | ~6,400 | ~25,600 | ~160,000 |
| 3.0 | ~14,400 | ~57,600 | ~360,000 |
| 5.0 | ~40,000 | ~160,000 | ~1,000,000 |

High-CV metrics (revenue, redemption value) require large samples — this is why CUPED
matters most for these metrics.

## Effect of CUPED on required sample size

If pre-post correlation = ρ, multiply n by (1 - ρ²):

| ρ | Variance reduction | Sample size multiplier |
|---|---|---|
| 0.3 | 9% | 0.91 (save ~9%) |
| 0.5 | 25% | 0.75 (save ~25%) |
| 0.7 | 51% | 0.49 (need ~half) |
| 0.8 | 64% | 0.36 (need ~1/3) |
| 0.9 | 81% | 0.19 (need ~1/5) |

Retention/engagement metrics typically achieve ρ = 0.6–0.8 with 2-week pre-period.

## Multi-arm correction

For K arms tested simultaneously (each vs. control, not pairwise):
- Bonferroni: use α/K per test → multiply n by ~K^0.6 (rough approximation)
- More precisely: compute power for each planned comparison using α_adj

| Arms (including control) | Bonferroni α | n multiplier (approx) |
|---|---|---|
| 2 (standard A/B) | 0.050 | 1.0× |
| 3 | 0.025 | 1.3× |
| 4 | 0.017 | 1.5× |
| 5 | 0.013 | 1.7× |

## Rule of thumb for experiment duration

```
Duration (days) = n_required / (daily_eligible_users × traffic_fraction_in_experiment)
```

If duration > 4 weeks: reconsider the MDE (is this effect actually detectable?) or
apply variance reduction (CUPED) before launching.

Cap at 4–6 weeks to avoid: seasonality confounds, population drift, novelty effect decay.
