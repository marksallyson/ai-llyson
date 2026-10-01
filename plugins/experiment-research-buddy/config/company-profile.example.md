# Company Profile — Example / Template

> Copy this file to `config/company-profile.md` and fill it in. That file is
> gitignored, so your company's details never leave your machine.
>
> Fastest way to fill it in: run the **setup** skill — say "set up the experiment
> research buddy" and Claude will interview you and write the file for you.
>
> Every field is optional. Skills degrade gracefully: anything you leave as `TBD`
> is simply not asserted. Skills will never invent a tool name or a process rule
> that isn't in this file.

---

## Identity

- **Company name:** Acme Rewards
- **Short name used in answers:** Acme
- **Business model:** Two-sided marketplace — consumer mobile app plus brand/retailer
  advertisers who fund the offers
- **My role:** Decision Scientist
- **Team name:** DSP (Decision Science & Product)

Business-model options that change the advice you get. Pick the closest:
`consumer subscription` · `consumer transactional` · `two-sided marketplace` ·
`B2B SaaS` · `ad-supported media` · `ecommerce marketplace` · `gaming`

## Closest public analogues

Which companies in `knowledge-base/companies/` are the best precedent for us, and why.
Skills prefer these when choosing an example.

1. **Airbnb** — two-sided marketplace, SUTVA violations in pricing experiments
2. **DoorDash** — marketplace interference, switchback designs, experiment capacity
3. **Booking.com** — very high experiment volume on a consumer transactional surface

## Product surfaces we test

| Surface | What it is | Traffic (DAU or sessions/day) |
|---|---|---|
| Home screen | Main offer feed | TBD |
| Onboarding | First-run signup flow | TBD |
| Offer detail | Single-offer page | TBD |
| Search | Offer/retailer search | TBD |

## Metrics

- **Typical OEC:** Offer redemption rate
- **Standard guardrails:** 7-day retention, app crash rate, average order value
- **Known baseline rates:** TBD — fill in as you learn them; these make power
  analysis answers concrete instead of symbolic
- **Metric distribution notes:** Revenue per user is heavy-tailed; winsorize at p99

---

## Experimentation stack

- **Feature flag / randomization platform:** LaunchDarkly
  - Migration in progress? No
- **Experiment analysis platform:** None — bespoke notebooks
- **Data warehouse:** Databricks
- **BI tool:** Looker
- **Ticketing:** Jira
- **Docs:** Confluence
- **Internal libraries:** TBD — name any in-house utility packages here (e.g. a
  variant-fetching helper, a CUPED helper), and what each one does
- **Analysis repo:** TBD — the repo holding standard analysis notebooks

## Our process rules

Fill in only the ones that are real policy at your company. These are what the
`company-ab-process` skill will state as fact.

- **Launch day rule:** Launch Mondays, after the weekly mobile release
- **Minimum runtime:** 2 weeks (full weekly seasonality cycle)
- **Standard power / alpha:** 0.80 power, 0.05 alpha, two-tailed
- **Max variants:** 1–3 treatments; only one winner ships
- **Action standard required before launch?** Yes
- **Peer QA required?** Yes — flag setup and analysis both reviewed by a second
  team member
- **When DS must be involved:** Design stage, before anything is built
- **Multiple-comparison policy:** Bonferroni by default, Holm when >3 metrics
- **Data cleaning order:** remove spillover users → remove fraud/internal users →
  winsorize continuous metrics at p99
- **Variance reduction default:** CUPED on the primary metric using pre-period data

## Timezone and reporting gotchas

- **Flag platform reports in:** local time
- **Event warehouse runs in:** UTC
- **Other known traps:** TBD

---

## Private references

Paths to local, non-shareable material. These files are gitignored. Skills read them
only if they exist.

- **Past experiment inventory:** `skills/company-ab-process/references/past-experiments.md`
- **Other local notes:** `config/local/`

## Digest delivery

Used by the `weekly-digest` skill.

- **Deliver to:** your.name@example.com
- **Channels:** Slack DM, Gmail
- **Cadence:** Mondays, 8am America/Denver
- **Timezone:** America/Denver
