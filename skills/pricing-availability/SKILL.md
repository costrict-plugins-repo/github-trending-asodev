---
name: pricing-availability
description: "Use for App Store app, IAP, and subscription pricing or availability: price points, territory rollout, scheduled changes, regional availability, offer pricing, ASO.dev CSV price templates, validation, and ASO.dev local MCP fill when that surface is available."
metadata:
  version: 1.0.0
---

# Pricing and Availability

Use this skill for price points, price schedules, territory availability, regional rollout, app pricing, IAP pricing, subscription pricing, intro/promo/win-back offer pricing, CSV price templates, and availability audits.

## MCP workflow

1. Use `app-store-connect-mcp`.
2. Read current prices, territories, schedules, and product/subscription relationships before proposing changes.
3. Treat price and availability writes as high impact: produce a diff and require explicit user intent to apply.
4. Validate dates, countries, currency/price point assumptions, product IDs, and affected territories before writing.
5. Pricing tools are planned. If pricing tools are not exposed by the active MCP yet, produce a save-ready plan and say live fill is unavailable in the current MCP surface.

## Required snapshot

- Entity type: app, IAP, subscription, offer, or territory availability
- Entity ID/product ID/subscription ID
- Current price point(s)
- Current territories
- Scheduled price changes
- Start/end dates
- Offer/trial details, if relevant
- Status and editability

## ASO.dev pricing methods

When using ASO.dev pricing docs or exports, identify which pricing method is intended:

| Method | Use when |
|---|---|
| Apple price points | The user wants native App Store tier distribution without extra adjustment |
| Big Mac Index | Broad purchasing-power alignment with wide country coverage |
| Purchasing Power Parity | More formal country-level affordability strategy, often useful for B2B/long-term pricing |
| Spotify / Netflix index | Benchmarking against familiar subscription services |
| Starbucks / Numbeo / iPhone index | Audience-specific affordability benchmarks |
| Fixed payout amount | The user needs predictable net/gross proceeds by country |
| Custom multiplier | The user has their own country coefficients |
| CSV price template | The user wants to download, edit, reuse, or apply an ASO.dev price template |
| Imported Excel prices | The user has a preapproved spreadsheet price list |

Also check whether the task is a recalculation, a scheduled/rescheduled price change, or a price point editor/import/export workflow.

## CSV price templates

ASO.dev pricing can use downloadable CSV templates that are edited and applied as reusable price plans. A valid workflow is to upload/open an existing CSV template, adjust only the rows/columns needed for the user's pricing task, save it as a new template, and apply that new template to prices.

When the user mentions a template:

1. Identify the entity: subscription, IAP, paid app, offer, or territory availability.
2. Ask for or read the source CSV template: downloaded from ASO.dev, previously approved, or uploaded by the user.
3. Clarify whether to modify in place or create a new derived template. Prefer a new derived template for reusable pricing plans.
4. Treat the CSV as structured data, not prose. Preserve headers, country/storefront identifiers, product identifiers, price point IDs, currencies, effective dates, and empty/locked columns unless the user explicitly asks otherwise.
5. Change only the requested storefronts/products/effective dates/price columns.
6. Validate the template schema and row count before applying it.
7. Produce a diff by storefront/product/effective date.
8. Do a dry-run style review: invalid price points, unsupported territories, missing required columns, duplicate rows, date conflicts, subscriber impact.
9. Apply/import the new template only after explicit user approval.

Template checklist:

- Source: downloaded ASO.dev template / previous approved template / uploaded user CSV
- Output: new template name / modified template
- Entity IDs and storefront identifiers preserved
- Price point IDs or values match App Store-supported options
- Effective dates and schedules are clear
- Existing scheduled changes are not silently overwritten
- Tax/VAT/net/gross assumptions are stated if present
- Output can be imported back into ASO.dev without manual reformatting

## Output

```md
# Pricing and Availability Plan

Entity:
ID:
Country/territories:
Status:
Template source:
Template output:

## Current state
| Item | Value | Notes |
|---|---|---|

## Proposed change
| Scope | Current | Proposed | Effective date | Reason |
|---|---|---|---|---|

## Risk check
- Revenue impact:
- Existing subscribers affected:
- Territory removals:
- Scheduled changes conflict:
- CSV schema valid:
- Import/apply dry run:
- New template ready:
- User approval needed before write:
- MCP fill available:
```

## Rules

- Do not invent price points, currencies, exchange rates, tax treatment, or territory availability.
- Do not edit CSV template identifiers, headers, or locked/system columns unless explicitly requested.
- Do not apply a modified CSV template without showing the diff and getting explicit approval.
- Do not remove a territory or raise a price unless the user explicitly requested it.
- Mention subscriber impact when subscription prices change.
- Keep marketing wording separate from actual pricing configuration.
