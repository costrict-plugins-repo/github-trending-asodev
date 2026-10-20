---
name: metadata-validation
description: "Use to validate ASO.dev Apple/Google metadata, In-App Event drafts, nominations, review replies, or review complaint drafts before filling them through the AI Companion MCP."
metadata:
  version: 1.0.0
---

# Metadata Validation

Validate drafts before they are filled into ASO.dev.

## MCP workflow

Use `validate_ai_companion_data`.

Targets:

- `appMetadata`
- `googleMetadata`
- `appEvent`
- `nomination`
- `review`
- `reviewList`

Pass `pageId` and `reviewId` only when needed. Pass `data` when validating a draft payload; omit `data` to validate the active page.

## Manual checks

- Character limits
- Required fields
- Locale scope
- Apple keyword format
- Unsupported claims
- Competitor trademarks
- Pricing, trial, subscription, medical, financial, legal, privacy, and safety claims
- Placeholder/URL corruption
- Review response tone and privacy

## Output

```md
# Validation Report

Status: Pass / Pass with warnings / Fail
Target:

## Errors
| Field | Issue | Fix |
|---|---|---|

## Warnings
| Field | Issue | Safer action |
|---|---|---|

## Ready to fill
Yes/No
```

## Rules

- Separate blocking errors from quality suggestions.
- Do not rewrite all fields when the user asked only to validate.
- If MCP validation disagrees with your manual check, surface both and choose the stricter result.
