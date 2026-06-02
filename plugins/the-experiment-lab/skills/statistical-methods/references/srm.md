# SRM — Sample Ratio Mismatch

## What it is

SRM occurs when the observed traffic split between variants differs significantly from
the intended split. It almost always indicates an instrumentation or assignment bug.

**Never interpret metric results when SRM is present.** SRM invalidates both treatment
effect estimates and p-values.

## Detection

Chi-squared test:

```python
from scipy.stats import chisquare

# Example: 50/50 intended split
observed = [treatment_count, control_count]
total = sum(observed)
expected = [total * 0.5, total * 0.5]  # adjust for unequal intended splits

chi2, p_value = chisquare(observed, f_exp=expected)

if p_value < 0.01:
    print(f"SRM DETECTED: p={p_value:.4f}")
    print("Do NOT interpret metric results. Investigate root cause.")
```

Use p < 0.01 (not 0.05) as threshold — SRM is almost always a bug, not a chance event.

## Diagnostic checklist

Work through these in order:

### 1. Logging / instrumentation
- [ ] Does the logging event fire before or after the treatment assignment?
  - Logging fires AFTER a filter → treated/control populations are post-filter subsets → SRM
- [ ] Is the same logging pipeline used for both variants?
- [ ] Are there any variant-specific code paths that could drop events?

### 2. Assignment mechanism
- [ ] Is the hashing function deterministic and uniform?
  - Non-uniform hash → unequal buckets → SRM
- [ ] Is the same user getting assigned to different variants across sessions?
  - Session-level assignment with user-level counting → SRM
- [ ] Are there any assignment-time filters that differ across variants?

### 3. Bot / non-human traffic
- [ ] Do bots get assigned and logged? If bot filtering happens downstream,
  bots may be disproportionately in one variant
- [ ] Check bot rate by variant — should be equal

### 4. Caching / CDN
- [ ] Is there any caching layer that serves stale variant assignments?
- [ ] Could variant B users be served cached control content (or vice versa)?

### 5. Novelty-driven attrition
- [ ] If treatment changes a prominent UI element, are users in treatment churning faster
  (disabling, uninstalling, blocking) during the experiment? — this is real attrition
  bias, not SRM, but looks similar
- [ ] Check user-level survival curves by variant

### 6. Experiment system bugs
- [ ] Is the traffic allocation logic correct in code?
- [ ] Has the allocation changed during the experiment? (ramp-up without proper accounting)
- [ ] Are there any feature flag overrides or QA accounts polluting the assignment?

## SRM in holdback experiments

Holdback (persistent control group) experiments are especially prone to SRM over time
because the holdback population ages — new users aren't added to the holdback group.
Monitor the size of the holdback group relative to the launched population over time.

## References

- Fabijan et al. (2019). "Diagnosing Sample Ratio Mismatch in Online Controlled Experiments:
  A Taxonomy and Rules of Thumb for Practitioners." KDD 2019.
- Kohavi, Tang & Xu (2020). "Trustworthy Online Controlled Experiments," Chapter 21.
