# Official Marketplace Submission

Use this file as the copy/paste source for the official Anthropic marketplace submission forms:

- Claude.ai: https://claude.ai/settings/plugins/submit
- Console: https://platform.claude.com/plugins/submit

The repository is already structured as a Claude Code plugin:

```text
.claude-plugin/plugin.json
.claude-plugin/marketplace.json
skills/<skill-name>/SKILL.md
README.md
LICENSE
```

## Plugin Details

Name:

```text
asodev-skills
```

Version:

```text
1.0.0
```

Description:

```text
ASO.dev skills for App Store Optimization, App Store Connect workflows, Google Play ASO, metadata, localization, reviews, monetization, subscriptions, pricing, In-App Events, featuring nominations, local AI Companion MCP workflows, and ASO.dev public API workflows.
```

Repository:

```text
https://github.com/asodevapp/skills
```

Homepage:

```text
https://aso.dev
```

License:

```text
MIT
```

Author:

```text
ASO.dev
```

Category:

```text
marketing
```

Keywords:

```text
aso, app-store-optimization, app-store-connect, google-play, metadata, localization, keywords, reviews, monetization
```

Tags:

```text
aso, app-store, google-play, growth, localization, metadata
```

## Marketplace Listing Copy

Short description:

```text
ASO.dev skills for app marketers, growth teams, and AI agents working with App Store Optimization workflows.
```

Long description:

```text
ASO.dev Skills is a Claude Code plugin with 27 Agent Skills for App Store Optimization and app growth workflows. It covers ASO audits, App Store and Google Play metadata, keyword research, competitor analysis, Apple Ads intelligence, app analytics, localization, Figma JSON screenshot localization, screenshot briefs, reviews and ratings, App Store In-App Events, featuring nominations, CPP/PPO workflows, in-app purchases, subscriptions, pricing and availability, monetization strategy, seasonal planning, validation, ASO.dev local AI Companion MCP workflows, and ASO.dev public API workflows.
```

Install/test command:

```text
claude --plugin-dir .
```

Local marketplace install:

```text
/plugin marketplace add .
/plugin install asodev-skills@asodev-skills
```

GitHub marketplace install after publishing:

```text
/plugin marketplace add asodevapp/skills
/plugin install asodev-skills@asodev-skills
```

## Validation

Run before submission:

```bash
./validate-skills.sh
claude plugin validate .
```
