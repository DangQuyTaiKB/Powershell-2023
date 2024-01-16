# Cim interface:

$users = Get-LocalUser
$unusedAccounts = $users | Where-Object { $_.Enabled -eq $true -and $_.LastLogon -lt $date }
$lockedAccounts = $users | Where-Object { $_.Enabled -eq $true -and $_.Lockout -eq $true }

Write-Host "Unused accounts:"
$unusedAccounts | Select-Object Name
Write-Host "Locked accounts:"
$lockedAccounts | Select-Object Name

# Print a list of unused accounts and a list of locked accounts:

$users = Get-WmiObject -Class Win32_UserAccount
$unusedAccounts = $users | Where-Object { $_.Disabled -eq $false -and $_.Lockout -eq $false -and $_.LastLogon -lt $date }
$lockedAccounts = $users | Where-Object { $_.Disabled -eq $false -and $_.Lockout -eq $true }

Write-Host "Unused accounts:"
$unusedAccounts | Select-Object Name
Write-Host "Locked accounts:"
$lockedAccounts | Select-Object Name