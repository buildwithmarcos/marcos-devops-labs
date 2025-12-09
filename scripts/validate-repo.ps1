# Fail the script if any command errors
$ErrorActionPreference = 'Stop'

Write-Host "=== Running Repository Validation ==="

try {
    # 1) Check README exists
    if (-not (Test-Path -Path "./README.md" -PathType Leaf)) {
        Write-Error "README.md missing ❌ (expected at ./README.md)"
        exit 1
    }
    Write-Host "README.md found ✔"

    # 2) Check notes folder exists
    if (-not (Test-Path -Path "./notes" -PathType Container)) {
        Write-Error "notes folder missing ❌ (expected at ./notes)"
        exit 2
    }
    Write-Host "notes folder found ✔"

    # 3) Get note files
    $notes = Get-ChildItem "./notes" -File -ErrorAction Stop

    if (-not $notes -or $notes.Count -eq 0) {
        Write-Error "No note files found in ./notes ❌"
        exit 3
    }

    Write-Host "`nNotes files:"
    foreach ($n in $notes) {
        Write-Host " - $($n.Name)"
    }

    # 4) Build a structured status object
    $status = [pscustomobject]@{
        Timestamp  = Get-Date
        NotesCount = $notes.Count
        Success    = $true
    }

    Write-Host "`n=== Validation Complete ==="
    $status | ConvertTo-Json -Depth 3

    # Explicit success exit
    exit 0
}
catch {
    # Catch any unexpected error
    Write-Error "Unexpected validation error: $($_.Exception.Message)"
    # 99 = generic/unexpected failure
    exit 99
}