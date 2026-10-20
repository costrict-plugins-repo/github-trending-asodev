---
name: in-app-purchases
description: "Use for App Store consumable and non-consumable In-App Purchases: metadata, localization, pricing/availability notes, promoted IAP readiness, validation, and ASO.dev local MCP fill when that surface is available."
metadata:
  version: 1.0.0
---

# In-App Purchases

Use this skill for consumable and non-consumable IAPs. Use `in-app-subscriptions` for auto-renewable subscriptions and non-renewing subscription-like products.

## MCP workflow

1. Use `app-store-connect-mcp`.
2. Read the product by product ID or active editor/page before editing.
3. Preserve product ID, type, reference name, entitlement, quantity, price, availability, and review status unless the user explicitly asks to change them.
4. Validate draft data before fill/update.
5. IAP localization tools are planned. If the active MCP does not expose IAP tools yet, produce a save-ready diff and say live fill is unavailable in the current MCP surface.

## Required snapshot

- Product ID
- Type: consumable or non-consumable
- Reference name
- Display name and description by locale
- Price or price tier
- Availability/territories
- Review screenshot/image
- Promoted IAP image, if any
- Status

## ASO.dev editor surfaces

Account for ASO.dev IAP editor concepts when present:

- Product type: consumable or non-consumable. Auto-renewable subscriptions belong in `in-app-subscriptions`; non-renewing subscription-like access should be handled as a consumable-style IAP only when that matches the App Store configuration.
- Apple limits: IAPs go through separate review, every purchase needs localization, prices use price tiers, availability can be country-restricted, changes do not require an app update, and apps can have up to 10,000 IAPs.
- IAP edit card: reference name, product ID, localizations, review notes, App Review image, Promoted IAP image, and missing-metadata status.
- Bulk localization: create/manage localizations for names and descriptions across supported locales; track character counters, readiness, and per-locale status.
- Action panel: regional availability, price tier editor, delete purchase, and notes/images for App Review.
- Review assets: IAP review images are required; review notes should explain the purchase clearly for App Review.
- Local changes: ASO.dev applies edits locally first. App Store Connect is unchanged until Save; after Save, the IAP can be submitted for review if required fields are complete.

## Copy rules

- Consumables must state what is consumed or topped up.
- Non-consumables must state the permanent unlock/value.
- Do not invent quantities, features, duration, price, or availability.
- Do not use “lifetime” unless the product is truly permanent.
- Product IDs and reference names are internal; do not optimize them as user copy.
- Keep review notes factual and reviewer-facing, not marketing copy.
- Treat deletion as irreversible and never recommend it without explicit user intent.
- Treat price, availability, and submission actions as high impact; produce a diff and ask for explicit confirmation before applying.

## Output

```md
# In-App Purchase Update

Product ID:
Type:
Country:
Locale:
Status:

## Current state
| Field | Current | Issue |
|---|---|---|

## Proposed metadata
### Display name
`...`
Characters:

### Description
`...`
Characters:

## Diff
| Field | Current | Proposed | Reason |
|---|---|---|---|

## Validation
- Entitlement clear:
- Product type matches copy:
- Price/availability unchanged unless requested:
- Review asset present:
- Review notes needed:
- Promoted IAP ready:
- Local changes vs saved changes clear:
- Submit for review needed:
- MCP fill available:
```
