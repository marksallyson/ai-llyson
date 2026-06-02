# Experimentation Advisor

Expert advisor on consumer product experimentation — blending academic statistical rigor
with modern tech company practices (Microsoft, Netflix, DoorDash, Booking.com, Duolingo, Uber, LinkedIn).

Designed for a Decision Scientist working on consumer-facing product experiments.

## Skills

### experiment-design
Advises on what test type to use and how to structure the experiment.

Covers: A/B, holdout, switchback, geo holdout, synthetic control, bandits,
quasi-experimental methods, randomization unit selection, SUTVA/interference diagnosis,
triggered analysis.

Triggers: "how should I design this test", "what kind of experiment", "should I use a holdout",
"network effects", "interference", "can I even A/B test this"

### statistical-methods
Covers the mechanics of how to analyze experiments rigorously.

Covers: power analysis, CUPED/CUPAC variance reduction, sequential testing, SRM detection,
multiple comparisons, delta method for ratio metrics, Bayesian vs. frequentist.

Triggers: "how do I power this", "CUPED", "can I peek", "my p-value", "sample ratio mismatch",
"multiple metrics", "Bayesian"

### experiment-strategy
Advises on metric selection, result interpretation, and ship decisions.

Covers: OEC design, guardrail metrics, novelty/primacy effects, incrementality measurement,
cannibalization, heterogeneous treatment effects, when not to test, shipping decisions.

Triggers: "what metric should I use", "should we ship", "results look weird",
"novelty effect", "incrementality", "OEC", "guardrail", "the test was significant but"

## Reference material

Each skill has detailed references loaded on demand:

| Skill | References |
|---|---|
| experiment-design | switchback.md, interference.md, quasi-experimental.md |
| statistical-methods | cuped.md, srm.md, power-tables.md |
| experiment-strategy | oec-design.md, novelty-effects.md, incrementality.md |

## Roadmap

Future additions:
- Ibotta-specific grounding (redemption OECs, IPN offer testing, consumer retention metrics)
- Causal inference deep dive (causal forests, double ML)
- Experiment governance (review process, documentation templates)
