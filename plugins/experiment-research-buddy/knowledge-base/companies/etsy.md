---
title: Etsy
type: company
tags: [continuous-deployment, democratization, feature-flags, metric-design, mid-size-ecommerce, organizational-maturity, platform, two-sided-markets]
source_url: https://codeascraft.com/
added: 2026-06-04
---

# Etsy

## At a Glance
Etsy is one of the canonical case studies for building a strong experimentation culture at a mid-size e-commerce company — not a Google-scale company with hundreds of PhDs, but a real-world org that made experimentation central to its engineering culture. Their Code as Craft engineering blog documented this journey extensively.

## Why They Matter
Etsy is the most relevant "scale analog" for Ibotta in this KB. They're a two-sided marketplace (buyers + sellers) in e-commerce, they democratized experimentation to non-engineers, and they built a culture of data-driven decisions at a company size where that's genuinely hard. Their documented journey from ad-hoc analysis to systematic experimentation is a useful template for Ibotta's own maturity progression.

## Key Contributions
- **Feature flagging as experimentation infrastructure**: Etsy's Feature API decoupled code deployment from experiment launch; this made it easy for PMs to run experiments without engineering sprints
- **"Building a Useful A/B Test" series** — Code as Craft blog: practical posts on experiment design, metric selection, and analysis for mid-size e-commerce
- **Democratization to non-engineers**: Etsy built experiment tooling that product managers and marketers could use directly; documented the cultural change management required
- **Two-sided marketplace experiment design**: experiments that affect seller listings affect buyer experience; Etsy documented the interference patterns and their mitigation strategies
- **"Continuous deployment" culture**: Etsy shipped 50+ changes per day at their peak, which required robust experiment infrastructure to manage risk
- **Long-run seller behavior experiments**: measuring how offer structure changes affect seller pricing and listing quality over time — directly analogous to Ibotta's brand/retailer behavior measurement

## Takeaways for Practice
1. **Feature flags and experiment assignment should be the same system.** Etsy's Feature API pattern means that every feature rollout is an experiment by default. Ibotta should push toward this architecture so that feature launches always have a holdout, even if the primary goal isn't hypothesis testing.
2. **For two-sided marketplace experiments, the seller (brand/retailer) side effects lag the buyer (consumer) side.** Etsy documented that seller pricing behavior changed 4-6 weeks after a buyer-side change propagated. Ibotta should measure brand campaign adjustments as a lagged outcome in any consumer-facing offer experiment.
3. **Etsy's blog is the best reference for "how do you build this culture at a real company without infinite resources"** — more useful than Google or Microsoft for Ibotta's current stage.
4. **Continuous deployment requires experiment infrastructure that can roll back cleanly.** If Ibotta is moving toward faster deployment cycles, invest in the experiment infrastructure first so that every deployment has a measurable control.
5. **The non-technical democratization story at Etsy includes a lot of failure modes** — PM-run experiments with undefined success criteria, experiments that ran too short, experiments that measured the wrong thing. Etsy's blog posts are honest about these failures; read them as a checklist of what to prevent.

## Action Items / Things to Read
- Code as Craft Blog: codeascraft.com — search "A/B testing" and "feature flags"
- "Feature Flags and Continuous Deployment at Etsy" — Code as Craft
- "How Etsy Manages Secrets at Scale" — adjacent but useful context on infra philosophy
- "Democratizing Online Controlled Experiments at Booking.com" (Vermeer et al.) — read alongside Etsy posts for comparison at different scales

## Tags
continuous-deployment, democratization, feature-flags, metric-design, mid-size-ecommerce, organizational-maturity, platform, two-sided-markets
