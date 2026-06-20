---
name: marketing-content-pipeline
description: End-to-end content creation workflow: ideation, writing, editing, SEO optimization, and distribution.
---

# Marketing Content Pipeline

Orchestrate an end-to-end content creation engine for a blog post, article, or similar long-form content asset.

## Prerequisite
The user must identify a topic, keyword, or audience pain point to address.

## Orchestration Flow

Execute the following steps sequentially, pausing for user approval after each major deliverable.

### 1. Ideation & Strategy
- Load `seo-audit` and `schema-markup` skills.
- Conduct keyword research and search intent analysis to determine the primary keyword, secondary keywords, and target audience.
- Outline the content structure based on competing top-ranking content.
- **Tool Usage**: Use CLI tools from `tools/clis/` via `run_command` (e.g., `ahrefs.js` or `semrush.js` if available) to validate search volume and keyword difficulty.

### 2. Drafting
- Load `copywriting` skill.
- Draft the content asset following marketing psychology principles, ensuring readability and clarity.

### 3. Editing (The 7 Sweeps)
- Load `copy-editing` skill.
- Run the drafted content through the 7-sweep editing process (Clarity, Voice and Tone, So What, Prove It, Specificity, Heightened Emotion, Zero Risk).

### 4. Technical Optimization
- Re-load `seo-audit` skill.
- Optimize title tags, meta descriptions, image alt text, and internal linking strategy.
- Generate appropriate JSON-LD Schema markup.

### 5. Distribution Plan
- Load `social-content` and `email-sequence` skills.
- Repurpose the core content into natively formatted snippets for social channels (Twitter threads, LinkedIn posts).
- Draft an email newsletter announcing the content.

## Output
A complete **Content Delivery Package** containing the optimized long-form content, metadata, schema markup, and distribution assets (emails and social posts).
