#!/bin/bash
# Stella IP Kit installer
# Usage:
#   ./stella_ip_kit/install.sh
#   ./stella_ip_kit/install.sh /path/to/project
#   curl -fsSL https://raw.githubusercontent.com/<owner>/<repo>/main/stella_ip_kit/install.sh | bash

set -euo pipefail

REPO_RAW="${REPO_RAW:-https://raw.githubusercontent.com/<owner>/<repo>/main/stella_ip_kit}"
SKILLS_ROOT="${SKILLS_ROOT:-.claude/skills}"
MEMORY_ROOT="${MEMORY_ROOT:-memory/stella-ip-director}"
INSTRUCTIONS_FILE="${INSTRUCTIONS_FILE:-CLAUDE.md}"
INCLUDE_OPENAI_METADATA="${INCLUDE_OPENAI_METADATA:-1}"
INCLUDE_INSTRUCTIONS_BLOCK="${INCLUDE_INSTRUCTIONS_BLOCK:-1}"

if [ -n "${1:-}" ]; then
    TARGET="$1"
else
    TARGET="$(pwd)"
fi

if [ ! -d "$TARGET" ]; then
    echo "Error: target directory does not exist: $TARGET"
    exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
LOCAL_KIT="$SCRIPT_DIR"

SKILLS=(
    stella
    stella-ip-direction
    stella-ip-director
    stella-ip-planning
    stella-ip-episode
    stella-ip-script
    stella-ip-package
    stella-ip-review
)

MEMORY_FILES=(
    ip-profile.md
    topic-backlog.md
    production-board.md
    publishing-log.md
)

skill_extra_files() {
    case "$1" in
        stella-ip-director)
            if [ "$INCLUDE_OPENAI_METADATA" = "1" ]; then
                printf '%s\n' "agents/openai.yaml"
            fi
            printf '%s\n' "references/memory-template.md"
            ;;
        *)
            if [ "$INCLUDE_OPENAI_METADATA" = "1" ]; then
                printf '%s\n' "agents/openai.yaml"
            fi
            ;;
    esac
}

copy_if_missing() {
    local src="$1"
    local dest="$2"
    mkdir -p "$(dirname "$dest")"
    if [ -f "$dest" ]; then
        echo "  [skip] $dest"
    else
        cp "$src" "$dest"
        echo "  [done] $dest"
    fi
}

download_if_missing() {
    local src="$1"
    local dest="$2"
    mkdir -p "$(dirname "$dest")"
    if [ -f "$dest" ]; then
        echo "  [skip] $dest"
    else
        curl -fsSL "$src" -o "$dest"
        echo "  [done] $dest"
    fi
}

install_file() {
    local relative_path="$1"
    local dest="$2"
    if [ -f "$LOCAL_KIT/$relative_path" ]; then
        copy_if_missing "$LOCAL_KIT/$relative_path" "$dest"
    else
        download_if_missing "$REPO_RAW/$relative_path" "$dest"
    fi
}

echo ""
echo "Stella IP Kit"
echo "Installing to: $TARGET"
echo ""

mkdir -p "$TARGET/$SKILLS_ROOT"
mkdir -p "$TARGET/$MEMORY_ROOT"

echo "Installing skills..."
for skill in "${SKILLS[@]}"; do
    install_file "skills/$skill/SKILL.md" "$TARGET/$SKILLS_ROOT/$skill/SKILL.md"
    while IFS= read -r extra; do
        [ -n "$extra" ] || continue
        install_file "skills/$skill/$extra" "$TARGET/$SKILLS_ROOT/$skill/$extra"
    done < <(skill_extra_files "$skill")
done

echo ""
echo "Installing memory templates..."
for memfile in "${MEMORY_FILES[@]}"; do
    install_file "memory/stella-ip-director/$memfile" "$TARGET/$MEMORY_ROOT/$memfile"
done

CLAUDE_MD="$TARGET/$INSTRUCTIONS_FILE"
MARKER="# Stella IP Kit"
if [ "$INCLUDE_INSTRUCTIONS_BLOCK" != "1" ]; then
    :
elif [ -f "$CLAUDE_MD" ] && grep -q "$MARKER" "$CLAUDE_MD"; then
    echo ""
    echo "  [skip] CLAUDE.md already contains the Stella block"
else
    echo ""
    echo "Adding Stella block to CLAUDE.md..."
    cat >> "$CLAUDE_MD" <<'BLOCK'

# Stella IP Kit
# Start with /stella

## Stella Personal IP System
- `/stella` - Entry point and onboarding router
- `/stella-ip-direction` - Business direction and account positioning
- `/stella-ip-director` - One-step workflow controller
- `/stella-ip-planning` - Long-range planning and topic system
- `/stella-ip-episode` - Single-episode planning
- `/stella-ip-script` - Script, shot list, and filming package
- `/stella-ip-package` - Hook, title, cover, caption, and AI-tone cleanup
- `/stella-ip-review` - Post-publish review and iteration

Memory: `memory/stella-ip-director/` (`ip-profile.md`, `topic-backlog.md`, `production-board.md`, `publishing-log.md`)
BLOCK
    echo "  [done] $INSTRUCTIONS_FILE updated"
fi

echo ""
echo "Stella IP Kit installed successfully."
echo ""
echo "Next steps:"
echo "  1. Open your project in the agent"
echo "  2. Type: /stella"
echo "  3. Complete business direction and account positioning"
echo ""
