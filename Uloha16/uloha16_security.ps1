# 2) Create a script that lists the successful and failed logins of MS Windows users. 
# In case of unsuccessful login, also write the reason for the failure.

# Get successful logins
$successfulLogins = Get-WinEvent -FilterHashtable @{Logname = 'Security'; Id = 4624 }

# Get failed logins
$failedLogins = Get-WinEvent -FilterHashtable @{Logname = 'Security'; Id = 4625 }

# Output successful logins
Write-Output "Successful logins:"
$successfulLogins | ForEach-Object {
    Write-Output ("User: {0}, Time: {1}" -f $_.Properties[5].Value, $_.TimeCreated)
}

# Output failed logins
Write-Output "Failed logins:"
$failedLogins | ForEach-Object {
    Write-Output ("User: {0}, Time: {1}, Failure Reason: {2}" -f $_.Properties[5].Value, $_.TimeCreated, $_.Properties[13].Value)
}