param(
    [string]$Target = (Get-Location).Path,
    [Alias("Global")]
    [switch]$GlobalMode,
    [switch]$DryRun,
    [switch]$Overwrite,
    [switch]$Backup,
    [switch]$Yes,
    [switch]$Help
)

Set-StrictMode -Version 3.0
$ErrorActionPreference = "Stop"

$Created = 0
$Updated = 0
$Skipped = 0
$Conflicts = 0
$Errors = 0
$PlanLines = New-Object System.Collections.Generic.List[string]
$ConflictLines = New-Object System.Collections.Generic.List[string]
$Actions = New-Object System.Collections.Generic.List[object]

function Show-Usage {
    @"
Usage: install.ps1 [options]

Options:
  -Target <path>   Target repository. Defaults to current directory.
  -Global          Install global rule to ~/.codex/AGENTS.md.
  -DryRun          Print planned actions without writing files.
  -Overwrite       Overwrite conflicting files.
  -Backup          Back up conflicting files before writing.
  -Yes             Do not ask for interactive confirmation.
  -Help            Show this help.

Default behavior never overwrites files with different content.
"@
}

function Write-Log {
    param([string]$Message)
    Write-Output $Message
}

function Fail {
    param(
        [string]$Message,
        [int]$Code = 1
    )
    [Console]::Error.WriteLine("ERROR: $Message")
    exit $Code
}

function Get-ScriptRoot {
    if ($PSScriptRoot) {
        return (Resolve-Path -LiteralPath $PSScriptRoot).Path
    }

    return (Resolve-Path -LiteralPath (Split-Path -Parent $MyInvocation.MyCommand.Path)).Path
}

function Test-SameFileContent {
    param(
        [string]$Source,
        [string]$Destination
    )

    if (-not (Test-Path -LiteralPath $Destination -PathType Leaf)) {
        return $false
    }

    $sourceHash = Get-FileHash -LiteralPath $Source -Algorithm SHA256
    $destHash = Get-FileHash -LiteralPath $Destination -Algorithm SHA256
    return $sourceHash.Hash -eq $destHash.Hash
}

function Get-Timestamp {
    return (Get-Date -Format "yyyyMMddHHmmss")
}

function Add-Action {
    param(
        [string]$Source,
        [string]$Destination,
        [string]$Action
    )

    $script:Actions.Add([pscustomobject]@{
        Source = $Source
        Destination = $Destination
        Action = $Action
    })
}

function Write-PlannedFile {
    param(
        [string]$Source,
        [string]$Destination,
        [string]$Action
    )

    if ($DryRun) {
        return
    }

    $parent = Split-Path -Parent $Destination
    if ($parent -and -not (Test-Path -LiteralPath $parent -PathType Container)) {
        New-Item -ItemType Directory -Path $parent -Force | Out-Null
    }

    switch ($Action) {
        "create" {
            Copy-Item -LiteralPath $Source -Destination $Destination -Force
        }
        "overwrite" {
            Copy-Item -LiteralPath $Source -Destination $Destination -Force
        }
        "backup" {
            $backupPath = "$Destination.bak.$(Get-Timestamp)"
            Copy-Item -LiteralPath $Destination -Destination $backupPath -Force
            Copy-Item -LiteralPath $Source -Destination $Destination -Force
        }
        default {
            throw "Unknown action: $Action"
        }
    }
}

function Invoke-Actions {
    foreach ($action in $script:Actions) {
        try {
            Write-PlannedFile -Source $action.Source -Destination $action.Destination -Action $action.Action
        }
        catch {
            Write-Error "ERROR: Failed to write $($action.Destination): $($_.Exception.Message)"
            $script:Errors++
        }
    }
}

function Plan-File {
    param(
        [string]$Source,
        [string]$Destination,
        [string]$Label
    )

    if (-not (Test-Path -LiteralPath $Source -PathType Leaf)) {
        Fail "Missing source file: $Source"
    }

    if (-not (Test-Path -LiteralPath $Destination)) {
        $script:PlanLines.Add("create   $Label -> $Destination")
        Add-Action -Source $Source -Destination $Destination -Action "create"
        $script:Created++
        return
    }

    if (-not (Test-Path -LiteralPath $Destination -PathType Leaf)) {
        $script:PlanLines.Add("conflict $Label -> $Destination (destination exists and is not a file)")
        $script:ConflictLines.Add($Destination)
        $script:Conflicts++
        return
    }

    if (Test-SameFileContent -Source $Source -Destination $Destination) {
        $script:PlanLines.Add("skip     $Label -> $Destination (unchanged)")
        $script:Skipped++
        return
    }

    if ($Overwrite) {
        $script:PlanLines.Add("overwrite $Label -> $Destination")
        Add-Action -Source $Source -Destination $Destination -Action "overwrite"
        $script:Updated++
        return
    }

    if ($Backup) {
        $script:PlanLines.Add("backup   $Label -> $Destination")
        Add-Action -Source $Source -Destination $Destination -Action "backup"
        $script:Updated++
        return
    }

    $script:PlanLines.Add("conflict $Label -> $Destination")
    $script:ConflictLines.Add($Destination)
    $script:Conflicts++
}

