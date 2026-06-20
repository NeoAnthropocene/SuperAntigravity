---
name: campaign-strategy
description: "When the user wants to plan, build, or analyze a marketing campaign. Also use when the user mentions 'campaign builder,' 'multi-channel campaign,' 'awareness campaign,' 'lead gen campaign,' 'creative brief,' or 'campaign measurement.'"
---

# Campaign Strategy

This skill guides the design, orchestration, and measurement of multi-channel marketing campaigns.

## Core Principles

- **A campaign is not a tactic**: A single email is a tactic. A coordinated effort across email, ads, and socials pushing the same message to a specific audience over a specific timeframe is a campaign.
- **Start with the goal**: Every campaign must have a single, primary objective (e.g., generate 500 MQLs, drive 50 trial signups, increase brand awareness by X%).
- **Audience dictates channel**: Don't pick channels first. Pick the audience first, then figure out where they spend their time.
- **Consistent message, native format**: The core idea must remain consistent, but the execution must be native to the channel (e.g., a formal LinkedIn post vs. a casual TikTok video).
- **Measurement defines success**: If you can't measure it, it's not a campaign, it's hope.

## 1. Campaign Architecture

Every campaign needs a solid foundation before creative work begins.

### The Campaign Brief
- **Objective**: What is the single most important metric for success?
- **Audience Segment**: Exactly who are we targeting? (e.g., "Recently churned enterprise users," not "everyone")
- **The Core Message/Offer**: What is the "Big Idea"? What action do we want them to take?
- **Budget & Resources**: How much money and team time is allocated?
- **Timeline**: Launch date, duration, and post-campaign analysis date.

## 2. Campaign Types

Tailor your approach based on the type of campaign:

- **Awareness (Top of Funnel)**: Reach over conversion. Focus on impressions, CTR, brand lift. Heavy on PR, social, display ads.
- **Lead Generation (Middle of Funnel)**: Focus on capturing contact info. Requires a strong lead magnet. Heavy on search ads, gated content, webinars.
- **Conversion/Sales (Bottom of Funnel)**: Focus on revenue. Requires urgency and strong offers. Heavy on retargeting, email sequences, direct response.
- **Retention/Engagement**: Focus on existing users. Reactivation campaigns, NPS campaigns, feature adoption pushes.

## 3. Channel Selection

Allocate effort across the PESO model:

- **Paid**: Search, social, display, sponsorships. (Fast, scalable, expensive)
- **Earned**: PR, media mentions, influencer shoutouts. (High trust, hard to control)
- **Shared**: Social media engagement, community. (Interactive, algorithmic)
- **Owned**: Email list, blog, website. (High control, high ROI, slow to build)

## 4. The Execution Plan

Break the campaign down into phases:

1. **Pre-Launch**: Teasers, building waitlists, configuring tracking, QA testing links.
2. **Launch**: The main push. Coordinating all channels to hit simultaneously for max impact.
3. **Mid-Campaign Optimization**: Adjusting ad spend, A/B testing subject lines, monitoring analytics.
4. **Closing**: Final push, "last chance" messaging, urgency hooks.
5. **Post-Campaign**: Analysis, reporting, debriefing.

## 5. Measurement and Tracking

- **UTM Parameters**: Ensure every single link in the campaign uses consistent UTMs (`utm_source`, `utm_medium`, `utm_campaign`).
- **Control Groups**: For large lists, hold back 5-10% of the audience as a control group to measure true incremental lift.
- **Attribution**: Decide on the attribution model (first-touch, last-touch, linear) before launching.

## Tool Integration

When building campaigns, leverage external tools:
1. Check `~/.gemini/antigravity/tools/REGISTRY.md` to see available tools.
2. Use CLIs in `tools/clis/` (e.g., `google-ads`, `meta-ads`, `mailchimp`, `segment`) to configure settings or pull data via the `run_command` tool.

## Output Format

When generating a campaign plan, output a structured document containing:
1. Executive Summary
2. Campaign Brief (Goals, Audience, Big Idea)
3. Budget & Timeline
4. Channel Mix & Deliverables
5. Measurement Plan (KPIs, UTM structure)

## Questions to Ask
- What is the primary, single metric that defines success for this campaign?
- Who exactly is the audience, and what are their current pain points?
- What is the total budget (including ad spend and production)?

## Related Skills
- `copywriting`
- `paid-ads`
- `email-sequence`
- `social-content`
- `analytics-tracking`
