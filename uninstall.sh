#!/usr/bin/env bash
set -euo pipefail

SKILLS_DIR="$HOME/.gemini/antigravity/skills"
WORKFLOWS_DIR="$HOME/.gemini/antigravity/global_workflows"
AGENTS_DIR="$HOME/.gemini/antigravity/agents"
TOOLS_DIR="$HOME/.gemini/antigravity/tools"
GEMINI_FILE="$HOME/.gemini/GEMINI.md"
LIFTOFF_MARKER="# SuperAntigravity Skills"

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

log()  { echo -e "${GREEN}[superantigravity]${NC} $1"; }
warn() { echo -e "${YELLOW}[superantigravity]${NC} $1"; }

LIFTOFF_SKILLS=(
  using-superantigravity brainstorming writing-plans executing-plans
  subagent-driven-development test-driven-development systematic-debugging
  verification-before-completion requesting-code-review receiving-code-review
  finishing-a-development-branch dispatching-parallel-agents writing-skills
  deep-research performance-optimization security-review architecture-design
  confidence-check
  design-ops design-research design-systems ux-strategy ui-design
  interaction-design prototyping-testing designer-toolkit
  campaign-strategy copywriting copy-editing social-content
  seo-audit schema-markup programmatic-seo page-cro
  form-cro signup-flow-cro popup-cro onboarding-cro
  paywall-upgrade-cro pricing-strategy launch-strategy referral-program
  free-tool-strategy marketing-ideas marketing-psychology paid-ads
  email-sequence competitor-alternatives ab-test-setup analytics-tracking
)

LIFTOFF_WORKFLOWS=(
  brainstorm plan implement research build test git analyze design-code
  troubleshoot explain improve review cleanup document estimate design-orchestrate
  design-research--discover design-research--interview design-research--test-plan design-research--synthesize
  design-systems--audit-system design-systems--create-component design-systems--tokenize
  ux-strategy--strategize ux-strategy--benchmark ux-strategy--frame-problem
  ui-design--design-screen ui-design--color-palette ui-design--type-system ui-design--responsive-audit
  interaction-design--design-interaction interaction-design--map-states interaction-design--error-flow
  prototyping-testing--prototype-plan prototyping-testing--evaluate prototyping-testing--test-plan prototyping-testing--experiment
  design-ops--plan-sprint design-ops--handoff design-ops--setup-workflow
  designer-toolkit--write-rationale designer-toolkit--build-presentation designer-toolkit--write-case-study
  business-panel spec-panel recommend
  marketing-audit marketing-launch marketing-panel marketing-growth-experiment
  marketing-content-pipeline marketing-campaign-builder
)

LIFTOFF_AGENTS=(
  code-reviewer backend-architect frontend-architect
  security-engineer deep-research system-architect
  socratic-mentor repo-index
  design-orchestrator design-researcher design-systems-architect
  ux-strategist ui-designer interaction-designer prototype-tester
  design-ops-lead designer-toolkit-expert
  marketing-growth-strategist marketing-conversion-specialist
  marketing-content-strategist marketing-campaign-specialist
  marketing-panel-experts business-panel-experts
)

echo "This will remove SuperAntigravity skills, workflows, agents, and the GEMINI.md block."
read -p "Continue? [y/N] " -n 1 -r; echo ""
[[ $REPLY =~ ^[Yy]$ ]] || { echo "Aborted."; exit 0; }

log "Removing skills..."
for skill in "${LIFTOFF_SKILLS[@]}"; do
  [ -d "$SKILLS_DIR/$skill" ] && rm -rf "$SKILLS_DIR/$skill" && echo "  ✓ $skill"
done

log "Removing workflows..."
for wf in "${LIFTOFF_WORKFLOWS[@]}"; do
  [ -f "$WORKFLOWS_DIR/$wf.md" ] && rm "$WORKFLOWS_DIR/$wf.md" && echo "  ✓ $wf"
done

log "Removing agents..."
for agent in "${LIFTOFF_AGENTS[@]}"; do
  [ -f "$AGENTS_DIR/$agent.md" ] && rm "$AGENTS_DIR/$agent.md" && echo "  ✓ $agent"
done

log "Removing tools..."
if [ -d "$TOOLS_DIR" ]; then
  rm -rf "$TOOLS_DIR"
  echo "  ✓ tools directory"
fi

if [ -f "$GEMINI_FILE" ] && grep -q "$LIFTOFF_MARKER" "$GEMINI_FILE"; then
  log "Removing SuperAntigravity block from GEMINI.md..."
  python3 -c "
import re, sys
content = open('$GEMINI_FILE').read()
# Remove the superantigravity block (from marker to end or next major section)
cleaned = re.sub(r'\n*# SuperAntigravity Skills.*', '', content, flags=re.DOTALL).rstrip()
open('$GEMINI_FILE', 'w').write(cleaned + '\n' if cleaned else '')
print('  ✓ removed')
"
else
  warn "No SuperAntigravity block found in GEMINI.md"
fi

IDE_DIR="$HOME/.gemini/antigravity-ide"
if [ -d "$IDE_DIR" ]; then
  log "Removing Antigravity IDE links..."
  [ -L "$IDE_DIR/skills" ] && rm "$IDE_DIR/skills"
  [ -L "$IDE_DIR/global_workflows" ] && rm "$IDE_DIR/global_workflows"
  [ -L "$IDE_DIR/agents" ] && rm "$IDE_DIR/agents"
  [ -L "$IDE_DIR/tools" ] && rm "$IDE_DIR/tools"
  echo "  ✓ IDE links removed"
fi

echo ""
echo -e "${GREEN}✓ SuperAntigravity uninstalled.${NC}"
