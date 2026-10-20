# ASO.dev Agent Skills Examples

Use these prompts to test the skill pack after installing it in Codex, Claude Code, Cursor, or another agent that supports `SKILL.md` folders.

Replace the app name, platform, locales, and product details with real project context. For active ASO.dev pages, keep the relevant editor page open and ask the agent to read current state before drafting changes.

## Quick Smoke Tests

```text
What ASO.dev skills are available? Group them by workflow.
```

```text
Check whether the ASO.dev local AI Companion MCP is available.
Tell me which current page data can be read, but do not fill anything.
```

```text
Read the current iOS metadata from the active ASO.dev Metadata Editor.
Find missing or weak fields, draft improvements for en-US, validate them, and wait for approval before filling.
```

```text
Read unanswered low-star reviews from the active ASO.dev Reviews page.
Group complaints by theme and draft replies for the 5 highest-impact reviews.
Do not fill replies until I approve.
```

## Metadata

### iOS Metadata Refresh

```text
I have an iOS focus timer app called <app name>.
It has Pomodoro timers, focus sessions, calendar blocking, app limits, and weekly productivity reports.

The brand is not famous. Optimize App Name, Subtitle, Keyword Field, Promotional Text, and the first 3 lines of Description.
Lead with important functional keywords before the brand when that is better for search suggestions.
Show exact character counts and explain what changed.
```

### Google Play Listing

```text
Optimize Google Play metadata for a habit tracker called <app name>.
Features: streaks, reminders, widgets, mood notes, progress charts.
Audience: people building simple wellness and productivity habits.

Draft Title, Short Description, and the first 250 characters of Long Description.
Use keywords naturally because Google Play indexes the long description.
```

### Metadata Validation

```text
Validate this draft before I paste it into App Store Connect:

App Name: PDF Scanner - Scan Docs
Subtitle: Docs, OCR, Sign & Share
Keywords: scanner,pdf,scan,document,docs,ocr,sign,signature,file,files,share,export

Check character limits, duplicate terms, keyword waste, and whether the title/subtitle structure makes sense.
```

### Cross-Localization

```text
Localize this App Store metadata from en-US into de-DE, fr-FR, es-ES, and ja-JP.
Translate search intent, not just words.

App: <app name>, a sleep app
Core value: sleep sounds, smart alarm, bedtime routines, sleep tracking.
Target audience: adults with stress and inconsistent sleep.

Return metadata per locale with App Name, Subtitle, Keyword Field, and notes on cultural/search differences.
```

## Keywords and Competitors

### Keyword Research From Scratch

```text
Build a keyword research plan for a new meal planning app.
App value: weekly meal plans, grocery lists, calorie targets, family recipes.
Markets: US and UK.

Start with seed keyword clusters, competitor types to inspect, and a prioritized list of primary, secondary, and long-tail keywords.
```

### CSV-Based Keyword Coverage

```text
Analyze the keyword CSV in this workspace.
Create a coverage plan for App Name, Subtitle, iOS Keyword Field, Google Play Short Description, and Long Description.
Prioritize relevance first, then search demand and difficulty.
```

### Competitor Analysis

```text
Compare my app with the top competitors for "budget tracker", "expense tracker", and "money manager".
Analyze title/subtitle keywords, positioning, visual strategy, ratings/reviews, update frequency, and gaps we can own.
```

## Creative and Growth

### Screenshot Brief

```text
Create an App Store screenshot brief for a language learning app.
Features: daily lessons, speaking practice, vocabulary review, travel phrases, progress streaks.
Audience: busy adults learning Spanish.

Plan the first 8 screenshots, with the first 2-3 focused on conversion.
Include overlay copy, visual direction, localization notes, and App Preview first-3-second hook.
```

### In-App Event

```text
Draft an App Store In-App Event for a summer fitness challenge.
App: <app name>, a running and walking tracker.
Goal: re-engage existing users and attract search traffic around summer fitness.

Return event name, short description, long description, media direction, timing, and localization notes.
```

### CPP/PPO Test

```text
Design a Product Page Optimization test for a photo editing app.
Hypothesis: AI background removal converts better than filters for creator traffic.

Define variants, screenshot sequence differences, target audience, metrics, minimum runtime, confidence threshold, and decision rules.
```

### Featuring Nomination

```text
Prepare an App Store featuring nomination draft for a meditation app releasing a new guided sleep program.
Highlight what is new, editorial angle, audience, accessibility, localization, and why Apple should feature it.
```

## Reviews and Analytics

### Review Health

```text
Analyze this reviews export and create a review health report.
Group sentiment themes, identify product issues, draft reply templates, and suggest rating-improvement actions.
```

### Launch Readout

```text
Use ASO.dev Measurements data to evaluate the first 14 days after our metadata update.
Compare impressions, product page views, conversion rate, downloads, revenue, ratings, and review themes.
Separate likely metadata effects from ads, seasonality, and launch novelty.
```

## Monetization

### In-App Purchases

```text
Draft App Store metadata for these in-app purchases:
- Small credit pack
- Large credit pack
- Advanced export pack

For each IAP, provide reference name, display name, description, localization notes, review notes guidance, and image direction.
Keep subscriptions out of this plan.
```

### Subscriptions

```text
Create subscription localization drafts for a productivity app.
Plans: Monthly plan, Annual plan, Family plan.
Benefits: unlimited projects, shared workspaces, AI summaries, priority sync.

Return product display names, descriptions, review notes guidance, and positioning risks.
```

### Pricing and Availability

```text
Plan a pricing and territory change for a subscription app.
Current: $9.99 monthly in all countries.
Goal: increase annual plan adoption in US, UK, Canada, Australia, Germany, and France.

Suggest price architecture, rollout plan, ASO risks, communication notes, and what to monitor after launch.
```

## Public API and MCP

### Developer API

```text
Re-check the ASO.dev Developer API OpenAPI document before answering.
Summarize currently documented endpoints and generate a minimal integration checklist.
Do not infer undocumented endpoints from local MCP tools.
```

### Partners API

```text
Re-check the ASO.dev Partners API OpenAPI document before answering.
Show how I would call the documented live keyword ranking endpoint, including required auth/header assumptions from the docs.
Mark anything unknown instead of inventing it.
```

### MCP Safety Check

```text
Explain which ASO.dev local MCP actions are read-only and which can fill drafts.
Then inspect the current active page and tell me what data is available without making changes.
```

## Regression Checklist

- Skill discovery works in the target agent.
- Local MCP read paths are checked before drafting active-page changes.
- Drafts show character counts for store metadata.
- The agent waits for explicit approval before filling ASO.dev drafts.
- Public API answers re-check OpenAPI and stay separate from local MCP.
- Screenshot and video prompts prioritize the first 2-3 screenshots and first 3 video seconds.
- Review replies are grouped by theme before individual drafts.
- Monetization prompts separate IAPs, subscriptions, pricing, and availability.
