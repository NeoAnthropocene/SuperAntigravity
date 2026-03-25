# Designer Skills Integration into SuperAntigravity

Port [Owl-Listener/designer-skills](https://github.com/Owl-Listener/designer-skills) (63 skills, 27 commands, 8 plugins) into SuperAntigravity's agent/skill/workflow structure with a design orchestrator for automatic routing.

## Design Decisions

| Decision | Choice | Rationale |
|---|---|---|
| Skill grouping | B) Nested subdirectories | `skills/<group>/<skill>/SKILL.md` — maintains groups for easier management |
| Workflow naming | A) Group-prefixed | `design-research--discover.md` — no conflicts, self-documenting |
| Agent architecture | 1 orchestrator + 8 specialists | Focused context per agent, composable, parallelizable |
| Existing `/design` | Rename to `/design-code` | Preserves the code-architecture workflow; frees `/design-orchestrate` for the new orchestrator |

## Architecture Overview

```
User: "improve checkout UX"
    ↓
/design-orchestrate (workflow) → design-orchestrator (agent)
    ↓ analyzes intent
Dispatches specialist agents:
  → ux-strategist          (frame the problem)
  → design-researcher      (journey mapping)
  → interaction-designer   (flow design)
  → prototype-tester       (validate)
```

## What Gets Added

### 63 Skills (nested by group)

```
skills/
  design-research/            ← NEW group
    user-persona/SKILL.md
    empathy-map/SKILL.md
    journey-map/SKILL.md
    survey-design/SKILL.md
    usability-test/SKILL.md
    card-sorting/SKILL.md
    contextual-inquiry/SKILL.md
    diary-study/SKILL.md
    analytics-interpretation/SKILL.md
    research-synthesis/SKILL.md
  design-systems/             ← NEW group
    design-token/SKILL.md
    component-spec/SKILL.md
    accessibility-guidelines/SKILL.md
    theming-system/SKILL.md
    documentation-standards/SKILL.md
    naming-convention/SKILL.md
    contribution-guide/SKILL.md
    system-governance/SKILL.md
  ux-strategy/                ← NEW group
    competitive-analysis/SKILL.md
    design-principles/SKILL.md
    experience-map/SKILL.md
    stakeholder-alignment/SKILL.md
    opportunity-framework/SKILL.md
    metrics-definition/SKILL.md
    design-brief/SKILL.md
    user-segmentation/SKILL.md
  ui-design/                  ← NEW group
    layout-grid/SKILL.md
    color-system/SKILL.md
    typography-scale/SKILL.md
    spacing-system/SKILL.md
    visual-hierarchy/SKILL.md
    responsive-design/SKILL.md
    dark-mode-design/SKILL.md
    iconography/SKILL.md
    data-visualization/SKILL.md
  interaction-design/         ← NEW group
    micro-interaction/SKILL.md
    state-machine/SKILL.md
    gesture-design/SKILL.md
    error-handling-ux/SKILL.md
    feedback-pattern/SKILL.md
    loading-pattern/SKILL.md
    navigation-pattern/SKILL.md
  prototyping-testing/        ← NEW group
    prototype-strategy/SKILL.md
    usability-testing/SKILL.md
    heuristic-evaluation/SKILL.md
    ab-testing/SKILL.md
    accessibility-test-plan/SKILL.md
    user-flow-diagram/SKILL.md
    task-analysis/SKILL.md
    benchmark-test/SKILL.md
  design-ops/                 ← NEW group
    design-critique/SKILL.md
    design-qa-checklist/SKILL.md
    design-review-process/SKILL.md
    design-sprint-plan/SKILL.md
    handoff-spec/SKILL.md
    team-workflow/SKILL.md
    version-control-strategy/SKILL.md
  designer-toolkit/           ← NEW group
    case-study/SKILL.md
    design-rationale/SKILL.md
    design-system-adoption/SKILL.md
    design-token-audit/SKILL.md
    presentation-deck/SKILL.md
    ux-writing/SKILL.md
```

> [!NOTE]
> Exact skill names will be confirmed when reading each `SKILL.md` from the source repo during implementation. The names above are derived from the directory names.

### 27 Workflows (group-prefixed)

