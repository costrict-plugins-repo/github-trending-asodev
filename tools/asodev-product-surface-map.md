# ASO.dev Product Surface Map

Public ASO.dev docs checked on 2026-05-02 for skill coverage.

## Covered by Skills

| ASO.dev surface | Skill coverage | Notes |
|---|---|---|
| AI Companion MCP | `app-store-connect-mcp`, `tools/aso-dev-local-mcp.md` | Localhost MCP/Companion for editor reads and draft fills. |
| Developer API | `asodev-public-api`, `tools/asodev-public-api.md` | Public OpenAPI surface for developer-facing integrations; currently sparse and expected to expand. |
| Partners API | `asodev-public-api`, `keyword-research`, `keyword-coverage`, `tools/asodev-public-api.md` | Public OpenAPI surface for partner-facing integrations; current snapshot includes dictionaries and live keyword rankings. |
| Applications / Projects | `app-context`, `current-metadata-fetch`, `metadata-editor` | Project app list, pinned/unpinned apps, `.p8` API-key app discovery, app switching, base locale, bundle ID, version, and app state. |
| Metadata Editor / Bulk Editor | `current-metadata-fetch`, `metadata-editor`, `metadata-validation`, `localization-cross-localization`, `keyword-coverage`, `app-store-connect-mcp` | App Store metadata workflow for versions, localizations, keyword metrics/suggestions, validation, import/export, Fastlane, direct App Store Connect save, review submission, and AI Companion draft fills. |
| Cross Localization | `localization-cross-localization`, `keyword-coverage` | App Store cross-locales and market adaptation. |
| Review Submissions | `aso-audit`, `app-analytics`, `metadata-editor` | Recent App Review submissions, status, submitted version/platform, submission date, actors, submitted items, and future App Review messaging surface. |
| Subscriptions | `in-app-subscriptions`, `subscription-lifecycle`, `pricing-availability` | Subscription metadata, localization, lifecycle, and pricing. |
| Subscription Pricing | `pricing-availability`, `monetization-strategy` | PPP, Big Mac, Spotify/Netflix, Starbucks, Numbeo, iPhone index, fixed payout, multiplier, downloadable/applicable CSV price templates, Excel import. |
| In-App Purchases | `in-app-purchases`, `pricing-availability` | Consumable/non-consumable IAP metadata, product IDs, bulk localization, regional availability, price tiers, review notes/images, local changes, saving, and App Review submission. |
| In-App Events | `in-app-events`, `seasonal-calendar`, `app-analytics` | Event strategy, metadata, localized media, deep links, badges, audience, cost, availability, review submission, analytics, and calendar planning. |
| Screenshots and Videos | `screenshot-brief`, `cpp-ppo-pages`, `figma-json-localization` | Briefing, ordering, bulk folder upload, localized media sets, device/file detection, uploader readiness, CPP/PPO assets. |
| Figma screenshot JSON localization | `figma-json-localization`, `localization-cross-localization` | Localize Figma/ASO.dev screenshot JSON to all App Store Connect locales while preserving all system/template tags. |
| PPO / CPP | `cpp-ppo-pages`, `apple-search-ads-intelligence`, `screenshot-brief` | PPO default-page A/B tests; CPP direct-link campaign pages with localized promo text, screenshots/videos, keyword tags, analytics, and ad/keyword alignment. |
| Reviews | `reviews-ratings` | Replies, reports/complaints, CSV review analysis, sentiment, feature-request mining, rating strategy. |
| Measurements | `app-analytics` | Metrics, release markers, before/after analysis. |
| ASO Check / App Info / Global Overview | `aso-audit`, `competitor-analysis` | Full ASO health and country/localization diagnostics. |
| Changelog / Timeline | `aso-audit`, `app-analytics`, `competitor-analysis` | Historical metadata, screenshots, icons, releases, ranking context. |
| Keywords / Spy / Search Term Rank | `keyword-research`, `keyword-coverage`, `competitor-analysis` | Keyword/search query CSV analysis, keyword discovery, competitor gaps, SAP and monthly search term data. |
| Ads Intelligence | `apple-search-ads-intelligence`, `cpp-ppo-pages` | App Ads, Keyword Ads, creative/CPP analysis. |
| Security / Projects / Access | `app-context`, `app-store-connect-mcp` | Direct local requests, API keys, service accounts, proxies, permissions. |

## Public Docs Referenced

- `https://aso.dev/`
- `https://aso.dev/features/`
- `https://aso.dev/metadata/`
- `https://aso.dev/getting-started/applications/`
- `https://aso.dev/metadata/editor/`
- `https://aso.dev/metadata/bulk-editor/`
- `https://aso.dev/metadata/cross-localization/`
- `https://aso.dev/metadata/review-submissions/`
- `https://aso.dev/tools/timeline/`
- `https://aso.dev/metadata/mcp-server/`
- `https://aso.dev/metadata/editor-pricing/`
- `https://aso.dev/metadata/editor-subscriptions/`
- `https://aso.dev/metadata/editor-in-app-purchases/`
- `https://aso.dev/metadata/editor-in-app-events/`
- `https://aso.dev/metadata/editor-screenshots/`
- `https://aso.dev/metadata/ppo/`
- `https://aso.dev/metadata/cpp/`
- `https://aso.dev/tools/reviews/`
- `https://aso.dev/tools/measurements/`
- `https://aso.dev/aso/app-info/`
- `https://aso.dev/aso/aso-check/`
- `https://aso.dev/aso/app-clash/`
- `https://aso.dev/aso/spy/`
- `https://aso.dev/aso/keywords-list/`
- `https://aso.dev/aso/search-term-rank/`
- `https://aso.dev/ads/`
- `https://aso.dev/getting-started/security/`
- `https://aso.dev/getting-started/projects/`
- `https://aso.dev/blog/calendar/`
- `https://developer.aso.dev/docs/`
- `https://developer.aso.dev/openapi/developer-v1.json`
- `https://partners.aso.dev/docs/`
- `https://partners.aso.dev/openapi/partners-v1.json`

