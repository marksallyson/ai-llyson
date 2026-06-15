# experiment-research-buddy

A Claude Code plugin for Decision Scientists at Ibotta — built to think like a senior experimentation advisor who has worked inside the best programs in the industry.

## What This Is

A **knowledge-grounded consultation plugin.** You bring it a problem in experiment design, strategy, or statistics, and it responds the way a senior advisor would — grounded in documented practice from the most mature experimentation programs in the industry, calibrated to your expertise level.

It is not a passive reference tool you search. It is not an autonomous agent that watches your work and flags things. It is the expert you bring into the conversation when you have a decision to make.

## The Premise

Companies like Booking.com, Duolingo, Airbnb, DoorDash, LinkedIn, Netflix, and Microsoft ExP are years — sometimes decades — ahead of most experimentation programs. They've already hit the walls, made the mistakes, built the infrastructure, and figured out what actually works at scale. That knowledge exists in their engineering blogs, conference talks, papers, and public postmortems — but it's scattered and hard to synthesize.

This plugin is that synthesis. When you ask it a question, it doesn't give you textbook answers — it tells you what Booking.com did when they hit this problem, what DoorDash learned when they tried to scale experiment capacity, how LinkedIn handled the peeking problem when PMs wouldn't stop looking at dashboards. The goal is to skip the mistakes these companies already made and apply what they learned to Ibotta's specific situation.

## How to Use It

Bring it a real problem. "I need to design a test for X." "My PM wants to stop this test early." "What should we test on the home screen?" "My result looks weird." It works best as a consultation — you're in the conversation, it's a resource you're drawing from.

It also works best alongside **Emma's `stats-research-buddy`**, which covers the academic literature — what the research says is correct. This plugin covers practice — what reputable companies actually shipped and why. Academic rigor + real-world precedent = better decisions.

## Skills

### experiment-design
Design an experiment from scratch, grounded in how mature programs handle the same design challenge. Covers test type selection, interference, randomization unit, and validity threats — always anchored in a real company example.

**Trigger examples:** "How should I design this test?", "Should I use a holdout?", "How do I handle network effects?", "Can I even run an A/B test for this?"

### experiment-strategy
Choose the right metric, set guardrails, interpret results, and make ship/no-ship decisions — the way LinkedIn or Netflix would approach it, not just from first principles.

**Trigger examples:** "What metric should I use?", "Should we ship this?", "The test was significant but...", "Novelty effect", "Incrementality"

### statistical-methods
Power analysis, CUPED, sequential testing, SRM detection, ratio metrics, Bayesian vs. frequentist — with company-specific context for which method each mature program actually uses and why.

**Trigger examples:** "How do I power this?", "Can I peek at results?", "CUPED", "SRM", "Multiple comparisons", "mSPRT"

### ibotta-ab-process
The complete Ibotta-specific experiment lifecycle: LaunchDarkly/ConfigCat setup, event tracking and Jira workflow, Ibotta power tools (`ib_util`, `ds_util`, Looker calculator), data cleaning, and the Monday launch rule. Benchmarks Ibotta's process against mature programs and flags gaps.

**Trigger examples:** "How do we set up LaunchDarkly for this?", "What's the Jira event trigger process?", "At Ibotta, how do we...", "get_ld_variants"

### hypothesis-generation
Generate experiment ideas for a specific product surface, grounded in what real companies tested on analogous surfaces. Cross-references Ibotta's 34-experiment history to avoid re-testing, and prioritizes by expected impact vs. cost to run.

**Trigger examples:** "What should we test on the home screen?", "Give me hypotheses for the offer card", "We've never tested X — is it worth it?", "What would DoorDash test here?"

### stakeholder-communication
Translate experiment results, proposals, and methodology into language that lands with PMs, brand managers, and leadership. Includes ready-to-use scripts for the hard conversations.

**Trigger examples:** "My PM wants to stop the test early", "How do I explain a null result?", "Help me write the readout", "How do I push back on this?", "Make this accessible for leadership"

### kb-curator
Manage and surface knowledge from the knowledge base: look up what's in the KB on a topic, add a new entry, build a reading list, or summarize a paper or article into a KB entry.

**Trigger examples:** "What do we have on variance reduction?", "Add this paper to the KB", "Build me a reading list on sequential testing", "Who should I read for marketplace interference?"

## Knowledge Base

The `knowledge-base/` directory is the source of truth this plugin draws from. Every skill reads from it before answering — not from generic training knowledge.

- `companies/` — 17 entries covering the most rigorous experimentation programs in the industry: Airbnb, Booking.com, DoorDash, Duolingo, Etsy, Google, LinkedIn, Lyft, Meta, Microsoft ExP, Netflix, Pinterest, Shopify, Spotify, Statsig, Twitter/X, Uber
- `individuals/` — 10 entries on the practitioners who built these programs: Ron Kohavi, Diane Tang, Ya Xu, Alex Deng, Aleksander Fabijan, Lukas Vermeer, Chetan Sharma, Evan Miller, Rommil Santiago, Martin Tingley
- `papers/` — 7 foundational papers (CUPED, overlapping experiments, peeking/mSPRT, SRM, Trustworthy OCE, empirical Bayes)
- `articles/` — 8 essential practitioner articles with credibility assessments
- `_INDEX.md` — master index with tags for fast lookup
- `_TEMPLATE.md` — template for new entries
- `GLOSSARY.md` — definitions of all key terms

## Adding to the Knowledge Base

1. Use **kb-curator**: "Add this paper to the KB" or "Summarize this URL for the KB"
2. Or manually: copy `_TEMPLATE.md`, fill it out, save to the right subdirectory, update `_INDEX.md`

**Filename convention:** slugified title, lowercase, hyphens, `.md`

## GitHub

https://github.com/marksallyson/ai-llyson (plugin lives in `plugins/experiment-research-buddy/`)
