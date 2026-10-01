# Setup

Three required steps, about 10 minutes. Everything after step 3 is optional.

---

## Step 1 — Install

```bash
claude plugin marketplace add marksallyson/ai-llyson
```

```bash
claude plugin install experiment-research-buddy@ai-llyson
```

Restart Claude Code, then confirm:

```bash
claude plugin list
```

You should see `experiment-research-buddy`. If you don't, run
`claude plugin validate <path-to-plugin>` against the installed path for the specific error.

## Step 2 — Create your company profile

In a Claude Code session, say:

> set up experiment research buddy

The **setup** skill interviews you in four short rounds and writes
`config/company-profile.md`. "Defaults are fine" is a valid answer to any round — a thin
profile is better than no profile, and you can extend it later by invoking the skill again.

The one answer worth thinking about is **business model**, because it decides which
companies in the knowledge base count as valid precedent for you:

| Your business model | Analogues the plugin will reach for |
|---|---|
| Two-sided marketplace | Airbnb, DoorDash, Uber, Lyft, Etsy |
| Consumer subscription | Netflix, Spotify, Duolingo |
| Consumer transactional | Booking.com, Shopify, Pinterest |
| Ad-supported media | Meta, Twitter/X, Google |
| B2B SaaS | Microsoft ExP, LinkedIn, Statsig |

Prefer to write it by hand? Copy `config/company-profile.example.md` to
`config/company-profile.md` and fill it in. Leave anything you don't know as `TBD`.

**Verify it's protected before you continue:**

```bash
git check-ignore -v config/company-profile.md
```

That must print a `.gitignore` line. If it prints nothing, the file is not protected — add
`**/config/company-profile.md` to your `.gitignore` before you commit anything.

## Step 3 — Ask it something real

> How should I design a test for [something you're actually working on]?

If the answer names your surfaces and metrics, the profile is wired up correctly. If it
answers generically and says the profile is missing, step 2 didn't write the file — check
the path it reports.

---

## Optional — Your past-experiment inventory

Two skills get meaningfully better with this, and degrade to generic advice without it:
`hypothesis-generation` (to avoid proposing a test you already ran) and `company-ab-process`
(to get real baseline rates for power analysis).

```bash
cp skills/company-ab-process/references/past-experiments.example.md \
   skills/company-ab-process/references/past-experiments.md
```

Fill in one row per past readout: date, test name, surface, primary metric, result, shipped,
link. Even 10 rows is useful. The file is gitignored.

If you don't have readouts collected anywhere, that's the finding — start the list now and it
compounds.

---

## Optional — Set up the weekly routine

The routine is two skills in sequence, once a week:

1. **kb-curator** scans for new sources and writes knowledge base entries
2. **weekly-digest** reads what changed in the last 7 days and sends you a digest

### First, decide whether you want it

Run it by hand once before automating anything:

> what's new in the KB this week

If the output isn't worth 2 minutes of your Monday, don't schedule it.

### Set delivery

The **Digest delivery** section of `config/company-profile.md` controls where it goes:

```markdown
## Digest delivery

- **Deliver to:** you@example.com
- **Channels:** Slack DM, Gmail
- **Cadence:** Mondays, 8am America/Denver
- **Timezone:** America/Denver
```

Delivery needs the matching connector authorized in Claude Code — Slack for a DM, Gmail for
email. Without them the digest still generates, it just prints in the chat instead of
sending. Set **Channels** to `chat` if that's what you want, or the whole section to
`disabled` to turn the routine off.

### Then pick one way to run it

**Option A — scheduled task, if your Claude Code build has one.** Ask for it in a session:

> schedule the experiment lab weekly digest for Mondays at 8am

This is the least setup. Availability varies by build; if nothing happens, use option B.

**Option B — cron, works on any machine.** Write a prompt file so the schedule and the
instruction stay separate:

```bash
mkdir -p ~/.claude/routines && cat > ~/.claude/routines/experiment-digest.txt <<'EOF'
Run the kb-curator skill to scan for new experimentation sources and write any new
knowledge base entries. Then run the weekly-digest skill to compose and deliver this
week's digest using the delivery settings in the company profile.
EOF
```

Then add the cron entry with `crontab -e`:

```
0 8 * * 1 cd ~/path/to/your/project && /usr/local/bin/claude -p "$(cat ~/.claude/routines/experiment-digest.txt)" >> ~/.claude/routines/digest.log 2>&1
```

Four things that break this, in the order people hit them:

1. **`claude` not found.** cron has a minimal `PATH`. Use the absolute path — find it with
   `which claude`.
2. **Permission prompts.** A non-interactive run stalls on any prompt. Pre-approve the tools
   the routine needs in your project's `.claude/settings.json` rather than disabling
   permission checks.
3. **No output anywhere.** Check `~/.claude/routines/digest.log` first; cron swallows
   everything otherwise.
4. **Wrong timezone.** cron uses the system timezone, not the one in your profile. On macOS,
   `sudo systemsetup -gettimezone` tells you what cron thinks it is.

Test it before you trust it — run the exact cron command by hand in a terminal first.

**Option C — GitHub Actions**, if the plugin lives in a repo you control and you want the
digest to run whether or not your laptop is on. Use a scheduled workflow that checks out the
repo, installs the Claude Code CLI, and runs the same prompt. You'll need an API key in
repository secrets, and your company profile will **not** be present in CI (it's gitignored,
by design) — so the digest will be generic. Only worth it if you want the KB updated
centrally rather than a personalized digest.

### Adjust the digest

The format, tone, and section structure live in `skills/weekly-digest/SKILL.md`. Edit it
directly. The "Your angle" lines are the ones that make it feel personal — they read from
your company profile, so a thin profile produces a bland digest.

---

## Updating

```bash
claude plugin update experiment-research-buddy
```

Your `config/company-profile.md` and `past-experiments.md` are gitignored but live inside the
plugin directory, so **back them up before updating** — an update replaces the plugin
directory:

```bash
cp config/company-profile.md ~/experiment-buddy-profile.backup.md
```

Restore it after the update completes.

---

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| Answers are generic, never mention your company | No `config/company-profile.md` | Run the **setup** skill |
| Skill cites Netflix for your marketplace problem | Business model missing or wrong in the profile | Re-run **setup**, fix the Analogues section |
| "I can't find the knowledge base" | Plugin loaded from a path where `${CLAUDE_PLUGIN_ROOT}` isn't set | Reinstall via `claude plugin install` rather than copying files by hand |
| Plugin doesn't appear after install | Needs a restart | Restart Claude Code, then `claude plugin list` |
| Digest never arrives | Connector not authorized, or cron `PATH` | Run the digest by hand in a session to isolate which |
| It asserts a tool you don't use | A stale field in the profile | Edit `config/company-profile.md` directly; it's just markdown |
