# Render Recipes

Technical constraints for rendering these pictures. Several are non-obvious and fail
silently — read this before writing SVG.

---

## Before anything: defer to the `dataviz` skill for aesthetics

The `dataviz` skill is already installed and owns palette, mark specs, legend and axis
rules. **Do not reinvent chart styling here.** Read it when picking series colors or
laying out a chart. This file covers only what's specific to teaching pictures.

---

## Inline rendering (the default)

Use `mcp__visualize__show_widget`. Call `mcp__visualize__read_me` for the full contract;
the load-bearing rules are:

**Geometry**
- `<svg width="100%" viewBox="0 0 680 H" role="img">` — **680 is load-bearing.** It maps
  1:1 to container pixels. Shrinking it silently scales all your text up.
- Narrow content? Keep 680 and center the drawing. Don't hug the content.
- `H` = bottom-most element (including text baselines) + 20px. Compute it; don't guess.
- Safe area x=40..640. Never negative coordinates.
- First two children must be `<title>` and `<desc>`.
- Output the raw `<svg>`. Do **not** wrap it in a background `<div>` — the host provides
  the card.

**Color**
- All text and chrome uses CSS variables: `--text-primary` (values, titles),
  `--text-secondary` (legends), `--text-muted` (axis ticks), `--border` (hairlines),
  `--surface-1` (chart surface). Never hardcode `#333` — it vanishes in dark mode.
- Role tints for the semantic regions: `--text-danger` / `--bg-danger` for the
  false-positive and β regions, `--text-success` / `--bg-success` for power and correct
  coverage, `--text-accent` for the focal element.
- Text always wears text tokens, **never** the series color. A small colored square
  next to the label carries identity.

**Type**
- 14px for labels, 12px for ticks. Weights 400 and 500 only — never 600/700.

**Shaded regions** (the workhorse of this grammar)
- Fill at ~18–22% opacity so the curve stays readable through it.
- Always pair the fill with a direct text label inside or adjacent to the region.
  Color alone never carries meaning — a colorblind reader must still get it.

---

## Drawing a normal curve in SVG

You'll need this constantly. Generate the path from the actual density rather than
eyeballing a bezier — a wrong-looking bell undermines the whole picture.

Sample the PDF at ~60 points across ±4σ, map to viewBox coordinates, and emit a
polyline-style path:

```
M x0,y0 L x1,y1 L x2,y2 ... L xn,yn
```

For a shaded tail, continue the path down to the baseline and close it:
`... L xn,baseline L xcrit,baseline Z`

Two overlapping curves: draw the **back** curve first, both with `fill-opacity` low
enough that the overlap region reads as a blend.

For a quick check on proportions: peak height ∝ 1/σ, and the curve should be visually
near-zero by ±3σ.

---

## Term-mapping table (Layer 4 of the explanation)

When you finally show a formula, never show it bare. Break it into a table that points
each term back at the picture:

| Term | In the picture | In plain words |
|---|---|---|
| `σ` | the bracket on the top strip | how spread out individual users are |
| `n` | the count of highlighted dots | how many users you sampled |
| `√n` | the arrow between panels 2 and 3 | why more users tightens the estimate |

Three to five rows. If a term can't be pointed at in the picture, the picture is
incomplete — go back and add the element rather than explaining the term in prose.

---

## Interactive widgets

Only when the concept is *about* change. Pattern: inline SVG inside HTML, with a range
input that rewrites the geometry.

```html
<div style="display:flex;align-items:center;gap:12px;margin-bottom:16px">
  <label style="font-size:14px;color:var(--text-secondary)">Sample size</label>
  <input type="range" id="n" min="100" max="20000" value="2000" step="100" style="flex:1">
  <span id="nOut" style="font-size:14px;color:var(--text-primary);min-width:70px">2,000</span>
</div>
<svg width="100%" viewBox="0 0 680 360" role="img">
  <title>Power as sample size changes</title>
  <desc>Two overlapping distributions; the shaded power region grows as n increases.</desc>
  <!-- paths rewritten by script -->
</svg>
```

Rules:
- **One slider, or at most two.** Three controls turns a teaching picture into a
  cockpit and the lesson is lost.
- Always show the current numeric value next to the slider, and show the *consequence*
  ("power = 62%") as a live readout. The number moving is half the insight.
- Recompute the real density on input — don't interpolate between two hardcoded shapes.
- Scripts run after streaming completes, so initialize by calling your redraw function
  once on load rather than relying on inline markup being correct.
- Validate nothing here (no user text input), but do clamp slider math so an extreme
  value can't produce a NaN path and blank the picture.

---

## Standalone export (`save on request`)

**The failure mode:** widget markup pasted into a file has no CSS variables. Every
`var(--text-primary)` resolves to nothing and you get an unreadable file. Always inline
this block in exported HTML:

```html
<style>
  :root {
    --surface-0:#f7f7f5; --surface-1:#fcfcfb; --surface-2:#ffffff;
    --text-primary:#0b0b0b; --text-secondary:#52514e; --text-muted:#898781;
    --text-accent:#0c447c; --text-danger:#8c2f2f; --text-success:#1f5c3d;
    --bg-accent:#e6f1fb; --bg-danger:#fbeaea; --bg-success:#e8f3ec;
    --border:rgba(11,11,11,0.10); --border-strong:rgba(11,11,11,0.22);
    --radius:8px;
  }
  @media (prefers-color-scheme: dark) {
    :root {
      --surface-0:#121211; --surface-1:#1a1a19; --surface-2:#202020;
      --text-primary:#f0efec; --text-secondary:#c3c2b7; --text-muted:#898781;
      --border:rgba(255,255,255,0.10); --border-strong:rgba(255,255,255,0.22);
    }
  }
  body { background:var(--surface-0); color:var(--text-primary);
         font-family:ui-sans-serif,system-ui,sans-serif; line-height:1.7;
         max-width:760px; margin:0 auto; padding:40px 24px; }
  h1 { font-size:22px; font-weight:500; }
  h2 { font-size:18px; font-weight:500; }
</style>
```

Export checklist:
- `<!DOCTYPE html>`, `<html lang="en">`, `<meta charset>`, `<meta name="viewport">`
- Title = the concept name
- The picture, **plus** the Layer 2 (plain words) and Layer 3 (named parts) text
- Date, so she knows when she worked through it
- Self-contained: no CDN links, no external fonts. It must work offline in two years.
- Save to `~/.claude/visual-stats/<concept-slug>.html` (override: `$VISUAL_STATS_STATE`)
- Deliver with `SendUserFile`, `display: "render"`

---

## Things that reliably go wrong

- **Clipped content.** `H` guessed too small. Compute from the lowest element.
- **Text running off the left edge.** `text-anchor="end"` extends text leftward from `x`.
  At x=60 a 200px label starts at −140. Use `start`, or move x right.
- **Colliding labels.** Check bounding boxes for every pair not meant to overlap. In the
  α/β/power picture the three region labels crowd near the critical line — stagger their
  y values or use leader lines.
- **Legend instead of direct labels.** For teaching pictures, label the thing directly.
  A legend forces a lookup, and the lookup is exactly the symbolic indirection this
  whole plugin exists to avoid.
- **Too much in one frame.** If the picture needs a paragraph to orient, it's two pictures.
