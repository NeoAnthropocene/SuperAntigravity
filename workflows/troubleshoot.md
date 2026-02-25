# Troubleshoot

Diagnose and resolve issues systematically.

Load systematic-debugging skill for the full 4-phase process.

## Phase 1: Understand
- Reproduce the issue reliably
- Document: exact error message, stack trace, steps to reproduce
- Identify: when did it start? what changed?

## Phase 2: Investigate
- Read error messages carefully — they usually contain the answer
- Check logs at the point of failure
- Trace the call stack to the root cause
- Do NOT fix symptoms — find the root cause

## Phase 3: Hypothesize
- Form a specific hypothesis: "I believe X fails because Y"
- Test the hypothesis with a targeted investigation
- Do NOT guess and check randomly

## Phase 4: Fix and Verify
- Apply the minimal fix that addresses root cause
- Load verification-before-completion skill before declaring fixed
- Write a test that would have caught this

## Red Flags
- Retrying the same failing command without diagnosis
- Fixing symptoms without finding root cause
- Declaring fixed without running verification
- Using brute force when systematic analysis is needed
