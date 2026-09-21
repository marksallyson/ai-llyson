# Visual Grammar

One canonical picture per concept. **Look it up; do not improvise.** The same concept must
render the same way every time — consistency is what makes a visual metaphor stick, and a
new clever picture each session undoes the last one.

---

## Design principles for new entries

When a concept has no entry, design one against these rules, then write it in here.

1. **One idea per picture.** If you need two ideas, draw two pictures.
2. **Every symbol is a label on the drawing.** A Greek letter must annotate a visible
   element — a bracket, a shaded region, a distance, a slope. If a symbol can't be pointed
   at, the picture is wrong.
3. **Prefer distance and area over height.** Spread, overlap, and shaded area are read
   intuitively. Comparing bar heights is arithmetic in disguise.
4. **Show the counterfactual in frame.** Most stats concepts are "compared to what?"
   questions. Draw the "what" — the null, the tight version, the unadjusted version —
   in the same picture, greyed back.
5. **Repetition beats abstraction.** For anything about long-run behavior (CIs, false
   positives, power), draw 20–100 repeated instances rather than one instance plus a
   probability statement. Seeing 5 of 100 intervals miss is worth more than "95%".
6. **Name the misconception the picture kills.** If a picture doesn't correct a specific
   wrong intuition, it's decoration.

---

## Entries

### mean · μ, x̄

- **Picture:** Horizontal dot strip of ~20 observations. A small solid triangle sits
  beneath the axis at the balance point, like a fulcrum under a seesaw.
- **Annotate:** triangle → `μ`. Draw one long deviation arrow from an outlier to the
  fulcrum and one short one from a near point, to show they trade off.
- **Kills:** "the mean is the middle." It's the balance point, which is why one whale
  drags it. Median is the middle.
- **Ibotta example:** offers viewed per session, one power user at 60.
- **Builds toward:** variance, sensitivity to outliers / winsorization.

### variance & standard deviation · σ, σ²

- **Picture:** Two dot strips stacked vertically, same mean, same axis. Top = tight
  (σ≈2), bottom = wide (σ≈8). A horizontal bracket spans mean ± 1σ on each.
- **Annotate:** bracket width → `σ`. For σ², draw a literal square on 2–3 deviations,
  side length = the deviation. Variance is the average of those square areas.
- **Kills:** "σ² is just σ with a 2 on it." The squares are why one far point costs so
  much more than two near ones — area grows faster than distance.
- **Ibotta example:** redemption rate across two retailers, same average, different
  consistency.
- **Builds toward:** standard error, winsorization, heavy-tailed monetization metrics.

### standard error · SE

- **Picture:** Three panels left→right.
  1. Population: wide cloud of individual users.
  2. One sample: ~30 of them highlighted, their mean marked with a tick.
  3. Many sample means: a tight dot cloud of ~200 ticks from repeating step 2.
  A bracket spans the spread of **panel 3 only**.
- **Annotate:** panel 1 spread → `σ`. Panel 3 spread → `SE`. Label the gap between them
  `÷√n`. Keep panel 3 visibly ~5× narrower than panel 1 for n=30.
- **Kills:** the single most common confusion — σ vs SE. σ describes *people*. SE
  describes *estimates of an average*. They are spreads of two different things, which
  is why SE shrinks with more data and σ does not.
- **Ibotta example:** per-user redemption; σ is user-to-user variety, SE is how much a
  30-user average would wobble if you re-drew it.
- **Builds toward:** confidence intervals, sampling distribution, power.

### sampling distribution & CLT

- **Picture:** Four histograms stacked vertically, shared x-axis, labeled n=2, n=5,
  n=30, n=100. Each is the distribution of sample means. Behind all four, a greyed
  outline of the (skewed) source distribution.
- **Annotate:** each panel's width bracket, with values showing the halving pattern.
  Arrow down the left edge labeled "n increases".
- **Kills:** two at once — (a) "my data has to be normal", and (b) "more data makes
  data tighter". Neither. The *source stays skewed*; it's the distribution of *averages*
  that goes normal and narrow.
- **Ibotta example:** revenue per user, heavily right-skewed, but the average of 10,000
  is near-perfectly normal.
- **Builds toward:** why t-tests work on skewed metrics; delta method.

### p-value

- **Picture:** Single null distribution curve, centered at zero ("no effect"). A solid
  vertical line at the observed statistic, well out in the right tail. The area from that
  line outward is shaded. For two-sided, mirror it and shade both tails.
- **Annotate:** shaded area → `p`. The curve → "what I'd see if the feature did nothing."
  The line → "what I actually saw."
- **Kills:** "p is the probability the result is due to chance" and "p is the probability
  the null is true." The picture makes it unmistakable: p is an *area under the null
  curve* — it assumes the null and asks how surprising the data is. It says nothing
  about the probability of any hypothesis.
