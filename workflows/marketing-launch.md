---
name: marketing-launch
description: Orchestrates a product or feature launch from planning through post-launch analysis.
---

# Marketing Launch

Orchestrate a comprehensive product or feature launch. This workflow transitions from strategy to execution, producing launch content across multiple channels.

## Prerequisite
The user must provide a description of the product or feature being launched and the target launch date.

## Orchestration Flow

Execute the following steps sequentially, presenting the output of each step to the user for refinement before proceeding.

### 1. Strategy & Positioning
- Load `launch-strategy` and `pricing-strategy` skills.
- Define the launch goals, core positioning, target audience, and tiered rollout plan (beta, early access, public).

### 2. Core Messaging & Assets
- Load `copywriting` and `marketing-psychology` skills.
- Draft the primary launch announcement (e.g., blog post or landing page copy).

### 3. Email Sequencing
- Load `email-sequence` skill.
- Draft the launch email series (teaser, announcement, follow-up, "last chance" if applicable).

### 4. Social & Community
- Load `social-content` skill.
- Plan the social media distribution strategy, adapting the core message natively for platforms like Twitter/X, LinkedIn, and Product Hunt.

### 5. Paid Amplification (Optional)
- Load `paid-ads` skill.
- If the user has a budget, plan the ad account structure and draft ad copy for paid promotion channels.

### 6. Tracking & ROI
- Load `analytics-tracking` skill.
- Define the UTM parameter structure and the specific conversion events that must be tracked to declare the launch a success.

## Tool Usage
To configure tracking, schedule emails, or set up ad campaigns, consult `~/.gemini/antigravity/tools/REGISTRY.md` and utilize the CLI tools in `tools/clis/` using the `run_command` tool.

## Output
A complete **Launch Playbook** containing all strategic decisions, drafted copy, channel assignments, and the final tracking checklist.
