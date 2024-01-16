$executionPolicy = Get-ExecutionPolicy

$foregroundColor = @{"Unrestricted" = "Yellow"
    "RemoteSigned"                  = "Green"
}[$executionPolicy]

Write-Host "Execution Policy (Yellow): $executionPolicy" -ForegroundColor Yellow

$profilePath = $PROFILE
Write-Host "Cesta (green): $profilePath" -ForegroundColor Green