- **Ibotta example:** +1.8pp unlock rate against a null curve of width SE=0.6pp.
- **Builds toward:** α, power, peeking, multiple comparisons.

### confidence interval · 95% CI

- **Picture:** Caterpillar plot. 100 short horizontal intervals stacked vertically, each
  from a different simulated sample. One vertical line marks the **true** value. The ~5
  intervals that don't cross it are drawn in the danger color; the other 95 are neutral.
- **Annotate:** the vertical line → "the truth (unknown in real life)". One interval →
  "this is the one you actually got — you can't tell which kind it is."
- **Kills:** "there's a 95% chance the true value is in my interval." The truth is a
  fixed line. It's the *intervals* that are random. 95% is a property of the procedure
  over many runs, not a statement about your one interval. This is the single most
  valuable picture in the grammar — it's the one that makes CIs finally make sense.
- **Ibotta example:** 100 hypothetical reruns of the same A/B test.
- **Builds toward:** why you can't peek; frequentist vs Bayesian framing.

### α, β, and power · the four-Greek-letter picture

- **Picture:** Two overlapping bell curves on one axis. Left = null (no effect),
  right = alternative (the real effect you're hoping for). A vertical critical-value line
  where the test's threshold sits. Shade three regions in three distinguishable colors:
  - null curve, right of the line → `α`
  - alt curve, **left** of the line → `β`
  - alt curve, right of the line → `power = 1 − β`
- **Annotate:** all four labels directly on their regions. Label the distance between
  the two peaks "true effect size".
- **Kills:** the sense that α, β, and power are three unrelated definitions to memorize.
  They're three regions of one picture. And it shows the tradeoff physically: slide the
  critical line left and α grows while β shrinks. You cannot reduce both without moving
  the curves apart (bigger effect) or making them narrower (more data).
- **Ibotta example:** 80% power at α=0.05 to detect a 2% lift.
- **Note:** this is the highest-leverage picture in the whole grammar. Four symbols, one
  drawing. Reach for it any time power comes up.
- **Builds toward:** MDE, sample size, sequential testing.

### minimum detectable effect · MDE

- **Picture:** The α/β/power picture, shown three times side by side, with the
  alternative curve at three separations: too close (power 35%), just right (power 80%),
  far (power 99%). Power value labeled under each.
- **Annotate:** the peak-to-peak distance in the middle panel → `MDE`.
- **Kills:** "MDE is the effect we expect." No — it's the smallest effect your design can
  reliably *see*. A real effect smaller than the MDE will probably be missed, and a
  test that comes back flat is not evidence of no effect if the MDE was 8%.
- **Interactive:** strong slider candidate — drag the alt curve, watch power update live.
- **Builds toward:** sample size, "the test was flat, now what".

### sample size · n

- **Picture:** Power curve. n on the x-axis (log scale), power on y from 0 to 1. Curve
  rises steeply then flattens hard. A horizontal dashed line at 0.80, with a drop-line
  down to the required n on the axis.
- **Annotate:** the flat right portion → "diminishing returns". Mark two points showing
  that halving the MDE quadruples n.
- **Kills:** the assumption that precision scales with sample size. It scales with √n —
  so 2× the precision costs 4× the users, which is exactly why small effects need
  brutal sample sizes.
- **Ibotta example:** weeks of runtime rather than raw n on the axis — that's the unit
  her PMs actually argue about.
- **Builds toward:** the "can we stop early" conversation.

### effect size · Cohen's d

- **Picture:** Two distribution curves with their overlap region shaded. Shown at
  d=0.2, 0.5, 0.8 in three stacked panels. Overlap percentage labeled on each.
- **Annotate:** peak separation measured in σ-widths, with a σ ruler drawn on the axis.
- **Kills:** treating raw differences as big or small without reference to spread. A
  0.5pp lift is enormous or invisible depending entirely on σ.

### CUPED / variance reduction · θ, ρ

- **Picture:** Two-panel. Left: scatter of pre-period metric (x) against experiment-period
  metric (y), with the fitted line through it. Right: two vertical dot strips side by
  side — raw outcome spread vs. residual spread after removing the line's prediction.
  The residual strip is visibly and dramatically tighter.
- **Annotate:** fitted line slope → `θ`. Scatter tightness → `ρ`. Bracket both strips
  on the right and label the shrinkage "variance removed".
- **Kills:** "CUPED changes the effect estimate." It doesn't touch the estimate — it
  removes pre-existing, pre-experiment user differences from the *noise*. The signal is
  unchanged; the ruler got finer. And the picture shows why the gain depends entirely on
  ρ: no correlation in the left panel, no shrinkage in the right.
- **Ibotta example:** pre-period redemptions predicting experiment-period redemptions.
- **Builds toward:** CUPAC, covariate choice, why heavy users hurt precision.

### multiple comparisons & false discovery

- **Picture:** 20 confidence intervals stacked vertically against a vertical zero line.
  All 20 are drawn from a world where **nothing is real**. One or two happen to clear
  zero and are drawn in the danger color.
- **Annotate:** the false positive → "this is the one that gets put in the deck."
  Header: "20 metrics, zero real effects."
- **Kills:** the instinct to scan a readout for whatever came back significant. At
  α=0.05, one in twenty flags by luck. The picture makes the cherry-picking visible.
- **Ibotta example:** a readout with 20 secondary metrics.
- **Builds toward:** Bonferroni, FDR, pre-registering the primary metric.

### peeking & sequential testing

- **Picture:** Line trace of the cumulative p-value over the days of an experiment,
  from a test where the true effect is **zero**. The trace wanders, dipping below the
  0.05 horizontal line two or three times before drifting back up. Each dip is marked
  with a dot and a small "ship it?" flag.
- **Annotate:** the 0.05 line. Shade the sub-0.05 dips.
- **Kills:** "if it's significant now, it's significant." Under a true null, a wandering
  p-value will cross 0.05 eventually if you keep looking. Each peek is another lottery
  ticket, which is why the stopping rule has to be fixed in advance.
- **Ibotta example:** the standard "we're two weeks in and it looks good" ask.
- **Builds toward:** alpha spending, always-valid inference, the Monday launch rule.

### sample ratio mismatch · SRM

- **Picture:** Two horizontal stacked bars. Top = expected 50/50 split. Bottom = observed
  split (e.g. 50.4/49.6). Directly beneath, a null χ² distribution with the observed
  statistic as a vertical line far out in the tail.
- **Annotate:** the bar difference labeled "looks like nothing". The tail line labeled
  "is definitely something".
- **Kills:** eyeballing the split. At millions of users, a 0.4pp imbalance is visually
  invisible and statistically catastrophic — it means assignment is broken and the whole
  readout is suspect. The two-part picture is the point: tiny to the eye, extreme to the test.
- **Builds toward:** why an SRM check gates analysis rather than being a footnote.

### regression coefficient · β₁

- **Picture:** Scatter with fitted line. A right triangle sits on the line: horizontal
  leg exactly 1 x-unit, vertical leg the resulting rise.
- **Annotate:** vertical leg → `β₁`. Horizontal leg → "1 unit of x". Intercept where
  the line meets x=0 → `β₀`.
- **Kills:** coefficients as abstract table output. β₁ is a physical rise over a run
  of one, and you can see it on the line.
- **Builds toward:** controls, multicollinearity, partial effects.

### log transform & skew

- **Picture:** The same revenue-per-user distribution twice, stacked. Top: linear x-axis,
  a long right tail running off the panel. Bottom: log x-axis, roughly symmetric. Tick
  labels kept in dollars on both so the axis change is visible.
- **Annotate:** mark the same three users on both panels with connecting lines, showing
  where each one moved.
- **Kills:** "log makes the data normal." The data didn't change — the ruler did. And
  the connecting lines show the cost: differences become *ratios*, so the thing you're
  now testing is a percentage change, not a dollar change.

### prior → posterior · Bayesian updating

- **Picture:** Three curves on one axis, stacked or overlaid with distinct treatment:
  prior (dashed), likelihood from the data (light), posterior (solid). The posterior
  sits between the other two, nearer whichever is tighter.
- **Annotate:** arrow from prior to posterior labeled "the data pulled it here".
- **Kills:** "the prior biases the answer." Show the same picture with a weak prior and
  a strong prior — with real data volume, the posterior lands in nearly the same place.
  The prior matters when data is thin, which is the situation it's *for*.
- **Interactive:** good slider candidate — prior strength and sample size.
- **Builds toward:** credible vs confidence intervals.

### ratio metrics & the delta method

- **Picture:** Two panels. Left: the naive approach — a dot strip of per-user ratios,
  with a few users at ratio = 5.0 from a single denominator event, dragging everything.
  Right: the correct approach — the ratio of two totals, with error bars derived from
  the joint variability of numerator and denominator.
- **Annotate:** the outliers on the left → "one impression, one click, ratio = 1.0".
- **Kills:** averaging per-user ratios. The randomization unit (user) and the metric
  unit (impression) differ, so the naive average is both biased and wildly noisy.
- **Ibotta example:** click-through rate where the denominator is impressions but
  assignment is by user.

---

## Concepts with no entry yet

When you build one of these, write the entry.

- interaction effects
- Simpson's paradox
- instrumental variables
- difference-in-differences
- synthetic control
- propensity weighting / entropy balancing
- survivorship & selection bias
- Winner's curse / regression to the mean in experiment portfolios

---

## Revision log

Record what failed. If a picture didn't land for Allyson, note it here with the reason —
a form that failed once will fail again unless the entry changes.

| Date | Concept | What didn't work | Change made |
|---|---|---|---|
| — | — | — | — |
