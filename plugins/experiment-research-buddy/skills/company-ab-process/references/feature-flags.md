# Feature Flags & Randomization

Read `${CLAUDE_PLUGIN_ROOT}/config/company-profile.md` first to learn which platform the
company uses, and whether a migration is in progress. If a migration is in progress,
confirm which system the specific experiment runs on before giving any steps.

Platforms this pattern covers: LaunchDarkly, ConfigCat, Optimizely, GrowthBook, Statsig,
Eppo, Amplitude Experiment, and homegrown assignment services.

## Standard setup

1. Create a feature flag keyed to the test name. Keep the key identical to the `test_name`
   you emit in events — joining later depends on it.
2. Add a targeting rule per variant (treatments + control).
3. Set traffic allocation percentages. They must sum to 100%.
4. Confirm the flag is in the **production** environment, not staging.
5. Have a second team member QA the setup before you turn it on.

## Gotchas that apply on every platform

### Rule order is incremental
Targeting rules are evaluated top to bottom and the first match wins. A broad rule above a
narrow one silently swallows the narrow one. Fix the order before launch — reordering
mid-test reassigns users.

### Never turn the flag off before analysis is complete
Most platforms stop retaining, or actively purge, per-user assignment data once a flag is
archived or disabled. If that happens you cannot join variant assignment to event data and
the experiment is unanalyzable. Wait until the readout is signed off.

### Never alter traffic percentages mid-test
Changing allocation moves users between groups. Those users are **spillover** — they have
been exposed to both arms, so they violate the experiment's assumptions and have to be
dropped, which costs you power and can bias the remaining sample. If you must change
something, end the test and start a new one.

### Timezone mismatch
Flag platform dashboards commonly report in the viewer's local time, while event
warehouses usually run in UTC. A naive join produces an off-by-one-day exposure window and
an apparent SRM. Record both timezones in the company profile and convert explicitly.

### No peeking
Do not make ship/no-ship decisions from early dashboard data unless the test was designed
as a sequential test with an alpha-spending or always-valid procedure. See
`statistical-methods` for how to get safe mid-test reads.

### Platform-level SRM
Compare the platform's reported exposure counts against distinct users per variant in your
own event data. A mismatch between those two numbers is a setup bug, not noise, and is a
different failure from a within-data SRM.

## Retrieving variant assignment

You need a table of `user_id → variant` for the exposure window, to join to event data.

Options, in order of preference:
1. **An internal helper library**, if the company profile names one. This is the right
   default when it exists — it already handles the platform's pagination and timezone quirks.
2. **The platform's export or data-warehouse integration** (most vendors offer an
   assignment-event stream or a warehouse sync).
3. **The platform's REST API**, paginated, written to a staging table.
4. **Client-side exposure events** you emit yourself at assignment time. This is the most
   portable approach and the one to build if nothing above exists — but only count a user
   as exposed when they actually saw the variant.

Generic shape of what you want back:

```python
# assignments: one row per user per experiment
# user_id | experiment_key | variant | first_exposure_at
assignments = get_variant_assignments(
    experiment_key="your-flag-key",
    start_date="2026-01-06",
    end_date="2026-01-20",
)
```

Join on `user_id`, and filter events to `event_time >= first_exposure_at` so pre-exposure
behavior does not leak into the metric.

## QA checklist before launch

- [ ] Rule order is correct and reviewed by a second person
- [ ] Traffic percentages sum to 100%
- [ ] Flag is in the production environment
- [ ] Flag key matches the `test_name` emitted in events
- [ ] Event tracking validated in the warehouse before the flag is enabled
- [ ] Exposure timezone and warehouse timezone both documented
- [ ] Action standard written and agreed
