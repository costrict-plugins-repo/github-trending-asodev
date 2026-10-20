---
name: keyword-coverage
description: "Use for keyword ideas, keyword prioritization, keyword/search query CSV-derived shortlists, competitor keyword gaps, Search Ads Popularity interpretation, and keyword distribution across metadata/locales."
metadata:
  version: 1.0.0
---

# Keyword Coverage

Build a keyword strategy using ASO.dev keyword data, uploaded keyword CSV shortlists, competitor rankings, Search Ads Popularity, tracked keywords, and current metadata coverage from MCP.

Use `keyword-research` first when the raw CSV still needs column mapping, cleaning, clustering, or opportunity scoring.

## MCP metadata coverage workflow

When current metadata can be read from ASO.dev:

1. Use `current-metadata-fetch`.
2. Apple: call `get_editor_data` with target `country`, `locales`, and `fields` when needed. Use `asoOnly: true` for title/subtitle/keywords coverage.
3. Google: call `get_google_editor_data` for title, short description, and full description coverage.
4. Normalize metadata by locale:
   - lower-case for matching
   - trim punctuation and duplicate spaces
   - split Apple `keywords` arrays as individual terms
   - keep original text for reporting and character counts
5. Normalize keyword/search-query rows from CSV or ASO.dev data by country, locale, keyword, popularity/SAP, rank, difficulty, competitor/source, and intent.
6. Calculate coverage per keyword/query against current metadata.

## Coverage calculation

Use phrase and token coverage:

- Exact phrase covered: the full query appears in a field.
- Token covered: each meaningful word appears somewhere in indexed fields.
- Partial coverage: some but not all meaningful words are present.
- Not covered: no meaningful words are present.
- Wasted coverage: repeated words across fields without a clear strategic reason.

Ignore or downweight stop words and generic terms such as `app`, `free`, `best`, unless they are meaningful in that locale/query.

Field weights:

| Platform | Field | Weight | Notes |
|---|---|---:|---|
| Apple | title | 1.00 | Highest visibility and keyword weight |
| Apple | subtitle | 0.80 | Strong indexed field |
| Apple | keywords | 0.60 | Hidden indexed field; avoid duplicates from title/subtitle |
| Apple | description/promotionalText | 0.10 | Conversion context, not primary keyword coverage |
| Google Play | title | 1.00 | Highest indexed field |
| Google Play | shortDescription | 0.80 | Indexed and visible |
| Google Play | fullDescription | 0.50 | Indexed; natural repetition matters |

Suggested coverage score:

```text
coverage_score =
  exact_phrase_match ? max(field_weight) :
  token_coverage_ratio * max(field_weight_of_covered_tokens)
```

Then prioritize gaps:

```text
gap_priority =
  relevance
  + popularity/SAP
  + ranking_feasibility
  + competitor_gap_value
  - current_coverage_score
  - policy_or_trademark_risk
```

Do not present the score as an App Store ranking prediction. It is a planning heuristic.

## Classify keywords

- Primary - 1-3 high-relevance/high-opportunity terms for app name/title or strongest visible field
- Secondary - 5-10 relevant terms for subtitle, short description, or Apple keyword field
- Long-tail - 10-20 specific intent terms for Apple keyword field, Google full description, CPP/PPO, and tracking
- Defensive - protect current rankings
- Competitor gap - competitors rank, app does not
- Experimental - track first
- Avoid - irrelevant, risky, trademarked, too broad

## Scoring

If data exists:

```text
Opportunity = relevance * 0.35
            + popularity * 0.25
            + ranking feasibility * 0.25
            + conversion intent * 0.15
```

Do not invent missing SAP/rank values.

## Output

```md
# Keyword Coverage Report

Source:
Country:
Locale:
Current metadata source: MCP / CSV / user-provided

## Current indexed metadata
| Locale | Field | Value | Characters | Indexed |
|---|---|---|---:|---|

## Coverage summary
| Segment | Keywords | Covered | Partial | Missing | High-priority gaps |
|---|---:|---:|---:|---:|---:|

## Best opportunities
| Keyword | Locale | Relevance | Popularity/SAP | Current rank | Difficulty | Coverage | Action |
|---|---|---:|---:|---:|---:|---|---|

## Metadata distribution
| Keyword | Title | Subtitle/short desc | Keyword field/full desc | Locale | Coverage | Notes |
|---|---|---|---|---|---|---|

## Coverage gaps
| Keyword | Missing tokens | Best field to add | Trade-off | Reason |
|---|---|---|---|---|

## Recommended Apple keyword field
`...`
Characters: 0/100

## ASO.dev actions
1. Add to Keywords List:
2. Track competitors:
3. Test in metadata:
4. Use in CPP/PPO:
```

## Rules

* Relevance beats popularity.
* Do not use competitor trademarks.
* Always specify country and locale.
* Use MCP current metadata before claiming a keyword is missing.
* For Apple, do not duplicate title/subtitle words in the keyword field unless there is a deliberate reason.
* For Google Play, prefer natural semantic coverage over visible keyword stuffing.
