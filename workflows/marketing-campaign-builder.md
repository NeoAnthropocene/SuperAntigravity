---
name: marketing-campaign-builder
description: Comprehensive campaign planning, orchestration, and execution workflow.
---

# Marketing Campaign Builder

Design, orchestrate, and build a cohesive multi-channel marketing campaign. This workflow uses the `marketing-campaign-specialist` agent to coordinate strategy and execution.

## Prerequisite
The user must provide the campaign's high-level goal (e.g., "Generate 500 leads for our Q3 webinar" or "Announce our new AI feature to existing customers").

## Orchestration Flow

Follow these phases to build the campaign:

### 1. Campaign Architecture
- Load the `campaign-strategy` skill.
- Work with the user to define the Campaign Brief: Objective, Audience Segment, Core Message/Offer, Budget, and Timeline.

### 2. Core Creative Brief
- Load the `copywriting` and `marketing-psychology` skills.
- Draft the central messaging framework (the "Big Idea") that will anchor the campaign across all channels.
- Provide a creative brief outlining the required visual assets.

### 3. Channel Orchestration
- Segment the campaign into specific channel deliverables.
- **Email**: Load `email-sequence` skill. Draft the required broadcast emails or automated sequences.
- **Social**: Load `social-content` skill. Plan organic social promotion calendar.
- **Paid Ads**: Load `paid-ads` skill. Structure the ad account approach and draft ad copy variations.

### 4. Measurement & Tracking
- Load the `analytics-tracking` and `ab-test-setup` skills.
- Define success metrics (KPIs) and configure the UTM tracking strategy.
- Design any split tests (A/B testing) for the campaign creatives or landing pages.
- **Tool Usage**: Use external tools (e.g., `ga4.js`, `google-ads.js`, `meta-ads.js`, `mailchimp.js`) from `tools/clis/` via `run_command` to set up or verify necessary campaign tracking and configurations.

### 5. Final Review
- Synthesize all components into a timeline-based execution plan.

## Output
Produce a unified **Campaign Execution Plan** detailing the strategy, timeline, creative assets, channel assignments, and measurement framework.
