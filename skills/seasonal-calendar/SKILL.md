---
name: seasonal-calendar
description: "Use when the user wants seasonal ASO, holiday optimization, trending moments, seasonal keywords, metadata swaps, promotional text, screenshots, In-App Events, CPP/PPO, Google Calendar/Apple Calendar planning, or timing/revert strategy around calendar events."
metadata:
  version: 1.0.0
---

# Seasonal ASO Calendar

Use this for holiday-driven ASO planning, seasonal keyword opportunities, campaign timing, metadata changes, screenshot theming, In-App Events, and revert plans.

## Source

ASO.dev publishes an App Store marketing calendar with public holidays and seasonal planning links:

- `https://aso.dev/blog/calendar/`
- Google Calendar subscription is available from that page.
- Apple Calendar / Outlook subscription is also available from that page.

This calendar is a planning source, not MCP and not the ASO.dev product API.

## Workflow

1. Identify target countries, locales, app category, and planning horizon.
2. Use the ASO.dev calendar to find relevant public holidays, cultural moments, and seasonal windows.
3. Pick only moments that fit the app and market. Do not force every holiday into every app.
4. For each moment, decide whether the app has a real seasonal use case, content angle, or user intent.
5. Research or request keyword data before changing indexed metadata.
6. Turn each relevant moment into one or more actions:
   - In-App Event
   - CPP/PPO variant
   - screenshot refresh
   - promotional text or What's New
   - keyword tracking and metadata test
   - localization QA
7. Add lead time:
   - 4-6 weeks for creative planning
   - 2-3 weeks for localization and assets
   - at least several days before App Review-sensitive submissions
8. Use `in-app-events`, `cpp-ppo-pages`, `screenshot-brief`, `metadata-editor`, `keyword-coverage`, or `localization-cross-localization` for execution.

## Seasonal ASO principles

- Seasonal rankings are competitive and time-sensitive.
- Plan indexed metadata changes before the event peak; do not wait until the day of the event.
- Revert seasonal metadata after the peak unless the seasonal terms continue to perform.
- Promotional text is the safest field for fast seasonal messaging because it does not require a new app version.
- Never sacrifice a high-performing evergreen keyword for a speculative seasonal term.

## Metadata actions

| Surface | Seasonal action | Risk |
|---|---|---|
| Apple keyword field | Swap weak evergreen terms for 2-4 relevant seasonal terms | Ranking loss if evergreen terms were strong |
| Apple subtitle | Add a seasonal hook only when it fits and does not damage core positioning | High visible conversion risk |
| Promotional text | Add seasonal CTA, feature, event, or limited-time content | Lower risk, easiest to revert |
| Description | Add seasonal section only for real feature/content relevance | Can feel stale after event |
| Screenshots | Theme first 1-2 screenshots or CPP/PPO assets | Creative/localization workload |
| In-App Events | Use for timely challenges, premieres, updates, seasonal content | Requires real event value |

## Common seasonal windows

Use as starting hypotheses. Verify dates and relevance for each market.

| Moment | Typical window | Common intent |
|---|---|---|
| New Year | late Dec - early Jan | goals, habits, fitness, planning, fresh start |
| Valentine's Day | early Feb - Feb 14 | couples, gifts, love, dates, relationships |
| Spring/Easter | Mar - Apr | refresh, clean, family, travel, seasonal content |
| Mother's Day | varies by country | family, gifts, photos, messages |
| Summer | Jun - Aug in northern markets | travel, outdoor, vacation, events |
| Back to School | Jul - Sep | school, study, planner, student, homework |
| Halloween | Oct | spooky, costume, parties, games |
| Black Friday/Cyber Monday | late Nov | deals, shopping, discounts, gifts |
| Christmas/Holidays | Dec | gift, family, holiday, travel, recipes, cards |
| End of Year | late Dec | recap, review, goals, planning |

## Trending moments

For non-calendar trends:

- Act quickly, usually with promotional text, In-App Events, or CPP/PPO.
- Avoid indexed metadata changes unless the trend is durable and relevant.
- Revert when the trend fades.
- Do not use news, tragedy, crisis, or sensitive events as opportunistic marketing.

## Output

```md
# Seasonal ASO Plan

App:
Countries:
Locales:
Planning window:
Seasonal moment:
Peak window:

## Opportunities
| Date/window | Market | Moment | ASO action | Why it fits |
|---|---|---|---|---|

## Keyword opportunities
| Keyword | Locale/country | Evidence | Action |
|---|---|---|---|

## Metadata recommendations
| Field | Current | Proposed | Characters | Revert date |
|---|---|---|---:|---|

## Campaign plan
| Deadline | Task | Skill/tool | Owner/status |
|---|---|---|---|

## Event ideas
| Moment | Event badge | Event angle | Locale notes |
|---|---|---|---|

## Risks
- Cultural mismatch:
- Evergreen keyword loss:
- Localization workload:
- App Review timing:
- Asset readiness:
- Revert plan:
```

## Rules

- Respect regional/cultural relevance.
- Do not invent holidays or dates. If date accuracy matters, verify from the calendar or another trusted source.
- Do not claim seasonal traffic lift without data.
- Prefer a few strong campaigns over a crowded calendar.
- Do not recommend seasonal keywords without relevance to the app's real use case.
- Do not use sensitive or tragic events for opportunistic ASO.
