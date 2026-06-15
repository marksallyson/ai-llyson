# The Experiment Lab

A Claude Code plugin for experiment design, statistical methods, and A/B testing knowledge — built for Decision Scientists at Ibotta.

## Skills

| Skill | How to trigger |
|-------|---------------|
| **experiment-design** | "How should I design this test?" or "Can I even run an A/B test for this?" |
| **experiment-strategy** | "What metric should I use?" or "Should we ship this?" |
| **statistical-methods** | "How do I power this?" or "Can I peek at results?" or "CUPED/SRM/multiple comparisons" |
| **ibotta-ab-process** | "How do we set up LaunchDarkly?" or "At Ibotta, how do we..." |
| **kb-curator** | "What do we have on X?" or "Add this paper to the KB" |
| **weekly-digest** | Runs automatically on a schedule |

## Knowledge Base

The `knowledge-base/` directory contains curated entries organized by type:

- `companies/` — one file per company (17 entries: Airbnb, Booking.com, DoorDash, Duolingo, Etsy, Google, LinkedIn, Lyft, Meta, Microsoft, Netflix, Pinterest, Shopify, Spotify, Statsig, Twitter/X, Uber)
- `individuals/` — one file per practitioner (10 entries: Ron Kohavi, Diane Tang, Ya Xu, Alex Deng, Aleksander Fabijan, Lukas Vermeer, Chetan Sharma, Evan Miller, Rommil Santiago, Martin Tingley)
- `papers/` — foundational academic papers (CUPED, overlapping experiments, peeking/mSPRT, SRM, Trustworthy OCE book)
- `articles/` — essential blog posts (How Not To Run an A/B Test, Surprising A/B Test Results, DoorDash 1000% capacity)
- `_INDEX.md` — master index of all entries with tags
- `_TEMPLATE.md` — template for new entries
- `GLOSSARY.md` — definitions of all key terms (SUTVA, OEC, SRM, MDE, CUPED, etc.)

## How to Add New KB Entries

1. Use the **kb-curator** skill: "Add this paper to the KB" or "Summarize this URL for the KB"
2. Or manually: copy `_TEMPLATE.md`, fill it out, save to the appropriate subdirectory
3. Update `_INDEX.md` to add the entry to the correct table and update the Tags section
4. Use existing tags from `_INDEX.md` where possible; add new tags only if genuinely needed

**Filename convention:** slugified title, lowercase, hyphens, `.md`

## GitHub Repo

https://github.com/marksallyson/ai-llyson (experiment-research-buddy plugin lives in `plugins/experiment-research-buddy/`)
