# Feature Flags at Ibotta (LaunchDarkly → ConfigCat)

> ⚠️ **Migration in progress as of 2026:** Ibotta is migrating from LaunchDarkly to ConfigCat.
> Before following any steps below, confirm which system your experiment is running on.
> The ConfigCat migration began with the Walmart Relink relaunch (June 2026). New experiments
> may be on ConfigCat; existing experiments may still be on LD. Ask your PM or check the
> feature flag system before proceeding.
>
> ConfigCat differences to be aware of:
> - `get_ld_variants` from `ib_util` is LD-specific — confirm equivalent ConfigCat utility exists before using
> - Verify timezone behavior in ConfigCat (LD reports local time; confirm ConfigCat does the same)
> - ConfigCat setup steps may differ from LD steps below — document as you learn them

---

# LaunchDarkly at Ibotta

## Setup

LD is the primary randomization tool. Rule order is **incremental** — each rule is
evaluated in order, and the first matching rule wins. Get the order right before launch.

**Standard setup:**
1. Create a feature flag in LD with the test name
2. Add targeting rules for each variant (treatment + control)
3. Set traffic allocation percentages
4. Have a second analytics team member QA before turning on

## Critical Gotchas

### Timezone mismatch
- LD dashboard reports in **local time**
- Ibotta's event architecture runs in **UTC**
- Always account for this when matching LD exposure data to event data

### Never turn off the flag mid-analysis
Turning off the LD flag **destroys the user segment data**. You will lose the ability
to join LD variant assignment to event data. Always wait until analysis is fully complete.

### Never alter percentages mid-test
Changing traffic allocation mid-test causes **spillover** — users switch groups, which
violates the experiment's integrity. If you need to change something, end the test and
start a new one.

### No peeking
Do not make ship/no-ship decisions from early LD data. Wait for the pre-specified sample
size / duration to be reached.

## Key Utility: get_ld_variants

```python
from ib_util import get_ld_variants

variants = get_ld_variants(
    flag_key="your-flag-key",
    start_date="2024-01-01",
    end_date="2024-01-14"
)
```

Returns a DataFrame mapping `customer_id` → variant assignment. Use this to join to
event data for analysis.

## QA Checklist Before Launch
- [ ] Rule order is correct and reviewed
- [ ] Traffic percentages sum to 100%
- [ ] Flag is in the correct environment (production vs. staging)
- [ ] Second analytics team member has reviewed the LD setup
- [ ] Event tracking is validated in data lake before flag is turned on
