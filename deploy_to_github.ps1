# deploy_to_github.ps1
# Simple deploy script: init repo if needed, set remote, commit and push.
param(
    [Parameter(Mandatory=$true)]
    [string]$RemoteUrl,
    [string]$Branch = "main"
)

Write-Host ("Starting deploy script in: " + (Get-Location))

# Check for git
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Error "git not found. Please install Git (https://git-scm.com/) and ensure it's in PATH."
    exit 1
}

# Init repo if needed
if (-not (Test-Path .git)) {
    git init -b $Branch
    Write-Host ("Initialized new git repository with branch " + $Branch)
} else {
    Write-Host ".git exists, skipping git init"
}

# Check or set remote
$existingRemote = git remote 2>$null
if ($existingRemote -match 'origin') {
    Write-Host "origin exists, updating URL"
    git remote set-url origin $RemoteUrl
} else {
    git remote add origin $RemoteUrl
    Write-Host ("Added remote origin -> " + $RemoteUrl)
}

# Add and commit
git add -A
$commitMsg = "chore: deploy to GitHub Pages"
try {
    git commit -m $commitMsg
    Write-Host ("Committed changes: " + $commitMsg)
} catch {
    Write-Host ("No new changes to commit or commit failed: " + $_.Exception.Message)
}

# Push
Write-Host ("Pushing to origin/" + $Branch + " ...")
try {
    git push -u origin $Branch
    Write-Host "Push succeeded. Check GitHub Actions or Pages settings to confirm deployment."
} catch {
    Write-Error ("Push failed: " + $_.Exception.Message)
    Write-Host "If remote contains commits, consider running: git pull origin $Branch --rebase"
}
