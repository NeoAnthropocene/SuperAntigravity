# SuperAntigravity Development Pipeline

The complete brainstorm → plan → implement → review → ship chain.

```
┌─────────────┐    ┌──────────────┐    ┌─────────────────┐
│ /brainstorm │───▶│    /plan     │───▶│   /implement    │
│             │    │              │    │                  │
│ Skill:      │    │ Skill:       │    │ Skills (loop):   │
│ brainstorm- │    │ writing-     │    │ confidence-check │
│ ing         │    │ plans        │    │ test-driven-dev  │
│             │    │              │    │ requesting-code- │
│ Output:     │    │ Output:      │    │ review           │
│ Design doc  │    │ Plan file    │    │                  │
│ APPROVED    │    │ docs/plans/  │    │ Output: commits  │
└─────────────┘    └──────────────┘    └────────┬────────┘
                                                 │
       ┌─────────────────────────────────────────┘
       ▼
┌─────────────┐    ┌──────────────┐
│   /review   │───▶│    /git      │
│             │    │              │
│ Agent:      │    │ Skill:       │
│ code-       │    │ (built-in)   │
│ reviewer    │    │              │
│             │    │ Output:      │
│ Output:     │    │ Merged PR or │
│ APPROVED or │    │ pushed branch│
│ CHANGES     │    │              │
└─────────────┘    └──────────────┘
```

## Stage Details

| Stage | Command | Skill/Agent | Gate | Output |
|-------|---------|------------|------|--------|
| Design | /brainstorm | brainstorming | User approval | docs/plans/*-design.md |
| Plan | /plan | writing-plans | User approval | docs/plans/*-plan.md |
| Implement | /implement | tdd + confidence-check | Tests pass | Feature commits |
| Review | /review | code-reviewer agent | APPROVED verdict | Review report |
| Ship | /git | — | Branch is clean | PR or merge |

## Gates

Every stage transition requires a gate to be passed:

1. **Design → Plan**: User explicitly approves the design document
2. **Plan → Implement**: Plan file exists with all tasks having exact file paths
3. **Implement → Review**: All plan tasks complete, all tests green
4. **Review → Ship**: code-reviewer agent verdict is APPROVED (or APPROVED WITH SUGGESTIONS)
5. **Ship**: verification-before-completion skill passes, finishing-a-development-branch skill executed

## Skills Used Per Stage

### /brainstorm
- brainstorming (primary — owns process)
- deep-research (if feasibility research needed)
- architecture-design (if system design needed)

### /plan
- writing-plans (primary — owns process)
- confidence-check (verify readiness before planning)

### /implement (per task, loop)
- confidence-check (score ≥ 27 to start task)
- test-driven-development (RED-GREEN-REFACTOR per task)
- systematic-debugging (when tests fail unexpectedly)
- verification-before-completion (before marking task done)
- requesting-code-review (after each task)

### /review
- code-reviewer agent (primary)
- security-engineer agent (for security-relevant changes)
- receiving-code-review (when applying feedback)

### /git
- verification-before-completion (final check)
- finishing-a-development-branch (merge/PR decision)

## Interrupt Protocols

**Bug discovered mid-implementation:** Load systematic-debugging skill. Fix + regression test. Resume plan.

**Scope change requested:** Stop implementation. Return to /brainstorm for the new scope. Do not absorb scope changes into the current plan silently.

**Test suite fails catastrophically (>20 failures):** Load systematic-debugging skill. Identify root cause of mass failure before individual fixes.
