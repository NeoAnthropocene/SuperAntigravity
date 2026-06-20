---
name: marketing-audit
description: Comprehensive marketing audit across SEO, CRO, content, analytics, and growth.
---

# Marketing Audit

Run a comprehensive marketing audit of the primary product, website, or specific landing page. This workflow orchestrates multiple specialized marketing skills to produce a holistic evaluation and prioritized action plan.

## Prerequisite
Identify the target URL, product, or specific marketing scope to be audited.

## Orchestration Flow

Execute the following steps sequentially:

### 1. SEO & Technical Audit
- Load `seo-audit` and `schema-markup` skills.
- Evaluate search visibility, technical SEO health, metadata, and structured data opportunities.

### 2. Conversion (CRO) Audit
- Load `page-cro` skill and, if applicable, `signup-flow-cro` and `form-cro` skills.
- Analyze the user journey for friction, clarity of value proposition, and CTA placement.

### 3. Content & Messaging Audit
- Load `copywriting` and `copy-editing` skills.
- Analyze messaging clarity, adherence to marketing psychology principles, and brand voice consistency.

### 4. Tracking & Execution Readiness
- Load `analytics-tracking` skill.
- Review current or proposed measurement infrastructure (e.g., GA4, Segment) ensuring all key conversion events are documented.

### 5. Growth Synthesis
- Load `marketing-ideas` and `referral-program` skills.
- Identify "low-hanging fruit" growth opportunities that require minimal engineering effort to execute.

## Tool Usage
During the audit, if access to external platform data is needed (e.g., GA4, Ahrefs, Semrush), consult `~/.gemini/antigravity/tools/REGISTRY.md` and use the appropriate CLIs located in `tools/clis/` via the `run_command` tool.

## Output Format

Generate a single consolidated **Marketing Audit Report**. Group findings by domain and prioritize them using the following severity levels:

- **Critical**: Must fix immediately (e.g., broken tracking, severe usability friction).
- **High**: Significant impact on conversion or ranking.
- **Medium**: Best practice improvements.
- **Low**: Polish and nice-to-haves.
