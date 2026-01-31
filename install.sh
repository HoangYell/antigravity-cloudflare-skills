#!/bin/bash
# Antigravity Cloudflare Skill Installer
# Installs the Cloudflare skill to your Antigravity Agent

REPO_OWNER="hoangyell"
REPO_NAME="antigravity-cloudflare-skills"
BRANCH="main"
SKILLS_DIR="$HOME/.gemini/antigravity/skills/cloudflare"
TEMP_DIR=$(mktemp -d)

# Colors
GREEN='\033[0;32m'
CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m'
GRAY='\033[0;90m'

echo -e "${CYAN}⚡ Installing Antigravity Cloudflare Skill...${NC}"

# 1. Create Directory
mkdir -p "$SKILLS_DIR"

# 2. Download and Extract Tarball
echo -e "⬇️  Downloading metadata..."
TARBALL_URL="https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/tarball/$BRANCH"

echo -e "📦 Downloading and extracting to $SKILLS_DIR..."
# Download tarball, extract to temp
if ! curl -fsSL "$TARBALL_URL" | tar xz -C "$TEMP_DIR"; then
    echo -e "${RED}❌ Failed to download repository.${NC}"
    rm -rf "$TEMP_DIR"
    exit 1
fi

# Locate extracted root
EXTRACTED_ROOT=$(find "$TEMP_DIR" -maxdepth 1 -type d -iname "$REPO_OWNER-$REPO_NAME-*" | head -n 1)

if [ -d "$EXTRACTED_ROOT/skills/cloudflare" ]; then
    echo -e "${GRAY}🔄 Merging files (Skipping existing to preserve customizations)...${NC}"
    
    # Use cp -n (no-clobber) to avoid overwriting existing files
    # If cp -n is not supported (some old Linux), fallback to loop?
    # Mac and modern Linux support -n.
    
    # We copy content of skills/cloudflare/* to destination
    # 2>/dev/null to suppress "not overwritten" warnings
    cp -Rn "$EXTRACTED_ROOT/skills/cloudflare/"* "$SKILLS_DIR/" 2>/dev/null
    
    echo -e "${GREEN}✅ Successfully installed/merged skill files.${NC}"
    echo -e "${GRAY}(Existing files were NOT replaced)${NC}"
    
    # Clean up
    rm -rf "$TEMP_DIR"
    
    echo ""
    echo -e "${GREEN}🎉 Installation Complete!${NC}"
    echo -e "Reload your agent to use the cloudflare skill."
else
    echo -e "${RED}❌ Failed to locate skill files in the downloaded archive.${NC}"
    rm -rf "$TEMP_DIR"
    exit 1
fi
