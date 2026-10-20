---
name: cpp-ppo-pages
description: "Use when the user wants App Store Custom Product Pages, Product Page Optimization, A/B testing, conversion rate optimization, product page variants, screenshot/icon/app preview tests, campaign pages, keyword/ad alignment, or CPP/PPO drafts in ASO.dev."
metadata:
  version: 1.0.0
---

# CPP, PPO, and Store Listing Tests

Use this for App Store Custom Product Pages, Product Page Optimization tests, product page variants, campaign pages, and conversion test planning.

## MCP workflow

1. Use `app-store-connect-mcp`.
2. CPP/PPO tools are planned later. If a CPP/PPO tool exists, read the current page/test before editing.
3. If no CPP/PPO MCP tool exists in the active localhost server, produce a save-ready plan and clearly say live fill is not available yet.
4. Never overwrite default product page metadata while editing a CPP/PPO draft unless the user explicitly asks.

## Decide the object

- PPO: native App Store A/B test against the default product page.
- CPP: targeted product page for a campaign, ad group, audience, keyword cluster, country, creator/partner link, or seasonal moment.
- Google Play Store Listing Experiment: use `android-aso` for Play-specific experiments.

## Apple PPO facts

- Tests app icons, screenshots, and app previews.
- Up to 3 treatments per test.
- You choose the traffic proportion shown test treatments.
- Tests run for up to 90 days or until manually stopped.
- App Analytics may label results when confidence reaches 90%.
- PPO is not available for custom product pages, Apple Watch product pages, or iMessage product pages.
- App icon variants must be included in the current app binary and meet icon requirements.

## Apple CPP facts

- Up to 70 custom product pages per app.
- Each page can vary screenshots, app previews, promotional text, and keywords.
- CPPs are targeted pages with unique URLs; they are not randomized A/B tests.
- CPPs can be used in Apple Ads and can appear in relevant search results when configured with keywords.
- CPP metadata must be approved before it is visible.

## Test design framework

Write the hypothesis before variants:

```text
If we [change], then [metric] will improve because [reason].
```

Good tests:

- Change one primary thing at a time.
- Make the variant meaningful enough to detect.
- Tie each variant to a user intent or conversion blocker.
- Define baseline, success metric, target locale/country, and minimum practical lift.
- Decide the confidence threshold and minimum runtime before launch; for PPO, treat 90% confidence as a minimum practical bar unless the user provides another standard.
- Avoid stopping early just because results look promising.
- Document the result and learning even when the test is inconclusive.

## Test prioritization

| Element | Why test it |
|---|---|
| App icon | Often high impact in search/listing attention; requires binary support for PPO icon tests |
| First screenshot | High impact in search and product page scanning |
| Screenshot order | Low effort, clarifies value sequence |
| Screenshot style/message | Tests benefit vs feature, proof vs workflow, audience angle |
| App preview | Useful when motion explains value better than stills |

Do not promise lift percentages without app-specific data.

## Strategy checklist

- Goal: conversion lift, ad relevance, market launch, seasonal campaign, or feature adoption.
- Audience: one intent segment per page/treatment.
- Traffic source: Search Ads, social ads, web, influencer, owned channel, or organic test.
- Locale and country are explicit.
- Screenshots and app previews match the promise in ad/keyword copy.
- Metadata does not make claims unsupported by the app or assets.
- Existing impressions/downloads are enough to run a meaningful PPO test, or the plan acknowledges low-sample risk.
- CPP performance is measured by page views, downloads, conversion, and downstream quality, not just click volume.

## Result interpretation

When results are available:

- Check confidence, conversion rate, and confidence interval/uncertainty.
- Compare by territory, source type, device, and localization when available.
- For CPP, compare traffic quality and downstream events, subscriptions, or sales if available.
- Decide: apply winner, iterate, keep current, or run a new hypothesis.
- Do not apply a treatment if results are inconclusive or the winning segment is not the target segment.

## Output

```md
# Store Listing Test Plan

Type:
App:
Country:
Locale:
Traffic source:
Goal:
Baseline:
Success metric:

## Hypothesis
If we ..., then ..., because ...

## Current state
| Field | Value | Notes |
|---|---|---|

## Variants
| Variant | Change | Hypothesis | Assets needed |
|---|---|---|

## Screenshot/app preview sequence
| Position | Message | Visual direction | Source asset/status |
|---:|---|---|---|

## Sample and timing
- Daily impressions:
- Required sample:
- Estimated duration:
- Low-sample risk:

## Results interpretation
| Variant | Conversion | Confidence | Decision |
|---|---:|---:|---|

## Roadmap
| Month | Test | Why |
|---|---|---|

## Validation
- Correct object selected: PPO/CPP/Play experiment:
- One clear audience:
- Matches ad/keyword promise:
- Locale ready:
- Assets available:
- Review/submission needed:
- Unsupported claims removed:
- MCP fill available:
```

## Rules

- Keep each CPP/PPO variant focused on one promise.
- Do not duplicate the default page without a meaningful hypothesis.
- Do not invent performance metrics, audience data, or Search Ads results.
- For PPO, define the baseline and success metric before writing fields.
- For CPP, do not call it an A/B test unless traffic is externally randomized and measured.
- For Play Store experiments, use `android-aso`.
