# ASO.dev Agent Skills

Agent Skills for App Store Optimization workflows at ASO.dev, compatible with Codex and other tools that consume `SKILL.md` folders.

Each skill is a folder with a single `SKILL.md` file:

```text
skills/<skill-name>/SKILL.md
```

Skill names match folder names and use lowercase letters, digits, and hyphens.

The root `marketplace.json` describes the full ASO.dev skill pack for tools that consume plugin/marketplace manifests. `.claude-plugin/marketplace.json` and `.claude-plugin/plugin.json` make the same pack installable as a Claude Code plugin marketplace. Claude Code discovers skill folders automatically from the default `skills/` directory.

## Local Companion

The current live integration is the ASO.dev local AI Companion MCP:

- `http://localhost:42111`
- `http://127.0.0.1:42111`

The local MCP/Companion surface is not the ASO.dev product API. Do not assume the future API repeats MCP tool names, endpoints, payloads, or auth.

Technical references for tool surfaces live in `tools/`:

- `tools/aso-dev-local-mcp.md` - current localhost MCP tools, endpoints, payloads, and safety rules.
- `tools/asodev-public-api.md` - ASO.dev Developer API and Partners API OpenAPI sources, auth/header notes, and MCP separation rules.
- `tools/asodev-product-surface-map.md` - public ASO.dev product surfaces mapped to skills.

## Install

These skills use the common `SKILL.md` Agent Skills format. Install by copying the folders from `skills/*` into the target agent's skills directory.

`tools/` contains repository-level technical references, not Agent Skill folders. If an agent is installed outside this repository and needs detailed MCP endpoint/payload docs or public API OpenAPI notes, keep this repository in the workspace or copy `tools/` into the project root as reference documentation.

### Codex

User/global install:

```bash
mkdir -p "${CODEX_HOME:-$HOME/.codex}/skills"
cp -R skills/* "${CODEX_HOME:-$HOME/.codex}/skills/"
```

Restart Codex after copying if the session is already running.

### Claude Code

Recommended GitHub marketplace install after this repository is published:

```text
claude
> /plugin marketplace add asodevapp/skills
> /plugin install asodev-skills@asodev-skills
```

For local development, from this repository:

```text
claude
> /plugin marketplace add .
> /plugin install asodev-skills@asodev-skills
```

Claude Code uses slash commands inside a `claude` session for marketplace installs; `claude install-skill github.com/...` is not the documented install command.

For official Anthropic marketplace submission, use the Claude.ai or Console submission forms and the prepared fields in [`OFFICIAL_MARKETPLACE_SUBMISSION.md`](OFFICIAL_MARKETPLACE_SUBMISSION.md).

Personal skills, available across projects:

```bash
mkdir -p "$HOME/.claude/skills"
cp -R skills/* "$HOME/.claude/skills/"
```

Project skills, checked into a repository:

```bash
mkdir -p .claude/skills
cp -R skills/* .claude/skills/
```

Restart Claude Code, then ask "What Skills are available?" or invoke a skill with `/skill-name`.

For Claude.ai, upload skills through the Claude Skills UI instead of copying to a local directory.

### Cursor

Project skills:

```bash
mkdir -p .cursor/skills
cp -R skills/* .cursor/skills/
```

User/global skills, when supported by your Cursor build:

```bash
mkdir -p "$HOME/.cursor/skills"
cp -R skills/* "$HOME/.cursor/skills/"
```

Reload the Cursor window or restart Cursor. If a global install is not discovered, use the project-level `.cursor/skills/` path.

### Antigravity

Current community convention for global Antigravity skills:

```bash
mkdir -p "$HOME/.gemini/antigravity/skills"
cp -R skills/* "$HOME/.gemini/antigravity/skills/"
```

Then restart Antigravity or reload the workspace. If your Antigravity build exposes a different skills directory in settings, use that directory instead.

### Verify Install

After installing in any tool, ask the agent:

```text
What ASO.dev skills are available?
```

Then try task-specific prompts such as:

- "Optimize current App Store metadata in the active ASO.dev editor"
- "Draft an In-App Event for the next seasonal campaign"
- "Prepare an App Store featuring nomination"
- "Reply to unanswered low-star reviews"

More scenario prompts are in [`EXAMPLES.md`](EXAMPLES.md).

## Validate

Run:

```bash
./validate-skills.sh
```

For the Claude Code plugin marketplace manifest, you can also run:

