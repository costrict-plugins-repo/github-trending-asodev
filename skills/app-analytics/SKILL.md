---
name: app-analytics
description: "Use when the user wants to interpret ASO.dev Measurements or App Store Connect metrics: downloads, impressions, product page views, conversion, revenue, retention, sessions, active devices, ratings, reviews, release markers, experiment impact, or before/after ASO performance."
metadata:
  version: 1.0.0
---

# App Analytics

Interpret ASO and App Store performance data and turn it into decisions for metadata, creatives, pricing, reviews, releases, and experiments.

## ASO.dev Measurements context

ASO.dev Measurements compares current vs previous periods and shows release-date markers on charts. Use those release markers to connect metric changes to metadata, screenshot, pricing, event, or version changes.

Common metrics:

- impressions, product page views, downloads, conversion
- in-app purchases, subscription/revenue metrics when available
- retention, sessions, active devices
- ratings, reviews, review velocity
- release dates and before/after periods

## Workflow

1. Identify the question: conversion drop, install growth, revenue change, retention, experiment result, review/rating movement, or release impact.
2. Capture period, country, locale, source/channel, app version, and changed surfaces.
3. Compare current period to previous period and mark releases/campaigns.
4. Separate correlation from causation.
5. Recommend the smallest next experiment or investigation.

## Launch or major update readout

For a new launch or major update, inspect the first 14 days closely when data exists:

- compare daily trend against release markers and previous comparable period
- watch conversion, downloads, ratings/reviews, crashes/complaint themes if supplied, and revenue/subscription starts if relevant
- distinguish launch novelty, featuring/ad bursts, seasonality, and metadata/creative effects
- turn findings into the next metadata, screenshot, review, pricing, or CPP/PPO action

## Output

```md
# App Analytics Readout

App:
Market:
Period:
Comparison period:
Question:

## Metric changes
| Metric | Current | Previous | Change | Interpretation |
|---|---:|---:|---:|---|

## Timeline
| Date | Release/campaign/change | Metrics affected | Notes |
|---|---|---|---|

## Diagnosis
- Likely driver:
- Alternative explanations:
- Data gaps:

## Next actions
| Priority | Action | Skill/tool | Success metric |
|---|---|---|---|
```

## Rules

- Do not invent metrics or attribution.
- Do not call a change causal without enough evidence.
- Segment by country, locale, traffic source, and version when possible.
- For subscription-specific churn, trial, billing, or win-back analysis, use `subscription-lifecycle`.
