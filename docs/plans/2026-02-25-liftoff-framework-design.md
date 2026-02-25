# Liftoff Framework Design
*Superpowers + SuperClaude, merged for Google Antigravity*

Date: 2026-02-25

## Summary

Liftoff is a unified workflow + specialist skills framework for Google Antigravity IDE, merging the best of Superpowers (workflow pipeline, TDD discipline, anti-rationalization) and SuperClaude (specialist commands, agents, explicit slash commands). Install with one command, works immediately.

## Target Platform

Google Antigravity IDE — supports three native extension mechanisms:
- **Skills** (`~/.gemini/antigravity/skills/*/SKILL.md`) — semantically triggered, lazy-loaded
- **Workflows** (`~/.gemini/antigravity/global_workflows/*.md`) — explicit `/command` triggers
- **Rules** (`~/.gemini/GEMINI.md`) — always-on behavioral guidelines

No hooks system. Bootstrap is handled via GEMINI.md rules injection.

## Architecture

### Three Layers

| Layer | Files | Purpose |
|---|---|---|
| Bootstrap | `~/.gemini/GEMINI.md` | Always-on: tells agent it has skills, must check them |
| Skills | `~/.gemini/antigravity/skills/*/SKILL.md` | Auto-triggered workflow pipeline + specialist skills |
| Workflows | `~/.gemini/antigravity/global_workflows/*.md` | Explicit `/command` entry points |

### File Structure

```
liftoff/
├── install.sh
├── uninstall.sh
├── README.md
├── RELEASE-NOTES.md
├── rules/
│   └── GEMINI.md
├── skills/
│   # Superpowers pipeline skills
│   ├── using-liftoff/
│   ├── brainstorming/
│   ├── writing-plans/
│   ├── executing-plans/
│   ├── subagent-driven-development/
│   ├── test-driven-development/
│   ├── systematic-debugging/
│   ├── verification-before-completion/
│   ├── requesting-code-review/
│   ├── receiving-code-review/
│   ├── finishing-a-development-branch/
│   ├── dispatching-parallel-agents/
│   ├── writing-skills/
│   # SuperClaude specialist skills
│   ├── deep-research/
│   ├── performance-optimization/
│   ├── security-review/
│   ├── architecture-design/
│   └── confidence-check/
├── workflows/
│   ├── brainstorm.md
│   ├── plan.md
│   ├── implement.md
│   ├── research.md
│   ├── build.md
│   ├── test.md
│   ├── git.md
│   ├── analyze.md
│   ├── design.md
│   ├── troubleshoot.md
│   ├── explain.md
│   ├── improve.md
│   ├── review.md
│   ├── cleanup.md
│   ├── document.md
│   └── estimate.md
└── agents/
    ├── code-reviewer.md
    ├── backend-architect.md
    ├── frontend-architect.md
    ├── security-engineer.md
    ├── deep-research.md
    └── system-architect.md
```

## Bootstrap Mechanism

`rules/GEMINI.md` appended to `~/.gemini/GEMINI.md` on install:

```
# Liftoff Skills

You have liftoff skills installed. Before taking any action on a task,
you MUST invoke the relevant skill. Check skills before clarifying questions,
before writing code, before debugging, before everything.
```

`skills/using-liftoff/SKILL.md` contains the full anti-rationalization table and skill directory (mirrors Superpowers' `using-superpowers` skill).

## Skills: 19 total

### Superpowers Pipeline (13)
- using-liftoff, brainstorming, writing-plans, executing-plans
- subagent-driven-development, test-driven-development
- systematic-debugging, verification-before-completion
- requesting-code-review, receiving-code-review
- finishing-a-development-branch, dispatching-parallel-agents, writing-skills

### SuperClaude Specialist (5 new)
- deep-research, performance-optimization, security-review, architecture-design, confidence-check

## Workflows: 16 slash commands
brainstorm, plan, implement, research, build, test, git, analyze, design,
troubleshoot, explain, improve, review, cleanup, document, estimate

## Agents: 6
code-reviewer, backend-architect, frontend-architect, security-engineer, deep-research, system-architect

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/[user]/liftoff/main/install.sh | bash
```

Script behavior:
1. Download repo to temp dir
2. Copy skills/ → ~/.gemini/antigravity/skills/
3. Copy workflows/ → ~/.gemini/antigravity/global_workflows/
4. Append rules/GEMINI.md → ~/.gemini/GEMINI.md
5. Print success message

Uninstall reverses all steps cleanly.
