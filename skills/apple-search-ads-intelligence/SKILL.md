---
name: apple-search-ads-intelligence
description: "Use when the user wants Apple Search Ads or ASO.dev Ads Intelligence analysis: app ads, keyword ads, competitor ad creatives, custom product pages in ads, share of voice, auction insights, SAP as paid-intent signal, or paid/organic keyword alignment."
metadata:
  version: 1.0.0
---

# Apple Search Ads Intelligence

Use Apple Search Ads and ASO.dev Ads Intelligence data to connect paid keyword demand, competitor creatives, CPP usage, and organic ASO strategy.

## ASO.dev surfaces

Use when available:

- App Ads: keywords an app advertises on, creatives used, CPPs in campaigns, country/device filters.
- Keyword Ads: apps advertising on a search term, ad creatives, CPPs, country/device visibility.
- Share of Voice and Auction Insights when the data is available.
- SAP and Search Term Rank Report as supporting demand context, not as exact spend data.

## Workflow

1. Identify app, country, device, campaign goal, and target keyword cluster.
2. Compare paid visibility with organic rankings and metadata coverage.
3. Inspect competitor ad creatives and CPP promises.
4. Recommend CPP, metadata, screenshot, and keyword tracking actions.
5. Hand off to `cpp-ppo-pages`, `keyword-research`, `metadata-editor`, or `screenshot-brief`.

## Output

```md
# Apple Search Ads Intelligence

App:
Country:
Device:
Keywords/competitors:
Sources:

## Paid landscape
| Keyword | Advertisers | Creative/CPP pattern | Organic rank | Opportunity |
|---|---|---|---:|---|

## Competitor ad patterns
| Competitor | Keywords | Promise | Asset pattern | Gap |
|---|---|---|---|---|

## Recommendations
| Action | Surface | Reason | Success metric |
|---|---|---|---|

## Hand-off
- CPP/PPO:
- Metadata:
- Screenshots:
- Keyword tracking:
```

## Rules

- Do not infer bid, budget, conversion, or spend without data.
- Do not copy competitor creatives or trademarked terms.
- Use paid signals to prioritize tests; validate with actual campaign and conversion data.
- Keep Apple Ads recommendations distinct from organic App Store metadata edits.
