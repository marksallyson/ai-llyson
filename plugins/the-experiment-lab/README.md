# The Experiment Lab

A Claude Code plugin for experiment design, statistical methods, and A/B testing knowledge — built for Decision Scientists at Ibotta.

## Skills

### experiment-design
Design an experiment from scratch: choose the right test type, handle interference, pick a randomization unit, identify validity threats.

**Trigger examples:** "How should I design this test?", "Should I use a holdout?", "Can I even run an A/B test for this?", "How do I handle network effects?", "Two-sided marketplace interference"

### experiment-strategy
Choose the right metric (OEC), set guardrail metrics, interpret results, handle novelty effects, and make ship/no-ship decisions.

**Trigger examples:** "What metric should I use?", "Should we ship this?", "The test was significant but...", "Our metric moved but I'm not sure it's real", "Novelty effect", "Incrementality"

### statistical-methods
Power analysis, CUPED, sequential testing, SRM detection, ratio metrics, Bayesian vs. frequentist — the mechanics of how to analyze an experiment.

**Trigger examples:** "How do I power this?", "What sample size do I need?", "Can I peek at results?", "My p-value is X, what does it mean?", "CUPED", "SRM", "Multiple comparisons"

### ibotta-ab-process
The complete Ibotta-specific experiment lifecycle: LaunchDarkly setup, event tracking and Jira workflow, Ibotta power tools (Looker calculator, ib_util, ds_util), data cleaning, and the Monday launch rule.

**Trigger examples:** "How do we set up LaunchDarkly for this?", "What's the Jira event trigger process?", "How do I use ib_util?", "At Ibotta, how do we...", "DSP process", "get_ld_variants"

### kb-curator
Manage and surface knowledge from the knowledge base: look up what's in the KB on a topic, add a new entry, build a reading list, or summarize a paper into a KB entry.

**Trigger examples:** "What do we have on variance reduction?", "Add this paper to the KB", "Build me a reading list on sequential testing", "Who should I read for marketplace interference?"

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

https://github.com/marksallyson/ai-llyson (the-experiment-lab plugin lives in `plugins/the-experiment-lab/`)
