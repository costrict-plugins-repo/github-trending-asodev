---
name: competitor-analysis
description: "Use when the user wants to analyze App Store or Google Play competitors: competitor metadata, keywords, screenshots, ratings, reviews, category rank, update cadence, IAP/subscriptions, In-App Events, CPP/ad patterns, ASO.dev App Info, App Clash, Spy, or competitor gap analysis."
metadata:
  version: 1.0.0
---

# Competitor Analysis

Analyze competitors to find positioning, keyword, localization, creative, monetization, and reputation gaps.

## ASO.dev surfaces

Use these when the user provides data, exports, screenshots, or future API access:

- App Info: country-specific metadata, screenshots/videos, events, IAP/subscriptions, ratings/reviews, category rank, keyword ranking overview, competitor list.
- App Clash: worldwide and locale-by-locale competitor comparison across metadata, ratings, downloads/revenue where available.
- Spy: keywords any app ranks for, including large competitor keyword sets.
- Changelog: historical metadata, screenshots, icons, release notes, and release cadence.
- Ads Intelligence: app ads, keyword ads, creatives, and CPP usage.

## Workflow

1. Define the market: platform, country, locale, category, and target audience.
2. Select competitors by direct function, search results, category rank, "You might also buy", ads, and aspirational positioning.
3. Compare metadata, keyword visibility, creative sequence, reviews, ratings, update cadence, monetization surfaces, and ad/CPP patterns.
4. Extract gaps that are actionable for the user's app.
5. Hand off to `keyword-research`, `metadata-editor`, `screenshot-brief`, `cpp-ppo-pages`, `reviews-ratings`, or `monetization-strategy`.

## Competitor set

Use a mixed set when data is available:

- top 10 apps in the target category
- top 5 apps for each target keyword/cluster
- direct competitors by job-to-be-done
- aspirational competitors one tier above the app's current position

Analyze keyword usage, positioning, visual strategy, ratings/reviews, and update frequency separately; do not collapse them into one generic "competitor quality" score.

## Output

```md
# Competitor Analysis

App:
Market:
Competitors:
Sources:

## Positioning map
| App | Main promise | Audience | Differentiator | Weakness |
|---|---|---|---|---|

## Keyword gaps
| Keyword/cluster | Competitors ranking | Our status | Opportunity | Next step |
|---|---|---|---|---|

## Creative gaps
| App | First-screen message | Proof | Visual pattern | Idea to test |
|---|---|---|---|---|

## Competitor checklist
| App | Title/subtitle keywords | Positioning | Visual strategy | Rating/reviews | Update cadence |
|---|---|---|---|---|---|

## Reputation and monetization
| App | Rating/reviews | Review themes | IAP/subscription signals | Notes |
|---|---|---|---|---|

## Action plan
| Priority | Action | Skill/tool | Evidence |
|---|---|---|---|
```

## Rules

- Do not copy competitor claims, screenshots, or trademarked phrases.
- Do not infer revenue, downloads, ad spend, or conversion unless data is provided.
- Treat competitor data as inspiration and market evidence, not permission to imitate.
- For Google Play, use `android-aso` for platform-specific listing rules.
