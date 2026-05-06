#!/bin/bash

# Antigravity Lazyweb Skill Installer
# Target: ~/.gemini/antigravity/skills/

set -e

SKILLS_DIR="$HOME/.gemini/antigravity/skills"
MCP_CONFIG="$HOME/.gemini/antigravity/mcp_config.json"
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "🚀 Installing Antigravity Lazyweb Skills..."

# 1. Ensure Antigravity skills directory exists
mkdir -p "$SKILLS_DIR"

# 2. Copy skill folders to the global skills directory
echo "📦 Copying skills to $SKILLS_DIR..."
cp -R "$REPO_DIR"/lazyweb-add-inspo-source "$SKILLS_DIR/"
cp -R "$REPO_DIR"/lazyweb-design-brainstorm "$SKILLS_DIR/"
cp -R "$REPO_DIR"/lazyweb-design-improve "$SKILLS_DIR/"
cp -R "$REPO_DIR"/lazyweb-design-research "$SKILLS_DIR/"
cp -R "$REPO_DIR"/lazyweb-quick-references "$SKILLS_DIR/"
cp -R "$REPO_DIR"/lazyweb-remove-inspo-source "$SKILLS_DIR/"

# 3. Update global MCP configuration
if [ ! -f "$MCP_CONFIG" ] || [ ! -s "$MCP_CONFIG" ]; then
    echo "🆕 Initializing mcp_config.json..."
    cp "$REPO_DIR/.mcp.json" "$MCP_CONFIG"
else
    echo "🔄 Updating mcp_config.json with Lazyweb server..."
    # Use jq to merge the lazyweb server definition into the existing config
    if command -v jq >/dev/null 2>&1; then
        jq -s '.[0] * .[1]' "$MCP_CONFIG" "$REPO_DIR/.mcp.json" > "$MCP_CONFIG.tmp" && mv "$MCP_CONFIG.tmp" "$MCP_CONFIG"
    else
        echo "⚠️  Warning: jq not found. Please manually add the lazyweb server from .mcp.json to $MCP_CONFIG"
    fi
fi

echo "✅ Installation complete!"
echo "💡 Tip: Restart Antigravity to activate the new skills."
