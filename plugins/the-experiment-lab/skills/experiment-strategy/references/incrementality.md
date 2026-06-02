# Incrementality Measurement

## The core question

Incrementality asks: **would this behavior have occurred without the intervention?**

An offer drives incremental purchase if the user would NOT have bought without the offer.
If the user would have bought anyway, the offer is a pure subsidy — negative ROI.

This is the central measurement challenge for performance marketing, promotions, and
offer-based products.

## Frameworks

### 1. Holdout-based iROAS (incremental Return on Ad Spend)

The cleanest approach when you can randomize.

```
iROAS = (Revenue_treatment - Revenue_control) / Spend_treatment
```

- Treatment: users who receive the offer / see the ad
- Control: users who would have received the offer but are held out (receive nothing or a generic experience)
- Spend: total offer cost (face value of cashback, ad spend, etc.)

**Requirement**: the holdout must be a true random holdout, not a convenience group.
Self-selection into offers (users who click) is not a valid control group — selection bias.

### 2. Geo holdout

For offer campaigns that can't be withheld at the user level (e.g., mass promotions
tied to retailer events):
- Hold out a set of geographic markets from the promotion
- Compare purchase behavior in treated vs. holdout markets
- Requires: markets are exchangeable; no spillover between markets

### 3. Ghost ads / counterfactual logging

Log what the control experience would have shown, even though it's not displayed:
- If the algorithm would have shown Offer A to a control user, log that
- Compare outcomes for users where the same offer was shown (treatment) vs. would have been shown (control)
- More statistically efficient than user-level holdout; requires platform support

### 4. Propensity score matching (observational)

When randomization is impossible:
- Match treated users to untreated users with similar pre-treatment behavior
- Compare outcomes within matched pairs
- **Weakness**: only controls for observed confounders; unobserved confounders bias estimates
- Use as a last resort; report sensitivity analysis (e.g., Rosenbaum bounds)

## Baseline purchase rate estimation

The key input to incrementality is the counterfactual purchase rate — what would the
user have done without the offer?

Methods:
1. **Holdout group**: direct observation (cleanest)
2. **Historical baseline**: same users, prior comparable period — risks time confounds
3. **Matched control**: similar unexposed users — risks selection bias
4. **Model-predicted counterfactual**: ML model predicts probability of purchase
   for each user; compare to actual rate in treatment — flexible but model-dependent

## Distinguishing incrementality from cannibalization

**Purchase cannibalization**: the offer induces a purchase that would have happened later
(forward pull) — appears incremental in the short run, is not truly incremental

**Category cannibalization**: the offer drives a brand switch or product switch that
nets out at the category level — brand gains, but the retailer or category doesn't

**Cross-offer cannibalization**: user redeems Offer A instead of Offer B they would
have redeemed anyway — shifts which offer is credited, not the underlying behavior

To detect:
- Measure basket composition in treatment vs. control (is the category growing or just
  shifting brands?)
- Measure post-experiment behavior — do treatment users purchase MORE in subsequent
  weeks, or less (forward pull evidence)?

## Diminishing incrementality

As offer frequency increases, the marginal user being reached becomes more likely to
have purchased anyway (lower incrementality). Measure:

```
Marginal iROAS by reach decile:
- Decile 1 (highest propensity): lowest incrementality, highest basline rate
- Decile 10 (lowest propensity): highest incrementality, lowest baseline rate
```

Optimize offer targeting toward lower-propensity users for higher marginal iROAS.
This is the core of causal forest / heterogeneous treatment effect targeting.

## Reporting incrementality to stakeholders

Frame it concretely:
- "X% of redemptions were incremental — the remaining Y% would have purchased at
  baseline rates without the offer"
- "The incremental cost per acquired purchase was $Z vs. total cost per redemption of $W"
- "Incremental ROAS was X:1 vs. reported ROAS of Y:1"

Don't just report ROAS — it's almost always higher than iROAS and misleads on true ROI.

## Academic references

- Rubin (1974). "Estimating causal effects of treatments in randomized and nonrandomized studies"
- Gordon et al. (2019). "Comparison of Approaches to Advertising Measurement" — Facebook/Stanford
- Taddy et al. (2016). "A Nonparametric Bayesian Analysis of Heterogeneous Treatment Effects
  in Digital Experimentation" — causal forest precursor
- Wager & Athey (2018). "Estimation and Inference of Heterogeneous Treatment Effects using
  Random Forests" — causal forests for targeting
