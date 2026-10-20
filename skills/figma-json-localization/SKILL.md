---
name: figma-json-localization
description: "Use when the user wants to localize a Figma or ASO.dev screenshot JSON file into all App Store Connect localizations, translate screenshot/UI text keys, use description/context fields, respect length limits, preserve JSON structure, and keep all system/template tags such as asodev{...}, {placeholder}, {{token}}, or <tag> unchanged."
metadata:
  version: 1.0.0
---

# Figma JSON Localization

Localize Figma/ASO.dev screenshot JSON while preserving structure, keys, IDs, placeholders, and every system/template tag.

## Locale target

Default target is all current App Store Connect localizations supported by ASO.dev. Use these ASO.dev-style locale codes unless the JSON already uses another code format:

```text
AR_SA,BN,CA,HR,CS,DA,NL_NL,EN_GB,EN_CA,EN_US,EN_AU,FI,FR_CA,FR_FR,DE_DE,EL,GU,HE,HI,HU,ID,IT,JA,KN,KO,MS,ML,MR,NO,OR,PL,PT_BR,PT_PT,PA,RO,RU,ZH_HANS,SK,SL,ES_ES,ES_MX,SV,TA,TE,TH,ZH_HANT,TR,UK,UR,VI
```

If the user asks for Apple API shortcodes, convert only the code format, for example `EN_US` -> `en-US`, `ZH_HANS` -> `zh-Hans`, `PT_BR` -> `pt-BR`.

When exact locale support matters, verify against current Apple/ASO.dev docs:

- `https://developer.apple.com/news/?id=97t4mt64`
- `https://aso.dev/app-store-connect/app-store-localizations/`

## Workflow

1. Parse JSON with a real JSON parser. Do not use regex-only editing for the whole file.
2. Detect schema:
   - locale-rooted: `{ "EN_US": { ... } }`
   - key-rooted: `{ "headline_1": { "EN_US": "..." } }`
   - flat source JSON: `{ "headline_1": "..." }`
   - array/layer JSON: objects with text fields such as `text`, `value`, `characters`, `label`, `headline`.
3. Identify the source locale. Prefer `EN_US`, then `EN_GB`, then the first complete locale; ask only if ambiguous.
4. Decide which string values are translatable. Usually translate visible screenshot copy, UI labels, CTAs, feature text, and short descriptions.
5. Read sibling context fields before translating, especially `description`, `context`, `notes`, `comment`, `meaning`, and `usage`.
6. Read sibling length fields before translating, especially `maxLength`, `maxChars`, `charLimit`, `limit`, `minLength`, `maxLines`, `lineLimit`, and nested `constraints`.
7. Do not translate JSON object keys, IDs, layer IDs, frame names, asset names, file paths, URLs, color values, numbers, booleans, or nulls unless the user explicitly says they are visible copy.
8. Generate missing target locales and preserve existing completed locales unless the user asks to overwrite them.
9. Return valid JSON with the same schema and stable ordering.

## Context and limits

Many ASO.dev/Figma JSON files include non-visible fields that explain what a text is for. Treat `description`, `context`, `notes`, `comment`, `meaning`, and `usage` as translation context by default, not as copy to localize.

Only translate a `description` value when the schema clearly makes it visible copy, for example App Store metadata `description`, event `longDescription`, Google Play `fullDescription`, or when the user explicitly asks to translate descriptions.

If a translatable node has a length constraint:

- Treat the explicit JSON limit as authoritative.
- Produce translations that fit the limit; prefer concise transcreation over literal wording.
- If a locale cannot fit naturally, provide the best fitting version and flag it for native review.
- Count visible text after removing protected technical tags unless the JSON explicitly defines a raw-string limit.
- Preserve line breaks if they affect Figma layout, and honor `maxLines` or `lineLimit` when present.

## Protected tokens

Never change any tag or placeholder. Treat tags as protected technical markup, not translatable copy.

Always preserve these byte-for-byte:

```text
asodev{anything inside}
name{anything inside}
{placeholder}
{{token}}
${token}
<tag>
</tag>
<tag attr="value">
<br/>
```

Before translating any string:

1. Extract protected substrings first, including system tags, HTML/XML-like tags, ICU variables, template tokens, and ASO.dev tags.
2. Replace each with a temporary token.
3. Translate the remaining text.
4. Restore each original protected substring byte-for-byte.

Also preserve:

- ASO.dev/system tags: `asodev{...}` and any other `tagName{...}` pattern
- ICU placeholders: `{count}`, `{name}`, `{value, plural, ...}`
- printf/template placeholders: `%@`, `%s`, `%d`, `${name}`, `{{name}}`
- HTML/XML-like tags: `<b>`, `</b>`, `<br/>`, `<span class="...">`
- line breaks and intentional spacing
- emoji, trademark symbols, product names, and brand names unless the user asks to localize them

## Translation rules

- Translate intent, not word-for-word text.
- Keep screenshot copy short enough for the same text boxes.
- Use context-only `description` fields to understand tone, screen, audience, and product meaning.
- Prefer native App Store marketing style over literal UI translation.
- Keep CTA verbs natural for each language.
- Preserve capitalization patterns only when they are part of the brand or design.
- For languages with longer text, produce concise alternatives rather than overflowing.
- Mark locales needing native review, especially Arabic, Hebrew, Japanese, Korean, Chinese, Thai, Indic languages, and right-to-left layouts.

## QA

Check before returning:

- JSON parses.
- Every target locale exists.
- No tag or placeholder changed, removed, duplicated incorrectly, or translated.
- All placeholders have identical names/counts before and after translation.
- Every translated value fits its explicit character and line limits.
- Existing non-target fields are unchanged.
- Empty source strings remain empty unless the user asks to fill them.
- RTL locales are flagged for layout review.
- Long translations are flagged for Figma text-box review.

## Output

````md
# Figma JSON Localization

Source locale:
Target locales:
Schema:

## Changes
| Key/path | Locales generated | Limit | Notes |
|---|---:|---:|---|

## Protected-token QA
| Token type | Status | Notes |
|---|---|---|

## Layout QA
| Locale | Key/path | Limit risk | Recommendation |
|---|---|---|---|

## JSON
```json
...
```
````

## Rules

- Do not translate, normalize, reorder, or rewrite tags or placeholders.
- Do not change JSON keys unless the user explicitly asks for a schema migration.
- Do not drop unknown fields.
- Do not overwrite existing localized values unless requested.
- If the JSON is too large to show fully, write the updated file and summarize changed paths.
