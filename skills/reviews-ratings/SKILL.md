---
name: reviews-ratings
description: "Use when the user wants to analyze, respond to, report, or improve App Store reviews and ratings in ASO.dev: negative reviews, ratings trend, review replies, review complaints, review health, product insights, uploaded review CSV analysis, sentiment, missing feature requests, or rating prompt strategy."
metadata:
  version: 1.0.0
---

# Review Management

Use this for review analysis, reputation management, reply drafts, complaint/report drafts, product insight mining, uploaded review CSV analysis, and rating improvement strategy.

## MCP workflow

1. Use `app-store-connect-mcp`.
2. Single review: read with `get_review_data`.
3. Review list: read with `get_reviews_data`.
4. Use `unansweredOnly`, `badRatingOnly`, and `maxRating` to narrow review lists.
5. Use project context for tone, support links, known issues, and response policy.
6. Analyze review health, themes, response opportunities, and complaint/report eligibility.
7. Validate with `validate_ai_companion_data` target `review` or `reviewList`.
8. If asked to apply, fill drafts with `fill_review` or `fill_reviews`.

## Fill fields

Single review:

- `responseBody`
- `complaintReason`
- `concernType`

Review list:

- `reviews`: array or map by `reviewId`, each with `responseBody`, `complaintReason`, and/or `concernType`

## CSV review analysis

Use this mode when the user uploads or references a CSV with all reviews. CSV analysis does not require MCP unless the user wants to fill replies/complaints back into ASO.dev.

Before analysis:

1. Identify the CSV columns. Common columns: review ID, rating, title, body/text, locale/country, app version, date, developer response, response date, device/platform.
2. Normalize dates, ratings, locales, versions, and empty values.
3. Deduplicate repeated rows by review ID or exact title/body/date.
4. Segment by rating, locale/country, app version, date period, answered/unanswered status, and review length.
5. If the CSV is large, sample examples for quotes but compute counts/themes across the full file.

Analyze for:

- Sentiment by rating and text: positive, neutral, negative, mixed.
- Themes: bugs/crashes, UX friction, pricing/paywall, onboarding, performance, account/login, localization, support, content quality.
- Feature requests: missing capabilities, repeated "wish it had..." patterns, competitor comparisons.
- Product risk: regressions by app version/date, severe bugs, refund/cancel intent, trust/privacy concerns.
- ASO language: phrases users use to describe value, outcomes, and use cases.
- Support opportunities: unanswered low-star reviews, stale responses, high-impact replies.

CSV output should include counts and representative examples. Do not paste large raw review dumps.

## Review analysis framework

Classify themes:

| Theme | What it means | Action |
|---|---|---|
| Bugs/crashes | Technical failure, broken flow, regression | Escalate fix, respond with known status only |
| Feature requests | Users ask for missing capability | Track frequency and user segment |
| UX complaints | Confusing, slow, frustrating, hard to use | Prioritize UX/product review |
| Pricing/paywall | Too expensive, unclear subscription, trial confusion | Use `monetization-strategy` if repeated |
| Praise | Value, delight, favorite features | Thank and learn conversion language |
| Competitor mentions | Comparisons or switching reasons | Mine positioning gaps |

Review health signals:

- Average rating and trend, if available
- Recent low-star volume
- Unanswered negative reviews
- Response rate and response freshness
- Repeated bug/UX/pricing themes
- Complaint/report candidates

## Reply rules

- Be calm, specific, and brief.
- Prioritize timely replies; aim for 24-48 hours for high-impact negative reviews when operationally possible.
- Do not argue with the reviewer.
- Do not reveal internal data.
- Do not promise fixes unless they are confirmed.
- Do not ask for personal information in public.
- For angry reviews, acknowledge the issue and move to support.
- Do not ask the user to change their rating.
- Do not copy-paste identical replies across many reviews.

## Response framework

Use HEAR for negative reviews:

1. Hear: acknowledge the specific issue.
2. Empathize: show you understand the frustration.
3. Act: explain what is known, fixed, or being investigated.
4. Resolve: invite direct support with the right contact path.

Templates are starting points only:

- Bug: acknowledge, mention known fixed version only if confirmed, invite update/support.
- Feature request: thank them, say it is shared with the team, avoid promising roadmap.
- Vague negative: apologize briefly, ask for details through support.
- Positive: thank them and echo the benefit they named.

## Complaint/report rules

- Report only when the review appears abusive, spam, fraudulent, irrelevant, or otherwise policy-violating.
- Do not report valid negative feedback just because it is low-rated.
- Keep complaint reasons factual and short.

## Rating prompt strategy

Use for advice only; this MCP skill fills review drafts, not app code.

- Trigger only after a positive value moment.
- Avoid first session, onboarding, errors, crashes, failed payment, or support frustration.
- Good moments: completed task, achieved goal, streak, saved time/money, successful restore/export/share.
- Respect platform limits and do not incentivize reviews.
- If bad reviews are caused by product issues, fix the issue before increasing prompt volume.

## Product insight mining

Use reviews to extract:

- Most loved features and exact user language for metadata/screenshots.
- Top recurring bugs or UX failures.
- Monetization objections and subscription confusion.
- Feature demand frequency.
- Competitors mentioned and switching triggers.

Feature request scoring:

| Signal | Meaning |
|---|---|
| Frequency | How many reviews mention the request |
| Rating impact | Whether request appears in low-star or churn-risk reviews |
| Segment | Locale, version, user type, or country where it appears |
| Strategic fit | Whether it matches app positioning and roadmap |
| Effort/risk | Whether it needs product, backend, design, pricing, or policy work |

## Output

```md
# Review Health and Response Work

App:
Mode:
Rating/trend:
Filters:
CSV source:

## Health summary
- Total loaded reviews:
- Low-star reviews:
- Unanswered reviews:
- Main risk:

## Sentiment
| Segment | Positive | Neutral | Negative | Mixed | Notes |
|---|---:|---:|---:|---:|---|

## Themes
| Theme | Count | Rating impact | Evidence | Action |
|---|---:|---|---|---|

## Missing features / requests
| Request | Count | User segment | Evidence | Product recommendation |
|---|---:|---|---|---|

## Drafts
| Review ID | Rating | Theme | Action | Draft |
|---|---:|---|---|---|

## Product insights
| Insight | Evidence | Recommended owner/action |
|---|---|---|

## Rating improvement plan
1.
2.
3.

## Validation
- CSV columns mapped:
- Counts based on full data:
- Tone safe:
- No private data:
- Complaint justified:
- MCP validation:
- Ready for fill:
```
