# ASO.dev Public API Reference

This file maps ASO.dev public API surfaces for agents. It is intentionally separate from `tools/aso-dev-local-mcp.md`.

## Canonical Live Docs

Use the live OpenAPI JSON as the source of truth before describing or calling API endpoints:

| Surface | Docs UI | OpenAPI JSON | Purpose |
|---|---|---|---|
| Developer API | `https://developer.aso.dev/docs/` | `https://developer.aso.dev/openapi/developer-v1.json` | Developer-facing ASO.dev integrations. |
| Partners API | `https://partners.aso.dev/docs/` | `https://partners.aso.dev/openapi/partners-v1.json` | Partner-facing integrations and partner API keys. |

The Scalar docs pages reference relative `openapi/*.json` sources, but the currently working absolute JSON URLs are rooted at `/openapi/...`.

## Current State

Checked on 2026-05-02: the public OpenAPI contracts are still sparse and appear to be early/smoke-test surfaces. They are expected to expand.

Do not turn the current minimal endpoints into broad skill behavior. Re-check the live OpenAPI whenever a user asks about the API.

## Auth and Headers

- Public APIs use `X-API-Key` according to the OpenAPI `ApiKeyAuth` scheme.
- Some endpoints accept optional `X-Request-ID` for client-side traceability.
- Never store API keys in skill files, project context, README examples, or committed config.

## Known Surfaces From Current OpenAPI

Developer API currently exposes only smoke/test paths:

- `GET /v1/auth/test`
- `GET /v1/developer/test`

Partners API currently exposes:

- `GET /v1/auth/test`
- `GET /v1/partners/test`
- `GET /v1/dictionaries/countries`
- `POST /v1/keywords/rankings/live`

Treat this list as a snapshot, not a stable contract.

## Relationship to Local MCP

Public APIs are external product APIs. Local MCP is a localhost AI Companion surface for active ASO.dev editor reads and draft fills.

Do not infer API paths, auth, payloads, permissions, or semantics from MCP tool names. Do not infer MCP tool availability from public API docs.

Use:

- `app-store-connect-mcp` for local editor workflows and draft fills.
- `asodev-public-api` for Developer API and Partners API integrations.
