---
title: "Overlapping Experiment Infrastructure: More, Better, Faster Experimentation"
type: paper
tags: [overlapping-experiments, platform, organizational-maturity, layered-experiments, concurrent-experiments, infrastructure]
source_url: https://research.google/pubs/overlapping-experiment-infrastructure-more-better-faster-experimentation/
added: 2026-06-08
---

# Overlapping Experiment Infrastructure: More, Better, Faster Experimentation

## At a Glance
Tang, D., Agarwal, A., O'Brien, D., & Meyer, M. (KDD 2010). Describes Google's layered experiment system for running thousands of concurrent experiments without interference. Introduced the concept of orthogonal experiment layers as the standard architecture for scaling experimentation.

## Why They Matter
This paper is the blueprint for how large-scale experimentation infrastructure is built. Before this, most companies ran experiments sequentially (one at a time) to avoid confounding. The layered system enabled Google to run thousands of concurrent experiments. Understanding this architecture is essential for any conversation about Ibotta's experiment capacity, concurrency, and potential for interaction effects between experiments.

## Key Contributions
- Introduced the concept of **orthogonal experiment layers**: experiments in the same layer cannot overlap in traffic; experiments in different layers are orthogonal and can run concurrently on the same users
- Demonstrated that orthogonality between layers ensures unconfounded estimates even when a user is in experiments from multiple layers simultaneously
- Documented Google's traffic splitting at launch (~2010): 10% experiments, 40% hold-out for stability
- Described the "diversion" hierarchy: user-level → cookie-level → request-level
- Became the standard reference for any discussion of concurrent experiment architecture

## Takeaways for Practice
1. **The key insight for Ibotta**: if two experiments operate on independent surfaces (e.g., offer feed ranking and push notification copy), they can run concurrently on the same users safely — provided neither's treatment affects the other's metric.
2. **When concurrent experiments DO interact** (e.g., two offer ranking experiments both affecting the same feed), they must be in the same layer (mutually exclusive traffic allocation) or run sequentially.
3. **Experiment interactions are a real power problem.** A user in two treatment groups is in a combined treatment cell that may not have enough power to detect interaction effects separately.
4. **This paper is required reading before designing an experiment platform.** If Ibotta ever builds a formal experiment management system, the layers architecture is the correct foundation.

## Action Items / Things to Read
- Paper: https://research.google/pubs/overlapping-experiment-infrastructure-more-better-faster-experimentation/
- See also: `knowledge-base/individuals/diane-tang.md` — Tang is the co-author and primary practitioner

## Tags
overlapping-experiments, platform, organizational-maturity, layered-experiments, concurrent-experiments, infrastructure
