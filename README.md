# SuperAntigravity

**Superpowers + SuperClaude for Google Antigravity IDE.**

One install command. Works automatically. Complete AI-assisted development workflow.

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/neoanthropocene/SuperAntigravity/main/install.sh | bash
```

Restart Antigravity. That's it.

## What You Get

### 83 Auto-Triggered Skills

Skills fire automatically when your task context matches — no commands needed.

**Workflow Pipeline** (from [Superpowers](https://github.com/obra/superpowers))

| Skill | Fires when... |
|-------|--------------|
| `brainstorming` | You want to build something new |
| `writing-plans` | You have an approved design ready to implement |
| `executing-plans` | You have a written plan to execute |
| `subagent-driven-development` | Executing plans with fresh subagents per task |
| `test-driven-development` | Implementing any feature or bug fix |
| `systematic-debugging` | A bug, test failure, or unexpected behavior |
| `verification-before-completion` | About to claim something is done |
| `requesting-code-review` | Between implementation tasks |
| `receiving-code-review` | You receive code review feedback |
| `finishing-a-development-branch` | Implementation is complete |
| `dispatching-parallel-agents` | 2+ independent tasks to parallelize |
| `writing-skills` | Creating or editing Antigravity skills |

**Specialist Skills** (from [SuperClaude](https://github.com/NomenAK/SuperClaude))

| Skill | Fires when... |
|-------|--------------|
| `deep-research` | Task needs external information before proceeding |
| `performance-optimization` | Code needs profiling and optimization |
| `security-review` | Code touches auth, input handling, or sensitive data |
| `architecture-design` | Designing systems, APIs, or significant features |
| `confidence-check` | About to implement — verifies readiness |
| `browser-agent` | Testing UI flows, verifying web app behavior, browser automation |

### 44 Slash Commands

Type `/` + command name in Antigravity:

| Command | What it does |
|---------|-------------|
| `/brainstorm` | [Step 1] Requirements discovery before writing code |
| `/plan` | [Step 2] Write a detailed implementation plan |
| `/implement` | [Step 3] Feature implementation with TDD |
| `/research` | Deep multi-source research |
| `/build` | Build and package project |
| `/test` | Run tests with coverage |
| `/git` | [Step 5] Git operations with smart commits |
| `/analyze` | Code quality, security, performance review |
| `/design-code` | Architecture and API design |
| `/design-orchestrate` | Auto-routes design tasks |
| `/troubleshoot` | Systematic debugging |
| `/explain` | Explain code or concepts |
| `/improve` | Apply code improvements |
| `/review` | [Step 4] Code review |
| `/cleanup` | Remove dead code |
| `/document` | Generate documentation |
| `/estimate` | Development estimates |
| `/business-panel` | AI-facilitated panel discussion with business thought leaders |
| `/spec-panel` | Multi-expert review of technical specification quality |
| `/recommend` | Intelligent recommender for SuperAntigravity commands |

> Each command is backed by a workflow file in `~/.gemini/antigravity/global_workflows/` — you can inspect and customize them.

### 15 Specialist Agents

| Agent | Specializes in |
|-------|---------------|
| `code-reviewer` | Reviews implementation against plan and quality standards |
| `backend-architect` | Backend systems, APIs, databases, reliability |
| `frontend-architect` | UI components, state management, performance |
| `security-engineer` | Vulnerability review, auth design, threat modeling |
| `deep-research` | Multi-source research with source quality ranking |
| `system-architect` | Distributed systems, migrations, observability |
| `socratic-mentor` | Educational guide for Socratic discovery learning |
| `repo-index` | Repository context compression and indexing |


## Designer Skills (from designer-skills)

Integrated from [designer-skills](https://github.com/Owl-Listener/designer-skills) with a design orchestrator for automatic routing.

### Design Specialist Agents  
| Agent | Group | Role |
|---|---|---|
| `design-orchestrator` | Meta | Auto-routes to the right design specialist |
| `design-researcher` | design-research | Expert in user research methodologies |
| `design-systems-architect` | design-systems | Expert in design systems |
| `ux-strategist` | ux-strategy | Expert in UX strategy and competition |
| `ui-designer` | ui-design | Expert in visual/UI design |
| `interaction-designer` | interaction-design | Expert in interaction patterns |
| `prototype-tester` | prototyping-testing | Expert in prototyping and validation |
| `design-ops-lead` | design-ops | Expert in design operations |
| `designer-toolkit-expert` | designer-toolkit | Expert in design documentation |

### Design Slash Commands (Auto-Routed)

Commands use the `/<group>--<command>` format. Example: `/design-research--discover`. 
See the `workflows/` directory for the full list of 27 commands.

## How It Works

```
Install → GEMINI.md gets SuperAntigravity bootstrap block (always-on)
        → skills/ → ~/.gemini/antigravity/skills/
        → workflows/ → ~/.gemini/antigravity/global_workflows/
        → agents/ → ~/.gemini/antigravity/agents/

Session → Agent reads GEMINI.md → knows it has skills, must check them
        → Skills trigger automatically by description matching
        → /commands available explicitly via workflows
```

## ⚡ Conversation Modes

SuperAntigravity is optimized for Antigravity's native mode toggles:

- **Planning Mode**: Mandatory for `/brainstorm`, `/plan`, `/research`, and `/troubleshoot`. Use for deep thinking, design, and complex problem isolation.
- **Fast Mode**: Recommended for `/implement`, `/test`, and batch execution. Optimized for direct code generation and mechanical tasks.

## The Workflow

```
/brainstorm  →  discuss + design (no code yet)
     ↓
/plan        →  bite-sized tasks with TDD steps
     ↓
/implement   →  subagent per task + code review between
     ↓
/review      →  validate against plan
     ↓
/git         →  smart commit and push
```

## Philosophy

- **Design before code** — brainstorming is mandatory, not optional
- **Test first** — TDD is the iron law, no exceptions
- **Systematic over ad-hoc** — process beats guessing every time
- **Evidence over claims** — run the verification before declaring done
- **YAGNI** — build what's needed now, not hypothetical future needs

## Uninstall

```bash
curl -fsSL https://raw.githubusercontent.com/neoanthropocene/SuperAntigravity/main/uninstall.sh | bash
```

## Credits

- Workflow pipeline adapted from [Superpowers](https://github.com/obra/superpowers) by Jesse Vincent (MIT)
- Specialist commands adapted from [SuperClaude](https://github.com/NomenAK/SuperClaude) (MIT)
- Built for [Google Antigravity](https://antigravity.google)

## Contributing

Skills live in `skills/`, workflows in `workflows/`, agents in `agents/`.
Follow the `writing-skills` skill for creating new skills.
PRs welcome.

## License

MIT
