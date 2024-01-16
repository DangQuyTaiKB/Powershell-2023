# Create a script that reports that it was run either without or with admin privileges.
# If it was started without administrator rights, it will restart so that it has administrator rights.

# Check if running as administrator
$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
$status = $currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

if ($status) {
    Write-Host "Running as administrator"
    Read-Host
}
else {
    Write-Host "Not running as administrator"
    # restart so that it has administrator rights.
    Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs

}