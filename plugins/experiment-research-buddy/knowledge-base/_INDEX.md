# Experiment Lab Knowledge Base — Master Index

Last updated: 2026-07-06 (added 1 paper: Multi-Experiment Analysis LinkedIn 2026; updated Statsig with Amplitude Phase 1 acquisition news; updated Netflix with HTE case studies; updated LinkedIn with MEA paper reference)

---

## Companies

| File | Company | One-Line Description |
|------|---------|----------------------|
| [microsoft-exp.md](companies/microsoft-exp.md) | Microsoft ExP Team | Runs 20k+ experiments/year; invented CUPED; most published internal experimentation team in history |
| [google.md](companies/google.md) | Google | Pioneered overlapping/layered experiment infrastructure; 2010 KDD paper is foundational reading |
| [linkedin.md](companies/linkedin.md) | LinkedIn | Built XLNT (~400 experiments/day); landmark work on interference in social networks under Ya Xu |
| [netflix.md](companies/netflix.md) | Netflix | XP platform + causal inference at scale; known for modular inference models and personalization experiments |
| [booking-com.md](companies/booking-com.md) | Booking.com | 25k+ experiments/year; Lukas Vermeer built the culture and democratized access to non-technical teams |
| [airbnb.md](companies/airbnb.md) | Airbnb | Built experimentation culture from scratch; ML × experiment integration; Kohavi joined as VP |
| [meta.md](companies/meta.md) | Meta | Massive-scale network effects research; surrogate metrics; interference in social graphs · 📡 [Analytics at Meta (Medium)](https://medium.com/@AnalyticsAtMeta) |
| [uber.md](companies/uber.md) | Uber | Marketplace interference; switchback testing; synthetic control; staged rollouts |
| [lyft.md](companies/lyft.md) | Lyft | Two-sided market interference paper; long-term holdout experiments; quasi-experimental methods |
| [doordash.md](companies/doordash.md) | DoorDash | Invented CUPAC (CUPED + ML); Dash-AB stats engine; interleaving for ranking experiments |
| [spotify.md](companies/spotify.md) | Spotify | Built and open-sourced Confidence platform; "learning framework" beyond win/lose |
| [duolingo.md](companies/duolingo.md) | Duolingo | Aggressive testing culture; rapid iteration; consumer learning product context |
| [twitter-x.md](companies/twitter-x.md) | Twitter/X | Duck Duck Goose A/B platform; mobile A/B infra; early 2015 large-scale technical overview |
| [pinterest.md](companies/pinterest.md) | Pinterest | Interleaving for ranking; delayed conversion measurement; metric frameworks |
| [etsy.md](companies/etsy.md) | Etsy | Democratization case study for mid-size e-commerce; early strong engineering culture |
| [shopify.md](companies/shopify.md) | Shopify | Synthetic controls for merchant-level interventions; quasi-experimental methods write-up |
| [statsig.md](companies/statsig.md) | Statsig | Warehouse-native experimentation platform; founded by ex-Facebook VP; strong practitioner blog |

---

## Individuals

| File | Person | One-Line Description |
|------|--------|----------------------|
| [ron-kohavi.md](individuals/ron-kohavi.md) | Ron Kohavi | Most cited practitioner in the field; co-authored *Trustworthy Online Controlled Experiments*; 55k+ Scholar citations |
| [diane-tang.md](individuals/diane-tang.md) | Diane Tang | Google Research; co-authored foundational overlapping experiments paper (2010 KDD) and the book |
| [ya-xu.md](individuals/ya-xu.md) | Ya Xu | Built LinkedIn's XLNT platform; landmark work on causal inference in social networks; co-authored the book |
| [alex-deng.md](individuals/alex-deng.md) | Alex Deng | Co-invented CUPED (2013); technically precise papers on variance reduction and intuition busters |
| [aleksander-fabijan.md](individuals/aleksander-fabijan.md) | Aleksander Fabijan | Created the Experimentation Growth Model (Crawl/Walk/Run/Fly); best source on scaling org maturity |
| [lukas-vermeer.md](individuals/lukas-vermeer.md) | Lukas Vermeer | Built Booking.com's culture; prolific speaker; advises companies on democratizing experimentation |
| [chetan-sharma.md](individuals/chetan-sharma.md) | Chetan Sharma | Co-founder of Eppo (acquired by Datadog 2025); rigorous Substack on warehouse-native and sequential testing |
| [evan-miller.md](individuals/evan-miller.md) | Evan Miller | Wrote canonical "How Not To Run an A/B Test"; built most-used sample size calculator at evanmiller.org |
| [rommil-santiago.md](individuals/rommil-santiago.md) | Rommil Santiago | Founder of Experiment Nation (11k+ members); authored *Prove It or Lose It* (2025) |
| [martin-tingley.md](individuals/martin-tingley.md) | Martin Tingley + Netflix team | Netflix causal inference collective; published on GLM-based variance reduction and modular experiment infra |

---

## Papers

| File | Title | One-Line Description |
|------|-------|----------------------|
| [trustworthy-online-controlled-experiments.md](papers/trustworthy-online-controlled-experiments.md) | Trustworthy Online Controlled Experiments (Kohavi, Tang, Xu 2020) | The definitive practitioner textbook; covers OEC, SRM, pitfalls, organizational maturity |
| [cuped-paper.md](papers/cuped-paper.md) | Improving Sensitivity Using Pre-Experiment Data — CUPED (Deng et al., KDD 2013) | Invented CUPED; the canonical variance reduction technique now used industry-wide |
| [overlapping-experiments.md](papers/overlapping-experiments.md) | Overlapping Experiment Infrastructure (Tang et al., KDD 2010) | Google's layered experiment system; foundational for concurrent experiment design |
| [peeking-problem.md](papers/peeking-problem.md) | Peeking Problem / mSPRT (Johari et al.) | Formalizes the peeking problem and introduces always-valid inference via mSPRT |
| [srm-paper.md](papers/srm-paper.md) | SRM — Sample Ratio Mismatch detection and diagnostics | Systematic treatment of SRM as a validity check; diagnostic checklist |
| [objective-bayesian-ab-testing-deng.md](papers/objective-bayesian-ab-testing-deng.md) | Objective Bayesian Two Sample Hypothesis Testing (Deng et al., 2016) | Microsoft/Bing's empirical Bayes framework — prior learned from thousands of historical experiments |
| [empirical-bayes-multistage-testing.md](papers/empirical-bayes-multistage-testing.md) | Empirical Bayes Multistage Testing for Large-Scale Experiments (arXiv 2022) | Sequential + empirical Bayes hybrid (AMSET) with FDR control and adaptive stopping |
| [mmm-calibration-bayesian-priors.md](papers/mmm-calibration-bayesian-priors.md) | Media Mix Model Calibration With Bayesian Priors (Google Research, 2024) | Reparameterizes MMMs so ROAS is an explicit parameter — enables direct calibration from A/B experiment results |
| [heavy-tailed-monetization-variance-poststrat-2026.md](papers/heavy-tailed-monetization-variance-poststrat-2026.md) | Variance Reduction for Heavy-Tailed Monetization Metrics via Post-Stratification (SIGIR 2026) | Post-stratification + CUPED hybrid for heavy-tailed revenue metrics; 45% traffic reduction achieved at ShareChat |
| [ai-assisted-variance-reduction-kdd2026.md](papers/ai-assisted-variance-reduction-kdd2026.md) | AI-Assisted Variance Reduction in Randomized Experiments (KDD 2026) | Any AI prediction can be used as a CUPED covariate with a "do no harm" guarantee; validated on email marketing and platform experiments |
| [multi-experiment-analysis-linkedin-2026.md](papers/multi-experiment-analysis-linkedin-2026.md) | Multi-Experiment Analysis (Hosseini, LinkedIn, arXiv 2026) | Joint estimation across overlapping experiments producing corrected individual effects, combined launch effects, and conditional effects — no factorial pre-design needed; deployed at LinkedIn |

---

## Articles

| File | Title | One-Line Description |
|------|-------|----------------------|
| [how-not-to-run-an-ab-test.md](articles/how-not-to-run-an-ab-test.md) | How Not To Run an A/B Test (Evan Miller) | Canonical peeking problem post; explains what peeking does to Type I error |
| [surprising-ab-test-results.md](articles/surprising-ab-test-results.md) | Surprising A/B Test Results (Kohavi et al.) | Catalog of experiments that contradicted expert intuition; why mandatory pre-registration matters |
| [doordash-experiment-capacity.md](articles/doordash-experiment-capacity.md) | DoorDash Experiment Capacity (DoorDash Engineering) | How CUPAC increased DoorDash's effective experiment capacity via ML-based variance reduction |
| [goodui.md](articles/goodui.md) | GoodUI | 650+ crowdsourced A/B test patterns from major companies — useful for hypothesis generation, not statistical evidence; no sample sizes or significance data |
| [abtest-design.md](articles/abtest-design.md) | abtest.design | 50 mobile/SaaS A/B test case studies (Duolingo, Uber, Pinterest) — wins-only, no statistical rigor, many implausibly large effect sizes; use only for paywall/onboarding hypothesis generation |
| [statsig-informed-bayesian-ab-testing.md](articles/statsig-informed-bayesian-ab-testing.md) | Informed Bayesian A/B Testing: Two Approaches (Statsig) | Risks of informed priors; empirical Bayes as the only defensible approach; Microsoft Bing as model |
| [eppo-frequentist-vs-bayesian-vs-sequential.md](articles/eppo-frequentist-vs-bayesian-vs-sequential.md) | Comparing Frequentist vs. Bayesian vs. Sequential (Eppo) | Structured tradeoff comparison; Spotify + Booking.com named as sequential adopters; Google reversed from Bayesian |
| [spotify-risk-aware-multi-metric.md](articles/spotify-risk-aware-multi-metric.md) | Risk-Aware Decisions in A/B Tests with Multiple Metrics (Spotify, 2024) | Four-category metric framework; beta corrections for guardrails; fully frequentist |
| [microsoft-ab-interactions-call-to-relax.md](articles/microsoft-ab-interactions-call-to-relax.md) | A/B Interactions: A Call to Relax (Microsoft ExP, 2023) | Empirical study across 4 products: interaction rate is 1-in-50,000 metric pairs; run tests concurrently |
| [statsig-detecting-interaction-effects.md](articles/statsig-detecting-interaction-effects.md) | Detecting Interaction Effects of Concurrent Experiments (Statsig, 2025) | 2×2 factorial split to test whether combined effect differs from sum; overlap + monitoring beats mutual exclusion |
| [statsig-speeding-up-ab-tests.md](articles/statsig-speeding-up-ab-tests.md) | Speeding Up A/B Tests with Discipline (Statsig, 2025) | Four levers: concurrent testing, proxy metrics (10× sample), CUPED (40% variance), adaptive allocation |
| [eppo-rethinking-experimental-impact.md](articles/eppo-rethinking-experimental-impact.md) | The Whole Is Less Than the Sum of Its Parts (Eppo/Sven Schmit, 2025) | Four reasons summed wins overstate impact: winner's curse, interactions, novelty decay, selection bias |
| [etsy-collective-impact-experiments.md](articles/etsy-collective-impact-experiments.md) | Understanding the Collective Impact of Experiments (Etsy, 2025) | Global holdout held out of all experiments for a quarter; sum of wins ≠ true collective product impact |
| [etsy-winners-curse-mitigation.md](articles/etsy-winners-curse-mitigation.md) | Mitigating the Winner's Curse in Online Experiments (Etsy, 2022) | Bayesian shrinkage with empirical prior fitted on historical lifts; adaptive discounting per experiment precision |
| [statsig-kaplan-meier-ab-retention.md](articles/statsig-kaplan-meier-ab-retention.md) | Kaplan-Meier: Visualizing A/B Test Retention (Statsig, 2025) | Survival analysis for retention experiments; handles censored data; 20–30% sensitivity gain over point-in-time retention metrics |
| [abadie-value-of-evidence-2026.md](articles/abadie-value-of-evidence-2026.md) | Estimating the Value of Evidence-Based Decision Making (Abadie, Agarwal, Imbens et al., 2026) | p < 0.05 rules leave 27–30% of attainable value on the table; empirical Bayes decision rules recover most of it — validated on 4,800+ Upworthy A/B tests |

---

## Tags in Use

`agentic-ai` · `amplitude` · `checkout` · `conditional-effects` · `conversion-optimization` · `marketing-measurement` · `mmm` · `roas` · `empirical-bayes` · `frequentist-vs-bayesian` · `forms` · `always-valid-inference` · `attribution-window` · `bayesian` · `behavioral-economics` · `binary-outcomes` · `book` · `booking-com` · `brand-level` · `career` · `causal-inference` · `client-side-assignment` · `cluster-randomization` · `community` · `concurrent-experiments` · `continuous-deployment` · `crawl-walk-run-fly` · `culture` · `cupac` · `cuped` · `decision-theory` · `delayed-conversion` · `democratization` · `difference-in-differences` · `engagement` · `eppo` · `experimental-meta-analysis` · `exposure-logging` · `false-positive` · `feature-flags` · `funnel` · `glm` · `guardrail-metrics` · `heavy-tailed` · `heterogeneous-treatment-effects` · `holdout` · `hte` · `infrastructure` · `interference` · `interleaving` · `interrupted-time-series` · `layered-experiments` · `layers` · `llm-evals` · `long-term-effects` · `loss-aversion` · `marketplace` · `maturity-model` · `metric-design` · `mid-size-ecommerce` · `ml-covariate` · `ml-integration` · `mlrate` · `joint-estimation` · `mobile` · `mobile-ab` · `multi-experiment` · `modular-inference` · `monetization` · `msprt` · `multiple-testing` · `netflix` · `network-effects` · `non-technical-access` · `notifications` · `oec` · `organizational-maturity` · `outlier-treatment` · `overlapping-experiments` · `peeking` · `personalization` · `platform` · `platform-acquisition` · `platform-consolidation` · `policy-learning` · `post-stratification` · `practitioner-interviews` · `prognostic-score` · `quasi-experimental` · `ranking` · `rapid-iteration` · `regression-to-mean` · `right-censoring` · `sample-size` · `sequential-testing` · `social-graph` · `srm` · `staged-rollout` · `stakeholder-communication` · `streak-mechanics` · `surprising-findings` · `surrogate-metrics` · `sutva` · `switchback` · `synthetic-control` · `two-sided-markets` · `type-i-error` · `user-lifecycle` · `variance-reduction` · `warehouse-native` · `xlnt`
