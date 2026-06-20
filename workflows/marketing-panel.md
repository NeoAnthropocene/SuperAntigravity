---
name: marketing-panel
description: Orchestrates an expert panel discussion using distinct marketing personas to tackle a specialized growth challenge.
---

# Marketing Panel

Orchestrate a discussion among world-class marketing experts to analyze a specific marketing, growth, or conversion challenge.

This workflow produces high-level analysis and strategic direction, NOT direct code implementation. It relies on the `marketing-panel-experts` agent.

## Required Context
The user must provide a specific marketing challenge (e.g., "Our SaaS free trial conversion rate dropped from 15% to 5% after we added a credit card requirement.")

## The Experts
Load the `marketing-panel-experts` agent to assume the roles of:
- **Ayla** (The Brand Builder - qualitative, remarkability focus)
- **Donny** (The Positioner - competitive context, messaging)
- **Gustav** (The Growth Engineer - loops, funnels, unit economics)
- **Kramer** (The Conversion Optimizer - friction, motivation, copy)
- **Selin** (The Inbound Authority - organic growth, audience research)
- **Efe** (The Marketing Operator - metrics, infrastructure, alignment)

## Orchestration Flow

### Phase 1: Problem Deconstruction
Select 3 experts whose specialties best match the challenge. Represent their initial unfiltered reactions and questions based purely on their distinct frameworks.

### Phase 2: Hypothesis Generation & Debate
The selected experts present their primary hypotheses for solving the problem. They MUST constructively debate each other's approaches (e.g., Selin arguing for an organic content moat while Gustav pushes for a rapid paid acquisition loop).

### Phase 3: Data & Tool Validation
The experts request specific data points to validate their hypotheses. To gather this data, the agent MUST consult `~/.gemini/antigravity/tools/REGISTRY.md` and use the appropriate CLIs in `tools/clis/` (e.g., pulling GA4 metrics, checking Ahrefs rankings).

### Phase 4: Synthesis & Action Plan
End the panel by stepping out of the expert personas and synthesizing the debate into a prioritized list of 3-5 concrete next steps for the user. Recommend specific SuperAntigravity marketing skills (e.g., `ab-test-setup`, `copywriting`, `page-cro`) to execute the recommendations.
