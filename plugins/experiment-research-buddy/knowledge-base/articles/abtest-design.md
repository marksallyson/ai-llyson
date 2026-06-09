---
title: abtest.design
type: article
tags: [ui-patterns, conversion-optimization, pattern-library, mobile, saas, onboarding, paywalls, monetization]
source_url: https://abtest.design/
added: 2026-06-09
---

# abtest.design

## At a Glance
A curated collection of 50 A/B test case studies from consumer mobile apps and SaaS products (Duolingo, Uber, Pinterest, GitHub, Headspace, etc.), focused on onboarding, paywalls, and conversion optimization. Useful as a narrow hypothesis-generation resource — with significant credibility caveats.

## Credibility Assessment

**Corpus size:** 50 tests total — much smaller than GoodUI (650+).

**What's missing (everything statistical):**
- No sample sizes
- No p-values or confidence intervals
- No test durations
- No links to original sources — claims cannot be independently verified
- Unknown methodology — no way to know if these were properly randomized experiments, sequential before/after comparisons, or something else entirely

**The effect size problem:** Many reported lifts are extremely large:
- +190% conversion (TIPSTOP)
- +143% trial signup (Opal)
- +104% trial starts (Going)
- 5x conversion rate (Outseta)
- 20x referral growth (SoFi)

Effects of this magnitude in real, properly powered A/B tests are rare. These are almost certainly a mix of: small N with high variance, novelty effects, confounded changes (multiple variables changed at once), or cherry-picked success stories. When you see +104%, the right reaction is skepticism, not inspiration.

**Wins-only bias:** Unlike GoodUI which includes REJECTED experiments, abtest.design appears to show only positive outcomes. This is a significant red flag — a resource without losing experiments is teaching you survivorship bias, not A/B testing.

**Verdict:** Lower statistical credibility than GoodUI. Treat every entry as an unverified anecdote, not a tested pattern.

## Why It's Still Worth a Skim

The company roster is relevant: Duolingo, Pinterest, Uber, GitHub, Headspace, and TikTok are all companies with mature experimentation cultures. When their entries align with what those companies have published elsewhere, the signal is stronger.

Specifically credible entries (corroborated by company-published research):
- **Duolingo — Streak mechanics (+40% users maintaining streaks):** Corroborated by Duolingo's own published work on habit formation and streak design. This one is believable.
- **Pinterest — Pre-signup exploration (+20% signups):** Aligns with Pinterest's published work on reducing friction in the signup funnel.
- **TikTok — Deferred account completion (+25% creator enrollment):** Consistent with the industry-wide pattern of "let users experience value before asking for commitment."

These three are worth reading. The others should be treated as unverified.

## Compared to GoodUI

| | abtest.design | GoodUI |
|---|---|---|
| Total tests | 50 | 650+ |
| Source links | None | None |
| Statistical rigor | None | None |
| Losing experiments | Not shown | Shown (REJECTED) |
| Effect size plausibility | Many suspiciously large | More varied, more plausible |
| Focus | Mobile apps, SaaS, paywalls | Broad UI/UX, checkout, e-commerce |
| Verdict | Lower credibility | Slightly higher credibility |

If you're going to use one, use GoodUI. If you specifically need mobile/SaaS paywall and onboarding patterns, abtest.design has more of those.

## Takeaways for Practice
1. **Do not cite effect sizes from this site in any analysis or proposal.** +190% conversion will be immediately questioned and will undermine your credibility.
2. **Use it only for generating hypotheses in mobile/SaaS onboarding and paywall contexts** — surfaces that are somewhat adjacent to Ibotta's offer and loyalty mechanics.
3. **The three credible entries (Duolingo streaks, Pinterest pre-signup, TikTok deferred signup) are worth knowing.** These patterns have independent corroboration.
4. **The wins-only framing is a trap.** Every test shown "worked." Real experimentation has a roughly 10-30% win rate. If you design experiments expecting these effect sizes, you will be consistently disappointed and may wrongly conclude your instrumentation is broken.
5. **Cross-reference anything interesting against the company's actual engineering blog** before acting on it. If Duolingo published something about streak mechanics, read that — not a three-line summary on abtest.design.

## Action Items / Things to Read
- Browse the Duolingo, Pinterest, and GitHub entries — most credible given those companies' publishing track records
- For paywall and onboarding patterns specifically: abtest.design is a reasonable starting point, then go to the actual company engineering blogs for substance
- Compare to GoodUI (knowledge-base/articles/goodui.md) — GoodUI's larger corpus and inclusion of REJECTED experiments makes it more useful as a reference

## Tags
ui-patterns, conversion-optimization, pattern-library, mobile, saas, onboarding, paywalls, monetization
