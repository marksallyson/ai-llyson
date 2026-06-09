# Interference and SUTVA Violations

## SUTVA — Stable Unit Treatment Value Assumption

SUTVA requires two things:
1. **No interference**: the potential outcome of unit i depends only on i's own treatment, not others'
2. **No hidden versions**: there's only one version of treatment (no heterogeneous delivery)

When SUTVA is violated, standard A/B estimates are biased. The direction of bias depends on
the nature of interference.

## Types of interference

### Network / social interference
- Treating one user changes the experience of their connections
- Example: a new feed feature for user A changes what user B sees in their feed
- LinkedIn, Twitter, Facebook all face this
- Solutions: **graph cluster randomization** (cluster by connected component or ego network),
  **ego network experiments** (treat ego + all alters together), **bipartite experiments**

### Marketplace / supply-demand interference
- Treatment changes supply or demand, which spills over to control
- Example: a promo increases consumer demand → drivers/inventory shift toward treated users → control gets worse service
- Solutions: **switchback** (time-based), **geo holdout** (market-level), **budget-split** for ad auctions

### Shared resource interference
- Units compete for a finite resource (inventory, budget, capacity)
- Example: A/B test on ad bidding — treatment bids more aggressively, control wins fewer auctions
- Solution: **campaign-level** or **advertiser-level** randomization (not user-level)

### Cannibalization
- Treatment draws behavior that would have gone to control
- Example: testing a new offer surface — users who find offers there don't use the old surface
- This is often desirable (you want to know net effect) but must be modeled explicitly

## Detection strategies

1. **SUTVA test**: compare outcomes for control units adjacent to treatment units vs. far from them
   — if adjacent controls perform worse, interference is present
2. **Dilution analysis**: vary the treatment fraction and check if estimated effects are stable
   — if effects shrink as treatment fraction grows, spillover is occurring
3. **Exposure mapping**: define a richer exposure variable (e.g., "fraction of neighbors treated")
   and test whether it predicts outcomes in the control group

## When you can't fix interference

Sometimes the interference is the phenomenon you're studying (e.g., viral features).
In that case:
- Report the **total average treatment effect (TATE)** including spillovers
- Use **intent-to-treat (ITT)** analysis rather than per-protocol
- Be explicit in reporting that the estimate includes indirect effects

## Key papers

- Rubin (1980) — original SUTVA formulation
- Halloran & Struchiner (1995) — interference in epidemiology (foundational)
- Aronow & Samii (2017) — "Estimating Average Causal Effects Under Interference" — nonparametric
- Eckles, Karrer & Ugander (2017) — "Design and Analysis of Experiments in Networks" — graph cluster
- Johari, Li & Wager (2022) — "Experimental Design in Two-Sided Platforms" — marketplace
