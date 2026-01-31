# Antigravity Cloudflare Skill Installer (Windows)

$Owner = "hoangyell"
$Repo = "antigravity-cloudflare-skills"
$Branch = "main"
$SkillsDir = "$HOME\.gemini\antigravity\skills\cloudflare"
$TempDir = Join-Path $env:TEMP $([System.Guid]::NewGuid().ToString())

Write-Host "⚡ Installing Antigravity Cloudflare Skill..." -ForegroundColor Cyan

try {
    # 1. Create Directory
    if (-not (Test-Path $SkillsDir)) {
        New-Item -ItemType Directory -Force -Path $SkillsDir | Out-Null
        Write-Host "📂 Created directory: $SkillsDir" -ForegroundColor Green
    }

    # 2. Download Zipball
    $ZipUrl = "https://api.github.com/repos/$Owner/$Repo/zipball/$Branch"
    $ZipFile = Join-Path $TempDir "repo.zip"
    
    New-Item -ItemType Directory -Force -Path $TempDir | Out-Null
    
    Write-Host "⬇️  Downloading repository archive..." -NoNewline
    Invoke-WebRequest -Uri $ZipUrl -OutFile $ZipFile -UseBasicParsing
    Write-Host " [OK]" -ForegroundColor Green

    # 3. Extract
    Write-Host "📦 Extracting files..." -NoNewline
    Expand-Archive -Path $ZipFile -DestinationPath $TempDir -Force
    Write-Host " [OK]" -ForegroundColor Green

    # 4. Move Files (Merge Logic)
    # Find the top-level folder
    $ExtractedRoot = Get-ChildItem -Path $TempDir -Directory | Where-Object { $_.Name -like "$Owner-$Repo-*" } | Select-Object -First 1

    if ($ExtractedRoot) {
        $SourceBasePath = Join-Path $ExtractedRoot.FullName "skills\cloudflare"
        
        Write-Host "🔄 Merging files into $SkillsDir..."
        Write-Host "(Skipping existing files to preserve customizations)" -ForegroundColor Gray

        # Get all files in source recursively
        $SourceFiles = Get-ChildItem -Path $SourceBasePath -Recurse -File

        foreach ($File in $SourceFiles) {
            # Calculate relative path
            $RelativePath = $File.FullName.Substring($SourceBasePath.Length + 1)
            $DestPath = Join-Path $SkillsDir $RelativePath
            
            # Create Dest Folder if needed
            $DestFolder = Split-Path $DestPath -Parent
            if (-not (Test-Path $DestFolder)) {
                New-Item -ItemType Directory -Force -Path $DestFolder | Out-Null
            }

            # Copy ONLY if destination does not exist
            if (-not (Test-Path $DestPath)) {
                Copy-Item -Path $File.FullName -Destination $DestPath
            }
        }
        
        Write-Host ""
        Write-Host "🎉 Installation Complete!" -ForegroundColor Green
        Write-Host "Reload your agent to use the cloudflare skill."
    } else {
        throw "Could not find valid repository structure in the archive."
    }

} catch {
    Write-Host ""
    Write-Host "❌ Error: $($_.Exception.Message)" -ForegroundColor Red
} finally {
    # Cleanup
    if (Test-Path $TempDir) {
        Remove-Item -Path $TempDir -Recurse -Force -ErrorAction SilentlyContinue
    }
}
