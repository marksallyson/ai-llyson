---
name: setup
description: >
  Use this skill to set up, configure, or re-configure the experiment-research-buddy
  plugin for a company. Interviews the user about their business model, product
  surfaces, metrics, experimentation stack, and process rules, then writes
  config/company-profile.md. Trigger on: "set up experiment research buddy",
  "configure this plugin", "set up my company profile", "the plugin doesn't know
  about my company", "first time using this", "how do I customize this",
  "update my company profile", "we switched from LaunchDarkly to X", "add a new
  surface", or when any other skill in this plugin reports that
  config/company-profile.md is missing or has TBD fields the user needs filled.
metadata:
  version: "0.1.0"
---

# Setup

Your job is to produce `${CLAUDE_PLUGIN_ROOT}/config/company-profile.md`, the private
file every other skill in this plugin reads to become company-aware.

## Rules

1. **Never invent a fact.** If the user doesn't know a value, write `TBD`. A `TBD` makes
   skills answer generically, which is correct. An invented tool name makes them answer
   confidently and wrongly.
2. **Never commit the profile.** It is gitignored by design. If the user asks you to
   commit it, say that it's the file that makes the plugin un-shareable and confirm first.
3. **Don't interrogate.** Run the interview in rounds, 3–5 questions a round, and offer a
   sensible default for every question so the user can say "defaults are fine" and stop.
4. **Finish in one pass.** Write the file at the end of the first round even if most of
   it is `TBD`. A thin profile beats an unwritten one, and the user can extend it later
   by invoking this skill again.

## Step 1 — Check what exists

Read `${CLAUDE_PLUGIN_ROOT}/config/company-profile.md`.

- **Missing** → this is first-time setup. Read
  `${CLAUDE_PLUGIN_ROOT}/config/company-profile.example.md` as your structure, then go to Step 2.
- **Exists** → this is an update. Show the user the current values for the section they
  want to change, change only that, and leave everything else alone. Skip to Step 4.

## Step 2 — Interview

### Round 1 — identity and shape (ask all five)

1. Company name, and the short form you want used in answers
2. Business model — offer these: consumer subscription · consumer transactional ·
   two-sided marketplace · B2B SaaS · ad-supported media · ecommerce marketplace · gaming
3. Your role and team name
4. The product surfaces you run experiments on — just names is fine
5. Your typical primary metric (OEC) and your usual guardrail metrics

Business model is the highest-value answer in the whole interview: it decides which
companies in the knowledge base are valid precedent. A two-sided marketplace benchmarked
against Netflix gets bad advice.

### Round 2 — the stack

6. Feature flag / randomization platform. **Ask whether a migration is in progress** —
   mid-migration is the single most common source of wrong operational advice.
7. Experiment analysis: a vendor platform, or bespoke notebooks?
8. Data warehouse and BI tool
9. Any internal libraries or an analysis repo worth naming, and what each does
10. Ticketing and docs tools

### Round 3 — process rules (say "defaults are fine" is a valid answer)

11. Launch day rule — fixed weekday, or ad hoc?
12. Minimum runtime, standard power and alpha
13. Max variants, and whether an action standard is required before launch
14. Peer QA requirements, and at what stage DS gets involved
15. Multiple-comparison policy, data cleaning order, CUPED by default?
16. Which timezone the flag platform reports in vs. which the warehouse runs in

### Round 4 — analogues and extras

17. Propose 2–4 companies from `${CLAUDE_PLUGIN_ROOT}/knowledge-base/companies/` as the
    closest public analogues, based on their business model, and explain each in one line.
    Let the user correct you. Do not ask them to pick blind from a list of 17.
18. Do they have an inventory of past experiment readouts? If yes, point the profile at
    `skills/company-ab-process/references/past-experiments.md` and offer to scaffold it
    from `past-experiments.example.md`. If no, say it's the cheapest maturity win
    available and that `hypothesis-generation` depends on it.
19. For the weekly digest: delivery address, channels, cadence, timezone. If they don't
    want the digest, write `disabled` and tell them to skip the scheduling step in SETUP.md.

## Step 3 — Confirm the analogues

Before writing, state which knowledge-base companies you selected and why, in one line
each. This is the part the user is most likely to want to override, and it has the largest
effect on answer quality.

## Step 4 — Write the file

Write `${CLAUDE_PLUGIN_ROOT}/config/company-profile.md` using the section structure of
`company-profile.example.md`. Keep every heading, even where the body is `TBD`, so later
updates have somewhere to land.

Start the file with:

```
> LOCAL ONLY. This file is gitignored and must never be committed.
```

## Step 5 — Verify and report

1. Confirm the file is ignored:
   `git check-ignore -v config/company-profile.md`
   If that command reports nothing, the file is **not** protected. Tell the user
   immediately and add `**/config/company-profile.md` to the repo's `.gitignore`.
2. Report back:
   - Which fields are filled and which are `TBD`
   - Which analogue companies were selected
   - Whether a past-experiment inventory exists, and what's degraded without it
   - One concrete next action: a real question to try, phrased for their stack

## Step 6 — Offer the routine

Ask if they want the weekly digest running on a schedule. If yes, walk them through
`SETUP.md` → "Set up the weekly routine". Don't set up a schedule unprompted.

## Related skills

- **company-ab-process** — the main consumer of this profile
- **kb-curator** — add company-specific knowledge base entries after setup
- **weekly-digest** — uses the delivery settings written here
