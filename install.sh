#!/usr/bin/env bash
set -euo pipefail

# Liftoff — Superpowers + SuperClaude for Google Antigravity
# https://github.com/YOUR_USERNAME/liftoff

REPO_URL="https://github.com/YOUR_USERNAME/liftoff"
BRANCH="main"
SKILLS_DIR="$HOME/.gemini/antigravity/skills"
WORKFLOWS_DIR="$HOME/.gemini/antigravity/global_workflows"
AGENTS_DIR="$HOME/.gemini/antigravity/agents"
GEMINI_DIR="$HOME/.gemini"
GEMINI_FILE="$GEMINI_DIR/GEMINI.md"
LIFTOFF_MARKER="# Liftoff Skills"

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

log()   { echo -e "${GREEN}[liftoff]${NC} $1"; }
warn()  { echo -e "${YELLOW}[liftoff]${NC} $1"; }
error() { echo -e "${RED}[liftoff]${NC} $1" >&2; exit 1; }

# Check for partial install
if [ -f "$HOME/.gemini/antigravity/.liftoff-installed" ]; then
  warn "Previous install detected. Re-running will overwrite existing skills/workflows/agents."
fi

command -v git >/dev/null 2>&1 || error "git is required but not installed"

log "Installing Liftoff..."

TMPDIR=$(mktemp -d)
trap "rm -rf $TMPDIR" EXIT

log "Downloading..."
git clone --depth 1 --branch "$BRANCH" "$REPO_URL" "$TMPDIR/liftoff" 2>/dev/null \
  || error "Failed to clone. Check your internet connection and try again."

mkdir -p "$SKILLS_DIR" "$WORKFLOWS_DIR" "$AGENTS_DIR" "$GEMINI_DIR"

log "Installing skills..."
for skill_dir in "$TMPDIR/liftoff/skills"/*/; do
  skill_name=$(basename "$skill_dir")
  if [ -f "$skill_dir/SKILL.md" ]; then
    mkdir -p "$SKILLS_DIR/$skill_name"
    cp -r "$skill_dir"/* "$SKILLS_DIR/$skill_name/"
    echo "  ✓ $skill_name"
  fi
done

log "Installing workflows..."
for wf in "$TMPDIR/liftoff/workflows"/*.md; do
  name=$(basename "$wf")
  cp "$wf" "$WORKFLOWS_DIR/$name"
  echo "  ✓ ${name%.md}"
done

log "Installing agents..."
for agent in "$TMPDIR/liftoff/agents"/*.md; do
  name=$(basename "$agent")
  cp "$agent" "$AGENTS_DIR/$name"
  echo "  ✓ ${name%.md}"
done

log "Updating ~/.gemini/GEMINI.md..."
if [ -f "$GEMINI_FILE" ] && grep -q "$LIFTOFF_MARKER" "$GEMINI_FILE"; then
  warn "Liftoff block already in GEMINI.md — skipping (run uninstall.sh first to reinstall)"
else
  [ -s "$GEMINI_FILE" ] && printf '\n\n' >> "$GEMINI_FILE"
  cat "$TMPDIR/liftoff/rules/GEMINI.md" >> "$GEMINI_FILE"
  log "Bootstrap rules added"
fi

echo ""
echo -e "${GREEN}✓ Liftoff installed!${NC}"
echo ""
echo "  19 skills   → $SKILLS_DIR"
echo "  16 workflows → $WORKFLOWS_DIR"
echo "   6 agents   → $AGENTS_DIR"
echo ""
echo "Restart Antigravity and type /brainstorm to get started."
echo ""

# Write manifest only on complete successful install
MANIFEST_FILE="$HOME/.gemini/antigravity/.liftoff-installed"
echo "liftoff-version=1.0.0" > "$MANIFEST_FILE"
echo "install-date=$(date -u +%Y-%m-%dT%H:%M:%SZ)" >> "$MANIFEST_FILE"
