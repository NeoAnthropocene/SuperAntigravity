# Browser Agent Skill Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Create a `browser-agent` skill that teaches Antigravity's AI agent when and how to correctly delegate tasks to the built-in browser subagent.

**Architecture:** A single `skills/browser-agent/SKILL.md` file with YAML frontmatter for semantic triggering and a markdown body covering prerequisites, invocation patterns, artifact interpretation, error paths, and anti-patterns. Two supporting files are updated: `using-superantigravity/SKILL.md` (new matching example) and `rules/GEMINI.md` (skill listed in the reference table).

**Tech Stack:** Markdown, YAML frontmatter, Antigravity skill format (`~/.gemini/antigravity/skills/<name>/SKILL.md`)

---

### Task 1: Create `skills/browser-agent/SKILL.md`

**Files:**
- Create: `skills/browser-agent/SKILL.md`

**Background — what the browser agent actually does:**
- It is a specialized subagent that fires automatically when the main agent needs web interaction
- Supported actions: click, scroll, type, read DOM/screenshots/markdown, execute JavaScript, record video sessions, access console logs
- Artifacts produced: screenshots and screen recordings (verifiable evidence of task completion)
- Chrome extension required: installed via Chrome Web Store; setup prompt appears in Agent Manager (bottom left icon) or Editor (top right icon)
- URL security: `~/.gemini/antigravity/browserAllowlist.txt` restricts which domains the browser agent can access
- Skills do NOT directly control the browser agent — they guide the main agent on when and how to delegate clearly

**Step 1: Create the skill file**

```bash
mkdir -p "/Users/der.haken/Desktop/superpowers for antigravity/skills/browser-agent"
```

Then write `skills/browser-agent/SKILL.md` with this exact content:

