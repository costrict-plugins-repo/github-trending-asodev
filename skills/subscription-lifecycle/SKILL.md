---
name: subscription-lifecycle
description: "Use when the user wants to optimize subscription lifecycle and subscriber retention: trial start, trial conversion, renewal, churn, cancellation, grace period, billing retry, dunning, win-back offers, lapsed subscribers, subscriber LTV, renewal rate, or resubscribe strategy."
metadata:
  version: 1.0.0
---

# Subscription Lifecycle

Use this for the end-to-end subscription journey: trial -> paid conversion -> renewal -> churn prevention -> billing recovery -> win-back.

Use `monetization-strategy` for paywall/pricing design. Use `in-app-subscriptions` and `pricing-availability` for App Store subscription metadata, offers, price, and availability changes.

## Workflow

1. Read `app-context` or `get_project_context` when available.
2. Identify subscription products, groups, durations, trials, intro offers, promo offers, win-back offers, price changes, and target territories.
3. Collect lifecycle metrics if available: trial starts, trial-to-paid, renewal rates, voluntary churn, billing retry/grace period recovery, win-back, LTV, MRR, refund rate, cancellation reasons, and cohort age.
4. Diagnose the weakest lifecycle stage.
5. Recommend actions without inventing metrics or benchmarks.
6. For App Store configuration changes, hand off to `in-app-subscriptions`, `pricing-availability`, or future MCP pricing/subscription tools.

## Lifecycle map

```text
Install -> trial start -> trial activation -> paid conversion -> renewal
              |                  |                 |              |
              v                  v                 v              v
          no trial          no conversion     voluntary churn  billing issue
                                                    |              |
                                                    v              v
                                               win-back       grace/retry recovery
```

## Stage diagnostics

| Stage | Signals | Typical actions |
|---|---|---|
| Trial start | Low paywall view -> trial start | Improve paywall timing, value prop, eligibility clarity |
| Trial activation | Trial users do not reach aha moment | Nurture sequence, onboarding, feature prompts |
| Trial conversion | Trial starts do not become paid | Value recap, annual/monthly plan clarity, trial-end messaging |
| Renewal | Month 1/2/3 renewal drops | Improve activation, lifecycle messaging, product value delivery |
| Voluntary churn | Cancellation or disabled auto-renew | Exit survey, value recap, pause/discount if appropriate |
| Involuntary churn | Billing retry/grace period states | Grace period, payment update messaging, server entitlement handling |
| Win-back | Lapsed subscriber cohorts | New value, targeted offer, direct link/email/push where eligible |

## Trial strategy

- Match trial length to time-to-value.
- Nurture users with value, not pressure.
- Show trial users what they achieved before asking them to pay.
- Do not use fake urgency or hide renewal terms.
- If trial conversion is weak, diagnose activation before changing price.

Trial nurture examples:

| Moment | Message goal |
|---|---|
| Day 0 | Confirm trial start and first action |
| Early trial | Drive core feature use |
| Mid-trial | Show progress, proof, or advanced feature |
| Near end | Recap value and explain what continues after renewal |
| Last day | Clear renewal reminder and plan choice |

## Churn prevention

Common voluntary churn causes:

- Not enough usage or habit formation
- Paid value not understood
- Price sensitivity
- Missing feature
- Technical issue or bad support experience
- Seasonal use case
- Competitor switch

Cancellation flow ideas:

- Value recap based on real usage
- One-tap cancellation reason survey
- Support route for bugs/billing confusion
- Lower tier, pause, or limited discount only when product and platform support it
- Avoid blocking cancellation or hiding platform subscription management.

## Billing recovery and grace period

For Apple auto-renewable subscriptions, Billing Grace Period is configured per app in App Store Connect, not per product. Current Apple options include 3, 16, or 28 days, with weekly subscriptions capped by subscription length rules. Verify the current App Store Connect settings before recommending a change.

The app/server must handle renewal states correctly so subscribers retain access when they are entitled during grace period or billing retry.

## Win-back

Use for lapsed or churned subscribers.

- Segment by lapse age, prior tenure, plan, churn reason, and value reached.
- Start with product value/new feature messaging before deep discounts.
- Apple win-back offers can be configured in App Store Connect for eligible churned subscribers and merchandised through App Store surfaces, direct links, and in-app StoreKit experiences when implemented.
- Verify eligibility, regions, offer identifiers, images, and streamlined purchasing behavior before launch.

## Output

```md
# Subscription Lifecycle Report

App:
Subscription group/products:
Period:
Markets:

## Lifecycle metrics
| Stage | Metric | Current | Concern | Next action |
|---|---|---:|---|---|

## Diagnosis
Weakest stage:
Why:
Evidence:

## Recommendations
| Priority | Stage | Action | Expected effect | Related skill |
|---:|---|---|---|---|

## Trial and renewal plan
- Trial length/message:
- Activation milestone:
- Trial-end recap:
- Renewal nurture:

## Churn and win-back plan
- Cancellation survey:
- Voluntary churn action:
- Billing recovery action:
- Win-back segment:
- Offer/message:

## App Store configuration follow-up
- `in-app-subscriptions`:
- `pricing-availability`:
- MCP/API availability:
```

## Rules

- Do not invent metrics, subscriber counts, benchmarks, offer eligibility, price points, recovery rates, or LTV.
- Label directional benchmarks as assumptions if the user has no data.
- Do not recommend dark patterns, hidden cancellation, misleading trial copy, fake urgency, or unclear renewal terms.
- Treat price changes, grace period changes, and win-back offers as high-impact configuration changes that need explicit approval and validation.
- Verify platform capabilities and App Store Connect settings before giving implementation-specific instructions.

## References

- Apple Billing Grace Period: `https://developer.apple.com/help/app-store-connect/manage-subscriptions/enable-billing-grace-period-for-auto-renewable-subscriptions/`
- Apple win-back offers: `https://developer.apple.com/documentation/storekit/supporting-win-back-offers-in-your-app`
