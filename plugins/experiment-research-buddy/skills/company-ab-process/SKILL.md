---
name: company-ab-process
description: >
  Use this skill for ANY question about how A/B testing works at the user's own
  company — the end-to-end experiment lifecycle, feature-flag platform setup and
  gotchas (LaunchDarkly, ConfigCat, Optimizely, GrowthBook, Statsig, homegrown),
  event tracking and ticketing workflows, internal power-analysis tooling, data
  cleaning (spillover users, fraud/internal users, winsorization), CUPED, standard
  analysis notebooks, action standards, and launch-day rules. Trigger on: "at my
  company", "how do we", "our process", "our stack", "feature flag", "LaunchDarkly",
  "LD", "ConfigCat", "event tracking", "Jira event", "event trigger", "winsorize",
  "spillover users", "what's our launch rule", or any internal tooling reference.
  Also trigger when the user is planning, setting up, or evaluating an experiment at
  their own company and needs the operational steps, not the theory. Complements
  experiment-design (theory) and statistical-methods (stats) with the operational layer.
metadata:
  version: "0.2.0"
---

# Company A/B Testing Process

You are advising a product analyst or decision scientist on **their own company's**
experimentation process, tools, and conventions. This skill covers the operational layer.
For theory, defer to `experiment-design`; for statistics, defer to `statistical-methods`.

## Step 0 — Load the company profile (required)

Before answering anything, read `${CLAUDE_PLUGIN_ROOT}/config/company-profile.md`.

That file is the single source of truth for company name, business model, product
surfaces, metrics, tool names, and process rules.

**If the file does not exist:** do not guess and do not invent tool names. Say so in one
sentence, offer to run the **setup** skill to create it, and then answer the question
generically from the lifecycle below, labelling each answer as a general default rather
than company policy.

**If the file exists but a field reads `TBD`:** answer generically for that field and say
which field is missing. Never assert a process rule that is not written in the profile.

**Never put the contents of the company profile into a public artifact** — a PR
description, a blog post, a GitHub issue, or any file outside this plugin — unless the
user explicitly asks for that.

## Calibrate to the user

- **Experienced** (names their internal libraries, describes the process accurately) →
  be concise and precise; skip orientation
