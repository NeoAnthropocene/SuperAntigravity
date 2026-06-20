# Changelog

All notable changes to the SuperAntigravity project will be documented in this file.

## [Unreleased]

## [1.2.0] - 2026-03-25
### Added
- Integrated 63 designer-skills under `skills/design-ops/`, `skills/design-research/`, etc.
- Added 9 design-focused agents:
  - `design-ops-lead`
  - `design-orchestrator`
  - `design-researcher`
  - `design-systems-architect`
  - `designer-toolkit-expert`
  - `interaction-designer`
  - `prototype-tester`
  - `ui-designer`
  - `ux-strategist`
- Added `/design-code` and `/design-orchestrate` workflows.
- Added implementation plan and design doc `docs/plans/2026-03-25-designer-skills-integration-design.md`.

### Changed
- Routed UI/UX brainstorming outcomes to `design-orchestrate` in brainstorm workflows.
- Updated `docs/pipeline.md`, `skills/brainstorming/SKILL.md`, and `workflows/brainstorm.md`.
- Updated `rules/GEMINI.md` to bootstrap the design-related rules.
- Updated `install.sh` and `README.md` to reference new design agents and workflows.

## [1.1.0] - 2026-02-27
### Added
- Added dependency-management skill with full integration (`skills/dependency-management/SKILL.md`).
- Added design documents and implementation plan for dependency management.

### Changed
- Updated repository and installation URLs to NeoAnthropocene fork in `install.sh`, `uninstall.sh`, and `README.md`.

## [1.0.0] - 2026-02-26
### Added
- Added Antigravity Conversation Mode (Planning/Fast) instructions to skills and workflows.
- Added browser-agent skill implementation plan.
- Added browser-agent skill (`skills/browser-agent/SKILL.md`) for browser subagent.
- Integrated SuperClaude panel and discovery tools natively (business-panel, spec-panel, recommend workflows).
- Ported socratic-mentor and repo-index agents.
- Added install scripts, README, pipeline doc.

### Changed
- Renamed framework from Liftoff to SuperAntigravity across all files and folders.
- Improved workflow slash command descriptions.
- Added missing YAML frontmatter to workflow files.
- Applied spec panel suggestions (retry limit, selector strategy, JS safety note).

## [0.1.0] - 2026-02-25
### Added
- Initialized SuperAntigravity repository.
