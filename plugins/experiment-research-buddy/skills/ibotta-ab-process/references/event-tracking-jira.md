# Event Tracking & Jira at Ibotta

## Jira Hierarchy

```
Initiative
└── Platform Tracking Epic (iOS)
└── Platform Tracking Epic (Android)
    └── Event Issue
        └── Event Trigger Issue
```

DS creates the tracking epics and event/trigger issues. Use:
1. **Events notebook** in the `dsp-analysis` repo
2. **Google Sheet template** — clone a copy for each new test

## Event Types

| Type | When to use |
|---|---|
| `click_action` | User taps/clicks a UI element |
| `view_page` | User views a screen or page |
| `offer_view` | User views an offer |

## event_properties Format

Event properties are passed as a JSON object. Key fields:
- `test_name` — matches the LD flag key
- `variant` — which group the user is in (should match LD)
- Any metric-relevant fields (offer_id, redemption_value, etc.)

## Validation Checklist

**Before launch:**
- [ ] Events fire on all variants including control
- [ ] Fields appear in data lake with correct data types
- [ ] No unexpected nulls in key fields
- [ ] Events consistent across iOS / Android / web

**Event Validation Part 2 (a few days after launch):**
- [ ] Check daily event counts by platform and app version
- [ ] Look for unexpected drops, spikes, or platform imbalances
- [ ] Confirm variant assignment counts match LD exposure counts

## Common Issues
- **Missing control tracking** — tracking added to treatment only; control has no events
- **Platform inconsistency** — iOS fires event correctly but Android doesn't
- **Type mismatches** — `redemption_value` stored as string instead of float
- **Late tracking** — events added after launch creates incomplete early-period data