function Write-GitStatusIfAvailable {
    param([string]$Directory)

    $git = Get-Command git -ErrorAction SilentlyContinue
    if (-not $git) {
        Write-Log "Git status skipped: git is not available."
        return
    }

    & git -C $Directory rev-parse --is-inside-work-tree *> $null
    if ($LASTEXITCODE -eq 0) {
        Write-Log "Git status for ${Directory}:"
        & git -C $Directory status --short
    }
    else {
        Write-Log "Git status skipped: target is not a Git repository."
    }
}

function Install-Project {
    param(
        [string]$ProjectRoot,
        [string]$TargetPath
    )

    if (-not (Test-Path -LiteralPath $TargetPath -PathType Container)) {
        Fail "Target does not exist or is not a directory: $TargetPath" 2
    }

    Write-GitStatusIfAvailable -Directory $TargetPath

    $starterRoot = Join-Path $ProjectRoot "starter"
    if (-not (Test-Path -LiteralPath $starterRoot -PathType Container)) {
        Fail "Missing starter directory: $starterRoot"
    }

    Get-ChildItem -LiteralPath $starterRoot -File -Recurse |
        Sort-Object FullName |
        ForEach-Object {
            $relative = $_.FullName.Substring($starterRoot.Length).TrimStart([System.IO.Path]::DirectorySeparatorChar, [System.IO.Path]::AltDirectorySeparatorChar)
            $destination = Join-Path $TargetPath $relative
            Plan-File -Source $_.FullName -Destination $destination -Label $relative
        }
}

function Install-GlobalRule {
    param([string]$ProjectRoot)

    $source = Join-Path $ProjectRoot "global/AGENTS.md"
    $home = $env:USERPROFILE
    if (-not $home) {
        $home = $env:HOME
    }
    if (-not $home) {
        Fail "USERPROFILE and HOME are not set"
    }

    $destination = Join-Path $home ".codex/AGENTS.md"
    Plan-File -Source $source -Destination $destination -Label "global/AGENTS.md"
}

function Confirm-IfNeeded {
    if ($Yes -or $DryRun) {
        return
    }

    $answer = Read-Host "Proceed with installation? [y/N]"
    if ($answer -notin @("y", "Y", "yes", "YES")) {
        Write-Log "Installation cancelled."
        exit 1
    }
}

function Write-Plan {
    Write-Log "Plan:"
    if ($script:PlanLines.Count -eq 0) {
        Write-Log "  No actions planned."
        return
    }

    foreach ($line in $script:PlanLines) {
        Write-Log "  $line"
    }
}

function Write-Summary {
    Write-Log "Summary:"
    Write-Log "  created:   $script:Created"
    Write-Log "  updated:   $script:Updated"
    Write-Log "  skipped:   $script:Skipped"
    Write-Log "  conflicts: $script:Conflicts"
}

if ($Help) {
    Show-Usage
    exit 0
}

if ($Overwrite -and $Backup) {
    Fail "-Overwrite and -Backup cannot be used together"
}

$ScriptRoot = Get-ScriptRoot
$ProjectRoot = (Resolve-Path -LiteralPath (Join-Path $ScriptRoot "..")).Path

try {
    $TargetPath = (Resolve-Path -LiteralPath $Target).Path
}
catch {
    Fail "Target does not exist or is not readable: $Target" 2
}

Write-Log "AI Project OS installer"
Write-Log "Source: $ProjectRoot"
Write-Log "Target: $TargetPath"
if ($DryRun) {
    Write-Log "Mode: dry-run"
}

if ($GlobalMode) {
    Install-GlobalRule -ProjectRoot $ProjectRoot
}
else {
    Install-Project -ProjectRoot $ProjectRoot -TargetPath $TargetPath
}

Write-Plan

if ($script:Conflicts -gt 0) {
    Write-Log ""
    Write-Log "Conflicts:"
    foreach ($conflict in $script:ConflictLines) {
        Write-Log "  $conflict"
    }
    Write-Log "Resolve conflicts manually or rerun with -Backup or -Overwrite."
    Write-Summary
    exit 1
}

if ($DryRun) {
    Write-Summary
    exit 0
}

Confirm-IfNeeded
Invoke-Actions
Write-Summary

if (-not $GlobalMode) {
    Write-GitStatusIfAvailable -Directory $TargetPath
}

if ($script:Errors -gt 0) {
    exit 3
}
