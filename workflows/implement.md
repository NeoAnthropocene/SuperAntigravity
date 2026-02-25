# /implement

**What this does:** Orchestrates feature implementation through TDD with review gates.

**Prerequisites:**
- Design approved (docs/plans/*-design.md exists) — if not, run /brainstorm first
- Implementation plan exists (docs/plans/*-plan.md) — if not, run /plan first
- On a feature branch (not main/master)

## Orchestration Flow

```
confidence-check skill → score ≥ 27 required to proceed
         ↓
test-driven-development skill → RED phase (write failing test)
         ↓
minimal implementation
         ↓
test-driven-development skill → GREEN phase (make it pass)
         ↓
commit
         ↓
requesting-code-review skill → review against plan
         ↓
next task (repeat)
         ↓
verification-before-completion skill → final check
         ↓
finishing-a-development-branch skill → merge/PR decision
```

## Session Announcement

At start: "Starting /implement for [task/feature]. Loading confidence-check..."

## On Confidence Below 27

Announce: "Confidence check failed: [dimension] scored [X].
Gap: [specific unknown].
Action: [reading files | running research | asking user]"
Do not start implementing until score reaches 27+.

## On Test Failure After Implementation

Load systematic-debugging skill. Do NOT retry without diagnosis.

## Commit Cadence

Commit after every GREEN test. Message format: `test: [what behavior is now tested]`
Never accumulate more than one GREEN test before committing.
