---
name: current-metadata-fetch
description: "Use before editing current Apple or Google metadata in ASO.dev. Reads active editor data through the local MCP and returns a compact snapshot for ASO work."
metadata:
  version: 1.0.0
---

# Current Metadata Fetch

Use this before rewriting existing metadata.

## MCP workflow

1. Use `app-store-connect-mcp`.
2. Apple: call `get_editor_data`.
3. Google: call `get_google_editor_data`.
4. Pass `locales`, `fields`, `country`, or `asoOnly` only when the user or task needs a narrower read.
5. If the project context matters, call `get_project_context`.

## Output

```md
# Current Metadata Snapshot

Source: ASO.dev AI Companion MCP
Platform:
App ID:
Bundle/package:
Country:
Locales:

## Current fields
| Locale | Field | Value | Characters | Notes |
|---|---|---|---:|---|

## Missing or empty
-

## Safe next step
-
```

## Rules

- Do not invent missing fields.
- Preserve locale codes exactly as returned.
- Treat `keywords` as an array internally; render Apple keyword field comma-separated with no spaces when needed.
- If the MCP returns an error or active page is missing, ask the user to open the correct ASO.dev editor/page.
