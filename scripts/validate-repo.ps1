Write-Host "=== Running Repository Validation ==="

# Check README exists
if (Test-Path "./README.md") {
    Write-Host "README.md found ✔"
} else {
    Write-Host "README.md missing ❌"
    exit 1
}

# Check notes folder exists
if (Test-Path "./notes") {
    Write-Host "notes folder found ✔"
} else {
    Write-Host "notes folder missing ❌"
    exit 1
}

# List files inside notes
Write-Host "`nNotes files:"
Get-ChildItem "./notes" | ForEach-Object {
    Write-Host " - $($_.Name)"
}

# Print structured output (useful for CI logs)
$status = @{
    Timestamp = (Get-Date)
    NotesCount = (Get-ChildItem "./notes").Count
    Success = $true
}

Write-Host "`n=== Validation Complete ==="
$status | ConvertTo-Json -Depth 3