## Not Yet Modeled as Separate Skills

- Developer account operations outside the current public OpenAPI contract: certificates, identifiers, devices, profiles, beta testers.
- Google Play Console operational setup: service accounts, tracks, release rollout.
- General project sharing/access-rights administration.

Add these later only if ASO.dev AI tasks need agent instructions for those surfaces.

## Metadata Section Notes

Use these ASO.dev docs as surface-specific context:

| Docs page | Agent notes |
|---|---|
| `https://aso.dev/getting-started/applications/` | App list is project-scoped. With a `.p8` API key, ASO.dev shows apps from the Apple Developer account; app cards expose app ID, bundle ID, base localization, version, state, platform, and project pinning. |
| `https://aso.dev/metadata/editor/` | Smart App Store metadata editor: versioning, localization management, keyword metrics/suggestions, validation, import/export, Fastlane, direct App Store Connect save, review submission, and AI Companion entry point. |
| `https://aso.dev/metadata/bulk-editor/` | Bulk-edit one metadata field across all App Store localizations; useful for What's New, mass translation, keyword validation, recommendations, and translation provider workflows. |
| `https://aso.dev/metadata/cross-localization/` | Cross-localization uses additional App Store localizations indexed in a country to expand title/subtitle/keyword coverage; avoid duplicate keywords, empty localizations, cross-locale phrase assumptions, and AI claims for mainland China unless certified. |
| `https://aso.dev/metadata/review-submissions/` | Shows recent App Review submissions per app, including status, submitted version/platform, submission date, actor, and submitted items; App Review messaging is marked as coming later. |
| `https://aso.dev/tools/timeline/` | Timeline is App Store Connect API-backed release and metadata history: release dates, keyword changes, title/subtitle changes, and a limited API history for some fields. |
| `https://aso.dev/metadata/editor-subscriptions/` | Subscription editor covers subscription creation/management, durations, terms, payment frequency, automatic localization, and handoff to price editing. |
| `https://aso.dev/metadata/editor-pricing/` | Subscription price editor supports Apple price points, PPP, Big Mac, Spotify, Netflix, Starbucks, Numbeo, iPhone cost index, fixed payout, multiplier, Excel import/export, schedule changes, and per-country point editing. |
| `https://aso.dev/metadata/editor-in-app-purchases/` | IAP editor covers consumable/non-consumable products, product IDs, reference names, localization status, machine translation for names/descriptions, regional availability, price tiers, irreversible deletion, review notes/images, Promoted IAP images, local-before-save changes, saving to App Store Connect, and separate App Review submission. |
| `https://aso.dev/metadata/editor-in-app-events/` | In-App Events editor covers up to 10 events, localized event metadata/media, deep links, badges, priority, audience, cost, availability, calendar planning, review submission, and analytics. |
| `https://aso.dev/metadata/editor-screenshots/` | Bulk Screenshot and Video uploader handles localized media sets, device/file detection from folders and filenames, alphabetical ordering, videos before screenshots, individual edits, and upload troubleshooting. |
| `https://aso.dev/metadata/ppo/` | PPO runs A/B tests on the default App Store product page with up to 3 treatments and one live experiment per app version; screenshots/videos can change without app update, icon tests require bundled icons. |
| `https://aso.dev/metadata/cpp/` | CPPs are direct-link campaign pages for targeted audiences; ASO.dev adds multi-localization creation, localization copying, bulk screenshots/videos, promo text translation, keyword tags from Apple suggestions, validation, save, review, and analytics workflows. |
| `https://aso.dev/tools/reviews/` | Reviews tool supports API-key based review filtering/replies, AI-generated replies, review reporting via app-specific password, complaint modes, AI templates, and translation language switching. |
| `https://aso.dev/tools/measurements/` | Measurements uses an app-specific password for App Store metrics, pinned metrics, current-vs-previous period comparison, release markers, and metrics such as impressions, page views, downloads, sales, revenue, sessions, and active devices. |

The App Store Metadata Editor is broader than text editing. It covers:

- current and previous app versions, app version number, release type, build selection, age rating, server notifications, and submission/release actions
- editable App Store metadata fields with character counts, change highlighting, previous-version copy, translation/reverse translation, and clear/diff controls
- keyword-aware fields with keyword breakdown, rank, SAP, difficulty, total app count, suggestions, tracked keyword management, and recommendations from current app keywords, saved keyword lists, and competitors
- localization management: add/delete localizations, set primary localization, auto-localize from the base localization, and bulk-edit the same field across all localizations
- validation before saving, including App Store Connect compliance errors/warnings and save-only-valid-localizations behavior
- direct save to App Store Connect, review submission/cancel/publish workflow, and data refresh from App Store Connect
- metadata import/export through zip, Fastlane, Excel, and Excel reports, plus copying metadata from another version, platform, or app

Agent behavior: use `metadata-editor` for text/ASO work, `metadata-validation` before fills/saves, `current-metadata-fetch` for active state, `keyword-research`/`keyword-coverage` for keyword decisions, and `app-store-connect-mcp` only when the user explicitly wants ASO.dev drafts filled.