```markdown
---
name: browser-agent
description: Use when a task requires interacting with a web browser — testing UI flows, verifying web app behavior, clicking through screens, reading live web content, or automating browser workflows in Google Antigravity
---

# Browser Agent

## Overview

Antigravity includes a built-in browser subagent that can autonomously interact with web applications.
The main agent delegates browser tasks to it — this skill governs when and how to do that correctly.

The browser agent is NOT a general-purpose web search tool. It is a UI interaction and verification tool.
Use it when you need to *act on* a web page, not just *read* information from it.

## Prerequisites

Before any browser task, verify:

1. **Chrome extension installed** — if not yet installed:
   - Look for the Chrome icon in Agent Manager (bottom left) or Editor (top right)
   - Click it → follow the setup prompt → install from Chrome Web Store → grant permissions
   - Without the extension, the browser agent cannot interact with pages

2. **URL allowlist configured** (for non-localhost URLs) — add trusted domains to:
   ```
   ~/.gemini/antigravity/browserAllowlist.txt
   ```
   One domain per line, e.g.:
   ```
   localhost
   127.0.0.1
   staging.myapp.com
   ```
   The browser agent will refuse to access domains not on this list.

Announce prerequisites status before starting: "Chrome extension: ✓ / ✗  |  Allowlist: ✓ domain added / ✗ needs update"

## When to Use the Browser Agent

**Use it when the task requires:**
- Testing a UI flow end-to-end (login, checkout, form submission)
- Verifying that a deployed or locally running web app behaves correctly
- Clicking through screens to confirm UI state after a code change
- Reading live content from a specific URL that cannot be fetched as static text
- Automating a repetitive browser workflow (fill form, submit, verify result)

**Do NOT use it for:**
- General web research (use the `deep-research` skill instead)
- Fetching static API responses (use `curl` or fetch in terminal)
- Anything that can be verified with a unit or integration test

## How to Frame Browser Requests

The browser agent responds to precise, stepwise instructions. Vague requests produce unreliable results.

**Bad:** "Test the login page"

**Good:** "Navigate to http://localhost:3000/login. Enter 'test@example.com' in the email field and 'password123' in the password field. Click the 'Sign In' button. Wait for navigation to complete. Verify the URL is now http://localhost:3000/dashboard and the text 'Welcome' appears on screen."

**Rule:** Every browser request must specify:
1. The starting URL
2. Each action in sequence (click X, type Y in Z, scroll to W)
3. The expected end state (URL, visible text, element present/absent)

## Supported Actions

The browser subagent can execute:

| Action | Example instruction |
|--------|-------------------|
| Navigate | "Go to http://localhost:3000/settings" |
| Click | "Click the button labeled 'Submit'" |
| Type | "Type 'hello world' into the search input" |
| Scroll | "Scroll down until the footer is visible" |
| Wait | "Wait for the spinner to disappear" |
| Read DOM | "Read the text content of the h1 element" |
| Screenshot | "Take a screenshot of the current state" |
| Read console | "Check the browser console for errors" |
| Execute JS | "Execute document.title and return the result" |
| Record | "Record this session as a video artifact" |

## Artifacts

The browser agent produces verifiable artifacts:

- **Screenshot** — static image of page state at a moment in time
- **Screen recording** — video of the full interaction session (use for dynamic flows)
- **Console log** — captured JavaScript errors and warnings

**Completion requires an artifact.** Do not claim a browser task is complete without one.

Acceptable completion statement:
> "Browser task complete. Screenshot attached shows dashboard loaded at /dashboard with 'Welcome, Jane' visible. No console errors."

Unacceptable:
> "I think the login flow worked."

## Error Paths

**Extension not installed:**
> "Browser agent setup required. Open Agent Manager → click the Chrome icon → install the extension → retry."
> Do NOT proceed. The browser agent cannot function without it.

**URL blocked by allowlist:**
> "URL [domain] is not in the allowlist. Add it to ~/.gemini/antigravity/browserAllowlist.txt and retry."
> Do NOT attempt to bypass the allowlist.

**Page does not reach expected state:**
1. Take a screenshot of the actual state
2. Compare actual vs expected
3. Report the discrepancy with the screenshot as evidence
4. Do NOT claim success if the expected state was not reached

**Browser agent timeout:**
> "Browser agent timed out. Simplify the request into smaller steps and retry one step at a time."

## Completion Criteria

A browser task is complete when ALL of the following are true:

- [ ] Chrome extension was confirmed installed before starting
- [ ] URL(s) were confirmed in the allowlist before starting
- [ ] Each action step was executed in sequence
- [ ] The expected end state was verified (URL, visible text, element)
- [ ] At least one artifact (screenshot or recording) was produced
- [ ] Completion statement includes artifact reference and describes actual observed state

A task that ends with "it should be working" is not complete.

## Anti-Patterns

| Pattern | Why it fails |
|---------|-------------|
| Skipping prerequisite check | Browser agent silently fails without extension installed |
| Vague action descriptions | Agent takes wrong actions or stops mid-flow |
| Claiming done without artifact | No verifiable evidence; errors may be invisible |
| Using browser agent for research | Slower and less reliable than `deep-research` skill |
| Testing localhost without allowlist entry | Request blocked; task cannot proceed |

## Example: Testing a Login Flow

**Request:** "Verify the login flow works on the local dev server."

**Correct execution:**

1. Announce prerequisites: "Chrome extension: ✓ | Adding localhost to allowlist..."
2. Add `localhost` and `127.0.0.1` to `~/.gemini/antigravity/browserAllowlist.txt`
3. Delegate to browser agent with precise steps:
   - Navigate to `http://localhost:3000/login`
   - Type `admin@test.com` into `#email`
   - Type `secret` into `#password`
   - Click `button[type=submit]`
   - Wait for URL to change
   - Take screenshot
   - Verify URL is `/dashboard`, text "Welcome" is present, console has no errors
