# Experiment Lab Knowledge Base — Master Index

Last updated: 2026-06-04

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
| [meta.md](companies/meta.md) | Meta | Massive-scale network effects research; surrogate metrics; interference in social graphs |
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

---

## Articles

| File | Title | One-Line Description |
|------|-------|----------------------|
| [how-not-to-run-an-ab-test.md](articles/how-not-to-run-an-ab-test.md) | How Not To Run an A/B Test (Evan Miller) | Canonical peeking problem post; explains what peeking does to Type I error |
| [surprising-ab-test-results.md](articles/surprising-ab-test-results.md) | Surprising A/B Test Results (Kohavi et al.) | Catalog of experiments that contradicted expert intuition; why mandatory pre-registration matters |
| [doordash-experiment-capacity.md](articles/doordash-experiment-capacity.md) | DoorDash Experiment Capacity (DoorDash Engineering) | How CUPAC increased DoorDash's effective experiment capacity via ML-based variance reduction |

---

## Tags in Use

`always-valid-inference` · `attribution-window` · `bayesian` · `behavioral-economics` · `binary-outcomes` · `book` · `booking-com` · `brand-level` · `career` · `causal-inference` · `client-side-assignment` · `cluster-randomization` · `community` · `concurrent-experiments` · `continuous-deployment` · `crawl-walk-run-fly` · `culture` · `cupac` · `cuped` · `delayed-conversion` · `democratization` · `difference-in-differences` · `engagement` · `eppo` · `exposure-logging` · `false-positive` · `feature-flags` · `funnel` · `glm` · `guardrail-metrics` · `holdout` · `infrastructure` · `interference` · `interleaving` · `interrupted-time-series` · `layered-experiments` · `layers` · `long-term-effects` · `loss-aversion` · `marketplace` · `maturity-model` · `metric-design` · `mid-size-ecommerce` · `ml-covariate` · `ml-integration` · `mlrate` · `mobile` · `mobile-ab` · `modular-inference` · `msprt` · `multiple-testing` · `netflix` · `network-effects` · `non-technical-access` · `notifications` · `oec` · `organizational-maturity` · `outlier-treatment` · `overlapping-experiments` · `peeking` · `personalization` · `platform` · `practitioner-interviews` · `quasi-experimental` · `ranking` · `rapid-iteration` · `regression-to-mean` · `right-censoring` · `sample-size` · `sequential-testing` · `social-graph` · `srm` · `staged-rollout` · `stakeholder-communication` · `streak-mechanics` · `surprising-findings` · `surrogate-metrics` · `sutva` · `switchback` · `synthetic-control` · `two-sided-markets` · `type-i-error` · `user-lifecycle` · `variance-reduction` · `warehouse-native` · `xlnt`
