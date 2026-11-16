---
title: From More to Better — Causal Inference and Digital Experimentation in the Age of AI (CIDER Roundtable, arXiv 2611.16335, November 2026)
type: paper
tags: [agentic-ai, causal-inference, generalization, industry-consensus, llm-evals, long-term-effects, metric-design, organizational-maturity, scientific-methodology, surrogate-metrics, synthetic-control, variance-reduction]
source_url: https://arxiv.org/abs/2611.16335
added: 2026-11-16
---

# From More to Better: Causal Inference and Digital Experimentation in the Age of AI

## At a Glance
A 21-author perspective paper drawing on the 2026 Causal Inference and Digital Experimentation Roundtable (CIDER), co-authored by Ronny Kohavi, Diane Tang, Ya Xu, Somit Gupta, David Holtz, Nathan Kallus, Mårten Schultzberg, Avi Feller, and 13 more practitioners and academics. Its thesis: AI is rapidly expanding how much data organizations can produce and analyze — but more data alone doesn't mean better decisions. It maps three shifts required for DS teams to convert that capacity into actual learning.

## Why They Matter
When Kohavi, Tang, and Ya Xu co-write a paper together, it's a signal event — the last time they did it was *Trustworthy Online Controlled Experiments* (2020). That this group convened specifically around the question of AI + experimentation, and reached consensus, makes this the most important framing document for where the field is heading in 2026. For practitioners, it matters because it shifts the job description: not just running tests, but ensuring the organization is learning correctly from them.

## Key Contributions
- **The "more data is not more learning" problem**: AI tools generate more experimental data, more synthetic results, and more candidates to test. This doesn't automatically produce better decisions — it creates more noise that requires better signal-extraction frameworks.
- **Three focus areas from the CIDER roundtable**:
  1. **Aggregate, don't just accumulate**: Build frameworks that extract learning from portfolios of experiments — not just one experiment at a time. Meta-analysis, cross-experiment synthesis, and power-aware portfolio design are all in scope.
  2. **Triangulate evidence types**: Combine experimental results with observational data and AI-generated synthetic evidence. Each source has different strengths and failure modes; using only one type leaves insight on the table and blind spots unaddressed.
  3. **Evaluation frameworks for AI products**: As AI-powered features replace rule-based ones, standard A/B tests often measure the wrong thing. The paper calls for designing evaluation frameworks before deploying AI features, not retrofitting metrics after launch.
- **AI makes existing challenges harder, not easier**: Three specific existing problems get worse under AI: (1) generalization from experiment findings to unobserved populations, (2) detecting when an AI-powered system has changed behavior post-launch, and (3) the temptation to let AI "optimize" experiments toward a metric that isn't the right OEC.
- **Role shift for data scientists**: The paper explicitly argues that the DS's job is shifting from "analyst who runs individual tests" to "credibility auditor who ensures the organization learns correctly" — evaluating whether experiment conclusions are valid, whether findings generalize, and whether evaluation frameworks are well-designed.

## Takeaways for Practice
- **Build a cross-experiment synthesis habit now.** Look for patterns across your Ibotta experiments rather than evaluating each one in isolation. If 7 of 10 offer-value tests show a consistent effect in a certain CPG category, that cross-experiment signal is more reliable than any single test.
- **Don't trust AI-generated covariates without auditing them.** If you use an ML model's predictions as a CUPED covariate (see: AI-Assisted Variance Reduction, KDD 2026), verify the model isn't incorporating signals that are downstream of treatment assignment — that would invalidate the variance reduction.
- **For every new AI-powered feature at Ibotta (personalized offer ranking, smart notifications, AI-curated deals), define the evaluation framework before launch.** What metric does this feature optimize? What proxy metrics will you track during the ramp? What is the holdout strategy for long-term effects? Answer these before code ships.
- **Use observational data to triangulate experiment findings.** If an A/B test shows offer X improves 7-day revenue per user, does the observational data tell a consistent story about why? If not, that's a sign the experiment may be picking up noise or a local effect that won't generalize.
- **Treat the credibility of your experiment conclusions as a deliverable, not an assumption.** Document: What is the population this experiment applies to? Would the effect hold for Ibotta's grocery-first users vs. deal-hunter users? This is exactly what the CIDER paper says DS teams aren't doing systematically.

## Action Items / Things to Read
- Full paper: https://arxiv.org/abs/2611.16335
- Read alongside: *Trustworthy Online Controlled Experiments* (Kohavi, Tang, Xu 2020) — this paper is a 2026 update to the same intellectual project
- Read alongside: "Evaluating for the Long Term" (arXiv 2608.08043, 2026) — the cross-industry consensus on long-run evaluation that CIDER builds on
- Watch for: a likely published version at a major 2027 venue (NeurIPS, ICML, KDD) — this reads like a journal/conference submission in progress

## Tags
agentic-ai, causal-inference, generalization, industry-consensus, llm-evals, long-term-effects, metric-design, organizational-maturity, scientific-methodology, surrogate-metrics, synthetic-control, variance-reduction
