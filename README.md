# SuperAntigravity

**Superpowers + SuperClaude for Google Antigravity IDE.**

One install command. Works automatically. Complete AI-assisted development workflow.

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/neoanthropocene/SuperAntigravity/main/install.sh | bash
```

Restart Antigravity. That's it.

## Update

Run the dedicated update script to get the latest skills, workflows, agents, and tools. It will show you what's new, back up any files you've customized, and refresh the GEMINI.md bootstrap block.

```bash
curl -fsSL https://raw.githubusercontent.com/neoanthropocene/SuperAntigravity/main/update.sh | bash
```

> Your customized files are backed up as `filename.bak` before being overwritten, so you never lose local changes.

## Uninstall

```bash
curl -fsSL https://raw.githubusercontent.com/neoanthropocene/SuperAntigravity/main/uninstall.sh | bash
```

## What You Get

### 107 Auto-Triggered Skills

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

**Marketing Skills**

| Skill | Fires when... |
|-------|--------------|
| `campaign-strategy` | Planning, building, or analyzing a multi-channel marketing campaign |
| `copywriting` | Writing or improving copy for web, ads, or email |
| `copy-editing` | Editing, polishing, or applying the 7-sweep process to written content |
| `social-content` | Creating content for social media channels |
| `seo-audit` | Auditing SEO for a page, domain, or set of URLs |
| `schema-markup` | Adding or improving JSON-LD structured data |
| `programmatic-seo` | Planning or executing a programmatic SEO content strategy |
| `page-cro` | Optimizing a landing page or product page for conversions |
| `form-cro` | Improving a lead generation or checkout form |
| `signup-flow-cro` | Reducing friction in a signup or registration flow |
| `popup-cro` | Designing or optimizing an exit-intent or triggered popup |
| `onboarding-cro` | Improving the new user onboarding experience |
| `paywall-upgrade-cro` | Optimizing a paywall, upgrade prompt, or pricing page |
| `pricing-strategy` | Setting, restructuring, or experimenting with pricing |
| `launch-strategy` | Planning a product or feature launch |
| `referral-program` | Building or optimizing a referral or word-of-mouth program |
| `free-tool-strategy` | Creating free tools as a growth and SEO lever |
| `marketing-ideas` | Generating marketing and growth ideas |
| `marketing-psychology` | Applying behavioral psychology principles to copy or UX |
| `paid-ads` | Planning or auditing paid advertising campaigns |
| `email-sequence` | Writing automated email sequences or broadcasts |
| `competitor-alternatives` | Creating competitor comparison or alternative landing pages |
| `ab-test-setup` | Designing a rigorous A/B or multivariate test |
| `analytics-tracking` | Setting up or auditing analytics and conversion tracking |

---

## Designer Skills (from designer-skills)

Integrated from [designer-skills](https://github.com/Owl-Listener/designer-skills) with a design orchestrator for automatic routing. Includes 63 skills under `skills/design-ops/`, `skills/design-research/`, `skills/design-systems/`, `skills/ux-strategy/`, `skills/ui-design/`, `skills/interaction-design/`, `skills/prototyping-testing/`, and `skills/designer-toolkit/`.

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
See the `global_workflows/` or `workflows/` directory for the full list of 27 commands.

---

### 48 Slash Commands (Workflows)

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
| `/design-orchestrate` | Auto-routes design tasks to the design-orchestrator |
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

**Marketing Workflows** — A full suite of orchestrated marketing workflows that chain skills together:

| Command | What it does |
|---------|-------------|
| `/marketing-audit` | Comprehensive audit across SEO, CRO, content, and analytics |
| `/marketing-launch` | End-to-end product or feature launch (strategy → copy → email → social → tracking) |
| `/marketing-panel` | Multi-persona expert panel debate on a marketing challenge |
| `/marketing-growth-experiment` | Design, run, and analyze a structured growth experiment |
| `/marketing-content-pipeline` | Ideation → writing → editing → SEO → distribution |
| `/marketing-campaign-builder` | Full multi-channel campaign from brief to execution plan |

> Each command is backed by a workflow file in `~/.gemini/antigravity/global_workflows/` — you can inspect and customize them.

### 20 Specialist Agents

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
| `design-orchestrator` | Meta-agent: analyzes user intent -> dispatches right specialist(s) |
| `design-researcher` | Expert in user research methodologies (10 skills) |
| `design-systems-architect` | Expert in design systems (8 skills) |
| `ux-strategist` | Expert in UX strategy and competition (8 skills) |
| `ui-designer` | Expert in visual/UI design (9 skills) |
| `interaction-designer` | Expert in interaction patterns (7 skills) |
| `prototype-tester` | Expert in prototyping and validation (8 skills) |
| `design-ops-lead` | Expert in design operations (7 skills) |
| `designer-toolkit-expert` | Expert in design documentation (6 skills) |
| `marketing-growth-strategist` | Growth funnels, acquisition, retention, monetization |
| `marketing-conversion-specialist` | CRO across landing pages, signup flows, paywalls |
| `marketing-content-strategist` | Content engines, SEO, multi-channel distribution |
| `marketing-campaign-specialist` | Multi-channel campaign planning and execution |
| `marketing-panel-experts` | 6-persona marketing expert panel for strategy debates |

## Marketing Panel Experts

The `/marketing-panel` workflow uses six distinct expert personas who debate challenges from their own frameworks:

| Expert | Framework | Focus |
|--------|-----------|-------|
| **Ayla** | Permission Marketing, Purple Cow, Tribes | Brand building, remarkability, storytelling |
| **Donny** | Obviously Awesome positioning | Product positioning, market categories, competitive context |
| **Gustav** | Reforge growth loops, four fits | Growth strategy, acquisition channels, retention |
| **Kramer** | Copyhackers, conversion copywriting | CRO, persuasion, copy optimization |
| **Selin** | SEO, content strategy, audience research | Organic growth, audience-first thinking |
| **Efe** | B2B marketing ops, MKT1 | Marketing infrastructure, metrics, team alignment |

## Marketing Tools

SuperAntigravity ships a `tools/` directory (installed to `~/.gemini/antigravity/tools/`) giving agents direct access to 50+ marketing platforms:

- **46 CLI scripts** (`tools/clis/`) — Zero-dependency Node.js wrappers for platforms like GA4, Ahrefs, Mailchimp, Google Ads, Meta Ads, Semrush, Stripe, Segment, HubSpot, and more. Agents use these via `run_command` with env var credentials — no npm install required.
- **50 integration docs** (`tools/integrations/`) — API reference sheets with authentication guides, and rate limits for each platform.
- **Registry** (`tools/REGISTRY.md`) — Quick-reference index agents consult to discover which tools are available and how to use them.

Agents automatically check `~/.gemini/antigravity/tools/REGISTRY.md` when a task requires external platform data.

## How It Works

```
Install → GEMINI.md gets SuperAntigravity bootstrap block (always-on)
        → skills/ → ~/.gemini/antigravity/skills/
        → workflows/ → ~/.gemini/antigravity/global_workflows/
        → agents/ → ~/.gemini/antigravity/agents/
        → tools/ → ~/.gemini/antigravity/tools/

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

## Changelog

See the [CHANGELOG.md](CHANGELOG.md) for a detailed history of changes.

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
