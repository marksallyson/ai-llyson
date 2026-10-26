---
title: "Let Them Peek: Group Sequential Designs for A/B Testing (Perini et al., arXiv:2610.27899, October 2026)"
type: paper
tags: [sequential-testing, always-valid-inference, peeking, sample-size, platform, experiment-velocity, variance-reduction]
source_url: https://arxiv.org/abs/2610.27899
added: 2026-10-26
---

# Let Them Peek: Group Sequential Designs for A/B Testing

## At a Glance
Perini, Garrard, Friedberg, Kumar, Nassif, Zaidi, and Alcain (Amazon Science + Stanford) propose a group sequential stopping framework using predictive probability of success. Applied to real online A/B and A/A experiments, it cuts expected experiment duration by 43.1% — from a 14-day baseline to roughly 8 days — and yields a 76% gain in effective platform capacity, while preserving false positive and power guarantees.

## Why They Matter
Shorter experiments are one of the highest-leverage levers in experimentation maturity. This paper operationalizes a classical idea — group sequential testing, which has existed in clinical trials for decades — in the specific context of online product experiments, with empirical validation on production data. The 43.1% duration reduction is not a simulation artifact; it's measured on actual A/B and A/A experiment archives. The 76% capacity gain means a team running 100 experiments a year could run 176 with the same experiment windows, or run the same number and learn faster.

## Key Contributions
- **Group sequential design with predictive probability of success**: rather than always-valid inference (which allows peeking at every data point), the framework uses pre-specified interim look points and a predictive probability criterion — "given data so far, what's the probability of reaching significance by end date?" — to decide whether to stop early or continue
- **43.1% reduction in expected experiment duration**: in production data, experiments end in ~8 days on average vs. the 14-day fixed-horizon baseline
- **76% effective platform capacity gain**: shorter experiments mean more experiments can run in the same calendar time on the same user population
- **False positive and power guarantees maintained**: early stopping rules are designed so that overall Type I and Type II error rates match the pre-specified levels — the guarantee isn't sacrificed for speed
- **Practical implementation guidance**: the framework specifies when to schedule looks, how to compute the predictive probability threshold, and how to handle multi-metric experiments

## Takeaways for Practice
1. **This is the sequential testing design most suited for production implementation.** Unlike mSPRT/always-valid inference (which allows infinite peeking at the cost of a larger sample or wider CI), group sequential designs schedule a small number of pre-planned interim analyses. For teams that run 2–4 planned check-ins per experiment (say, day 3, 7, 10, 14), this framework formalizes those checks into a statistically valid stopping procedure.
2. **A 43.1% average duration reduction would meaningfully accelerate Ibotta's offer experiment velocity.** If offer-level tests currently require 3–4 weeks to reach significance, the same statistical power could be achieved in roughly 2 weeks on average — enabling 2× the learning cycles per quarter.
3. **The 76% capacity gain matters at the experiment-portfolio level.** Ibotta may not be experiment-capacity-constrained today, but as experimentation matures and more teams want to run concurrent tests, getting more tests through the same experiment window becomes a competitive advantage.
4. **Implement group sequential at the platform level, not experiment by experiment.** The framework's guarantees depend on pre-committing to the look schedule and stopping criterion before the experiment starts. Ad hoc interim peeking and stopping remains invalid regardless of what this paper says.
5. **Validate on A/A tests first.** The paper uses A/A archives to calibrate false positive rates. Before adopting group sequential stopping in production, run the framework on historical A/A test data and confirm the false positive rate matches the nominal level — this is the same calibration step the authors took.

## Action Items / Things to Read
- arXiv:2610.27899 full text — focus on Section 3 (methodology) and Section 5 (empirical results)
- Compare with Schultzberg (Spotify, arXiv:2606.18366): a closed-form sample size correction for sequential designs — both papers address sequential efficiency, from complementary angles (stopping rules vs. sample size calibration)
- For context on group sequential designs in clinical trials (the precursor literature): Pocock (1977) and O'Brien-Fleming (1979) — the originals; the present paper adapts them to online experiments with the predictive probability criterion
- Related: mSPRT / always-valid inference (Johari et al.) for comparison with the always-valid approach

## Tags
sequential-testing, always-valid-inference, peeking, sample-size, platform, experiment-velocity, variance-reduction
