---
name: marketing-growth-experiment
description: Guides the design, measurement, and execution of a structured growth experiment.
---

# Marketing Growth Experiment

Design and execute a rigorous growth experiment (A/B test, multivariate test, or holdout test) to validate a marketing hypothesis.

## Prerequisite
The user must identify a growth metric to move (e.g., "increase landing page conversion rate," "reduce onboarding drop-off").

## Orchestration Flow

Execute the following steps sequentially.

### 1. Hypothesis Formulation
- Load `ab-test-setup` skill.
- Work with the user to define a clear, falsifiable hypothesis using the "If we [change], then we expect [impact] because [rationale]" format.

### 2. Test Design
- Load the relevant domain skill based on the test area (e.g., `page-cro`, `pricing-strategy`, or `email-sequence`).
- Define the Control and the Variant(s).
- Calculate the required sample size and estimated test duration to achieve statistical significance.

### 3. Measurement Setup
- Load `analytics-tracking` skill.
- Verify how success will be measured. Identify the Primary Metric, Secondary Metrics, and Guardrail Metrics (metrics you don't want to hurt, like retention).
- **Tool Usage**: Use CLI tools from `tools/clis/` via `run_command` (e.g., `ga4.js`, `mixpanel.js`, `amplitude.js`) to configure or verify tracking.

### 4. Implementation Guidelines
- Draft specific instructions or the copy/code variations required to build the experiment.

### 5. Post-Experiment Analysis (If data is provided)
- If the user provides experiment results, analyze the statistical significance.
- Determine if the hypothesis was validated, invalidated, or inconclusive.
- Recommend next steps (iterate, scale, or kill).

## Output
Produce a complete **Experiment Design Document** ready for execution.
