---
name: asodev-public-api
description: "Use when the user asks about ASO.dev public APIs, Developer API, Partners API, OpenAPI docs, API keys, integration endpoints, request/response schemas, or how an external system should call ASO.dev outside the local AI Companion MCP."
metadata:
  version: 1.0.0
---

# ASO.dev Public API

Use this for external ASO.dev API integrations. This is separate from the local AI Companion MCP.

## Source of truth

Read the repository reference before describing endpoints:

- `tools/asodev-public-api.md`

Then check the live OpenAPI document for the requested surface:

- Developer API: `https://developer.aso.dev/openapi/developer-v1.json`
- Partners API: `https://partners.aso.dev/openapi/partners-v1.json`

The docs may be sparse while the API is being expanded. Do not invent endpoints, schemas, permissions, rate limits, or workflows that are not present in the current OpenAPI contract or supplied by the user.

## Surface selection

- Use Developer API when the user is building direct product/API integrations for their own ASO.dev account, projects, apps, or developer workflows.
- Use Partners API when the user is integrating partner-facing features, partner API keys, shared partner access, dictionaries, or keyword ranking endpoints.
- Use `app-store-connect-mcp` instead when the user wants to read or fill the active ASO.dev editor through localhost MCP.

## Operating rules

1. Treat live OpenAPI as canonical for paths, methods, auth, parameters, request bodies, and response schemas.
2. Keep MCP and public API terminology separate.
3. Use `X-API-Key` only as a placeholder name; never ask the user to paste secrets into long-lived skill files or project context.
4. Preserve `X-Request-ID` when the user needs traceability.
5. When an API surface is not yet available, say that it is not in the current OpenAPI contract and offer a save-ready integration plan based on the intended workflow.
