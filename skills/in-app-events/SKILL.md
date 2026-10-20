---
name: in-app-events
description: "Use when the user wants to create, plan, audit, optimize, localize, or fill App Store In-App Events in ASO.dev: event cards for Today/Games/Apps tabs, search, product pages, re-engagement, challenges, competitions, live events, premieres, seasons, major updates, and special events."
metadata:
  version: 1.0.0
---

# In-App Events

Use this for App Store In-App Event strategy, metadata, media direction, localization, validation, and ASO.dev draft filling.

## MCP workflow

1. Use `app-store-connect-mcp`.
2. Read active event with `get_app_event_data`.
3. Read project context when positioning or tone matters.
4. Use `seasonal-calendar` when the event is tied to public holidays, cultural moments, or monthly campaign planning.
5. Identify event goal, badge/type, audience, territories, dates, and localization scope.
6. Draft event fields, locale copy, and media direction.
7. Validate with `validate_ai_companion_data` target `appEvent`.
8. If asked to apply, fill with `fill_app_event`.

## What events do

In-App Events are time-limited App Store cards for timely content or activities inside the app. They can appear on the product page, in search, and in editorial/personalized placements across App Store surfaces. They can support acquisition, re-engagement, feature adoption, and seasonal campaigns.

They are strongest when the event is more than ordinary app functionality.

## Supported fields

- `referenceName`
- `badge`
- `priority`
- `primaryLocale`
- `purpose`
- `purchaseRequirement`
- `deepLink`
- `localizations`: locale -> `name`, `shortDescription`, `longDescription`

## Apple constraints

| Item | Constraint |
|---|---:|
| Reference name | 64 chars |
| Event name | 30 chars |
| Short description | 50 chars |
| Long description | 120 chars |
| Duration | 15 minutes to 31 days |
| Publish start | Up to 14 days before event start |
| Overlapping events | Up to 10 at a time |
| Approved events | Up to 15 per app |
| Draft events | Up to 50 |

Media specs:

| Asset | Ratio | Minimum | Maximum |
|---|---|---:|---:|
| Event card image/video | 16:9 | 1920x1080 | 3840x2160 |
| Event details image/video | 9:16 | 1080x1920 | 2160x3840 |

Use JPG/PNG for images and MOV/M4V/MP4 for videos. Keep important visuals readable as a small card thumbnail.

## Event badge strategy

| Badge | Best for |
|---|---|
| `Challenge` | Goal completion, streaks, fitness, education, game progress |
| `Competition` | Rankings, tournaments, scored contests, leaderboards |
| `Live Event` | Real-time sessions users experience together |
| `Major Update` | Significant new feature/content beyond bug fixes |
| `Premiere` | First release of new media or content |
| `New Season` | New content season, battle pass, content library refresh |
| `Special Event` | Seasonal, themed, collaboration, or limited-time campaign |

By app type:

- Games: Challenge, Competition, New Season, Major Update
- Fitness/wellness: Challenge, Live Event, Major Update
- Productivity/utility: Major Update, Special Event
- Social/community: Live Event, Challenge, Competition
- Streaming/content: Premiere, New Season, Special Event

## Improvement checklist

- Event has a real reason to exist: challenge, competition, live event, major update, new season, premiere, or special event.
- Name is specific and timely.
- Short description gives immediate value.
- Long description says what happens, who it is for, and how to participate.
- Purchase/subscription requirement is clear.
- Deep link is preserved unless the user asks to change it.
- Localizations translate intent, not words.
- Event media shows the outcome, reward, content, or activity rather than a generic UI screenshot.

## Copy rules

- Event name should lead with the user action, benefit, content, or moment. Avoid leading with the app name unless brand recognition is the point.
- Short description should answer "what is in it for me?"
- Long description should cover what, why, and how to participate.
- Use 1-2 keywords only when natural; do not keyword-stuff event names.
- Write the event name as if it may appear alone in notifications, search, and cards.

## Planning workflow

1. Choose primary goal: acquisition, re-engagement, feature launch, content launch, seasonal visibility, or community activation.
2. For seasonal ideas, use ASO.dev's calendar at `https://aso.dev/blog/calendar/` or the Google Calendar subscription linked there.
3. Choose badge/type based on the real user activity.
4. Choose dates and submit early enough for review; flag if start date is too close.
5. Draft copy for each locale.
6. Specify card and details media direction.
7. Define KPIs: event impressions, event page views, reminders, notification taps, app opens, downloads, subscriptions, or sales.
8. Build a monthly calendar when the user asks for ongoing strategy.

## Output

```md
# In-App Event Brief and Draft

Event:
App:
Primary locale:
Goal:
Badge:
Dates:
Status:

## Current state
| Field | Current | Characters | Issue |
|---|---|---:|---|

## Strategy
- Audience:
- Primary goal:
- Why this is event-worthy:
- KPI:
- Submit/review risk:

## Proposed fields
| Field | Value | Reason |
|---|---|---|

## Localizations
| Locale | Name | Short description | Long description |
|---|---|---|---|

## Media direction
- Event card media:
- Event details media:
- Key visual:
- Thumbnail risk:
- Text on image:

## Event calendar
| Week/date | Event | Badge | Goal | Notes |
|---|---|---|---|---|

## Validation
- Clear event angle:
- Access/cost clear:
- Deep link preserved/tested:
- Character limits:
- Dates within constraints:
- Media specs:
- MCP validation:
- Ready for `fill_app_event`:
```

## Rules

- Do not invent dates, prizes, access terms, or availability.
- Do not claim urgency unless current data supports it.
- If extra payment is required, say it clearly.
- Do not use In-App Events for minor bug fixes, normal evergreen features, or generic promotions with no timely user activity.
- Do not promise Today tab placement or App Store notifications. Treat placement and reminders as opportunities, not guarantees.
