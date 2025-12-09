$ErrorActionPreference = 'Stop'

Write-Host "=== GitHub API Self-check ==="

# Expect these env vars from the workflow:
# - GITHUB_REPOSITORY (owner/repo)
# - GH_API_TOKEN      (PAT from secrets)

if (-not $env:GITHUB_REPOSITORY) {
    Write-Error "GITHUB_REPOSITORY env var is missing."
    exit 1
}

if (-not $env:GH_API_TOKEN) {
    Write-Error "GH_API_TOKEN env var is missing. Did you set the secret?"
    exit 2
}

$repo = $env:GITHUB_REPOSITORY
$token = $env:GH_API_TOKEN

$uri = "https://api.github.com/repos/$repo"

Write-Host "Requesting repo info from: $uri"

$headers = @{
    Authorization = "Bearer $token"
    "User-Agent"  = "github-actions-pwsh-selfcheck"
    Accept        = "application/vnd.github+json"
}

try {
    $response = Invoke-RestMethod -Uri $uri -Headers $headers -Method GET

    Write-Host "Repository: $($response.full_name)"
    Write-Host "Default branch: $($response.default_branch)"
    Write-Host "Visibility: $($response.visibility)"
    Write-Host "Stars: $($response.stargazers_count)"
    Write-Host "Forks: $($response.forks_count)"

    # Simple assertion: ensure the repo name matches
    if ($response.full_name -ne $repo) {
        Write-Error "Repo name mismatch. Expected $repo, got $($response.full_name)"
        exit 3
    }

    Write-Host "`nGitHub API self-check passed ✅"
    exit 0
}
catch {
    Write-Error "GitHub API call failed: $($_.Exception.Message)"
    exit 99
}