---
name: aso-audit
description: "Use when the user wants a full ASO audit or health check for an app: metadata, keyword coverage, cross-localization, screenshots, reviews, ratings, update history, In-App Events, IAP/subscriptions, CPP/PPO, competitors, rankings, or ASO.dev ASO Check interpretation."
metadata:
  version: 1.0.0
---

# ASO Audit

Run a practical ASO health check across discoverability, conversion, localization, reputation, monetization surfaces, and competitive context.

## ASO.dev surfaces

Use these ASO.dev concepts when data is available from the user, MCP, exports, screenshots, or future API:

- App Info: title/subtitle length, screenshots/video counters, in-app events, IAP/subscriptions, ratings/reviews, category rank, keyword ranking overview, competitors.
- ASO Check: metadata and cross-localization quality across App Store locales.
- Global App Overview and App Clash: compare localization, screenshots, ratings, and keyword distribution across apps/locales.
- Changelog/Timeline: connect metadata, screenshot, icon, release, and keyword changes to performance changes.
- Measurements: correlate downloads, page views, revenue, retention, ratings, and releases.

## Workflow

1. Use `app-context` and `current-metadata-fetch` when this is the user's own app.
2. Use `keyword-research`, `keyword-coverage`, `competitor-analysis`, `reviews-ratings`, `screenshot-brief`, `app-analytics`, and `metadata-editor` as needed.
3. Separate current facts, missing data, assumptions, and recommendations.
4. Score areas directionally; do not imply Apple/Google will rank or feature the app because of a score.
5. Prioritize fixes by impact, confidence, effort, and ability to validate in ASO.dev.

## Directional scoring

When enough data exists, use a simple 100-point health score as an organizing device, not as a promise:

| Component | Weight | Evidence |
|---|---:|---|
| Metadata quality | 25 | Field usage, keyword placement, clarity, compliance, localization readiness |
| Ratings and reviews | 25 | Average rating, rating volume/velocity, unanswered reviews, low-star themes |
| Keyword performance | 25 | Top 10/50/100 coverage, trend, feasibility, competitor gaps |
| Conversion metrics | 25 | Impressions, product page views, downloads, conversion, creative/page changes |

If a component lacks data, mark it `unknown` and do not redistribute the score weight.

## Audit areas

| Area | What to inspect |
|---|---|
| Metadata | Title/name, subtitle/short description, keywords, descriptions, promo text, What's New |
| Keyword visibility | Current ranks, SAP/popularity, difficulty, competitors, coverage by field and locale |
| Cross-localization | Unique title/subtitle coverage, keyword distribution, local relevance |
| Creative conversion | Icon, first 3 screenshots, app previews, feature graphic, CPP/PPO variants |
| Reputation | Rating level/trend, unanswered reviews, low-star themes, response quality |
| Release/history | Update cadence, changelog, release notes, metadata changes around metric shifts |
| Monetization surfaces | IAP, subscriptions, pricing, event/IAP discoverability, paywall clarity |
| Competitive context | App Info, App Clash, Spy, competitor changelog, category rank, ad/CPP patterns |

## Output

```md
# ASO Audit

App:
Country:
Locale:
Data sources:

## Executive summary
- Biggest growth blocker:
- Highest-confidence fix:
- Data missing:

## Scorecard
| Area | Score | Evidence | Priority |
|---|---:|---|---|

## ASO health score
| Component | Weight | Score | Evidence | Data gaps |
|---|---:|---:|---|---|

## Findings
| Priority | Finding | Evidence | Recommended action | Skill/tool |
|---|---|---|---|---|

## Quick wins
1.
2.
3.

## 30-day plan
| Week | Action | Owner/input needed | Validation metric |
|---|---|---|---|

## Hand-offs
- Metadata:
- Keywords:
- Screenshots/CPP/PPO:
- Reviews:
- Analytics:
```

## Rules

- Do not invent rankings, ratings, revenue, downloads, or competitor data.
- Distinguish ASO.dev app data from public App Store/Google Play data.
- If the audit recommends live edits, hand off to the relevant editing skill and validate before filling.
- Treat legal, privacy, medical, financial, and subscription claims as high-risk.
