---
name: localization-cross-localization
description: "Use when the user wants to localize App Store or Google Play metadata, translate/adapt listings, expand to international markets, prioritize countries, adapt local keywords, localize screenshots, or use App Store cross-localization strategy."
metadata:
  version: 1.0.0
---

# Localization and Cross-Localization

Localize metadata and optimize country-level keyword coverage. Treat localization as market adaptation, not literal translation.

## Workflow

1. Use `current-metadata-fetch` for current localizations.
2. Read project context when available: current markets, app UI languages, audience, monetization, and brand tone.
3. Identify whether the app UI/content is localized or only the store listing is localized.
4. Prioritize target countries and locales.
5. List relevant App Store localizations for each country, including cross-localization opportunities.
6. Research or request local keyword data; do not translate English keywords directly.
7. Assign a keyword theme per locale.
8. Adapt metadata, screenshots, promotional text, and What's New.
9. Validate character limits, placeholders, URLs, legal text, and native-review needs.

## ASO.dev localization tooling

Use these ASO.dev concepts when available:

- Cross Localization: one table for App Store localizations; optimize titles, subtitles, and keywords by country/localization coverage.
- Bulk Editor: translate or copy fields across many locales and detect duplicates.
- App localization tools: `.arb`, `.strings`, and `.xcstrings` may be relevant when the user asks for app UI strings, not only store listing metadata.
- Translation providers can include Google Translate, DeepL, OpenAI, Claude, or DeepSeek depending on the user's configured ASO.dev settings.

Store listing localization and app UI string localization are related but different tasks. Do not imply the app UI is localized just because the store listing is localized.

## Market prioritization

Score markets directionally. Do not invent market size, ARPU, or competitor data.

| Factor | What to inspect |
|---|---|
| Market size | App category demand, iOS/Android presence, current traffic |
| Competition | Localized competitors, keyword difficulty, category saturation |
| Effort | Language complexity, UI readiness, screenshot/content work |
| Revenue potential | Paid conversion, subscription/IAP fit, purchasing power |
| Strategic fit | Local need, seasonality, cultural fit, support capacity |

Common expansion starting points:

- English variants: US, UK, Canada, Australia
- Major EU: Germany, France, Spain, Italy, Netherlands
- High-value Asia: Japan, South Korea
- Growth markets: Brazil, Mexico, India, Indonesia, Turkey, Saudi Arabia
- China requires extra regulatory and product review; do not treat it as a simple translation project.

## Keywords are not translations

Never assume translated keywords are good ASO keywords.

For each market:

- Use local seed terms and autocomplete/search data when available.
- Check local competitors and category wording.
- Adapt concepts, not words.
- Preserve brand/product names intentionally.
- Avoid duplicated keyword coverage across title, subtitle, and keyword field unless deliberate.

Examples of concept adaptation:

- English "budget tracker" may become German "Haushaltsbuch" or Japanese "家計簿" depending on search behavior.
- English "planner" may map to task, calendar, habit, or study terms by market and app category.

## Cultural adaptation checklist

| Element | Check |
|---|---|
| Screenshots | UI language, text overlays, currency, dates, names, devices |
| Tone | Formal/informal, directness, emotional intensity |
| Imagery | Local relevance, diversity, taboo/sensitive symbols |
| Colors | Cultural associations and accessibility |
| Social proof | Local press, local users, local ratings only if true |
| Pricing | Local expectations and storefront price consistency |
| Legal/privacy | Required links, claims, regulated category wording |

## Metadata checklist

For each target locale:

- Title/name within limit
- Subtitle/short description within limit
- Apple keyword field is locally researched and under 100 joined characters
- Description is culturally adapted, not word-for-word translated
- Promotional text matches local season/event if used
- What's New is localized for each release
- Screenshots/app preview text match the localized listing
- Native speaker or local ASO review marked when needed

## Rules

- Translate intent, not words.
- Do not blindly copy English keywords.
- Preserve brand names, placeholders, product names, URLs, and legal text.
- Avoid repeated keywords across fields/locales unless strategically required.
- Mark locales needing native speaker review.
- Do not localize listing promises beyond what the app UI/content supports.
- Do not invent local competitors, keyword volume, market score, or revenue impact.
- For regulated categories, flag local compliance review.

## Output

```md
# Localization and Cross-Localization Plan

App:
Target countries:
Current localizations:
App UI/content localized:

## Market prioritization
| Market | Locale(s) | Size | Competition | Effort | Revenue fit | Priority |
|---|---|---|---|---|---|---|

## Current issues
| Locale | Issue | Fix |
|---|---|---|

## Keyword theme by locale
| Locale | Theme | Primary keywords | Avoid |
|---|---|---|---|

## Localized metadata
### locale-code
- Title:
- Subtitle:
- Keywords:
- Promotional text:
- Description notes:
- Screenshot notes:
- Native review needed:

## Cultural notes
| Market | Adaptation | Risk |
|---|---|---|

## Validation
- Character limits:
- Local keyword research:
- Placeholder/URL safety:
- App UI support:
- Translation provider/source:
- Native review:
```
