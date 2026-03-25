---
name: brainstorm
description: Requirements discovery before any code — turns vague ideas into approved designs.
---
# /brainstorm

**What this does:** Requirements discovery before any code — turns vague ideas into approved designs.

**When to use:** Before starting any new feature, component, or significant change.
When NOT to use: If design is already approved and documented — use /plan instead.
- **Planning Mode** active in Antigravity settings

## Orchestration

This workflow invokes the brainstorming skill and adds session coordination:

1. **Announce** to the user: "Starting /brainstorm. I will not write any code until you approve the design."
2. **Load brainstorming skill** — follow it completely
3. **Gate check** before any code: confirm the design doc exists at docs/plans/YYYY-MM-DD-topic-design.md
4. **Route based on outcome:**
   - Code/system task → Transition to `/plan`
   - UI/UX design task → Transition to `/design-orchestrate`
5. **Suggest relevant follow-ups** based on design nature (do NOT auto-invoke):
   | If the design involves… | Suggest… |
   |---|---|
   | Strategic/product decisions | `/business-panel` — expert panel analysis (Christensen, Porter, Drucker, etc.) |
   | Technical spec review | `/spec-panel` — multi-expert specification quality review |
   | User research or personas | `/design-research--discover` |
   | UX Strategy | `/ux-strategy--strategize` or `/ux-strategy--frame-problem` |
   | A complex UI screen | `/ui-design--design-screen` |
   | A new design system or component | `/design-systems--create-component` or `/design-systems--tokenize` |
   | User testing plan | `/prototyping-testing--test-plan` or `/prototyping-testing--prototype-plan` |
   | Security-sensitive features | `/analyze` with security focus |
   | Estimates needed | `/estimate` |

## Session State

At the start of each brainstorming session, output:
```
Session: /brainstorm
Stage: [question N of ~5 | proposing approaches | presenting design | approved]
Design doc: [not started | in progress | saved at path]
```

## Hard Gate

STOP if user says "just build it" or "skip the design" — respond:
"SuperAntigravity requires design approval before implementation. This prevents wasted effort.
The design will take 10-15 minutes and saves hours of rework. Shall we continue?"

## Completion Criteria

Session complete when:
- [ ] Design doc saved to docs/plans/
- [ ] User has explicitly approved (not just acknowledged)
- [ ] Next step communicated to user (`/plan` for code tasks, `/design-orchestrate` for UI/UX tasks)
