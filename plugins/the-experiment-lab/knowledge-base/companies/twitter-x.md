---
title: Twitter/X
type: company
tags: [platform, mobile, organizational-maturity, metric-design, network-effects]
source_url: https://blog.twitter.com/engineering/en_us/topics/insights
added: 2026-06-04
---

# Twitter/X

## At a Glance
Twitter built the Duck Duck Goose (DDG) A/B testing platform and published one of the first detailed technical overviews of mobile A/B infrastructure at scale (2015). Their experimentation program was notable for its mobile-first design and for grappling with network effects on social content distribution.

## Why They Matter
Twitter's 2015 technical overview is valuable primarily as a historical reference — it documents the decisions and tradeoffs in building a large-scale mobile A/B platform at a time when that was genuinely novel. For Ibotta (a mobile-first app), the mobile-specific considerations (push notification experiments, app version stratification, client-side vs. server-side assignment) are directly relevant. Twitter's network effects challenges (treatment affects content seen by control users through retweet graph) are also a useful reference for social/viral features.

## Key Contributions
- **Duck Duck Goose (DDG) platform**: Twitter's internal A/B testing infrastructure; handles server-side and client-side experiments across web, iOS, and Android
- **"Experimentation Infrastructure at Twitter"** (2015): technical blog post documenting the DDG architecture; one of the first detailed mobile A/B infra write-ups at scale
- **Mobile A/B testing infrastructure**: handling of app version stratification, client-side assignment, and offline experiment state
- **Network effects in social content experiments**: documented how showing a tweet to treatment users caused it to be retweeted to control users, biasing results
- **Notification and engagement experimentation**: mobile push notification testing at large scale across diverse user segments

## Takeaways for Practice
1. **For mobile A/B tests on Ibotta, stratify by app version.** Users on different app versions may have different base rates for any metric. If treatment users are disproportionately on the latest version (which is common if you use feature flags tied to app releases), you have confounding.
2. **Client-side assignment (feature flag evaluated on device) vs. server-side assignment (evaluated on API call) have different failure modes.** Client-side risks assignment drift if the user updates the app mid-experiment. Server-side requires network connectivity. Ibotta should document which pattern is used and what happens during offline sessions.
3. **Push notification experiments should be run with a holdout that never receives the notification type, not just variant A vs. variant B.** This lets you measure the counterfactual: what would this user's behavior look like without any push on this topic?
4. **Twitter's DDG paper (2015) is worth reading as a historical reference** to understand what problems were being solved when mobile A/B at scale was new — many of those problems are now solved by platforms like Statsig, Eppo, or Growth Book.
5. **Network effects in content recommendation make user-level randomization insufficient.** If Ibotta surfaces offers in a social or discovery feed where popularity signals influence ranking, test ranking changes with careful holdout design, not naive A/B.

## Action Items / Things to Read
- "Experimenting at Twitter (2015)" — Twitter Engineering Blog; search "Duck Duck Goose Twitter A/B"
- Twitter Engineering Blog: blog.twitter.com/engineering — search "experimentation"
- "How Twitter Handles 3,000 A/B Tests a Year" — conference talk summary (search KDD/RecSys proceedings)

## Tags
platform, mobile, organizational-maturity, metric-design, network-effects, mobile-ab, client-side-assignment, notifications
