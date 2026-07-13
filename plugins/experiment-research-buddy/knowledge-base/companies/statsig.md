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

---

## Recent: 2026-06-17 — Introducing Experimental Meta-Analysis and the Knowledge Base

**Source:** Statsig Blog, June 17, 2026 · https://www.statsig.com/blog/experimental-meta-analysis-and-knowledge-base

**What's new:** Statsig shipped two new platform capabilities: (1) **Experimental meta-analysis** — aggregated views across your full corpus of experiments, filterable by team and product area, surfacing patterns about which metrics move together, which user segments respond to changes, and how effect sizes cluster by experiment type; (2) **Experiment Knowledge Base** — a free-text search layer over all past experiments so teams can find relevant prior work when designing new tests. Both features live under a new "Insights" tab.

**Why it matters:** The meta-analysis capability operationalizes something most teams aspire to but rarely execute: learning *across* experiments, not just *from* individual experiments. The classic problem is that each experiment answers a point question — "did this feature work?" — but the corpus of experiments collectively holds far more signal about users and product levers than any individual result. Meta-analysis is how you extract it. The knowledge base addresses the equally common problem of running redundant experiments or missing that a related test was already done by another team.

**Ibotta relevance:** At scale, Ibotta runs experiments across offer categories, user segments, and retailer contexts. A meta-analysis view across those experiments would surface patterns like "BOGO offers consistently underperform cash-back offers in the grocery category" or "weekend sessions show 2× the lift from notification experiments" — insights that are invisible when experiments are analyzed in isolation. Worth evaluating even if Ibotta isn't fully on Statsig, as the underlying methodology is adoptable in any data warehouse.

**Tags added:** experimental-meta-analysis, knowledge-base, cross-experiment-learning, insights

---

## Recent: 2026-07-02 — Statsig + Amplitude: The Drop on Phase 1

**Source:** Statsig Blog, July 2, 2026 · https://www.statsig.com/blog/statsig-amplitude-phase-1  
**Context posts:** "Statsig is joining OpenAI" · https://www.statsig.com/blog/openai-acquisition | Amplitude blog · https://amplitude.com/blog/amplitude-and-statsig-partnership

**What happened (full arc):** In September 2025, OpenAI acquired Statsig for approximately $1.1 billion. Vijaye Raji (Statsig founder and CEO) moved to OpenAI as CTO of Applications, leading product engineering for ChatGPT and Codex. The Statsig engineering team went with him. Then, on May 5, 2026, Amplitude struck a partnership to take over the Statsig brand, customer base, and platform — maintaining the warehouse-native experimentation product under Amplitude's stewardship and adding Statsig's customers (~$16M incremental ARR) to Amplitude's portfolio. The July 2 blog post marks the beginning of **Phase 1** of the integration: connecting the two products at the data layer. Amplitude events and cohorts now work inside Statsig; Statsig experiment outcomes now surface inside Amplitude. By end of Q3 2026, customers of both products will be able to use them together without choosing one. Phase 2 will pursue deeper interoperability — a single unified workflow for product engineers shipping, testing, and proving fixes.

**Why it matters:** The original engineering team that built Statsig's reputation — rapid iteration, warehouse-native architecture, rigorous stats engine — is now at OpenAI building different things. Amplitude manages the platform with a product-analytics-first strategic agenda rather than Statsig's experimentation-first one. The warehouse-native architecture is preserved for now, but the product roadmap is Amplitude's to set. Phase 1 is plumbing — data connectors. The more interesting question is whether the combined Amplitude + Statsig product becomes the best end-to-end "instrument, analyze, experiment" platform, or whether the two codebases drift under competing priorities. VWO, Eppo (now Datadog), and GrowthBook all noted this as a competitive opening, especially for customers who chose Statsig for its engineering-led culture.

**Ibotta relevance:** Ibotta should update its experimentation platform evaluation with this changed landscape. The question is no longer "Statsig vs. Eppo vs. GrowthBook" but "Amplitude + Statsig (integrated) vs. standalone experimentation platforms vs. build in-house on Databricks." The warehouse-native data story is intact. The question is whether Amplitude's roadmap will deepen the stats engine or drift toward analytics product features. Worth checking the Phase 2 roadmap details when they're announced in Q3 2026.

**Tags added:** platform-acquisition, amplitude, openai, warehouse-native, platform-update, platform-consolidation

---

## Recent: 2026-07-13 — Meta Analysis July Release: Metric Correlation Across Experiments

**Source:** Statsig Product Updates, July 2026 · https://www.statsig.com/updates/update/metric-correlation  
**Related perspective piece:** https://www.statsig.com/perspectives/meta-analysis-experiments-patterns

**What's new:** Statsig shipped the second view in their experimental meta-analysis suite — a **metric correlation chart**. The view plots two metrics on the same chart, with each data point representing one experiment's treatment effect on both metrics simultaneously. You can visually scan whether the metrics tend to move together or independently across your full experiment corpus, remove outliers, filter by team or product area, and download the underlying dataset for further analysis.

**Why it matters:** This directly attacks one of the most persistent problems in experimentation: choosing a short-term proxy metric that actually predicts your long-term primary metric. The classic problem is that conversion (the metric you care about) is hard to move statistically — it takes a lot of traffic and time. If you could find a faster-moving metric that correlates tightly with conversion across your historical experiments, you could run faster tests and still learn what you care about. Statsig's metric correlation chart makes this analysis visual and accessible to non-statisticians. The key distinction from a simple correlation analysis: each data point is an *experiment's treatment effect* on both metrics, not raw user-level correlation — so it controls for confounders by construction.

**Ibotta relevance:** Ibotta's primary metric for offer experiments is likely redemption rate — a conversion event that requires the user to complete a purchase, which is rare and slow. Faster proxy candidates might include: offer saves/favorites, app session time, category browse events, or push notification open rate. Running a metric correlation analysis across historical offer tests would tell you which of these proxies actually moves when redemption moves — giving Ibotta a faster-measurable signal for future experiments without sacrificing connection to the outcome that matters.

**Tags added:** metric-design, proxy-metrics, experimental-meta-analysis, cross-experiment-learning
