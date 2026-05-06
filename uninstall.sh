#!/bin/bash

# Antigravity Lazyweb Skill Uninstaller

set -e

SKILLS_DIR="$HOME/.gemini/antigravity/skills"
MCP_CONFIG="$HOME/.gemini/antigravity/mcp_config.json"

echo "🗑️  Uninstalling Antigravity Lazyweb Skills..."

# 1. Remove skill folders
echo "📂 Removing skills from $SKILLS_DIR..."
rm -rf "$SKILLS_DIR"/lazyweb-add-inspo-source
rm -rf "$SKILLS_DIR"/lazyweb-design-brainstorm
rm -rf "$SKILLS_DIR"/lazyweb-design-improve
rm -rf "$SKILLS_DIR"/lazyweb-design-research
rm -rf "$SKILLS_DIR"/lazyweb-quick-references
rm -rf "$SKILLS_DIR"/lazyweb-remove-inspo-source

# 2. Remove Lazyweb server from MCP config
if [ -f "$MCP_CONFIG" ]; then
    echo "🧹 Removing Lazyweb server from mcp_config.json..."
    if command -v jq >/dev/null 2>&1; then
        jq 'del(.mcpServers.lazyweb)' "$MCP_CONFIG" > "$MCP_CONFIG.tmp" && mv "$MCP_CONFIG.tmp" "$MCP_CONFIG"
    else
        echo "⚠️  Warning: jq not found. Please manually remove the 'lazyweb' entry from $MCP_CONFIG"
    fi
fi

echo "✅ Uninstallation complete!"
