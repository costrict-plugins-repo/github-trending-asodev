---
name: metadata-editor
description: "Use when the user wants to write, rewrite, optimize, compare, validate, or bulk-fill Apple App Store or Google Play metadata in ASO.dev: title, subtitle, keyword field, description, promotional text, short description, full description, or What's New."
metadata:
  version: 1.0.0
---

# Metadata Optimization

Write App Store and Google Play metadata that balances search visibility, conversion, clarity, and compliance.

## Workflow

1. Use `current-metadata-fetch` to read current values.
2. Use `get_project_context` if positioning, tone, audience, or forbidden claims are relevant.
3. Identify platform, country, locale, target keywords, and page type: default listing, release metadata, CPP/PPO draft, or Google listing.
4. If target keywords are missing, use `keyword-research` first; use `keyword-coverage` to distribute selected keywords.
5. Draft only requested locales and fields.
6. Validate with `validate_ai_companion_data` using `appMetadata` or `googleMetadata`.
7. If the user asked to apply/fill, use `bulk_fill` or `bulk_fill_google`.

## Quality gate

- Recommended fields must be copy-paste ready: no placeholders, no unresolved brackets, exact character counts, and platform-specific limits respected.
- If app positioning, audience, monetization, proof, support URLs, or target keywords are missing, ask or mark the gap in analysis; do not invent it inside final metadata.
- Provide alternatives for high-impact fields, but clearly label one recommended option.
- Treat implementation steps separately from metadata copy so the user can paste fields without cleanup.

## ASO.dev editor context

When ASO.dev editor data is available, use it instead of guessing:

- Smart Metadata Editor: current values, length checks, preview, previous-version reuse/rollback, import/export, Fastlane, direct App Store Connect save, and review submission context.
- Bulk Editor: all localizations, duplicate detection, copy from past versions, AI/Google/DeepL translation state.
- Cross Localization: title/subtitle/keyword coverage by country-localization combination.
- Timeline/Changelog: previous metadata and release history for before/after comparisons.
- Version workflow: app version, release type, build selection, age rating, server notifications, primary localization, and localization add/delete state may affect what is safe to draft or fill.

## Platform limits

### Apple App Store

| Field | Limit | Search role |
|---|---:|---|
| `title` | 30 | Indexed, highest weight |
| `subtitle` | 30 | Indexed |
| `keywords` | 100 joined chars | Indexed, hidden |
| `promotionalText` | 170 | Conversion, not indexed, can change without app version |
| `description` | 4000 | Conversion, not indexed by App Store search |
| `whatsNew` | 4000 | Update communication |

### Google Play

| Field | Limit | Search role |
|---|---:|---|
| `title` | 30 | Indexed |
| `shortDescription` | 80 | Indexed and visible |
| `fullDescription` | 4000 | Indexed and conversion |

## Optimization framework

### Title

- Include the strongest target keyword naturally when possible.
- Lead with brand only when it is a known brand with meaningful search demand or trust value.
- For lesser-known apps, lead with the most important functional keyword/intent and place the brand at the end when brand inclusion is still needed; this helps App Store suggestions and phrases form from higher-priority keywords first.
- Keep it readable in search results.
- Avoid wasting characters on legal marks unless required.
- Provide 3 options when optimizing a title.

Good structures:

- `Primary Keyword: Benefit Phrase`
- `Primary Keyword - Secondary Intent`
- `Primary Keyword by Brand`
- `Known Brand: Primary Keyword`

### Apple subtitle

- Add secondary keywords and benefit language.
- Do not repeat title keyword words unless there is a clear strategic reason.
- Make it conversion-friendly, not just a keyword list.
- Provide 3 options when optimizing a subtitle.

### Apple keyword field

- Comma-separated with no spaces.
- Treat as an array internally for MCP payloads.
- Do not repeat words already in title/subtitle unless deliberate.
- Prefer singular forms unless data supports plural.
- Do not include app name, competitor brands, `app`, or `free`.
- Prioritize by relevance first, then popularity/opportunity.

### Apple description

- App Store search does not index it; write primarily for conversion.
- The first 2-3 lines should communicate the core user benefit before users tap "more".
- Use benefits before feature lists.
- Include only real proof: ratings, awards, press, usage numbers, or testimonials the user provides.
- Do not add emoji unless the brand tone supports it.

Suggested structure:

1. Hook
2. Main benefits
3. Key features
4. How it works
5. Trust/proof
6. Call to action

### Google description

- Balance conversion and natural keyword coverage.
- Front-load the most relevant terms in the first paragraph; the first ~250 characters should stand alone before expansion.
- Use variants and synonyms; do not keyword-stuff.
- Use bullets and line breaks for scanning.
- Keep density natural and readable.

### Promotional text

Use for timely messaging:

- feature launches
- seasonal campaigns
- In-App Events
- limited-time content
- real awards or milestones

Do not hardcode prices, dates, discounts, or availability unless current data or the user confirms them.

## Apple rules

- Apple keywords should be comma-separated without spaces.
- Avoid duplicate keyword words across title, subtitle, and keywords unless deliberate.
- Do not add competitor trademarks or unsupported claims.
- Do not change URLs, privacy text, or legal copy unless explicitly requested.
- Flag weak hooks such as "Welcome to..." or generic "best app for..." claims.
- Flag unused character budget only when adding characters would improve relevance or conversion.

## Output

```md
# Metadata Optimization Package

App:
Platform:
Country:
Locales:
Target keywords:

## Diagnosis
| Locale | Field | Issue | Fix |
|---|---|---|---|

## Recommended metadata
### locale-code
| Field | Recommended | Characters | Keywords covered | Rationale |
|---|---|---:|---|---|

## Alternatives
| Field | Option | Copy | Characters | Angle |
|---|---|---|---:|---|

## Keyword coverage matrix
| Keyword | Title | Subtitle/short description | Keyword field | Description | Notes |
|---|---|---|---|---|---|

## Before/after
| Field | Current | Recommended | Improvement |
|---|---|---|---|

## Validation
- Character limits:
- Keyword duplication:
- Keyword research source:
- Unsupported claims:
- URLs/privacy/legal unchanged:
- MCP validation:
- Ready for `bulk_fill`:
```

## Fill payload rule

When filling Apple metadata, send:

```json
{
  "locales": ["en-US"],
  "fields": ["title", "subtitle", "keywords"],
  "data": {
    "en-US": {
      "title": "...",
      "subtitle": "...",
      "keywords": ["keyword", "keyword2"]
    }
  }
}
```
