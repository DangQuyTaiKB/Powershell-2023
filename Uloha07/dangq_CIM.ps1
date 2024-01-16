# Get-CimInstance -ClassName Win32_UserAccount | Select-Object Name, Lockout
Get-CimInstance Win32_Useraccount | where { $_.Lockout -eq $true }

# print the account not used for 30 days
$date = (Get-Date).AddDays(-30).Date
Get-CimInstance Win32_Useraccount | where { $_.LastLogin -lt $date }


# print the lastLogin of all accounts
Get-CimInstance Win32_Useraccount | Select-Object Name, LastLogin