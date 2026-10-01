# Event Tracking & Ticketing Workflow

Read `${CLAUDE_PLUGIN_ROOT}/config/company-profile.md` for the company's event type names,
ticket hierarchy, and any internal notebook or sheet template used to generate tickets. The
pattern below is the generic default when the profile is silent.

## Why tracking is its own workstream

An experiment with incomplete tracking is unanalyzable, and you cannot fix it after launch
— the early period is permanently missing. Treat tracking as a gated prerequisite, not a
task that runs in parallel with QA.

## Ticket hierarchy

```
Initiative  (the business goal)
└── Tracking Epic — one per client platform (iOS, Android, web)
    └── Event Issue        (one per event to be instrumented)
        └── Event Trigger Issue   (one per place/condition that fires it)
```

Why per-platform epics: platform teams ship on different release trains, and the single
most common tracking bug is "iOS fires it, Android doesn't." Separate epics make that
visible in the board instead of invisible inside one ticket.

Data science normally writes these tickets, because DS is the consumer of the data and
knows which fields the analysis needs.

## Event types

Name events for the user action, not for the feature. Feature names change; actions don't.
A minimal, sufficient vocabulary:

| Type | When to use |
|---|---|
| `click_action` | User taps or clicks a UI element |
| `view_page` | User views a screen or page |
| `view_item` | User views a specific content item (offer, listing, product, video) |
| `transact` | User completes the money/conversion action |

Use the company profile's names if it lists them — consistency with the existing warehouse
matters more than the ideal taxonomy.

## Event properties

Pass properties as a structured object. Required on every experiment event:

- `test_name` — identical to the feature flag key
- `variant` — the variant the user is in, as the flag platform names it
- `user_id` — the same identifier the flag platform assigns on
- `event_time` — with an explicit timezone

Then add the fields your metric needs (`item_id`, `order_value`, `position_in_feed`, …).
Decide these at design time: a metric you cannot compute from the logged fields is a metric
you cannot report.

## Validation checklist

**Before launch:**
- [ ] Events fire on **all** variants, including control
- [ ] Fields appear in the warehouse with the correct data types
- [ ] No unexpected nulls in `test_name`, `variant`, or `user_id`
- [ ] Events consistent across every platform you ship on
- [ ] `variant` values exactly match the flag platform's variant names
- [ ] A test user can be traced end to end: assignment → exposure → metric event

**Event Validation Part 2, a few days after launch:**
- [ ] Daily event counts by platform and app version look stable
- [ ] No unexpected drops, spikes, or platform imbalances
- [ ] Distinct users per variant in events reconcile with the flag platform's exposure counts

## Common failures

- **Missing control tracking** — instrumentation added to the treatment only, so control
  has no events and there is nothing to compare against
- **Platform inconsistency** — one client fires the event correctly, another does not
- **Type mismatches** — a numeric field such as `order_value` stored as a string, which
  silently breaks aggregation
- **Late tracking** — events added after launch, leaving an incomplete early period you
  must either discard or caveat
- **Variant name drift** — the flag platform says `treatment_a`, events say `variant_1`,
  and the join quietly produces zero rows
