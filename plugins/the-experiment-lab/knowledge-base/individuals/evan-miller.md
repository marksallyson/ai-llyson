---
title: Evan Miller
type: individual
tags: [sample-size, peeking, sequential-testing, bayesian, metric-design]
source_url: https://www.evanmiller.org/
added: 2026-06-04
---

# Evan Miller

## At a Glance
Evan Miller is an independent writer and software developer who wrote "How Not To Run an A/B Test" (2010) — the canonical post on the peeking problem — and built the most widely used A/B test sample size calculator at evanmiller.org. His writing is short, precise, and aimed at practitioners who need to understand the statistics without a PhD.

## Why They Matter
"How Not To Run an A/B Test" is assigned reading for anyone who has ever stopped an experiment early because it "looked good." The post explains, with a concrete simulation, why peeking at a running experiment and stopping when p < 0.05 inflates the false positive rate to 25%+ even with a nominal 5% threshold. If you send this to one person at Ibotta before the next experiment ends early, it's worth more than any statistics course.

## Key Contributions
- **"How Not To Run an A/B Test"** (evanmiller.org, 2010): canonical post on the peeking problem; showed empirically that stopping an experiment when it "looks significant" gives a 25%+ false positive rate regardless of nominal alpha
- **evanmiller.org sample size calculator**: most-used A/B test power calculator; supports two-proportion z-test, t-test, and count outcomes with customizable alpha, power, and baseline conversion
- **"Bayesian A/B Testing at VWO"** (guest post/white paper): early practical treatment of Bayesian A/B testing for practitioners
- **Formulaic approach to experiment design**: his posts consistently derive things from first principles in accessible math, making the statistical reasoning transparent
- **Sequential testing explainer posts**: follow-on posts explaining always-valid inference as the correct solution to the peeking problem

## Takeaways for Practice
- **Share "How Not To Run an A/B Test" with every stakeholder who has ever asked to stop an experiment early because it looks good.** It is 1,000 words and has a graph. It will change behavior.
- **Use evanmiller.org as your quick sample size calculator** when you need to demonstrate power requirements to a non-technical stakeholder. It has a clean UI, requires no account, and produces results in the format most people expect.
- **His posts are the best first reading for a new analyst who hasn't been trained in experiment design.** Assign "How Not To Run an A/B Test" and his sample size calculator explainer before any other reading.
- **The peeking problem post is also a useful foundation for the case for sequential testing** — it defines the problem precisely, so when you propose sequential testing as the solution, stakeholders understand what problem you're solving.

## Action Items / Things to Read
- "How Not To Run an A/B Test" — evanmiller.org/how-not-to-run-an-ab-test.html — read it today if you haven't
- evanmiller.org sample size calculator — bookmark it
- "Bayesian A/B Testing at VWO" — search evanmiller.org
- evanmiller.org — all statistics posts; most are < 10 minutes each

## Tags
sample-size, peeking, sequential-testing, bayesian, metric-design, false-positive, type-i-error
