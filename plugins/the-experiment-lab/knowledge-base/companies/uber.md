---
title: Uber
type: company
tags: [causal-inference, interference, marketplace, quasi-experimental, staged-rollout, sutva, switchback, synthetic-control, two-sided-markets]
source_url: https://www.uber.com/en-US/blog/engineering/
added: 2026-06-04
---

# Uber

## At a Glance
Uber's experimentation challenges are defined by their marketplace structure: rider and driver supply are coupled, meaning a treatment that affects one side of the market always affects the other. They developed switchback testing, synthetic control methods, and staged rollout frameworks to handle this.

## Why They Matter
Uber is the leading public reference for marketplace interference methods — specifically, what to do when you cannot randomize at the user level because the two sides of your market interact with each other. Ibotta's brand-consumer-retailer structure creates analogous interference: an offer value change for consumer A affects retailer margin and brand budget, which affects what offers are available to consumer B. Understanding Uber's framework helps you design valid experiments when naive user-level A/B tests would be compromised.

## Key Contributions
- **Switchback testing (time-based randomization)**: alternate treatment and control across time windows (e.g., hourly) in a given market; treats the "market" as the unit, not the user
- **Synthetic control for marketplace experiments**: when you can't randomize, construct a synthetic control market from the weighted combination of unaffected markets
- **"Experimentation in a Ridesharing Marketplace"** (Chamandy et al., 2016): KDD paper documenting interference and their solutions
- **Staged rollouts and holdout cells**: Uber's framework for gradually increasing treatment exposure while maintaining a control arm for causal inference
- **Surge pricing experiments**: canonical example of why user-level randomization fails — if you show different surge prices to different users in the same market, supply allocation changes for everyone
- **CUPED + switchback combination**: applied variance reduction within time-period switchback designs

## Takeaways for Practice
1. **Use switchback testing for any Ibotta experiment where the offer or algorithm change affects the supply side (brand budget, retailer inventory).** If showing offer A to user group A depletes a brand's campaign budget faster, user group B's offer availability is affected — user-level randomization is invalid.
2. **Staged rollouts are good operational practice but are not controlled experiments** unless you've pre-specified a holdout. Uber's framework for maintaining a holdout during a staged rollout should be Ibotta's template for any major feature launch.
3. **Synthetic control is the right method for "we can't run an RCT" situations** — e.g., when a brand wants to test a new offer structure on a single retailer partner. Construct a synthetic control retailer from comparable partners.
4. **Switchback experiments require careful period-length selection.** Too short = carryover effects between periods. Too long = fewer periods = less power. Uber's guidance: period length should be longer than the typical user session but shorter than a meaningful behavior change window.
5. **Document SUTVA assumptions explicitly in every marketplace experiment design doc.** State whether you believe treatment of user A affects user B's outcome, and if so, what your strategy is.

## Action Items / Things to Read
- Chamandy et al. (2016) "Experimentation in a Ridesharing Marketplace" — KDD 2016; the foundational switchback paper
- Uber Engineering Blog: eng.uber.com — search "experimentation" and "causal"
- "Under the Hood of Uber's Experimentation Platform" — Uber Engineering Blog
- Bojinov et al. (2020) "Causal Inference from Observational Data in Online Platforms" — relevant for Uber and Ibotta settings

## Tags
causal-inference, interference, marketplace, quasi-experimental, staged-rollout, sutva, switchback, synthetic-control, two-sided-markets
