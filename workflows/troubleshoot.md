# /troubleshoot

**What this does:** Orchestrates systematic debugging sessions.

Load systematic-debugging skill — it owns the 4-phase process.

## Orchestration (what this workflow adds)

**Before loading the skill:**
1. Confirm the issue is reproducible: "Can you trigger this consistently? Yes/No?"
   If No: this is a flaky issue — note this before proceeding (affects Phase 1 scope)
2. Gather: exact error message, stack trace, and "when did this last work?"

**Phase names match systematic-debugging skill:**
- Phase 1: Understand (not "Diagnose")
- Phase 2: Investigate (not "Root Cause")
- Phase 3: Hypothesize
- Phase 4: Fix and Verify

**After Phase 4:**
- Load verification-before-completion skill before declaring fixed
- Write a regression test that captures the bug: `test: [bug description] no longer occurs`
- Commit the fix and the regression test together

## Escalation Path

If all 4 phases complete and issue is unresolved:
1. Document in BLOCKERS.md: symptom, what was tried, what was ruled out
2. Load deep-research skill to look for similar issues in official docs/issues
3. If still unresolved: present findings to user with specific question ("I've ruled out X and Y — is there something about the deployment environment I'm missing?")

## What NOT to Do
- Do NOT retry the same failing command without a new hypothesis
- Do NOT declare fixed without running verification-before-completion
- Do NOT guess and check — form hypothesis first