```bash
claude plugin validate .
```

The validator checks:

- every skill folder has `SKILL.md`
- YAML frontmatter parses correctly
- `name` and `description` exist
- `name` matches the folder name
- skill names use Codex-friendly lowercase hyphen format
- `marketplace.json` parses and points to a plugin source
- `.claude-plugin/marketplace.json` and `.claude-plugin/plugin.json` parse using Claude Code's default `skills/` discovery
- repository tool references in `tools/` exist and are non-empty

Expected output:

```text
All skills look valid.
```

## Skills

### Tools and Integrations

- `app-store-connect-mcp` - local MCP and localhost Companion workflow; detailed contract is in `tools/aso-dev-local-mcp.md`
- `asodev-public-api` - Developer API and Partners API integration workflow; live OpenAPI sources and current sparse-contract notes are in `tools/asodev-public-api.md`

### Core Workflow

- `aso-audit` - full ASO health check across metadata, keywords, creative, reviews, monetization, competitors, and analytics
- `current-metadata-fetch` - read current Apple/Google editor metadata
- `metadata-validation` - validate drafts before filling
- `app-context` - read or write per-app project context
- `app-analytics` - interpret ASO.dev Measurements and App Store metric changes

### Metadata and Localization

- `android-aso` - Google Play Store metadata, creative, ratings, and experiments
- `metadata-editor` - rewrite and bulk-fill App Store / Google Play metadata
- `figma-json-localization` - localize Figma/ASO.dev screenshot JSON to all App Store Connect locales while preserving all system/template tags
- `keyword-research` - analyze keyword/search query CSVs and prioritize ASO keywords using ASO.dev keyword, Spy, SAP, and Search Term Rank data
- `keyword-coverage` - plan CSV-derived or researched keyword distribution across fields/locales
- `localization-cross-localization` - localize metadata and cross-localization strategy
- `whats-new-release-notes` - write release notes / What's New
- `seasonal-calendar` - seasonal ASO, holiday campaigns, keyword swaps, and timing/revert plans

### Growth

- `competitor-analysis` - analyze competitors, App Info, App Clash, Spy, changelog, reviews, and creative gaps
- `apple-search-ads-intelligence` - analyze Apple Ads intelligence, paid keyword demand, competitor ads, and CPP alignment
- `featuring-nomination` - App Store featuring nomination strategy and drafts
- `in-app-events` - In-App Event strategy, metadata, media direction, and localizations
- `cpp-ppo-pages` - CPP/PPO, A/B test plans, variants, and conversion test interpretation
- `screenshot-brief` - screenshot sequence and creative copy

### Reviews

- `reviews-ratings` - review health, CSV review analysis, sentiment, feature requests, replies, complaint drafts, and rating strategy

### Monetization

- `in-app-purchases` - IAP metadata/localization drafts; MCP fill when available
- `in-app-subscriptions` - subscription metadata/localization drafts; MCP fill when available
- `monetization-strategy` - monetization model, paywall, trial, and revenue strategy
- `pricing-availability` - pricing, territory plans, and ASO.dev CSV price templates; MCP fill when available
- `subscription-lifecycle` - trial conversion, renewal, churn, billing recovery, and win-back

## Current MCP Surfaces

Detailed endpoints and payload examples are in `tools/aso-dev-local-mcp.md`.

The current local MCP supports these draft/read workflows:

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

Planned MCP surfaces include IAP localization, subscription localization, pricing/availability, and later CPP/PPO.

## Public API Surfaces

Detailed OpenAPI source links and separation rules are in `tools/asodev-public-api.md`.

Current public API docs:

- Developer API docs UI: `https://developer.aso.dev/docs/`
- Developer API OpenAPI JSON: `https://developer.aso.dev/openapi/developer-v1.json`
- Partners API docs UI: `https://partners.aso.dev/docs/`
- Partners API OpenAPI JSON: `https://partners.aso.dev/openapi/partners-v1.json`

These public APIs are separate from the local MCP. The current contracts are intentionally sparse and should be re-checked live before implementing API behavior.

## Operating Rule

Skills follow this pattern:

1. Read current state from local MCP when the surface exists.
2. Draft only requested fields.
3. Validate through `validate_ai_companion_data` when supported.
4. Fill ASO.dev drafts only when the user explicitly asks.

## License

This repository is licensed under the terms of `LICENSE`.
