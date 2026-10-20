---
name: featuring-nomination
description: "Use when the user wants App Store featuring, Apple editorial consideration, App of the Day/Today tab ideas, launch/update nomination strategy, or ASO.dev featuring nomination drafts. Reads and fills nomination drafts through the local MCP when available."
metadata:
  version: 1.0.0
---

# App Store Featuring Nomination

Prepare an App Store featuring strategy and ASO.dev nomination draft.

## MCP workflow

1. Use `app-store-connect-mcp`.
2. Read current draft with `get_nomination_data`.
3. Read project context when available; it should contain positioning, markets, launch plans, ratings, Apple technology usage, and assets.
4. Assess readiness before writing the pitch.
5. Draft only nomination fields the user needs.
6. Validate with `validate_ai_companion_data` target `nomination`.
7. If asked to apply, fill with `fill_nomination`.

## Supported draft fields

- `name` up to 60 characters
- `type`: `NEW_CONTENT`, `APP_ENHANCEMENTS`, or `APP_LAUNCH`
- `description` up to 1000 characters
- `notes` up to 500 characters
- `publishStartDate`
- `publishEndDate`
- `deviceFamilies`
- `locales`
- `relatedApps`
- `relatedEvents`
- `supportedTerritories`
- `supplementalMaterialsUris`
- `hasInAppEvents`
- `launchInSelectMarketsFirst`
- `preOrderEnabled`

## Initial assessment

If the data is not already in the MCP result or project context, identify what is missing:

- App ID / App Store link
- Previous featuring history
- Upcoming launch, update, content drop, seasonal moment, or In-App Event
- Apple technologies used: SwiftUI, WidgetKit, Live Activities, App Intents, StoreKit 2, SharePlay, iPad/macOS/visionOS support, accessibility APIs, privacy-preserving on-device features
- Rating, review health, crash/stability posture, recent update cadence
- Screenshots, app previews, editorial/promotional assets
- Target countries, locales, device families, and supported territories

Do not block on missing data. Mark unknowns and turn them into action items.

## Readiness factors

Score directionally, not as a guaranteed Apple decision:

| Factor | What to inspect |
|---|---|
| Product quality | Stability, performance, polish, update cadence |
| Design | Clear UI, icon, screenshots, iPad/device support, Apple-like interaction quality |
| Apple technology | Meaningful use of current platform capabilities, not checkbox usage |
| Story | Human, product, creator, community, cultural, or technical angle |
| Timeliness | Launch, major update, season, event, Apple OS/device moment |
| User proof | Ratings, reviews, retention/community signals, press/awards if real |
| Accessibility/privacy | VoiceOver, Dynamic Type, contrast, privacy labels, data minimization |
| Localization | Markets/locales/assets ready for the nomination scope |

## Placement thinking

Use these as strategy lenses, not promises:

- App of the Day / Today tab hero: exceptional product, design, story, and timing.
- Today tab story: strong editorial narrative or developer/user story.
- Apps We Love / category collection: strong category fit and quality signals.
- Search/category feature: relevance plus polished metadata/assets.
- In-App Events: strong self-serve editorial surface for timely campaigns.

## Nomination type mapping

- `APP_LAUNCH`: new app, major market launch, pre-order or first big release.
- `APP_ENHANCEMENTS`: meaningful feature update, redesign, new platform support, accessibility/privacy improvement.
- `NEW_CONTENT`: content drop, new season, event, campaign, collection, challenge, or live moment.

## Pitch checklist

- What is new
- Why it matters now
- Why users care
- Why it fits App Store editorial quality
- Which Apple technologies are meaningfully used
- Markets/locales ready
- Assets and related In-App Events ready
- Risks before nomination

## Output

```md
# Featuring Readiness and Nomination Draft

App:
Nomination:
Type:
Locales:
Territories:
Device families:

## Readiness score
Overall: X/100

| Area | Score | Notes |
|---|---:|---|
| Product quality | X/10 | |
| Design/assets | X/10 | |
| Apple technology | X/10 | |
| Story/timing | X/10 | |
| Ratings/reviews | X/10 | |
| Accessibility/privacy | X/10 | |
| Localization | X/10 | |

## Current state
| Field | Current | Issue |
|---|---|---|

## Before pitching
1.
2.
3.

## Proposed fields
| Field | Value |
|---|---|

## Final pitch
...

## Timing and angle
- Recommended timing:
- Editorial angle:
- Apple tech to highlight:
- Assets needed:
- Related In-App Event:

## Validation
- Specific launch/update story:
- Supported by app facts:
- Assets ready:
- Locales/territories match:
- MCP validation:
- Ready for `fill_nomination`:
```

## Rules

- Do not oversell or invent awards, Apple relationships, metrics, assets, or launch dates.
- Connect the pitch to a real release, season, event, market, or product milestone.
- Do not treat readiness score as a prediction or guarantee.
- Do not fill nomination fields that would change dates, related apps/events, territories, device families, or URLs unless those values came from current data or the user.
- If the user asks for external Apple submission instructions, distinguish them from ASO.dev MCP draft filling.
