# Dependency Management Skill — Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Create a decision-tree-focused skill that guides dependency management decisions across all ecosystems.

**Architecture:** Single SKILL.md file in `skills/dependency-management/`. Graphviz flowchart for the main decision tree, quick reference tables for evaluation criteria and update strategy, rationalization table for common mistakes.

**Tech Stack:** Markdown, Graphviz dot syntax

---

### Task 1: Create the SKILL.md file

**Files:**
- Create: `skills/dependency-management/SKILL.md`

**Step 1: Create the skill directory**

```bash
mkdir -p skills/dependency-management
```

**Step 2: Write the SKILL.md**

Write the full skill file with the following structure:

```markdown
---
name: dependency-management
description: Use when adding new dependencies, deciding whether to update packages, running security audits on dependencies, evaluating library alternatives, or encountering outdated or vulnerable packages
---

# Dependency Management

## Overview

Every dependency is a commitment — to its maintenance, security surface, and upgrade path. Add deliberately, update strategically, audit regularly.

**Core principle:** Every dependency decision should be justified. Don't add what you can write. Don't ignore what you can update. Don't skip what you can audit.

## When to Use

- Adding a new package or library to a project
- Security audit warnings (npm audit, pip-audit, cargo audit, etc.)
- Batch dependency update time
- Major version upgrade decisions
- Choosing between alternative libraries
- Lockfile merge conflicts
- Questioning if a package is still maintained

**Don't use when:**
- Internal module/code organization (that's refactoring)
- Learning a single package's API (that's research)

## Decision Tree

[Graphviz dot flowchart — see design doc for structure]

## New Package Evaluation

[Quick reference table with 7 criteria]

## Update Strategy

[Patch/Minor/Major table]

## Security Urgency Matrix

[Severity × exploit table]

## Lockfile & Pinning Rules

[Short rules list]

## Common Mistakes

[Rationalization table]
```

Full content specified in design doc: `docs/plans/2026-02-27-dependency-management-design.md`

**Step 3: Verify file exists and word count**

```bash
wc -w skills/dependency-management/SKILL.md
```

Expected: 800-1000 words

**Step 4: Commit**

```bash
git add skills/dependency-management/SKILL.md
git commit -m "feat: add dependency-management skill"
```

---

### Task 2: Register skill in using-superantigravity

**Files:**
- Modify: `skills/using-superantigravity/SKILL.md` (Specialist Skills table)

**Step 1: Add a new skill matching example**

Add after the browser-agent example (around line 69):

```markdown
**Given:** User says "Should I update these packages?" or "Add lodash to the project" or "npm audit found vulnerabilities"
**Then:** Load dependency-management skill. Reason: Dependency decisions require evaluating
trade-offs. The dependency-management skill governs how to assess, update, and audit packages.
```

**Step 2: Add to Specialist Skills table**

Add a new row to the Specialist Skills table (around line 76):

```markdown
| `dependency-management` | Adding, updating, auditing, or evaluating project dependencies |
```

**Step 3: Commit**

```bash
git add skills/using-superantigravity/SKILL.md
git commit -m "feat: register dependency-management in skill discovery"
```

---

### Task 3: Register skill in GEMINI.md rules

**Files:**
- Modify: `rules/GEMINI.md` (Specialist Skills table)

**Step 1: Add dependency-management to the specialist skills table**

Add a new row:

```markdown
| `dependency-management` | Adding, updating, auditing, or evaluating project dependencies |
```

**Step 2: Commit**

```bash
git add rules/GEMINI.md
git commit -m "feat: register dependency-management in GEMINI.md rules"
```

---

### Task 4: Verify skill integration

**Step 1: Verify file structure**

```bash
ls -la skills/dependency-management/
```

Expected: SKILL.md exists

**Step 2: Verify YAML frontmatter is valid**

```bash
head -4 skills/dependency-management/SKILL.md
```

Expected: Valid YAML with name and description fields

**Step 3: Verify skill is referenced in discovery files**

```bash
grep -l "dependency-management" skills/using-superantigravity/SKILL.md rules/GEMINI.md
```

Expected: Both files listed

**Step 4: Final commit if any fixes needed**

```bash
git status
```
