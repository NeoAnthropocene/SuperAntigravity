#!/usr/bin/env bash
set -euo pipefail

# SuperAntigravity — Superpowers + SuperClaude for Google Antigravity
# https://github.com/derHaken/SuperAntigravity

REPO_URL="https://github.com/neoanthropocene/SuperAntigravity"
BRANCH="main"
SKILLS_DIR="$HOME/.gemini/antigravity/skills"
WORKFLOWS_DIR="$HOME/.gemini/antigravity/global_workflows"
AGENTS_DIR="$HOME/.gemini/antigravity/agents"
TOOLS_DIR="$HOME/.gemini/antigravity/tools"
GEMINI_DIR="$HOME/.gemini"
GEMINI_FILE="$GEMINI_DIR/GEMINI.md"
LIFTOFF_MARKER="# SuperAntigravity Skills"

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

log()   { echo -e "${GREEN}[superantigravity]${NC} $1"; }
warn()  { echo -e "${YELLOW}[superantigravity]${NC} $1"; }
error() { echo -e "${RED}[superantigravity]${NC} $1" >&2; exit 1; }

# Check for partial install
if [ -f "$HOME/.gemini/antigravity/.superantigravity-installed" ]; then
  warn "Previous install detected. Re-running will overwrite existing skills/workflows/agents."
fi

command -v git >/dev/null 2>&1 || error "git is required but not installed"

log "Installing SuperAntigravity..."

TMPDIR=$(mktemp -d)
trap "rm -rf $TMPDIR" EXIT

log "Downloading..."
git clone --depth 1 --branch "$BRANCH" "$REPO_URL" "$TMPDIR/superantigravity" 2>/dev/null \
  || error "Failed to clone. Check your internet connection and try again."

mkdir -p "$SKILLS_DIR" "$WORKFLOWS_DIR" "$AGENTS_DIR" "$TOOLS_DIR" "$GEMINI_DIR"

log "Installing skills..."
find "$TMPDIR/superantigravity/skills" -type f -name "SKILL.md" | while read -r skill_file; do
  skill_dir=$(dirname "$skill_file")
  rel_path="${skill_dir#$TMPDIR/superantigravity/skills/}"
  mkdir -p "$SKILLS_DIR/$rel_path"
  cp -r "$skill_dir"/* "$SKILLS_DIR/$rel_path/"
  echo "  ✓ $rel_path"
done

log "Installing workflows..."
for wf in "$TMPDIR/superantigravity/workflows"/*.md; do
  name=$(basename "$wf")
  cp "$wf" "$WORKFLOWS_DIR/$name"
  echo "  ✓ ${name%.md}"
done

log "Installing agents..."
for agent in "$TMPDIR/superantigravity/agents"/*.md; do
  name=$(basename "$agent")
  cp "$agent" "$AGENTS_DIR/$name"
  echo "  ✓ ${name%.md}"
done

log "Installing tools..."
if [ -d "$TMPDIR/superantigravity/tools" ]; then
  cp -r "$TMPDIR/superantigravity/tools"/* "$TOOLS_DIR/" 2>/dev/null || true
  echo "  ✓ tools directory (CLIs and Integrations)"
fi

log "Updating ~/.gemini/GEMINI.md..."
if [ -f "$GEMINI_FILE" ] && grep -q "$LIFTOFF_MARKER" "$GEMINI_FILE"; then
  warn "SuperAntigravity block already in GEMINI.md — skipping (run uninstall.sh first to reinstall)"
else
  [ -s "$GEMINI_FILE" ] && printf '\n\n' >> "$GEMINI_FILE"
  cat "$TMPDIR/superantigravity/rules/GEMINI.md" >> "$GEMINI_FILE"
  log "Bootstrap rules added"
fi

echo ""
echo -e "${GREEN}✓ SuperAntigravity installed!${NC}"
echo ""
echo "  107 skills    → $SKILLS_DIR"
echo "  48 workflows  → $WORKFLOWS_DIR"
echo "  23 agents     → $AGENTS_DIR"
echo "  tools/        → $TOOLS_DIR (46 CLIs + 50 Integrations)"
echo ""



echo "Restart Antigravity and type /brainstorm to get started."
echo ""

# Write manifest only on complete successful install
MANIFEST_FILE="$HOME/.gemini/antigravity/.superantigravity-installed"
echo "superantigravity-version=1.0.0" > "$MANIFEST_FILE"
echo "install-date=$(date -u +%Y-%m-%dT%H:%M:%SZ)" >> "$MANIFEST_FILE"

# Copy for Antigravity IDE
IDE_DIR="$HOME/.gemini/antigravity-ide"
if [ -d "$IDE_DIR" ]; then
  log "Copying for Antigravity IDE..."
  rm -rf "$IDE_DIR/skills" "$IDE_DIR/global_workflows" "$IDE_DIR/agents" "$IDE_DIR/tools"
  cp -r "$SKILLS_DIR" "$IDE_DIR/skills"
  cp -r "$WORKFLOWS_DIR" "$IDE_DIR/global_workflows"
  cp -r "$AGENTS_DIR" "$IDE_DIR/agents"
  cp -r "$TOOLS_DIR" "$IDE_DIR/tools"
  cp "$MANIFEST_FILE" "$IDE_DIR/.superantigravity-installed" 2>/dev/null || true
  echo "  ✓ Copied to $IDE_DIR"
  echo ""
fi
