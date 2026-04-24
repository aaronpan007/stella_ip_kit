param(
    [string]$Target = (Get-Location).Path,
    [string]$SkillsRoot = ".claude/skills",
    [string]$MemoryRoot = "memory/stella-ip-director",
    [string]$InstructionsFile = "CLAUDE.md",
    [switch]$SkipOpenAIMetadata,
    [switch]$SkipInstructionsBlock
)

$ErrorActionPreference = "Stop"

$RepoRaw = if ($env:REPO_RAW) {
    $env:REPO_RAW
} else {
    "https://raw.githubusercontent.com/<owner>/<repo>/main/stella_ip_kit"
}

if (-not (Test-Path -LiteralPath $Target -PathType Container)) {
    throw "Target directory does not exist: $Target"
}

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$LocalKit = $ScriptDir

$Skills = @(
    "stella",
    "stella-ip-direction",
    "stella-ip-director",
    "stella-ip-planning",
    "stella-ip-episode",
    "stella-ip-script",
    "stella-ip-package",
    "stella-ip-review"
)

$MemoryFiles = @(
    "ip-profile.md",
    "topic-backlog.md",
    "production-board.md",
    "publishing-log.md"
)

function Get-SkillExtraFiles {
    param([string]$SkillName)
    $files = @()
    if (-not $SkipOpenAIMetadata) {
        $files += "agents/openai.yaml"
    }
    if ($SkillName -eq "stella-ip-director") {
        $files += "references/memory-template.md"
    }
    return $files
}

function Install-File {
    param(
        [string]$RelativePath,
        [string]$Destination
    )

    $destinationDir = Split-Path -Parent $Destination
    if ($destinationDir) {
        New-Item -ItemType Directory -Force -Path $destinationDir | Out-Null
    }

    if (Test-Path -LiteralPath $Destination) {
        Write-Host "  [skip] $Destination"
        return
    }

    $localSource = Join-Path $LocalKit $RelativePath
    if (Test-Path -LiteralPath $localSource) {
        Copy-Item -LiteralPath $localSource -Destination $Destination -Force
        Write-Host "  [done] $Destination"
        return
    }

    $remoteSource = "$RepoRaw/$($RelativePath -replace '\\','/')"
    Invoke-WebRequest -Uri $remoteSource -OutFile $Destination | Out-Null
    Write-Host "  [done] $Destination"
}

Write-Host ""
Write-Host "Stella IP Kit"
Write-Host "Installing to: $Target"
Write-Host ""

New-Item -ItemType Directory -Force -Path (Join-Path $Target $SkillsRoot) | Out-Null
New-Item -ItemType Directory -Force -Path (Join-Path $Target $MemoryRoot) | Out-Null

Write-Host "Installing skills..."
foreach ($skill in $Skills) {
    Install-File "skills/$skill/SKILL.md" (Join-Path $Target "$SkillsRoot/$skill/SKILL.md")
    foreach ($extra in Get-SkillExtraFiles $skill) {
        Install-File "skills/$skill/$extra" (Join-Path $Target "$SkillsRoot/$skill/$extra")
    }
}

Write-Host ""
Write-Host "Installing memory templates..."
foreach ($memfile in $MemoryFiles) {
    Install-File "memory/stella-ip-director/$memfile" (Join-Path $Target "$MemoryRoot/$memfile")
}

$ClaudeMd = Join-Path $Target $InstructionsFile
$Marker = "# Stella IP Kit"
$NeedsBlock = $true

if ($SkipInstructionsBlock) {
    $NeedsBlock = $false
} elseif (Test-Path -LiteralPath $ClaudeMd) {
    $existing = Get-Content -LiteralPath $ClaudeMd -Raw
    if ($existing -match [regex]::Escape($Marker)) {
        $NeedsBlock = $false
        Write-Host ""
        Write-Host "  [skip] CLAUDE.md already contains the Stella block"
    }
}

if ($NeedsBlock) {
    Write-Host ""
    Write-Host "Adding Stella block to CLAUDE.md..."
    @'

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
'@ | Add-Content -LiteralPath $ClaudeMd
    Write-Host "  [done] CLAUDE.md updated"
}

Write-Host ""
Write-Host "Stella IP Kit installed successfully."
Write-Host ""
Write-Host "Next steps:"
Write-Host "  1. Open your project in the agent"
Write-Host "  2. Type: /stella"
Write-Host "  3. Complete business direction and account positioning"
Write-Host ""
