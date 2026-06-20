#!/usr/bin/env bash
set -euo pipefail

# SuperAntigravity — Update Script
# https://github.com/neoanthropocene/SuperAntigravity

REPO_URL="https://github.com/neoanthropocene/SuperAntigravity"
BRANCH="main"
SKILLS_DIR="$HOME/.gemini/antigravity/skills"
WORKFLOWS_DIR="$HOME/.gemini/antigravity/global_workflows"
AGENTS_DIR="$HOME/.gemini/antigravity/agents"
TOOLS_DIR="$HOME/.gemini/antigravity/tools"
GEMINI_FILE="$HOME/.gemini/GEMINI.md"
LIFTOFF_MARKER="# SuperAntigravity Skills"
MANIFEST_FILE="$HOME/.gemini/antigravity/.superantigravity-installed"

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
CYAN='\033[0;36m'
NC='\033[0m'

log()   { echo -e "${GREEN}[superantigravity]${NC} $1"; }
warn()  { echo -e "${YELLOW}[superantigravity]${NC} $1"; }
info()  { echo -e "${CYAN}[superantigravity]${NC} $1"; }
error() { echo -e "${RED}[superantigravity]${NC} $1" >&2; exit 1; }

# Require an existing install
if [ ! -f "$MANIFEST_FILE" ]; then
  error "SuperAntigravity is not installed. Run install.sh first."
fi

command -v git >/dev/null 2>&1 || error "git is required but not installed"

log "Checking for updates..."

TMPDIR=$(mktemp -d)
trap "rm -rf $TMPDIR" EXIT

log "Downloading latest version..."
git clone --depth 1 --branch "$BRANCH" "$REPO_URL" "$TMPDIR/superantigravity" 2>/dev/null \
  || error "Failed to download. Check your internet connection and try again."

# ── Helper: compare a single installed file against the incoming repo version ──
# Prints "new", "updated", "modified", or "unchanged"
classify_file() {
  local installed="$1"
  local incoming="$2"

  if [ ! -f "$installed" ]; then
    echo "new"
  elif diff -q "$installed" "$incoming" >/dev/null 2>&1; then
    echo "unchanged"
  else
    # File differs — check if it was already different at last install.
    # We don't keep the old repo snapshot, so we conservatively treat any
    # difference as "user-modified" and back it up.
    echo "modified"
  fi
}

# ── Scan all components ────────────────────────────────────────────────────────
NEW_SKILLS=() UPDATED_SKILLS=() MODIFIED_SKILLS=() UNCHANGED_SKILLS=()
NEW_WORKFLOWS=() UPDATED_WORKFLOWS=() MODIFIED_WORKFLOWS=() UNCHANGED_WORKFLOWS=()
NEW_AGENTS=() UPDATED_AGENTS=() MODIFIED_AGENTS=() UNCHANGED_AGENTS=()
TOOLS_CHANGED=0

