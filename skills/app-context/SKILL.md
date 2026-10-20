---
name: app-context
description: "Use to read, create, or update ASO.dev per-app project context before metadata, localization, keywords, screenshots, IAP, subscriptions, pricing, In-App Events, nominations, or review work."
metadata:
  version: 1.0.0
---

# App Context

Project context is the reusable source of truth for ASO.dev AI tasks.

## Workflow

1. Use `app-store-connect-mcp`.
2. Call `get_project_context` with `appId` or `appName` when known; otherwise use the active project.
3. If context exists, use it and update only if the user asks.
4. If context is missing, produce concise MDX and save with `save_project_context` only when the user asks to save.

## Context content

Include only durable facts:

- App name, IDs, platforms
- Category and target markets
- Audience and use cases
- Positioning and differentiators
- Brand tone and forbidden claims
- Main keywords and competitors, if known
- Monetization: IAP, subscriptions, offers, pricing posture
- Support/review response policy
- Localization priorities
- Upcoming releases, events, nominations, CPP/PPO, screenshots
- Security/access constraints: API key model, Google service account, proxy requirements, financial-data restrictions, team/shared access rules

## Output

```md
# Project Context Draft

## Facts
-

## Assumptions
-

## Missing
-

## MDX
...

## Save readiness
- Ready for `save_project_context`:
```

## Rules

- Separate facts from assumptions.
- Do not invent competitors, metrics, prices, or legal claims.
- Keep context compact and reusable across skills.
- Do not store secrets, API keys, app-specific passwords, private keys, or service account JSON in project context.
