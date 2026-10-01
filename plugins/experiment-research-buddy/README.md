# experiment-research-buddy

A Claude Code plugin that acts as a senior experimentation advisor — one who has read what
the most mature experimentation programs in the industry actually published, and applies it
to your company.

> **New here? Go to [SETUP.md](SETUP.md).** Install, then run one setup conversation. Takes
> about 10 minutes.

## What it is

A **knowledge-grounded consultation plugin.** You bring a problem in experiment design,
strategy, or statistics; it answers the way a senior advisor would — grounded in documented
practice, calibrated to your expertise level, and specific to your company.

It is not a reference tool you search, and not an agent that watches your work. It's the
expert you pull into the conversation when you have a decision to make.

## The premise

Booking.com, Duolingo, Airbnb, DoorDash, LinkedIn, Netflix, Spotify and Microsoft ExP are
years — sometimes decades — ahead of most experimentation programs. They already hit the
walls, made the mistakes, built the infrastructure, and wrote down what worked. That
knowledge exists in engineering blogs, conference talks, papers and public postmortems, but
it's scattered and hard to synthesize.

This plugin is that synthesis. Ask it a question and it doesn't give you a textbook answer —
it tells you what Booking.com did when they hit this problem, what DoorDash learned scaling
experiment capacity, how LinkedIn handled peeking when PMs wouldn't stop refreshing
dashboards. The point is to skip the mistakes those companies already paid for.

## How it becomes *your* advisor

One local file, `config/company-profile.md`, holds your company's business model, product
surfaces, metrics, experimentation stack, and process rules. Every skill reads it before
answering.

That file is **gitignored and never shipped**. You create it by running the **setup** skill,
which interviews you and writes it. Everything else in this repo is generic and shareable.

Why it matters: business model decides which precedent is valid. A two-sided marketplace
benchmarked against Netflix gets bad advice. Tell the plugin what you are, once, and every
answer afterward picks the right analogues.

Without a profile, the plugin still works — it answers generically and says so, rather than
inventing your tool names or policies.

## Skills

### setup
Interviews you about your company and writes `config/company-profile.md`. Run this first.
Run it again when your stack changes.

**Try:** "set up experiment research buddy", "we switched from LaunchDarkly to Statsig"

### experiment-design
Design an experiment from scratch, grounded in how mature programs handled the same design
challenge. Test type selection, interference, randomization unit, validity threats — always
anchored in a real company example.

**Try:** "How should I design this test?", "Should I use a holdout?", "How do I handle
network effects?", "Can I even run an A/B test for this?"

### statistical-methods
Power analysis, CUPED, sequential testing, SRM detection, ratio metrics, multiple
comparisons, Bayesian vs. frequentist — with company-specific context on which method each
mature program actually uses, and why.

**Try:** "How do I power this?", "Can I peek at results?", "CUPED", "SRM", "mSPRT"

### experiment-strategy
Pick the right OEC, set guardrails, interpret weird results, make ship/no-ship calls — the
way LinkedIn or Netflix would approach it, not just from first principles.

**Try:** "What metric should I use?", "Should we ship this?", "The test was significant
but…", "Novelty effect", "Incrementality"

### company-ab-process
Your company's operational experiment lifecycle: feature-flag platform setup and gotchas,
event tracking and ticketing workflow, internal power tooling, data cleaning, launch rules.
Reads your profile for the specifics, and benchmarks your process against mature programs to
flag gaps.

**Try:** "How do we set up the flag for this?", "What's our event tracking process?",
"What's our launch rule?"

### hypothesis-generation
Generate experiment ideas for a product surface, grounded in what real companies tested on
analogous surfaces. Cross-references your own past-experiment inventory to avoid re-testing,
and prioritizes by expected impact vs. cost to run.

**Try:** "What should we test on the home screen?", "Give me hypotheses for the checkout
flow", "What would DoorDash test here?"

### stakeholder-communication
Translate results, proposals and methodology into language that lands with PMs and
leadership. Includes ready-to-use scripts for the hard conversations.

**Try:** "My PM wants to stop the test early", "How do I explain a null result?", "Help me
write the readout", "Make this accessible for leadership"

### kb-curator
Look up what the knowledge base holds on a topic, add a new entry from a URL or paper, build
a reading list, or summarize a source into a KB entry.

**Try:** "What do we have on variance reduction?", "Add this paper to the KB", "Reading list
on sequential testing"

### weekly-digest
Composes and delivers a weekly newsletter from what changed in the knowledge base. Optional,
and only runs on a schedule if you set one up — see [SETUP.md](SETUP.md).

**Try:** "send the weekly digest", "what's new in the KB this week"

## Knowledge base

`knowledge-base/` is the source of truth the skills draw from. Skills read it before
answering instead of relying on generic training knowledge.

- `companies/` — 17 entries on the most rigorous programs in the industry: Airbnb,
  Booking.com, DoorDash, Duolingo, Etsy, Google, LinkedIn, Lyft, Meta, Microsoft ExP,
  Netflix, Pinterest, Shopify, Spotify, Statsig, Twitter/X, Uber
- `individuals/` — 10 entries on the practitioners who built them: Ron Kohavi, Diane Tang,
  Ya Xu, Alex Deng, Aleksander Fabijan, Lukas Vermeer, Chetan Sharma, Evan Miller, Rommil
  Santiago, Martin Tingley
- `papers/` — 22 papers, foundational through 2026 (CUPED, overlapping experiments,
  peeking/mSPRT, SRM, Trustworthy OCE, winner's curse, network interference, LLM surrogacy)
- `articles/` — 13 practitioner articles, each with a credibility assessment
- `_INDEX.md` — master index with tags for fast lookup
- `_TEMPLATE.md` — template for new entries
- `GLOSSARY.md` — definitions of key terms

**A note on the examples.** Many entries end with an **"Ibotta relevance"** paragraph.
Ibotta is this plugin's original home — a consumer cashback app with a two-sided
brand/retailer marketplace. Those paragraphs are left in deliberately, as worked examples of
how to turn a company's published practice into a concrete recommendation for one specific
business. Read them as the pattern, not as advice for yours. Once your company profile exists,
skills generate the equivalent translation for *your* surfaces and metrics, and `kb-curator`
writes new entries in your terms.

## Adding to the knowledge base

1. Use **kb-curator**: "Add this paper to the KB", or "Summarize this URL for the KB"
2. Or by hand: copy `_TEMPLATE.md`, fill it in, save to the right subdirectory, update
   `_INDEX.md`

Filename convention: slugified title, lowercase, hyphens, `.md`.

## What stays on your machine

These are gitignored. Nothing company-specific is published by installing or updating.

| File | What it holds |
|---|---|
| `config/company-profile.md` | Your company, stack, metrics, process rules |
| `config/local/` | Any other private notes |
| `skills/company-ab-process/references/past-experiments.md` | Your past experiment inventory |

Templates for the first and last ship in the repo as `*.example.md`.

## Companion plugin

Works well alongside a literature-focused research plugin. This one covers **practice** —
what reputable companies shipped and why. A literature plugin covers **theory** — what the
research says is correct. Academic rigor plus real-world precedent beats either alone.

## Contributing

Knowledge base entries are the most useful contribution. Use `_TEMPLATE.md`, cite a public
source, and include a credibility assessment for anything from a vendor blog.

## License

MIT — see [LICENSE](LICENSE).
