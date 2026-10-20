---
name: keyword-research
description: "Use when the user wants ASO keyword discovery or research: uploaded keyword/search query CSV analysis, Search Ads Popularity, keyword rankings, suggestions, difficulty, total app count, guided search, Search Term Rank Report, competitor keywords, keyword tracking lists, or ASO.dev Spy/Keywords data."
metadata:
  version: 1.0.0
---

# Keyword Research

Discover and prioritize ASO keywords before distributing them into metadata. Use this for uploaded keyword/search query CSV analysis as well as ASO.dev keyword surfaces. Use `keyword-coverage` after the keyword set is selected.

## ASO.dev data to use

When available, use ASO.dev keyword surfaces:

- Keywords Tracking and Rankings: rank, previous rank, trend, SAP, difficulty, total app count, suggestions, ads signals.
- Spy: all keywords another app ranks for; save useful terms to the tracked keyword list.
- Search Term Rank Report: monthly Apple report by country/genre with genre rank and popularity metrics.
- Competitors and App Info: competitor keyword ranking overview and top-position coverage.
- SAP detector/anomaly context: avoid overreacting to platform-wide popularity shifts.

## Workflow

1. Identify app, platform, country, locale, category/genre, and audience.
2. Start from seed terms: app function, user problem, category, competitor positioning, seasonal intent.
3. Pull or request ASO.dev keyword data: SAP/popularity, rank, difficulty, total app count, suggestions, trend, competitor ranks.
4. Cluster terms by intent, not just word similarity.
5. Mark avoid terms: irrelevant, trademarked, deceptive, adult/sensitive, too broad, or low-converting.
6. Select a target set and hand it to `keyword-coverage` or `metadata-editor`.

When starting from scratch, ask for or generate a working set of 20-30 seed terms and 3-5 relevant competitors, then narrow with real ASO.dev data. Refresh research after major releases, seasonal shifts, category changes, or at least quarterly for active apps.

## CSV keyword analysis

Use this mode when the user uploads a CSV of search queries/keywords for their app or a competitor.

Before analysis:

1. Identify source type: own keyword list, competitor Spy export, Search Term Rank export, tracked keywords, ad keywords, or mixed.
2. Map columns. Common columns: keyword/query, country, locale, app/package, competitor, rank, previous rank, trend, SAP/popularity, genre rank, difficulty, total apps/results, suggestions count, installs/downloads estimate, date/month, tags.
3. Normalize country/locale codes, keyword casing, whitespace, duplicates, missing popularity/rank values, and date/month fields.
4. Deduplicate exact keywords within the same country/locale/source, but preserve separate competitor rows when they explain coverage gaps.
5. Segment by source, country, locale, competitor, rank bucket, popularity bucket, difficulty bucket, trend, and branded/non-branded intent.

Analyze for:

- Highest-priority opportunities: relevant, enough popularity, feasible difficulty, weak or missing current rank.
- Defensive keywords: current strong ranks to protect.
- Competitor gaps: competitors rank or advertise, app does not.
- Long-tail clusters: lower popularity but high relevance and conversion intent.
- Seasonal/trending terms: rising trend or month-specific Search Term Rank patterns.
- Avoid terms: competitor trademarks, irrelevant high-popularity queries, policy-sensitive terms, misleading intent.

CSV output should include counts, buckets, and a clean recommended target set. Do not paste the full raw CSV unless the user asks.

## Prioritization

Use real data when present:

```text
Priority = relevance
         + ranking feasibility
         + popularity/SAP quality
         + conversion intent
         + competitor gap value
         - policy/trademark risk
```

For SAP after late-2025 shifts, prefer ASO.dev averaged/historical context when available instead of treating fresh low values as absolute truth.

## Output

```md
# Keyword Research

App:
Country:
Locale:
Category/genre:
Sources:
CSV source:

## Keyword clusters
| Cluster | User intent | Keywords | Notes |
|---|---|---|---|

## CSV summary
| Segment | Keywords | Avg popularity | Rank coverage | Notes |
|---|---:|---:|---|---|

## Opportunities
| Keyword | Intent | SAP/popularity | Difficulty | Rank | Competitors | Decision |
|---|---|---:|---:|---:|---|---|

## Avoid
| Keyword | Reason |
|---|---|

## Recommended target set
- Primary:
- Secondary:
- Long-tail:
- Track first:

## Next action
- Add to tracked list:
- Send to `keyword-coverage`:
- Send to `metadata-editor`:
- Use in CPP/PPO or Apple Ads:
```

## Rules

- Do not assume CSV columns; map them first.
- Do not invent SAP, rank, difficulty, total app count, or search volume.
- Do not recommend competitor trademarks in metadata.
- Always specify country and locale; keyword value is market-specific.
- Treat monthly Search Term Rank Report data as trend/research input, not a fast A/B testing signal.
