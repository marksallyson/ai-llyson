---
title: GoodUI
type: article
tags: [ui-patterns, conversion-optimization, pattern-library, ux, checkout, forms, product-design]
source_url: https://goodui.org/
added: 2026-06-09
---

# GoodUI

## At a Glance
GoodUI is a curated database of 650+ A/B test patterns and "leaked" experiments from major companies (Amazon, Netflix, Airbnb, Booking.com, Etsy, Google, Walmart). Useful as a UI pattern library and inspiration source — not as a statistical reference.

## Credibility Assessment

**What it is:** A crowdsourced observation platform. Contributors submit screenshots and inferences about what companies appear to be testing. Results are classified as "IMPLEMENTED" (company shipped the variant) or "REJECTED" (company did not ship it).

**What's missing:**
- No sample sizes
- No p-values or confidence intervals
- No test durations
- No replication counts
- "Leaked" experiments are inferred from screenshots — not verified by the companies
- Actual effect size data is paywalled

**Bottom line:** IMPLEMENTED ≠ statistically significant. Companies ship features for many reasons beyond clean A/B wins (roadmap pressure, qualitative research, business requirements). The corpus is large and the pattern coverage is broad, but treat every entry as an *observation* not a *proof*.

## Why It's Still Worth Having

Despite the statistical limitations, GoodUI is useful for two specific things:

1. **Pattern awareness:** If you're designing a new UI feature and want to know what's been tried across the industry (checkout flows, notification design, form layouts, pricing display), GoodUI gives you a fast survey of the design space.

2. **Hypothesis generation:** The "75 foundational ideas" section distills recurring patterns into testable hypotheses. Good fodder for generating experiment ideas before talking to product partners.

It is **not** a substitute for reading the actual methodology from the companies listed (Booking.com, Netflix, Airbnb all have engineering blogs with proper statistical writeups).

## Key Contributions
- **653+ documented experiments** across major consumer companies (as of June 2026)
- **GoodUI Leaks** (goodui.org/leaks): ~112 real company experiments with IMPLEMENTED/REJECTED classification — Etsy, Walmart, Airbnb, Amazon, Booking.com, Netflix, Google, Zalando, Bol represented
- **75 UX pattern ideas** categorized by screen type (checkout, product, signup) and element type (forms, buttons, pricing, CTAs)
- **Company breakdown** by screen type and metric (sales, signups, leads) — useful for filtering to relevant contexts

## Takeaways for Practice
1. **Use GoodUI for hypothesis generation, not hypothesis validation.** If you're about to propose an offer card redesign to a PM, GoodUI can show you what Booking.com and Amazon have tried on similar surfaces — but don't cite it as evidence that something works.
2. **The checkout and pricing sections are most relevant to Ibotta.** Offer display, pricing anchoring, and call-to-action copy patterns map reasonably well to offer surfaces.
3. **Cross-reference GoodUI patterns with proper sources before running.** If GoodUI shows "simpler layouts win," check whether Netflix or Booking.com has a blog post with the actual stats. Run the test yourself rather than assuming the pattern holds.
4. **The REJECTED category is underrated.** Most pattern libraries only show winners. GoodUI's REJECTED entries are a useful reminder that intuitive-seeming changes often don't move the needle.
5. **Don't cite GoodUI in a readout.** It has no statistical credibility that would hold up to scrutiny from a data-savvy PM or fellow DS. Use it privately for idea generation, then run your own test.

## Action Items / Things to Read
- Browse goodui.org/leaks — filter to Booking.com and Airbnb entries specifically; these companies have the most rigorous experimentation cultures, so IMPLEMENTED from them is a slightly stronger signal
- Cross-reference any interesting GoodUI pattern against the actual company's engineering blog before acting on it
- The "75 ideas" section: skim once, bookmark patterns relevant to offer surfaces and notification design

## Tags
ui-patterns, conversion-optimization, pattern-library, ux, checkout, forms, product-design
