---
name: design-orchestrate
description: Entry point workflow that loads the design-orchestrator agent to auto-route design tasks
---

# /design-orchestrate

The design orchestrator analyzes the user's design needs, determines which specialist skills are required, and coordinates them.

## Flow:
1. Identify the core user challenge or goal (e.g., "improve checkout UX", "build a design system").
2. Match the intent to the appropriate specialist agent(s).
3. Dispatch to the right agent(s) sequentially or in parallel depending on task sequence dependencies.
