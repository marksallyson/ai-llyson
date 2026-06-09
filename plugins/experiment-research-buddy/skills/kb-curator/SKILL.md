---
name: kb-curator
description: >
  Use this skill when the user wants to add a new article, paper, or source to the knowledge base,
  look up what's in the knowledge base, get a reading list, explore what a company or individual
  has published, or asks "what should I read about X". Also triggers on "add this to the KB",
  "summarize this paper for the KB", "what do we have on [topic]", "build me a reading list",
  or "who should I follow for X". Does NOT replace experiment-design or statistical-methods
  — this is the curation and learning layer on top of those skills.
metadata:
  version: "0.1.0"
---

# KB Curator Skill

## Purpose

Manage and surface knowledge from the experiment-lab knowledge base. This skill handles four operations:

1. **Lookup** — find what's already in the KB on a topic, company, or individual
2. **Add** — create a new KB entry from a paper, article, blog post, or URL the user provides
3. **Reading list** — generate a focused reading list on a topic, scoped to what's most relevant to the user's current work
4. **Summarize** — when the user pastes or links content, extract it into a formatted KB entry

The KB lives at `knowledge-base/` in this plugin's directory.
When accessing files, use the plugin's install path from `installed_plugins.json`, or
look for the files relative to where this SKILL.md is located (two levels up: `../../knowledge-base/`).

Structure:
- `_TEMPLATE.md` — template for new entries
- `_INDEX.md` — master index of all entries
- `companies/` — one file per company
- `individuals/` — one file per person

---

## Operation: Lookup

When the user asks "what do we have on X" or "who is the best reference for Y":

1. Check `_INDEX.md` for relevant entries by scanning the one-line descriptions and tags column.
2. Read the relevant entry files directly.
3. Return: entry title, At a Glance summary, most relevant Key Contributions, and the Takeaways for Practice section.
4. If nothing matches exactly, return the closest matches and note the gap.

**Tag search**: The `_INDEX.md` lists all tags in use at the bottom. Match the user's topic to tags, then find entries with those tags in their frontmatter.

Common lookup patterns:
- "What do we have on variance reduction?" → tags: `variance-reduction`, `cuped`, `cupac` → Microsoft ExP, DoorDash, Netflix
- "Who should I read for marketplace interference?" → tags: `marketplace`, `interference`, `two-sided-markets` → Uber, Lyft, Airbnb
- "What's in the KB on sequential testing?" → tags: `sequential-testing`, `peeking`, `always-valid-inference` → Spotify, Statsig, Chetan Sharma, Evan Miller

---

## Operation: Add New Entry

When the user says "add this to the KB" or provides a URL/paper/article:

1. Ask for (or extract from the content): title, type (company/individual/paper/article), and source URL.
2. Use `_TEMPLATE.md` as the structure.
3. Fill each section:
   - **At a Glance**: 1-2 sentences. What is it? What does it do/claim?
   - **Why They Matter**: what problem does this solve that's relevant to product experimentation?
   - **Key Contributions**: specific methods, tools, datasets, or claims — not generic descriptions
   - **Takeaways for Practice**: 3-5 concrete things a DS at a promotions/cashback platform should do differently based on this source; be specific about offer testing, incentive design, two-sided marketplace dynamics where applicable
   - **Action Items / Things to Read**: specific URLs, paper titles, book chapters — not "read their work"
   - **Tags**: pick from existing tags in `_INDEX.md` where possible; add new tags if genuinely needed
4. Set `added: YYYY-MM-DD` to today's date.
5. Write the file to `companies/` or `individuals/` (or create a new subdirectory for papers/articles if needed).
6. Update `_INDEX.md` to add the new entry to the appropriate table.
7. Confirm the file path written and the index update made.

**Filename convention**: slugified title, lowercase, hyphens, `.md`. Examples:
- "Airbnb" → `airbnb.md`
- "A/B Testing Intuition Busters (paper)" → `ab-testing-intuition-busters.md`
- "Ron Kohavi" → `ron-kohavi.md`

---

## Operation: Reading List

When the user asks "build me a reading list on X" or "what should I read about Y":

1. Identify the topic. Map it to tags and KB entries.
2. Pull the "Action Items / Things to Read" sections from relevant entries.
3. Organize by: **Start here** (1-2 foundational items), **Go deeper** (2-4 items for more detail), **Advanced** (1-2 items for production-level or academic depth).
4. Add a one-line annotation for each item explaining why it's on the list and what specifically to read (don't just list titles).
5. If the topic isn't covered in the KB, say so clearly and offer to add entries.

Example topics and their KB coverage:
- Variance reduction → CUPED (Microsoft ExP / Alex Deng), CUPAC (DoorDash), GLM CUPED (Netflix/Tingley)
- Marketplace interference → Uber (switchback), Lyft (two-sided markets), Airbnb (SUTVA)
- Sequential testing → Spotify (always-valid inference), Chetan Sharma (mSPRT), Evan Miller (peeking post)
- Organizational maturity → Aleksander Fabijan (growth model), Lukas Vermeer (Booking.com), Etsy (mid-size case study)
- Delayed conversion → Pinterest (attribution window), Netflix (surrogate metrics)
- Interleaving → DoorDash, Pinterest
- Quasi-experimental methods → Shopify (synthetic control), Lyft (DiD)

---

## Operation: Summarize Into KB Entry

When the user pastes content (paper abstract, blog post, article text) or provides a URL:

1. Extract the key ideas. Identify: what method/claim is being made? What evidence supports it? What's the context?
2. Map to the `_TEMPLATE.md` structure.
3. For "Takeaways for Practice": translate the paper's findings into what a DS at a promotions/cashback platform should actually do. Be specific — "apply CUPED with prior redemption rate as covariate" not "consider variance reduction."
4. Draft the entry and show it to the user for review before writing to disk.
5. After approval: write the file, update `_INDEX.md`.

If the user provides a URL but you can't fetch it, ask them to paste the relevant content.

---

## Tone and Style

- Direct. No hedging, no filler.
- Assume the user knows statistics. Skip definitions of p-values and confidence intervals.
- Takeaways should be actionable at Ibotta — tie to offer testing, incentive design, brand/retailer experiments, two-sided marketplace dynamics wherever the connection is real.
- If a KB entry is thin or outdated, say so and offer to improve it.
- Don't pad reading lists. 5 well-annotated items beat 15 unannotated ones.