4. Produce artifact: screenshot of `/dashboard` state
5. Completion statement: "Login flow verified. Screenshot shows /dashboard with 'Welcome, Admin' heading. Zero console errors."
```

**Step 2: Verify the file was written correctly**

```bash
cat "/Users/der.haken/Desktop/superpowers for antigravity/skills/browser-agent/SKILL.md" | head -5
```

Expected: YAML frontmatter with `name: browser-agent` on line 2.

**Step 3: Commit**

```bash
cd "/Users/der.haken/Desktop/superpowers for antigravity"
git add skills/browser-agent/SKILL.md
git commit -m "feat: add browser-agent skill for Antigravity browser subagent"
```

---

### Task 2: Update `using-superantigravity` with browser-agent matching example

**Files:**
- Modify: `skills/using-superantigravity/SKILL.md` (Skill Matching Examples section)

**Step 1: Add the matching example**

In `skills/using-superantigravity/SKILL.md`, find the "Skill Matching Examples" section and add this block after the last existing example (after the PostgreSQL/MongoDB example):

```markdown
**Given:** User says "Test the checkout flow on the staging site" or "Click through the signup form" or "Verify the UI after this deploy"
**Then:** Load browser-agent skill. Reason: Interacting with a live web page requires the browser
subagent. The browser-agent skill governs prerequisites, request framing, and completion criteria.
```

**Step 2: Verify the addition**

```bash
grep -A3 "checkout flow" "/Users/der.haken/Desktop/superpowers for antigravity/skills/using-superantigravity/SKILL.md"
```

Expected: The new example block appears.

**Step 3: Commit**

```bash
cd "/Users/der.haken/Desktop/superpowers for antigravity"
git add skills/using-superantigravity/SKILL.md
git commit -m "feat: add browser-agent to using-superantigravity skill matching examples"
```

---

### Task 3: Update `rules/GEMINI.md` to list browser-agent skill

**Files:**
- Modify: `rules/GEMINI.md`

**Step 1: Read the current GEMINI.md to find the skills reference section**

```bash
cat "/Users/der.haken/Desktop/superpowers for antigravity/rules/GEMINI.md"
```

**Step 2: Add browser-agent to the skills table**

Find the skills table in GEMINI.md. Add a row for `browser-agent`:

```markdown
| `browser-agent` | Interacting with web browser, testing UI flows, verifying web app behavior |
```

Place it in the "Specialist Skills" section (alongside `deep-research`, `security-review`, etc.).

**Step 3: Verify**

```bash
grep "browser-agent" "/Users/der.haken/Desktop/superpowers for antigravity/rules/GEMINI.md"
```

Expected: One match showing the table row.

**Step 4: Commit**

```bash
cd "/Users/der.haken/Desktop/superpowers for antigravity"
git add rules/GEMINI.md
git commit -m "feat: list browser-agent skill in GEMINI.md bootstrap rules"
```

---

### Task 4: Update `README.md` skills table

**Files:**
- Modify: `README.md`

**Step 1: Add browser-agent row to the Specialist Skills table**

In `README.md`, find the "Specialist Skills" table (contains `deep-research`, `security-review`, etc.) and add:

```markdown
| `browser-agent` | Testing UI flows, verifying web app behavior, browser automation |
```

**Step 2: Verify**

```bash
grep "browser-agent" "/Users/der.haken/Desktop/superpowers for antigravity/README.md"
```

Expected: One match.

**Step 3: Commit and push**

```bash
cd "/Users/der.haken/Desktop/superpowers for antigravity"
git add README.md
git commit -m "docs: add browser-agent to README skills table"
git push
```

---

### Task 5: Run spec panel on browser-agent skill

**Goal:** Verify the new skill scores 8+ before shipping.

**Step 1: Run spec panel**

Use the `sc:spec-panel` skill on `skills/browser-agent/SKILL.md`.

**Step 2: If score < 8.0**

Apply fixes per panel feedback and re-run until score ≥ 8.0.

**Step 3: Commit fixes if any**

```bash
cd "/Users/der.haken/Desktop/superpowers for antigravity"
git add skills/browser-agent/SKILL.md
git commit -m "fix: browser-agent skill spec panel improvements"
git push
```