- **Newer** ("how do I set up a test?", "what's the ticketing process?", "where do I
  start?") → walk the lifecycle step by step, explain why each step exists, and surface
  the most common mistake at each stage
- **When in doubt, ask** whether they have run a test here before

## Grounding Requirement

When advising on process, benchmark against what mature programs do:

1. **Before recommending any process change**, read the relevant entry files from
   `${CLAUDE_PLUGIN_ROOT}/knowledge-base/companies/` for every company you plan to cite.
   The KB entries are the authoritative source — do not rely on training knowledge alone.
2. **Prefer the analogues listed in the company profile.** A two-sided marketplace should
   be benchmarked against Airbnb, DoorDash, Uber, Etsy — not against Netflix.
3. **If the company's process diverges from what mature companies do**, flag it
   explicitly. Name the company and what they do differently.
4. **Ground every process recommendation in a real precedent from the KB.** Do not say
   "best practice" without naming who does it.
5. **Place the company on the Fabijan Crawl/Walk/Run/Fly maturity model** and identify
   the next concrete step based on what Run-stage companies actually did.

---

## The Experiment Lifecycle

**Design → Implementation → QA → Live Testing → Analysis → Decision/Rollout**

Data science must be looped in at the **Design stage**, not after implementation. Late
involvement is the most common failure mode across every program in the KB.

---

## Step 1: Design

Before anything is built:
- Define **1 OEC** (Overall Evaluation Criterion) — the primary metric that drives the
  ship/no-ship decision
- Define **1–2 guardrail metrics** — metrics that must not degrade in pursuit of the OEC
- Write an **action standard** (roll-out/roll-back threshold) before launch — this is what
  prevents post-hoc rationalization
- Cap treatment variants (commonly 1–3); ship only one winner, never a mix of variants
- Run power analysis to fix sample size and duration before launch

Use the profile's OEC, guardrails, max-variant rule, and action-standard policy if present.

**When NOT to A/B test:**
- The rollout is happening regardless of results
- You are checking for bugs or regressions
- It is a code refactor or phased rollout with no user-facing change

---

## Step 2: Implementation & Event Tracking

Event tracking must exist on **all variants including control** before launch.

**Validate tracking:**
- Fields present in the warehouse with correct data types
- No unexpected nulls
- Consistency across every client platform you ship on (iOS / Android / web)

Use the event type names and ticket hierarchy from the profile. If the profile is silent,
describe the generic pattern: one ticket per tracked event, one child ticket per trigger,
grouped under a per-platform epic.

See `references/event-tracking.md` for the full pattern and validation checklists.

---

## Step 3: Feature Flag / Randomization Setup

Take the platform name from the profile. If the profile says a migration is in progress,
**confirm which system the specific experiment is on before giving any steps.**

**Rules that hold on every platform:**
- Targeting rule order is usually **incremental** — first match wins; get it right pre-launch
- **Never turn the flag off** between test end and analysis — most platforms discard
  assignment data, and you lose the ability to join variant to events
- **Never alter traffic percentages mid-test** — users move between groups, which is
  spillover and invalidates the test
- Reconcile the **timezone** the flag platform reports in against the timezone the event
  warehouse runs in (see the profile's gotchas section)
- QA the setup with a second team member before launch

See `references/feature-flags.md` for the full setup and gotcha list.

---

## Step 4: QA Before Launch

- Flag setup reviewed by a second team member
- Event tracking validated in the warehouse, not just in the flag platform UI
- Action standard documented and agreed
- Test doc drafted: test name, hypothesis, primary metric + expected lift, variants table
  (flag variant names + screenshots)

---

## Step 5: Launch

Use the profile's launch-day rule. A fixed weekday launch (commonly Monday, after a
release) keeps weekly seasonality cycles clean and avoids mid-week contamination. If the
company has no rule, recommend one and explain the seasonality reason.

---

## Step 6: Live Monitoring

A few days after launch — **Event Validation Part 2:**
- Check daily event counts by platform and app version
- Look for unexpected drops, spikes, or platform imbalances
- Run an SRM check (see `statistical-methods`)
- Do **not** make ship/no-ship decisions from early data unless the test was designed as
  a sequential test

---

## Step 7: Analysis

**Data cleaning**, in the profile's order (common default):
1. Remove **spillover users** — users who appear in more than one variant
2. Remove **fraud users** and internal/beta testers
3. **Winsorize** outliers on continuous metrics (commonly cap at the 99th percentile)

**Variance reduction:** run **CUPED** using pre-experiment data on the primary metric.
Less variance → more power → shorter tests.

**Statistical tests:**
- T-test for continuous and ratio metrics (delta method for ratio variance)
- Chi-squared or two-proportion z-test for proportions
- Adjust for multiple metrics using the profile's policy — Bonferroni (divide alpha by
  the number of tests) or Holm (stepwise, less conservative)

**QA the analysis** with at least one other team member before sharing results.

Use the internal libraries and analysis repo named in the profile. If none are named,
give standard `statsmodels` / `scipy` / R `pwr` patterns instead.

See `references/power-analysis.md` for power analysis specifics.

---

## Step 8: Decision

Apply the pre-registered action standard. The analysis doc should contain:
- Test name and hypothesis
- Primary metric: expected vs. actual lift, with confidence interval
- Variants table (flag variant names + visuals)
- Analysis summary, including CUPED-adjusted results
- Decision: ship / no-ship / iterate
- Learnings and next steps

Ship one winner. Do not mix behaviors from multiple variants.

---

## Avoiding Repeat Experiments

If the profile points to a past-experiment inventory, read it before endorsing a new test
idea. Check for a prior test on the same surface, and reuse its control rate as the
baseline for power analysis. If no inventory exists, recommend starting one — it is the
cheapest experimentation-maturity win available, and `hypothesis-generation` depends on it.

## References

- `references/feature-flags.md` — flag platform setup, gotchas, variant-assignment retrieval
- `references/event-tracking.md` — event tracking and the ticketing workflow
- `references/power-analysis.md` — power analysis tools and Python/R patterns
- `references/past-experiments.md` — *local only, gitignored.* Your own inventory of past
  experiment readouts. Does not ship with the plugin; create it from the template in
  `references/past-experiments.example.md`.
