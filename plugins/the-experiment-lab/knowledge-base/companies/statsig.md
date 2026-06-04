---
title: Statsig
type: company
tags: [platform, warehouse-native, sequential-testing, bayesian, organizational-maturity, metric-design]
source_url: https://statsig.com/blog
added: 2026-06-04
---

# Statsig

## At a Glance
Statsig is a warehouse-native experimentation platform founded by Vijaye Raji (ex-Facebook VP of Product Infrastructure). Their customers include OpenAI, Notion, and dozens of mid-size tech companies. Their engineering blog is one of the best sources of practitioner-level content on experiment statistics, sequential testing, and platform design.

## Why They Matter
Statsig is the best current option for a team that wants a rigorous, warehouse-native experimentation platform without building from scratch. For Ibotta, Statsig's warehouse-native architecture (experiments run on your own data warehouse, no data leaves your infrastructure) is directly relevant for compliance and data governance reasons. Their blog publishes unusually rigorous content — not vendor marketing, but technical deep-dives written by ex-Facebook and ex-Microsoft statisticians.

## Key Contributions
- **Warehouse-native architecture**: experiment assignment, exposure logging, and metric computation all run on top of your existing data warehouse (Snowflake, BigQuery, Databricks); no data egress required
- **CUPED and variance reduction out-of-the-box**: Statsig implements CUPED automatically using pre-experiment user data from your warehouse
- **Sequential testing (always-valid inference)**: built-in support for checking experiments early without inflating Type I error
- **Metric layers and guardrails**: define company-wide metric libraries; experiments automatically compute guardrail metrics alongside primary metrics
- **Statsig Engineering Blog**: deep posts on topics like CUPED implementation, Bayesian vs. frequentist tradeoffs, SRM detection, and sequential testing — written at a level that assumes you know statistics
- **Feature gates + experiments unified**: feature flag management and experiment assignment are the same system; every feature rollout is experiment-ready by default

## Takeaways for Practice
1. **If Ibotta is evaluating experimentation platforms, Statsig is worth a serious pilot** — particularly because warehouse-native means Ibotta's offer/transaction data never leaves the data warehouse, which matters for brand partner data agreements.
2. **Statsig's blog posts on CUPED implementation are the clearest technical explanation available** of how CUPED works in a production system. Read these before implementing CUPED in-house to understand the edge cases (dilution, covariate selection, regression to the mean artifacts).
3. **The unified feature flag + experiment system means every feature launch can have a holdout by default.** This is the right architecture for Ibotta. Even if a feature isn't being formally tested, having a holdout costs almost nothing and gives you a retrospective counterfactual if the feature underperforms.
4. **Statsig's metric library concept — centrally defined, version-controlled metrics shared across all experiments — solves the "every team computes revenue differently" problem.** If Ibotta has inconsistent metric definitions across teams, this is the pattern to adopt, even without Statsig.
5. **Read the Statsig blog before building any custom experimentation tooling.** Their engineers have solved problems you'll encounter, and their posts document the solutions.

## Action Items / Things to Read
- Statsig Engineering Blog: statsig.com/blog — start with posts on CUPED, SRM detection, and sequential testing
- "How Statsig Computes CUPED" — Statsig Blog (exact title may vary; search)
- "Building a Metrics Layer" — Statsig Blog
- Vijaye Raji's posts on LinkedIn and substack about experimentation infrastructure
- Statsig vs. Eppo vs. GrowthBook comparison — search for recent practitioner comparisons on substack or Hex blog

## Tags
platform, warehouse-native, sequential-testing, bayesian, organizational-maturity, metric-design, feature-flags, cuped, always-valid-inference

---

## Recent: 2026-05-05 — Amplitude Takes Over Statsig Brand After OpenAI Acquisition

**Sources:** [Amplitude announcement](https://amplitude.com/blog/amplitude-and-statsig-partnership) | [Convert.com analysis](https://www.convert.com/blog/a-b-testing/statsig-moves-to-amplitude/) | [OpenAI acquisition press release](https://openai.com/index/vijaye-raji-to-become-cto-of-applications-with-acquisition-of-statsig/)

### What Happened
Two major events unfolded in the span of eight months:

1. **September 2025**: OpenAI acquired Statsig for ~$1.1 billion (all-stock). Vijaye Raji, Statsig's founder and CEO, became OpenAI's CTO of Applications. The Statsig engineering team joined OpenAI.

2. **May 5, 2026**: Amplitude announced it is taking over the Statsig brand, platform, and customer base. OpenAI retained the engineering talent; Amplitude inherited the code, the warehouse-native product, and the customer relationships.

### Implications for the Platform
- The Statsig product continues under Amplitude's management. Existing warehouse-native functionality (Snowflake, BigQuery, Databricks integration), CUPED, sequential testing, and the metric layer are preserved.
- Amplitude plans to integrate Statsig's experimentation capabilities into its broader product analytics suite.
- Industry critics note the "race car without a driver" concern — Amplitude gets the codebase and customers, but the statistical and engineering expertise that made Statsig's blog and methodology unusually rigorous moved to OpenAI.

### What This Means for Teams Evaluating Statsig
- **Short term**: the platform continues. Existing customers are supported. No forced migration.
- **Medium term**: the roadmap now reflects Amplitude's priorities, not Statsig's. It is unclear whether the depth of statistical innovation (e.g., novel variance reduction methods, always-valid inference improvements) will continue at the same pace.
- **For Ibotta**: if Statsig was on the shortlist, re-evaluate it as "Amplitude-managed Statsig." Evaluate Amplitude's product analytics integration as a potential advantage (unified funnel analytics + experimentation), while noting the risk that deep statistical tooling may stagnate without the original team. Also evaluate Eppo-by-Datadog and GrowthBook as alternatives.

### Parallel Event: Eppo Acquired by Datadog (May 2025)
Eppo, Statsig's main warehouse-native competitor, was acquired by Datadog in May 2025 and relaunched as **Datadog Experiments** in April 2026. This means both top-tier warehouse-native platforms (Statsig and Eppo) are now subsidiaries of larger analytics vendors. GrowthBook (open-source) and Amplitude-managed Statsig are the remaining independent options at scale.
