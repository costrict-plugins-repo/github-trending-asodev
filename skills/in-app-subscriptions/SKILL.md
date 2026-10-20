---
name: in-app-subscriptions
description: "Use for App Store auto-renewable subscriptions and subscription groups: product names, descriptions, trial/offer wording, localization, pricing/availability notes, validation, and ASO.dev local MCP fill when that surface is available."
metadata:
  version: 1.0.0
---

# In-App Subscriptions

Use this skill for auto-renewable subscriptions, subscription groups, trials, intro offers, promotional offers, win-back offers, and plan metadata.

## MCP workflow

1. Use `app-store-connect-mcp`.
2. Read the subscription group and subscription products before editing.
3. Preserve product IDs, group IDs, duration, level, price, territories, trial/offer configuration, and review status unless explicitly asked to change them.
4. Validate draft data before fill/update.
5. Subscription localization tools are planned. If subscription tools are not exposed by the active MCP yet, produce a save-ready diff and say live fill is unavailable in the current MCP surface.

## Required snapshot

- Subscription group ID/name/display name
- Product ID
- Reference name
- Duration
- Display name and description by locale
- Price and territories
- Free trial, intro offer, promo offer, win-back offer
- Upgrade/downgrade relationship
- Review screenshot/image
- Status

## ASO.dev subscription workflow

When ASO.dev subscription data or docs are relevant, account for:

- Automatic localization of subscription descriptions, terms, and plan copy across supported languages.
- Subscription group and product relationship, including upgrade/downgrade levels.
- Terms, payment frequency, trial, intro offer, promo offer, and win-back offer wording.
- Transition to the price editor for country-level pricing and purchasing-power adjustments.
- Draft/local changes versus saved or submitted App Store Connect changes.

## Copy rules

- Make recurring access clear.
- Never call a subscription “lifetime”.
- Do not say “free” without trial/renewal context.
- Do not hardcode prices in descriptions unless the user specifically requests it.
- Do not present an introductory offer as a permanent discount.

## Output

```md
# Subscription Update

Subscription group:
Product ID:
Duration:
Country:
Locale:
Status:

## Current state
| Field | Current | Issue |
|---|---|---|

## Proposed metadata
### Group display name
`...`
Characters:

### Product display name
`...`
Characters:

### Description
`...`
Characters:

## Plan naming system
| Product ID | Current | Proposed | Reason |
|---|---|---|---|

## Validation
- Recurring nature clear:
- Duration clear:
- Trial/offer wording safe:
- Price/availability unchanged unless requested:
- Localizations checked:
- MCP fill available:
```
