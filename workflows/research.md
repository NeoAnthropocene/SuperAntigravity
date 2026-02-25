# Research

Deep research workflow for external information gathering.

## Protocol
1. List the specific questions you need to answer before searching
2. Identify 3-5 targeted search queries covering different angles
3. Search in parallel where possible
4. Prioritize: official docs > tutorials > blog posts
5. Require at least 2 corroborating sources for key claims
6. Present findings with confidence level and sources cited

A claim is key if: implementation depends on it, it contradicts common knowledge, or a technical decision hinges on it.

## Output Format
For each question:
- **Finding**: the answer
- **Confidence**: high / medium / low
- **Sources**: specific URLs or doc sections
- **Caveats**: what you couldn't verify

Load deep-research skill for the full process.

## Example Research Output

Question: Is Prisma ORM suitable for a Node.js app with 50k daily active users?

**Finding:** Yes, with caveats — Prisma performs well at this scale but requires connection pooling (PgBouncer) for high concurrency.
**Confidence:** High
**Sources:**
- Prisma docs on connection limits: prisma.io/docs/guides/performance/connection-pool
- Prisma blog post on production at scale: prisma.io/blog/...
**Caveats:** Benchmarks are from 2024; Prisma 6.x may have different characteristics. Connection pool configuration is critical and not covered in basic docs.

## Validation Step

Before acting on research: state the decision you're about to make and the key finding that supports it. If you cannot make this explicit, do more research.
