---
name: app-store-connect-mcp
description: "Use whenever an ASO.dev skill needs the local localhost AI Companion MCP: reading/filling Apple or Google metadata, nominations, In-App Events, reviews, review replies/complaints, project context, or validation."
metadata:
  version: 1.0.0
---

# ASO.dev Local AI Companion MCP

Use this as the shared local MCP layer for ASO.dev skills when a workflow needs live ASO.dev editor data or draft fills.

The companion runs locally at:

- `http://localhost:42111`
- `http://127.0.0.1:42111`

Detailed tool names, localhost endpoints, arguments, payload examples, and fill safety rules live in the repository reference:

- `tools/aso-dev-local-mcp.md`

This localhost surface is not the ASO.dev product API. Do not infer product API endpoints, auth, payloads, or behavior from this MCP server. Use `asodev-public-api` and `tools/asodev-public-api.md` for Developer API or Partners API work.

Official ASO.dev docs may show setup/config examples for external agents. Prefer the active local MCP `tools/list` and `GET /openapi.json` for exact tool and endpoint availability because the local server can be ahead of or behind public docs.

## Tool Map

Use these exact MCP tool names when available:

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

The `fill_*` tools fill ASO.dev drafts only. They do not submit to App Store Connect unless a separate tool explicitly says it submits.

## Standard workflow

1. Read the active page/entity with the matching `get_*` operation.
2. Read `get_project_context` when positioning, tone, support policy, review policy, or brand constraints matter.
3. Draft only requested fields.
4. Validate with `validate_ai_companion_data` before any fill.
5. Fill only when the user explicitly asks to apply, fill, update, save a draft, or generate drafts in the editor.
6. Summarize changed fields and fields intentionally left untouched.

## Safety

Do not fill when:

- The active page/entity is ambiguous.
- The user only asked for analysis.
- Validation returns blocking errors.
- Required facts are missing.
- The draft changes prices, availability, subscriptions, product IDs, dates, review complaints, legal/compliance claims, or support policy without explicit user intent.

## Planned surfaces

IAP localization, subscription localization, and pricing/availability are planned for this local MCP. CPP/PPO is planned later. Until matching MCP tools/endpoints exist, domain skills should produce save-ready drafts and diffs, not claim live fills.