# Skills
for skill_dir in "$TMPDIR/superantigravity/skills"/*/; do
  skill_name=$(basename "$skill_dir")
  if [ -f "$skill_dir/SKILL.md" ]; then
    installed_skill="$SKILLS_DIR/$skill_name/SKILL.md"
    incoming_skill="$skill_dir/SKILL.md"
    case $(classify_file "$installed_skill" "$incoming_skill") in
      new)       NEW_SKILLS+=("$skill_name") ;;
      modified)  MODIFIED_SKILLS+=("$skill_name") ;;
      unchanged) UNCHANGED_SKILLS+=("$skill_name") ;;
    esac
  fi
done

# Workflows
for wf in "$TMPDIR/superantigravity/workflows"/*.md; do
  name=$(basename "${wf%.md}")
  installed_wf="$WORKFLOWS_DIR/$(basename "$wf")"
  case $(classify_file "$installed_wf" "$wf") in
    new)       NEW_WORKFLOWS+=("$name") ;;
    modified)  MODIFIED_WORKFLOWS+=("$name") ;;
    unchanged) UNCHANGED_WORKFLOWS+=("$name") ;;
  esac
done

# Agents
for agent in "$TMPDIR/superantigravity/agents"/*.md; do
  name=$(basename "${agent%.md}")
  installed_agent="$AGENTS_DIR/$(basename "$agent")"
  case $(classify_file "$installed_agent" "$agent") in
    new)       NEW_AGENTS+=("$name") ;;
    modified)  MODIFIED_AGENTS+=("$name") ;;
    unchanged) UNCHANGED_AGENTS+=("$name") ;;
  esac
done

# Tools (just count changed files, don't list individually)
if [ -d "$TMPDIR/superantigravity/tools" ]; then
  while IFS= read -r -d '' incoming_tool; do
    rel="${incoming_tool#$TMPDIR/superantigravity/tools/}"
    installed_tool="$TOOLS_DIR/$rel"
    if [ ! -f "$installed_tool" ] || ! diff -q "$installed_tool" "$incoming_tool" >/dev/null 2>&1; then
      TOOLS_CHANGED=$((TOOLS_CHANGED + 1))
    fi
  done < <(find "$TMPDIR/superantigravity/tools" -type f -print0)
fi

# ── Print summary ──────────────────────────────────────────────────────────────
echo ""
info "Update summary:"
printf "  Skills:    %d new, %d modified by you, %d unchanged\n" \
  "${#NEW_SKILLS[@]}" "${#MODIFIED_SKILLS[@]}" "${#UNCHANGED_SKILLS[@]}"
printf "  Workflows: %d new, %d modified by you, %d unchanged\n" \
  "${#NEW_WORKFLOWS[@]}" "${#MODIFIED_WORKFLOWS[@]}" "${#UNCHANGED_WORKFLOWS[@]}"
printf "  Agents:    %d new, %d modified by you, %d unchanged\n" \
  "${#NEW_AGENTS[@]}" "${#MODIFIED_AGENTS[@]}" "${#UNCHANGED_AGENTS[@]}"
[ "$TOOLS_CHANGED" -gt 0 ] && printf "  Tools:     %d file(s) to update\n" "$TOOLS_CHANGED"

# Announce what will be backed up
ALL_MODIFIED=("${MODIFIED_SKILLS[@]}" "${MODIFIED_WORKFLOWS[@]}" "${MODIFIED_AGENTS[@]}")
if [ "${#ALL_MODIFIED[@]}" -gt 0 ]; then
  echo ""
  warn "${#ALL_MODIFIED[@]} locally modified file(s) detected — will backup before overwriting:"
  for skill in "${MODIFIED_SKILLS[@]}"; do
    echo "  ${CYAN}skill${NC}    $SKILLS_DIR/$skill/SKILL.md → Will backup to SKILL.md.bak"
  done
  for wf in "${MODIFIED_WORKFLOWS[@]}"; do
    echo "  ${CYAN}workflow${NC} $WORKFLOWS_DIR/$wf.md → Will backup to $wf.md.bak"
  done
  for agent in "${MODIFIED_AGENTS[@]}"; do
    echo "  ${CYAN}agent${NC}    $AGENTS_DIR/$agent.md → Will backup to $agent.md.bak"
  done
fi

echo ""
read -p "Continue? [Y/n] " -n 1 -r; echo ""
[[ $REPLY =~ ^[Yy]$|^$ ]] || { echo "Aborted."; exit 0; }

# ── Execute update (backups happen here, after confirmation) ───────────────────
log "Updating skills..."
for skill_dir in "$TMPDIR/superantigravity/skills"/*/; do
  skill_name=$(basename "$skill_dir")
  if [ -f "$skill_dir/SKILL.md" ]; then
    installed_skill="$SKILLS_DIR/$skill_name/SKILL.md"
    # Back up if user-modified
    if [ -f "$installed_skill" ] && ! diff -q "$installed_skill" "$skill_dir/SKILL.md" >/dev/null 2>&1; then
      cp "$installed_skill" "${installed_skill%.md}.bak"
      echo "  ↩ $skill_name (backed up)"
    fi
    mkdir -p "$SKILLS_DIR/$skill_name"
    cp -r "$skill_dir"/* "$SKILLS_DIR/$skill_name/"
    [[ " ${NEW_SKILLS[*]} " =~ " $skill_name " ]] && echo "  ✓ $skill_name (new)" \
      || echo "  ✓ $skill_name"
  fi
done

log "Updating workflows..."
for wf in "$TMPDIR/superantigravity/workflows"/*.md; do
  name=$(basename "${wf%.md}")
  installed_wf="$WORKFLOWS_DIR/$(basename "$wf")"
  if [ -f "$installed_wf" ] && ! diff -q "$installed_wf" "$wf" >/dev/null 2>&1; then
    cp "$installed_wf" "${installed_wf%.md}.bak"
    echo "  ↩ $name (backed up)"
  fi
  cp "$wf" "$WORKFLOWS_DIR/$(basename "$wf")"
  [[ " ${NEW_WORKFLOWS[*]} " =~ " $name " ]] && echo "  ✓ $name (new)" \
    || echo "  ✓ $name"
done

log "Updating agents..."
for agent in "$TMPDIR/superantigravity/agents"/*.md; do
  name=$(basename "${agent%.md}")
  installed_agent="$AGENTS_DIR/$(basename "$agent")"
  if [ -f "$installed_agent" ] && ! diff -q "$installed_agent" "$agent" >/dev/null 2>&1; then
    cp "$installed_agent" "${installed_agent%.md}.bak"
    echo "  ↩ $name (backed up)"
  fi
  cp "$agent" "$AGENTS_DIR/$(basename "$agent")"
  [[ " ${NEW_AGENTS[*]} " =~ " $name " ]] && echo "  ✓ $name (new)" \
    || echo "  ✓ $name"
done

log "Updating tools..."
if [ -d "$TMPDIR/superantigravity/tools" ]; then
  mkdir -p "$TOOLS_DIR"
  cp -r "$TMPDIR/superantigravity/tools/"* "$TOOLS_DIR/" 2>/dev/null || true
  echo "  ✓ tools directory"
fi

log "Refreshing ~/.gemini/GEMINI.md bootstrap block..."
if [ -f "$GEMINI_FILE" ] && grep -q "$LIFTOFF_MARKER" "$GEMINI_FILE"; then
  python3 -c "
import re
content = open('$GEMINI_FILE').read()
cleaned = re.sub(r'\n*# SuperAntigravity Skills.*', '', content, flags=re.DOTALL).rstrip()
open('$GEMINI_FILE', 'w').write(cleaned + '\n\n' if cleaned else '')
"
fi
[ -s "$GEMINI_FILE" ] && printf '\n\n' >> "$GEMINI_FILE"
cat "$TMPDIR/superantigravity/rules/GEMINI.md" >> "$GEMINI_FILE"
echo "  ✓ refreshed"

# Update manifest
echo "superantigravity-version=1.0.0" > "$MANIFEST_FILE"
echo "update-date=$(date -u +%Y-%m-%dT%H:%M:%SZ)" >> "$MANIFEST_FILE"

echo ""
echo -e "${GREEN}✓ SuperAntigravity updated!${NC}"
echo ""
echo "Restart Antigravity to use the latest version."
echo ""
