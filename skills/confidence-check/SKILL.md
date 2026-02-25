---
name: confidence-check
description: Use before implementing a feature or making significant changes to verify you have enough context and understanding to proceed — prevents wasted effort from proceeding with wrong assumptions
---

# Confidence Check

## Overview

A quick self-assessment before implementation. If confidence is below threshold,
gather more information first. Don't build on shaky understanding.

## When to Use

- Before starting implementation of a feature
- When requirements feel ambiguous
- After reading existing code that you're about to modify
- When you're unsure about a technical approach

## The Check

Score yourself 0-10 on each:

**Understanding (0-10)**
- Do I understand what this is supposed to do?
- Do I understand why it needs to exist?
- Do I understand who uses it and how?

**Context (0-10)**
- Do I know which files I need to touch?
- Do I understand the existing code patterns I'm building on?
- Do I know the data flow end-to-end?

**Approach (0-10)**
- Do I know which approach I'll take and why?
- Have I considered at least one alternative?
- Do I know how to test this?

## Scoring

| Score | Action |
|-------|--------|
| 27-30 | Proceed with implementation |
| 20-26 | Fill gaps before starting — identify and resolve unclear items |
| Below 20 | Stop — load brainstorming skill or discuss with user before any code |

## What to Do With Low Scores

**Low on Understanding:** Ask the user to clarify, or load the brainstorming skill.

**Low on Context:** Read more of the codebase. Use deep-research skill for external unknowns.

**Low on Approach:** Load architecture-design skill. Explore options before committing.

## Red Flags

| Thought | Reality |
|---------|---------|
| "I'll figure it out as I go" | Proceeding with low confidence wastes everyone's time. |
| "It's probably fine" | Probably is not good enough before writing code. |
| "I can't get higher confidence" | Then escalate to the user — don't proceed blind. |
