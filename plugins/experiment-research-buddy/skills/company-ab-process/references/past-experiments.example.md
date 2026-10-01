# Past Experiment Inventory — Template

> Copy to `past-experiments.md` (gitignored) and fill in with your own company's
> experiment history. This file is the public template; your filled-in copy never
> gets committed.
>
> Why bother: `hypothesis-generation` reads this to avoid proposing a test you have
> already run, and `company-ab-process` reads it to get realistic baseline rates for
> power analysis. Both degrade to generic advice without it.

**Owner:** who maintains this list
**Source of truth:** link to the folder/space where readouts actually live

---

## How to use this file

- **Don't re-test the same thing.** Check this list before scoping a new experiment.
  Repeats are common and usually accidental.
- **Calibrate power analysis.** Historical effect sizes from similar tests are the best
  available prior for a realistic lift. Pull the matching readout and use its control
  rate as your baseline.
- **Learn the readout format.** Reviewing a few before your first readout tells you what
  reviewers expect.
- **Find the gaps.** Tally tests per surface. Heavily tested surfaces have diminishing
  returns; untested surfaces are where the cheap wins are.

---

## Inventory

| Date | Test name | Surface | Primary metric | Result | Shipped? | Readout |
|---|---|---|---|---|---|---|
| 2026-03 | Example onboarding step reorder | Onboarding | Signup completion rate | +2.1%, p=0.01 | Yes | link |
| 2026-01 | Example feed card redesign | Home screen | Click-through rate | Flat, underpowered | No | link |

---

## Coverage summary

Update as you add rows.

- **Heavily tested:** surface, surface
- **Lightly tested:** surface, surface
- **Never tested:** surface, surface
- **Known inconclusive / worth a rerun with more power:** test name, test name
