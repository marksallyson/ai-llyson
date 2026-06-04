---
title: Microsoft ExP Team
type: company
tags: [cuped, variance-reduction, organizational-maturity, sample-size, metric-design, platform, causal-inference]
source_url: https://exp-platform.com
added: 2026-06-04
---

# Microsoft ExP Team

## At a Glance
Microsoft's Analysis and Experimentation (ExP) team runs 20,000+ experiments per year across Bing, Office, Azure, and other products. They are the single most published internal experimentation team in history, having produced foundational papers on nearly every aspect of controlled experiments.

## Why They Matter
If you read one team's body of work, it's this one. Kohavi, Deng, Fabijan, and colleagues have documented pitfalls, methodologies, and organizational lessons at a depth no other company has matched publicly. Their exp-platform.com site is a free library of practitioner knowledge. They invented CUPED, formalized the concept of Overall Evaluation Criterion (OEC), and wrote the book — literally.

## Key Contributions
- **CUPED** (Controlled-experiment Using Pre-Experiment Data): variance reduction method that uses pre-experiment covariate data to reduce SEM, effectively giving you the statistical power of a larger sample size without collecting more data (Deng et al., KDD 2013)
- **Overall Evaluation Criterion (OEC)**: framework for combining multiple metrics into a single decision metric; forces teams to articulate what they're actually optimizing
- **Trustworthy Online Controlled Experiments** (book, Cambridge University Press, 2020): the definitive practitioner reference
- **"Surprising findings"** series: published papers documenting experiments where intuition was wrong, helping teams avoid overconfidence in HiPPO-driven decisions
- **Experimentation Growth Model**: Aleksander Fabijan's Crawl/Walk/Run/Fly framework for organizational maturity
- **exp-platform.com**: public knowledge base with papers, slides, and tools
- **Sample Ratio Mismatch (SRM) detection**: formalized checking for assignment imbalance as a data quality signal

## Takeaways for Practice
1. **Apply CUPED to every experiment at Ibotta.** Pre-experiment user-level covariates (prior redemption rate, GMV, category spend) are readily available. Plugging them in reduces required sample size — critical when offer-level experiments have small eligible populations.
2. **Define your OEC before the experiment starts, not after.** For promotions experiments, decide whether you're optimizing for redemption rate, incremental revenue, or net margin lift. Post-hoc metric selection is p-hacking.
3. **Run SRM checks as a standard QA step.** If the treatment and control group sizes diverge from the expected split, the experiment is compromised. Instrument this into your analysis pipeline.
4. **Read the "Surprising findings" papers before designing any experiment you're confident about.** Microsoft's catalog of counterintuitive results is a useful prior for staying humble about effect size estimates.
5. **Use their OEC framing to push back on stakeholders** who want to add 10 guardrail metrics post-launch. Define success criteria upfront or the experiment is not trustworthy.

## Action Items / Things to Read
- exp-platform.com — read the "papers" section; start with the 2007 KDD paper "Practical Guide to Controlled Experiments on the Web"
- Deng et al. (2013) "Improving the Sensitivity of Online Controlled Experiments by Utilizing Pre-Experiment Data" — the CUPED paper
- Kohavi et al. (2009) "Controlled Experiments on the Web: Survey and Practical Guide" — Distilled Web paper
- Kohavi, Tang, Xu (2020) *Trustworthy Online Controlled Experiments* — buy it; read chapters 3, 5, 7, and 19 first
- Fabijan et al. (2017) "The Evolution of Continuous Experimentation in Software Product Development" — growth model paper

## Tags
cuped, variance-reduction, organizational-maturity, sample-size, metric-design, platform, causal-inference, oec
