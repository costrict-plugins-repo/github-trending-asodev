# ASO.dev Local AI Companion MCP

This is the local MCP/Companion contract used by ASO.dev skills when they need live data from the active ASO.dev editor.

The companion runs locally at:

- `http://localhost:42111`
- `http://127.0.0.1:42111`

The default port is `42111`, but ASO.dev settings may allow the user to change it. If a connection fails, ask the user to confirm the active AI Companion port and copied config.

This localhost surface is not the ASO.dev product API. Do not infer future product API endpoints, auth, payloads, or behavior from this MCP server. Public Developer API and Partners API notes live in `tools/asodev-public-api.md`.

## MCP Tools

Prefer MCP tools when the agent can call them directly.

| Domain | Read | Fill/update draft |
|---|---|---|
| Apple metadata | `get_editor_data` | `bulk_fill` |
| Google metadata | `get_google_editor_data` | `bulk_fill_google` |
| Featuring nomination | `get_nomination_data` | `fill_nomination` |
| In-App Event | `get_app_event_data` | `fill_app_event` |
| Single review | `get_review_data` | `fill_review` |
| Review list | `get_reviews_data` | `fill_reviews` |
| Project context | `get_project_context` | `save_project_context` |
| Validation | `validate_ai_companion_data` | none |

The `fill_*` tools fill ASO.dev drafts. They do not submit to App Store Connect unless a separate tool explicitly says it submits.

## Localhost HTTP Endpoints

Use these only when the agent cannot call MCP tools but can call the local companion HTTP endpoints.

| Domain | Read endpoint | Fill endpoint |
|---|---|---|
| Apple metadata | `POST /apple/metadata/editor/get-data` | `POST /apple/metadata/editor/bulk-fill` |
| Google metadata | `POST /google/metadata/editor/get-data` | `POST /google/metadata/editor/bulk-fill` |
| Nomination | `POST /apple/nominations/get-data` | `POST /apple/nominations/fill` |
| In-App Event | `POST /apple/app-events/get-data` | `POST /apple/app-events/fill` |
| Single review | `POST /apple/reviews/get-data` | `POST /apple/reviews/fill` |
| Review list | `POST /apple/reviews/get-list-data` | `POST /apple/reviews/fill-list` |
| Project context | `POST /project/context/get` | `POST /project/context/save` |
| Validation | `POST /ai-companion/validate` | none |

Utility endpoints:

- `GET /status`
- `GET /openapi.json`

Required local header: `X-Client-Secret`.

For raw MCP JSON-RPC, initialize first, keep `MCP-Session-Id`, then call `tools/list` and `tools/call`.

Public docs may contain legacy HTTP examples such as `/apple/metadata/editor/get` or `bulk_fill`. Prefer the active local `GET /openapi.json` and MCP `tools/list` as the source of truth for the running build.

## Standard Workflow

1. Read the active page/entity with the matching `get_*` operation.
2. Read `get_project_context` when positioning, tone, support policy, review policy, or brand constraints matter.
3. Draft only requested fields.
4. Validate with `validate_ai_companion_data` before any fill.
5. Fill only when the user explicitly asks to apply, fill, update, save a draft, or generate drafts in the editor.
6. Summarize changed fields and fields intentionally left untouched.

## Common Arguments

- `pageId`: optional. Omit it to use the active ASO.dev page.
- `locales`: locale codes such as `["en-US", "de-DE"]`.
- `fields`: field names to read/fill. Omit to read all supported fields.
- `country`: Apple metadata cross-localization country, for example `US`.
- `asoOnly`: Apple metadata boolean for title/subtitle/keywords only.
- `reviewId`: optional for review operations. Omit it to use the active review card.

## Apple Metadata

Apple localization fields:

- `title`
- `subtitle`
- `description`
- `promotionalText`
- `whatsNew`
- `marketingUrl`
- `supportUrl`
- `privacyPolicyUrl`
- `privacyChoicesUrl`
- `privacyPolicyText`
- `keywords` as an array of strings

Apple fill payload:

```json
{
  "locales": ["en-US"],
  "fields": ["title", "subtitle", "keywords"],
  "data": {
    "en-US": {
      "title": "Example App",
      "subtitle": "Plan smarter every day",
      "keywords": ["planner", "tasks", "calendar"]
    }
  }
}
```

## Validation Targets

Use canonical targets:

- `appMetadata`
- `googleMetadata`
- `appEvent`
- `nomination`
- `review`
- `reviewList`

## Fill Safety

Do not fill when:

- The active page/entity is ambiguous.
- The user only asked for analysis.
- Validation returns blocking errors.
- Required facts are missing.
- The draft changes prices, availability, subscriptions, product IDs, dates, review complaints, legal/compliance claims, or support policy without explicit user intent.

## Planned MCP Domains

Planned local MCP surfaces:

- IAP localization
- subscription localization
- pricing and availability
- CPP/PPO later

Until matching MCP tools/endpoints exist, domain skills should produce save-ready drafts and diffs, not claim live fills.
