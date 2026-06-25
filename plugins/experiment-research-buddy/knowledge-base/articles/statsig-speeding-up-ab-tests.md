---
title: "Speeding Up A/B Tests with Discipline"
type: article
tags: [concurrent-experiments, variance-reduction, cuped, sequential-testing, sample-size, organizational-maturity, platform, proxy-metrics]
source_url: https://www.statsig.com/blog/speeding-up-a-b-tests-with-discipline
author: Yuzheng Sun (Data Scientist, Statsig)
added: 2026-06-24
---

# Speeding Up A/B Tests with Discipline

## At a Glance
Statsig's 2025 pragmatic case for running experiments concurrently — the delay from isolating every test costs more than the occasional interaction. The article synthesizes four levers for faster experimentation: running tests in parallel, using proxy metrics instead of slow KPIs, applying variance reduction (CUPED), and adaptive allocation. The core argument: speed comes from discipline in statistical technique, not from cutting corners on rigor.

## Why It Matters
This is the operational companion to the Microsoft/Statsig interaction detection papers. Those papers establish that concurrent tests are safe. This paper shows how to maximize the speed benefit of running them concurrently, while maintaining statistical validity.

## The Four Levers

**1. Run concurrently (don't serialize)**
The isolation tax is real: if you require mutual exclusion between every test, each test waits for the last one to finish. At Ibotta's scale, that could mean a 6-test queue runs sequentially over 12–24 weeks instead of 3–4 weeks. Microsoft's empirical finding (1 in 50,000 interaction rate) is the justification. Run in parallel; detect interactions post-hoc.

**2. Proxy metrics**
Primary KPIs (revenue, retention) are slow to move and high-variance. Proxy metrics — short-term behavioral signals correlated with the primary KPI — can increase effective sample size by 10x. The key requirement: validate that the proxy actually predicts the primary outcome before using it as a decision metric. Without that validation, you're optimizing for the wrong thing.

**3. Variance reduction (CUPED)**
Up to 40% variance reduction documented; up to 80% in the Statsig article's cited case. Standard CUPED using prior-period behavior as covariate. This is the single highest-ROI statistical improvement available — reduces required sample size directly and proportionally.

**4. Adaptive allocation (contextual bandits)**
Continuously shift traffic toward better-performing arms. Appropriate when regret minimization matters more than clean causal inference. Not appropriate for tests where you need a clean estimate for reporting or for Bayesian/frequentist reporting to stakeholders.

## Key Statistics
- A/B tests typically require 6–11 weeks to complete at standard statistical parameters
- Proxy metrics can increase effective sample size by 10x vs. primary KPIs
- CUPED reduces variance by up to 40% (Statsig's number; up to 80% in favorable conditions)
- 400,000 transactions per cell needed to detect 1% lift (their example case — illustrates why variance reduction matters)
- 0.1% trimming (Winsorization) recommended for heavy-tailed metrics

## Main Conclusion
"Speed isn't about cutting corners; it's about clearing the path." The slowness of A/B testing is mostly self-imposed through isolation rules and reliance on slow primary metrics. Fix the techniques, not the rigor.

## Takeaways for Practice

1. **The overlap + detection approach is faster AND safer than isolation.** Don't frame the choice as "rigorous but slow" vs. "fast but risky." Concurrent + detection is the rigorous answer.

2. **Proxy metrics are high-leverage but require validation work upfront.** At Ibotta, validating that short-term engagement predicts long-run redemption behavior is exactly this work. Worth doing once; pays dividends on every subsequent test.

3. **CUPED is the most universally applicable speed lever.** No eligibility constraints, no architectural requirements — just use pre-experiment behavior as a covariate. Ibotta has the `ds_util` CUPED implementation already. The barrier is habit, not tooling.

4. **Use this article as the business case for implementing CUPED consistently.** The 40% variance reduction framing translates directly: "we can run tests 40% faster, or detect effects 40% smaller, at no additional cost."

## Related Reading
- `articles/microsoft-ab-interactions-call-to-relax.md` — the empirical case for concurrent testing
- `articles/statsig-detecting-interaction-effects.md` — the detection method to pair with concurrent testing
- `knowledge-base/papers/cuped-paper.md` — the original CUPED paper
- `articles/doordash-experiment-capacity.md` — DoorDash's 1000% capacity increase via similar levers

## Tags
concurrent-experiments, variance-reduction, cuped, sequential-testing, sample-size, organizational-maturity, platform, proxy-metrics
