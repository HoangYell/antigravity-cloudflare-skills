# Antigravity Cloudflare Skill Uninstaller (Windows)

$SkillsDir = "$HOME\.gemini\antigravity\skills\cloudflare"

Write-Host "🗑️  Uninstalling Antigravity Cloudflare Skill..." -ForegroundColor Cyan

if (Test-Path $SkillsDir) {
    Remove-Item -Path $SkillsDir -Recurse -Force
    Write-Host "✅ Successfully removed: $SkillsDir" -ForegroundColor Green
    Write-Host "Use 'git clone' or 'install.ps1' to re-install anytime."
} else {
    Write-Host "⚠️  Skill directory not found: $SkillsDir" -ForegroundColor Yellow
    Write-Host "Nothing to uninstall."
}
