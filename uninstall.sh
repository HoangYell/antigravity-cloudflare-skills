#!/bin/bash
# Antigravity Cloudflare Skill Uninstaller

SKILLS_DIR="$HOME/.gemini/antigravity/skills/cloudflare"

# Colors
GREEN='\033[0;32m'
CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${CYAN}🗑️  Uninstalling Antigravity Cloudflare Skill...${NC}"

if [ -d "$SKILLS_DIR" ]; then
    rm -rf "$SKILLS_DIR"
    echo -e "${GREEN}✅ Successfully removed: $SKILLS_DIR${NC}"
    echo -e "Use 'git clone' or 'install.sh' to re-install anytime."
else
    echo -e "${RED}⚠️  Skill directory not found: $SKILLS_DIR${NC}"
    echo -e "Nothing to uninstall."
fi
