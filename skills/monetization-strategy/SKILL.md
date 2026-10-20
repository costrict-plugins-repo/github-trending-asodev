---
name: monetization-strategy
description: "Use when the user wants to design or optimize app monetization: pricing, paywalls, subscriptions, in-app purchases, free trials, intro offers, revenue optimization, conversion to paid, paid app strategy, freemium strategy, or ads/IAP/subscription mix."
metadata:
  version: 1.0.0
---

# Monetization Strategy

Use this for high-level app monetization strategy. Use `subscription-lifecycle` for trial conversion, renewal, churn, billing recovery, and win-back. Use `in-app-subscriptions`, `in-app-purchases`, and `pricing-availability` for App Store entity metadata and save-ready changes.

## Workflow

1. Read `app-context` or `get_project_context` when available.
2. Identify current model: free, freemium, paid upfront, subscription, IAP, ads, or hybrid.
3. Capture category, audience, territories, current prices, paywall timing, trial/offer setup, conversion metrics, churn, ARPU/ARPPU, LTV, CAC, refund/complaint signals, and competitor norms if provided.
4. If live pricing/IAP/subscription MCP surfaces exist, use `app-store-connect-mcp` through the relevant tactical skill. If not, produce a strategy and implementation plan without claiming live fills.
5. Separate strategy recommendations from App Store configuration changes.

## Model selection

| Model | Best for | Watch-outs |
|---|---|---|
| Freemium + subscription | Productivity, health, education, content, pro tools | Needs recurring value and churn control |
| Freemium + consumable IAP | Games, credits, boosts, content unlocks | Revenue can be volatile |
| Paid upfront | Niche/pro tools with clear value | Lower install volume and harder UA |
| Free + ads | Content, casual games, high-volume apps | UX impact and lower ARPU |
| Hybrid | Mature apps with multiple user segments | Complexity and paywall confusion |

## Subscription strategy

- Free tier should create habit and show value, not replace paid value.
- Monthly plan lowers commitment and anchors annual value.
- Annual plan should be the preferred LTV plan when retention supports it.
- Free trial length should match time-to-value.
- Do not recommend "lifetime" for subscriptions; lifetime belongs to non-consumable IAP or paid unlocks.
- Do not invent prices or discounts. Use category benchmarks only as directional inputs, not facts.

## Paywall strategy

Choose timing based on value moment:

| Timing | Best for |
|---|---|
| Onboarding | Strong brands or apps where value is obvious |
| After aha moment | Most freemium apps |
| Feature gate | Utility/productivity when intent is clear |
| Usage limit | Content/tools with measurable usage |
| Trial start | Apps with enough value during trial to convert |

Paywall checklist:

- Benefit-led headline, not only "Go Premium"
- 3-5 clear paid benefits
- Pricing options with annual value shown if true
- Trial/intro offer wording is explicit
- Restore purchases is present
- Close/back affordance is visible
- Claims are consistent with subscription/IAP metadata

## Metrics

Use actual metrics when available. If missing, label estimates as assumptions.

| Metric | Formula |
|---|---|
| ARPU | Revenue / total users |
| ARPPU | Revenue / paying users |
| Conversion | Paying users / eligible users |
| Trial-to-paid | Paid conversions / trial starts |
| LTV | ARPU x average lifetime |
| Payback period | CAC / monthly gross profit per user |

## Optimization levers

- Improve paywall timing and message.
- Clarify paid value in subscription/IAP metadata.
- Test annual emphasis, trial length, intro offers, and price points.
- Add a secondary revenue stream only if it fits user intent.
- Reduce churn before raising prices when retention is weak.
- Localize price/value messaging for high-priority territories.

## Output

```md
# Monetization Strategy

App:
Category:
Markets:
Current model:
Current prices/offers:

## Diagnosis
| Area | Current | Issue | Opportunity |
|---|---|---|---|

## Recommended model
Model:
Why:
Risks:

## Pricing and offer direction
| Product/tier | Current | Recommendation | Rationale |
|---|---|---|---|

## Paywall strategy
- Timing:
- Headline angle:
- Benefits to show:
- Trial/offer wording:
- Required trust elements:

## Roadmap
| Timing | Action | Related skill |
|---|---|---|

## Metrics to track
| Metric | Current | Target/decision rule |
|---|---|---|

## App Store follow-up
- `in-app-subscriptions`:
- `in-app-purchases`:
- `subscription-lifecycle`:
- `pricing-availability`:
```

## Rules

- Do not invent revenue, conversion, retention, CAC, LTV, category benchmarks, prices, or competitor data.
- Avoid dark patterns: hidden close buttons, unclear renewal, misleading "free", fake scarcity, or confusing cancellation wording.
- Make subscription renewal, trial, intro offer, and paid access clear.
- Treat price changes and territory availability as high-impact; require explicit user approval before any fill/write.
