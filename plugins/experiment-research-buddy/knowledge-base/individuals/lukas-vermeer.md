---
title: Lukas Vermeer
type: individual
tags: [booking-com, culture, democratization, guardrail-metrics, metric-design, non-technical-access, organizational-maturity, platform, two-sided-markets]
source_url: https://lukasvermeer.nl/
added: 2026-06-04
---

# Lukas Vermeer

## At a Glance
Lukas Vermeer was Director of Experimentation at Booking.com, where he built both the technical infrastructure and the organizational culture for 25,000+ concurrent experiments. He has since moved to Vista (VistaPrint parent) and now advises companies on building experimentation programs. He is one of the most prolific conference speakers and writers in the field.

## Why They Matter
Vermeer's unique value is that he built something at Booking.com that most companies say is impossible: getting non-technical marketing and product teams to run rigorous experiments without constant statistician intervention. His documented approach — education first, tooling second, guardrails always — is the playbook for democratizing experimentation at a company like Ibotta where both DS and brand/marketing teams need to participate. His conference talks are unusually honest about what didn't work.

## Key Contributions
- **Built Booking.com's experimentation infrastructure and culture**: from scrappy start to 25k+ concurrent experiments while maintaining quality standards
- **"Democratizing Online Controlled Experiments at Booking.com"** (Vermeer et al., 2019): academic paper; covers both technical and cultural levers
- **Non-technical experiment authoring**: designed the workflows and UI that let non-engineers define, launch, and read experiments
- **Guardrail metric systems**: formalized the pattern of automated business-critical metric monitoring alongside every experiment
- **Conference talks**: KDD, SIGIR, ExP Summit, QCon — his talks are available on YouTube and are among the most honest in the field
- **Substack/blog**: lukasvermeer.nl — posts on experimentation culture, organizational design, and career advice for experimentation practitioners
- **Now advises mid-size companies**: his advisory work means he's encountered the full range of organizational failure modes across many companies

## Takeaways for Practice
- **Read the 2019 paper and watch one of his conference talks in parallel.** The paper gives structure; the talk gives texture. His KDD talks are the best starting point.
- **Vermeer's "education before tooling" principle is the most important lesson for Ibotta.** If you give brand managers access to an experiment platform before they understand p-values and sample size, you'll get a flood of underpowered, misinterpreted experiments. Build the training program first.
- **His guardrail metric framework is implementable today without any new tooling.** For every experiment, define 2-3 business-critical metrics that get monitored daily. If any guardrail breaches a threshold, pause and investigate. This is a spreadsheet and a daily query until you build the tooling.
- **Vermeer is active on LinkedIn and responds to questions.** If you're designing an experiment program at Ibotta and have a specific architectural question, he's worth reaching out to.
- **His Substack posts on "what experimentation culture actually looks like at 25k experiments/year" are more useful than the paper** for understanding day-to-day operations.

## Action Items / Things to Read
- Vermeer et al. (2019) "Democratizing Online Controlled Experiments at Booking.com" — arXiv:1710.08217
- lukasvermeer.nl — blog and talks archive
- YouTube: search "Lukas Vermeer experimentation" for KDD and QCon talks
- "In Controlled Experiments We Trust" — Lukas Vermeer talk (multiple versions; search for most recent)

## Tags
booking-com, culture, democratization, guardrail-metrics, metric-design, non-technical-access, organizational-maturity, platform, two-sided-markets

---

## Recent: 2026-07 — "Jesters, Not Kings": On the Practitioner's Role in Experimentation Culture

**Source:** Mel JI Mueller, "A Recap of the 2026 Experimentation Conference at Booking.com," Booking.com ML & DS Blog (Medium), July 2026 · https://medium.com/booking-com-data-science/a-recap-of-the-2026-experimentation-conference-at-booking-com-f43d48698fcd  
**Conference:** Booking.com 3rd Annual Experimentation Conference, May 18, 2026, Amsterdam  
**Panel participants:** Jev Gamper (Vinted) and Melanie Kyrklund (Specsavers)

**Core argument:** Vermeer argued data practitioners should think of themselves as *jesters*, not kings. The jester's institutional role — historically — was to speak truth to power without losing their head, using story, humor, and well-chosen timing as the vehicle. The contrast: a king makes decisions and expects compliance; a jester shapes decisions through craft and moment. Applied to data practitioners: your job is not to make the call, but to make the right call inevitable for those who do.

**Why this framing is precise, not just catchy:** "Influence without authority" is the usual phrase for this dynamic, but it's vague — it describes the constraint without giving practitioners a method. The jester analogy adds method: you speak truths that others are incentivized to avoid, you choose the *right moment* to say them, and you use narrative and specificity (not abstract statistics) to get them to land. The jester also knows the limits of the role: they don't try to replace the king. Practitioners who try to become decision-makers ("kings") often lose the credibility that made them effective in the first place.

**What practitioners often get wrong:** They present data as if the data speaks for itself. It doesn't. It needs framing, timing, and narrative. A p-value of 0.03 does not automatically change a meeting room's conclusion — a well-told story about what that p-value means for a decision the room is already wrestling with might.

**Ibotta relevance:** For a DS team trying to move offer experiment conclusions into actual product and pricing decisions made by brand managers or category leads, this reframing is practically useful. The jester's toolkit — a surprising finding framed as a question, a concrete case study anchored in something the decision-maker cares about, an inconvenient truth delivered with enough goodwill that it sticks — is exactly how to change decisions without triggering defensive reactions. The culture challenge at Ibotta isn't usually statistical; it's this.

**Tags added:** culture, stakeholder-communication, organizational-maturity
