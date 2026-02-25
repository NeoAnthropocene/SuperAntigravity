#!/usr/bin/env bash
set -euo pipefail

SKILLS_DIR="$HOME/.gemini/antigravity/skills"
WORKFLOWS_DIR="$HOME/.gemini/antigravity/global_workflows"
AGENTS_DIR="$HOME/.gemini/antigravity/agents"
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
)

LIFTOFF_WORKFLOWS=(
  brainstorm plan implement research build test git analyze design
  troubleshoot explain improve review cleanup document estimate
)

LIFTOFF_AGENTS=(
  code-reviewer backend-architect frontend-architect
  security-engineer deep-research system-architect
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

echo ""
echo -e "${GREEN}✓ SuperAntigravity uninstalled.${NC}"
