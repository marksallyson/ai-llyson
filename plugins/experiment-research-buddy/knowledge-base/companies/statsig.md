---
title: Statsig
type: company
tags: [always-valid-inference, bayesian, cuped, feature-flags, metric-design, organizational-maturity, platform, sequential-testing, warehouse-native]
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
always-valid-inference, bayesian, cuped, feature-flags, metric-design, organizational-maturity, platform, sequential-testing, warehouse-native

---

## Recent: 2026-06-11 — Full Support for Statsig Experimentation & Analytics in Microsoft Fabric

**Source:** Statsig Blog, June 11, 2026 · https://www.statsig.com/blog/microsoft-fabric-experimentation-analytics  
Cross-posted on the Microsoft Fabric Blog: https://blog.fabric.microsoft.com/en-US/blog/27219/

**What's new:** Statsig's experimentation and analytics tools are now fully generally available as a native workload inside Microsoft Fabric (previously in preview since late 2025). Teams can run A/B tests and compute experiment metrics directly against data in OneLake — Microsoft Fabric's unified data lake — without any ETL or data movement. The integration exposes Statsig's full stats engine: CUPED variance reduction, sequential testing, multi-armed bandits, stratified sampling, holdouts, and differential impact detection, all running on Fabric Data Warehouse or Lakehouse.

**Why it matters:** This is the closest thing to a turnkey warehouse-native experimentation platform for shops already on the Microsoft data stack (Azure Synapse, Fabric, Power BI). The no-data-movement architecture means experiment data never leaves your governed environment — critical for teams with strict data residency or brand-partner contractual constraints. It also lowers the barrier for teams that have been "planning to build warehouse-native experimentation" but haven't gotten there.

**Ibotta relevance:** If Ibotta's stack includes any Microsoft Fabric or Azure components, this is worth evaluating immediately. Even if Ibotta is primarily on Databricks, the Statsig/Fabric integration signals that warehouse-native is now table stakes for experimentation platforms — and worth asking whether the current Ibotta experimentation setup achieves the same properties (no data egress, compute on governed data, centralized metric definitions).

**Tags added:** microsoft-fabric, warehouse-native, platform-update, onelake
