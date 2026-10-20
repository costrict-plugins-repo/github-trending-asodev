---
name: android-aso
description: "Use when the user wants Google Play Store or Android ASO: Play listing title, short description, full description, keyword strategy, feature graphic, screenshots, ratings/reviews, Play Store Experiments, localization, or Google Play-specific metadata via ASO.dev."
metadata:
  version: 1.0.0
---

# Android ASO

Use this for Google Play Store optimization. Google Play differs from iOS: full descriptions are indexed, there is no hidden keyword field, and store listing experiments are native in Play Console.

## MCP workflow

1. Use `app-store-connect-mcp`.
2. Read current Play metadata with `get_google_editor_data`.
3. Read project context when positioning, audience, category, or monetization matters.
4. Draft Google-specific metadata and creative recommendations.
5. Validate with `validate_ai_companion_data` target `googleMetadata`.
6. If asked to apply, fill with `bulk_fill_google`.

## Google Play vs iOS

| Factor | Google Play | Apple App Store |
|---|---|---|
| Indexed fields | Title, short description, full description | Title, subtitle, keyword field |
| Hidden keyword field | No | Yes |
| Full description | Indexed and conversion | Conversion-focused |
| Experiments | Store Listing Experiments | PPO |
| Feature graphic | Important Play creative asset | Not used |
| Ratings | Long-running listing signal | App Store rating/review signal |

## Field limits

| Field | Limit | Role |
|---|---:|---|
| Title | 30 | Highest keyword + conversion weight |
| Short description | 80 | Search result copy and indexed relevance |
| Full description | 4000 | Indexed relevance + conversion |

## Metadata strategy

### Title

- Use brand plus one strong keyword/descriptor when natural.
- Do not keyword-stuff or make unverifiable "best" claims.
- Keep readable in search results.

### Short description

- Use one compelling sentence.
- Include 1-3 high-priority terms naturally.
- Do not simply repeat the title.
- Make the value clear without tapping through.

### Full description

Recommended structure:

1. Hook paragraph with core value and primary keyword early; the first ~250 characters should work before expansion.
2. Benefit-led feature bullets.
3. Trust/proof only if real.
4. How it works or use cases.
5. CTA.
6. Natural keyword variants and long-tail terms.

Keyword guidance:

- Use exact match, variants, and synonyms naturally.
- Long-tail phrases can work because full description is indexed.
- Do not create a visible keyword dump.
- If keyword data is missing, use `keyword-coverage` before final copy.

## Creative strategy

- Feature graphic: communicate the core use case quickly; avoid tiny text; keep it aligned with title and short description.
- Screenshots: at least 2 are required; first 2-3 should explain value, proof, and key workflow.
- Use `screenshot-brief` for screenshot copy and creative direction.
- Keep Play screenshots and feature graphic consistent with metadata claims.

## Ratings and reviews

- Low ratings hurt conversion and may affect visibility.
- Use `reviews-ratings` for review analysis and replies.
- Prompt users after positive value moments, not on cold start or after errors.
- Do not incentivize ratings.

## Play Store Experiments

Use Play Console experiments for:

- icon
- feature graphic
- screenshots
- short description
- full description

Test one primary hypothesis at a time. Keep locale, traffic source, and seasonality in mind when interpreting results.

## Localization

Google Play indexes listing text per language. Do not auto-translate keywords. Use `localization-cross-localization` for market choice and local keyword adaptation.

## Output

```md
# Google Play ASO Plan

App:
Package:
Country:
Locale:
Category:
Target keywords:

## Audit
| Area | Score | Issue | Fix |
|---|---:|---|---|

## Listing draft
### Title
`...`
Characters:

### Short description
`...`
Characters:

### Full description
...
Characters:

## Keyword coverage
| Keyword | Title | Short description | Full description | Notes |
|---|---|---|---|---|

## Creative recommendations
- Feature graphic:
- Screenshot sequence:
- Experiment idea:

## Validation
- Character limits:
- Keyword stuffing avoided:
- Unsupported claims removed:
- Localization checked:
- MCP validation:
- Ready for `bulk_fill_google`:
```

## Rules

- Do not invent Play Console data, rankings, install volume, ratings, or experiment results.
- Do not use iOS-only keyword-field logic for Google Play.
- Do not recommend review incentives or deceptive rating prompts.
- Keep full description readable; indexed does not mean stuffed.
