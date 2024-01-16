# Get a list of local user accounts
$localUsers = Get-LocalUser

# Get the current date and time
$currentDateTime = Get-Date

# Define a threshold for considering an account as unused (e.g., 90 days)
$unusedThreshold = 10
# Get a list of local user accounts
# $localUsers

foreach ($user in $localUsers) {
    # Check if the account is disabled
    if (($user.Enabled -eq $true) -and ($user.Lockout -eq $true)) {
        Write-Host "Locked Account: $($user.Name)"
    }

    $lastLogon = $user.LastLogon

    if ($lastLogon -eq $null) {
        Write-Host "$($user.Name)" -NoNewline
        Write-Host " - Never logged on"
    }
    else {
        Write-Host "$($user.Name)" -NoNewline
        Write-Host " - Last logon: $($lastLogon)"
    }

}

Get-LocalUser | Select-Object Name, Lockout, LastLogon