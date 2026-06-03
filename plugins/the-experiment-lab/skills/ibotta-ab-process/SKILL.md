---
name: ibotta-ab-process
description: >
  Use this skill for ANY question about how A/B testing works at Ibotta — the
  end-to-end experiment lifecycle, LaunchDarkly setup and gotchas, event tracking
  and Jira workflows, Ibotta power analysis tools (Looker calculator, ib_util,
  ds_util), data cleaning (spillover, fraud users, winsorization), CUPED, DSP
  analysis notebooks (dsp-analysis repo), action standards, and the Monday launch
  rule. Trigger on: "at Ibotta", "how do we", "our process", "LD",
  "LaunchDarkly", "ib_util", "ds_util", "dsp-analysis", "DSP", "event tracking",
  "Jira event", "event trigger", "get_ld_variants", "winsorize", "spillover
  users", or any internal Ibotta tooling reference. Also trigger when Allyson is
  planning, setting up, or evaluating any Ibotta experiment and needs to know the
  right way to do it here. Complements experiment-design (theory) and
  statistical-methods (stats) with Ibotta-specific operational knowledge.
metadata:
  version: "0.1.0"
---

# Ibotta A/B Testing Process

You are advising a Decision Scientist at Ibotta on the company's specific experimentation
process, tools, and conventions. Be precise about Ibotta specifics. When general stats
questions arise, defer to the `statistical-methods` and `experiment-design` skills for
theory — this skill covers the operational Ibotta layer on top.

---

## The Ibotta Experiment Lifecycle

**Design → Implementation → QA → Live Testing → Analysis → Decision/Rollout**

DSP (Decision Science & Product) must be looped in at the **Design stage**, not after
implementation. Late involvement is a common failure mode.

---

## Step 1: Design

Before anything is built:
- Define **1 OEC** (Overall Evaluation Criterion) — the primary metric that drives the
  ship/no-ship decision
- Define **1–2 guardrail metrics** — metrics that must not degrade in pursuit of the OEC
- Write an **action standard** (roll-out/roll-back threshold) before the test launches —
  avoids confirmation bias post-hoc
- Max **1–3 treatment variants**; only one winner gets shipped (no mixing variants)
- Run power analysis to determine sample size and test duration before launch

**When NOT to A/B test:**
- Rollout is happening regardless of results
- You're checking for bugs or regressions
- It's a code refactor or phased rollout with no user-facing change

---

## Step 2: Implementation & Event Tracking

Event tracking must exist on **all variants including control** before launch.

**Validate tracking:**
- Fields present in data lake with correct data types
- No unexpected nulls
- Consistency across iOS / Android / web
- Use event types: `click_action`, `view_page`, `offer_view`

**Jira hierarchy for tracking:**
```
Initiative
└── Platform Tracking Epic (iOS + Android separate)
    └── Event Issue
        └── Event Trigger Issue
```

DS creates tracking epics and event/trigger issues using:
1. The **Events notebook** (in dsp-analysis repo)
2. A **Google Sheet template** (clone for each test)

See `references/event-tracking-jira.md` for full setup details.

---

## Step 3: LaunchDarkly (LD) Setup

LD is the primary randomization tool at Ibotta.

**Critical rules:**
- Rule order in LD is **incremental** — order matters, get it right before launch
- **Never turn off the LD flag** between test end and analysis — you lose user segment
  data permanently
- **Never alter percentages mid-test** — causes spillover (users switching groups)
- LD reports in **local time**; event architecture uses **UTC** — always account for this
- QA the LD setup with another analytics team member before launch

**Key utility:** `get_ld_variants` from `ib_util` — retrieves which group each user
landed in for joining to event data.

See `references/launchdarkly.md` for full setup details.

---

## Step 4: QA Before Launch

- LD setup reviewed by a second analytics team member
- Event tracking validated in data lake (not just in LD)
- Action standard documented and agreed upon
- Test doc drafted with: test name, hypothesis, primary metric + expected lift, variants
  table (with LD names + visuals)

---

## Step 5: Launch

**Monday launch rule:** Tests launch on **Mondays** following a mobile app release.
This ensures clean weekly seasonality cycles and avoids mid-week contamination.

---

## Step 6: Live Monitoring

A few days after launch — **Event Validation Part 2:**
- Check daily event counts by platform and app version
- Look for unexpected drops, spikes, or platform imbalances
- Do NOT make ship/no-ship decisions from early data (no peeking)

---

## Step 7: Analysis

**Data cleaning (in order):**
1. Remove **spillover users** (users who appeared in multiple variants)
2. Remove **fraud users** and internal/beta testers
3. **Winsorize** outliers on continuous metrics (cap at 99th percentile)

**Variance reduction:**
- Run **CUPED** using pre-experiment data on the north star metric
- Reduces variance → increases power → shorter tests needed

**Statistical tests:**
- T-test for continuous/ratio metrics
- Chi-squared for proportions
- Adjust for multiple metrics: **Bonferroni** (divide alpha by # tests) or
  **Holm** (less conservative, stepwise)

**QA your analysis** with at least one other DSP member before sharing results.

**Key tools:**
- `ib_util` — Ibotta's internal Python utility library
- `ds_util` — DS-specific utilities
- `dsp-analysis` repo — standard analysis notebooks
- Looker power calculator — for sample size calculations

See `references/power-analysis-ibotta.md` for power analysis specifics.

---

## Step 8: Decision

Use the pre-defined action standard. The full analysis doc should include:
- Test name and hypothesis
- Primary metric + expected vs. actual lift
- Variants table (LD names + visuals)
- Analysis summary (with CUPED results)
- Decision (ship / no-ship / iterate)
- Learnings and next steps

Only one winner gets shipped. No mixing of variant behaviors.