| Workflow File | Source Command | Purpose |
|---|---|---|
| `design-research--discover.md` | discover.md | Full user research discovery cycle |
| `design-research--interview.md` | interview.md | Prepare and conduct user interview |
| `design-research--test-plan.md` | test-plan.md | Create usability test plan |
| `design-research--synthesize.md` | synthesize.md | Synthesize research into insights |
| `design-systems--audit-system.md` | audit-system.md | Audit design system for consistency |
| `design-systems--create-component.md` | create-component.md | Scaffold component specification |
| `design-systems--tokenize.md` | tokenize.md | Extract and organize design tokens |
| `ux-strategy--strategize.md` | strategize.md | Develop complete UX strategy |
| `ux-strategy--benchmark.md` | benchmark.md | Competitive benchmarking analysis |
| `ux-strategy--frame-problem.md` | frame-problem.md | Structure ambiguous challenge |
| `ui-design--design-screen.md` | design-screen.md | Design complete screen layout |
| `ui-design--color-palette.md` | color-palette.md | Generate color palette with a11y |
| `ui-design--type-system.md` | type-system.md | Create typography system |
| `ui-design--responsive-audit.md` | responsive-audit.md | Audit responsive behavior |
| `interaction-design--design-interaction.md` | design-interaction.md | Design complete interaction flow |
| `interaction-design--map-states.md` | map-states.md | Model states and transitions |
| `interaction-design--error-flow.md` | error-flow.md | Design error handling for feature |
| `prototyping-testing--prototype-plan.md` | prototype-plan.md | Create prototyping and testing plan |
| `prototyping-testing--evaluate.md` | evaluate.md | Run heuristic evaluation |
| `prototyping-testing--test-plan.md` | test-plan.md | Design usability testing plan |
| `prototyping-testing--experiment.md` | experiment.md | Design A/B experiment |
| `design-ops--plan-sprint.md` | plan-sprint.md | Plan a design sprint |
| `design-ops--handoff.md` | handoff.md | Generate developer handoff package |
| `design-ops--setup-workflow.md` | setup-workflow.md | Set up design team workflow |
| `designer-toolkit--write-rationale.md` | write-rationale.md | Write design rationale |
| `designer-toolkit--build-presentation.md` | build-presentation.md | Structure design presentation |
| `designer-toolkit--write-case-study.md` | write-case-study.md | Create portfolio case study |

### 9 New Agents

| Agent File | Role |
|---|---|
| `design-orchestrator.md` | **Meta-agent**: analyzes user intent → dispatches right specialist(s) |
| `design-researcher.md` | Expert in user research methodologies (10 skills) |
| `design-systems-architect.md` | Expert in design systems (8 skills) |
| `ux-strategist.md` | Expert in UX strategy and competition (8 skills) |
| `ui-designer.md` | Expert in visual/UI design (9 skills) |
| `interaction-designer.md` | Expert in interaction patterns (7 skills) |
| `prototype-tester.md` | Expert in prototyping and validation (8 skills) |
| `design-ops-lead.md` | Expert in design operations (7 skills) |
| `designer-toolkit-expert.md` | Expert in design documentation (6 skills) |

### 1 Renamed Workflow

| Before | After | Why |
|---|---|---|
| `design.md` | `design-code.md` | Frees the "design" namespace; this workflow is about code/system architecture, not visual design |

### 1 New Orchestrator Workflow

| File | Purpose |
|---|---|
| `design-orchestrate.md` | Entry point workflow that loads the `design-orchestrator` agent to auto-route design tasks |

## Files Modified

### `install.sh`
- Add loop for nested skill directories (`skills/<group>/<skill>/SKILL.md`)
- Update counts in summary output
- Handle the new designer-skills group structure

### `uninstall.sh`
- Add designer skill groups to the removal lists
- Add new workflows and agents to the removal lists
- Handle rename of `design` → `design-code`

### `rules/GEMINI.md`
- Add "Designer Skills" section documenting all 8 groups
- Add design orchestrator and specialist agents to the tables
- Add design slash commands table
- Rename `/design` → `/design-code` in the slash commands table
- Add `/design-orchestrate` to the slash commands table

### `README.md`
- Update skill/workflow/agent counts
- Add Designer Skills section with group table
- Add design agents and commands tables
- Rename `/design` → `/design-code`
- Credit designer-skills repo

## Porting Notes

### Format Compatibility
- Source `SKILL.md` files use identical YAML frontmatter (`name`, `description`) — **copy directly** ✅
- Source `commands/*.md` use `description` + `argument-hint` frontmatter — adapt to workflow format (`description` only, drop `argument-hint`)
- Source commands reference skills by name (e.g., `user-persona` skill) — **these references stay valid** since skill names don't change, only their directory path

### What Gets Dropped
- `.claude-plugin/` directories (Claude-specific metadata, not used by Antigravity)
- `marketplace.json` files
- Group-level `README.md` files (content absorbed into our `README.md` and `GEMINI.md`)

## Verification Plan

### Manual Verification
1. After implementation, run `install.sh` on a clean environment and verify:
   - All 83 skills appear in `~/.gemini/antigravity/skills/`
   - All 46 workflows appear in `~/.gemini/antigravity/global_workflows/`
   - All 18 agents appear in `~/.gemini/antigravity/agents/`
   - `GEMINI.md` contains the designer skills section
2. Run `uninstall.sh` and verify all designer-skills content is removed cleanly
3. Verify the renamed `design-code.md` workflow still functions correctly
4. Verify no broken skill references in the ported workflows
