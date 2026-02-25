---
name: architecture-design
description: Use when designing new systems or significant features, evaluating architectural trade-offs, choosing between structural approaches, or when a task requires understanding system-wide design before writing code
---

# Architecture Design

## Overview

Design before you build. Architecture decisions are expensive to change.
Understand constraints, explore options, validate trade-offs, then decide.

## When to Use

- Starting a new system or significant new component
- Evaluating whether to build vs. use existing solutions
- Making decisions that will affect multiple parts of the system
- Choosing between fundamentally different structural approaches
- Designing APIs, data models, or service boundaries

## The Process

**1. Understand constraints**
Before proposing anything, gather:
- Scale requirements (users, data volume, request rate)
- Consistency requirements (eventual vs. strong)
- Latency requirements (p50, p99)
- Team constraints (skills, existing tech stack)
- Operational constraints (deployment, monitoring, cost)

**2. Identify core trade-offs**
Every architecture has trade-offs. Name them explicitly:
- Consistency vs. availability
- Simple vs. scalable
- Build vs. buy
- Monolith vs. services
- Synchronous vs. asynchronous

**3. Propose 2-3 options**
Never present only one option. For each:
- Describe the approach in 2-3 sentences
- List pros and cons
- State the constraints it satisfies (and which it doesn't)
- Give a complexity estimate

**4. Recommend with reasoning**
State your recommendation clearly.
Explain WHY given the specific constraints.
Don't hedge everything — make a call.

**5. Document the decision**
Record: what was decided, what was rejected, and why.
This is the most important thing to write down.

## Architecture Principles

**YAGNI** — Don't build for hypothetical future needs.
**Simple first** — The simplest thing that could work is usually right.
**Explicit over implicit** — Clear dependencies beat magic.
**Stateless where possible** — Stateful systems are harder to scale and reason about.
**Fail fast** — Validate inputs at boundaries, not deep in the call stack.

## Common Patterns Reference

| Pattern | Use When |
|---------|----------|
| REST API | CRUD over resources, external-facing APIs |
| Event-driven | Decoupling producers/consumers, async workflows |
| CQRS | Read/write loads differ significantly |
| Repository pattern | Abstracting data access from business logic |
| Circuit breaker | Calling unreliable external services |
| Saga pattern | Distributed transactions across services |
| BFF (Backend for Frontend) | Multiple clients with different data needs |

## Output Format

Present as:
1. **Constraints** — what must be true
2. **Options** — 2-3 approaches with trade-offs
3. **Recommendation** — clear choice with reasoning
4. **Decision record** — what was decided and what was rejected
5. **Open questions** — what still needs to be resolved
