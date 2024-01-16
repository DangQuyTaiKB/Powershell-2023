# Create a script that lists as detailed as possible the installed software in Windows. 
# The idea is to list as many of those apps as possible, so that the list is created from multiple sources.

# Query WMI for installed software
$wmiSoftware = Get-WmiObject -Class Win32_Product | Select-Object Name, Version, Vendor

# Query the registry for installed software
$registrySoftware = Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | 
Select-Object DisplayName, DisplayVersion, Publisher

# Combine the two lists
$allSoftware = $wmiSoftware + $registrySoftware

# Output the combined list
$allSoftware | Format-Table -AutoSize