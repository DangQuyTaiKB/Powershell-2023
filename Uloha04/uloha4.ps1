# Create an alias for notepad.exe
New-Alias -Name np -Value notepad.exe
# Create an alias for control.exe
New-Alias -Name ct -Value control.exe
# Export aliases to JSON
$aliasData = Get-Alias np, ct | ForEach-Object {
    [PSCustomObject]@{
        Name   = $_.Name
        Value  = $_.Definition
        Option = $_.Options
    }
} | ConvertTo-Json
# $aliasData | Out-File -FilePath "Uloha4/alias.json"
# $aliasData | Out-File -FilePath "alias.json"
# export alias data to JSON to "D:\Documents\Unob_7\Milan\Powershell-2023\Uloha4"

# Define the output file path
$outputFilePath = "D:\Documents\Unob_7\Milan\Powershell-2023\Uloha4\alias.json"

# Export JSON data to the file
$aliasData | Out-File -FilePath $outputFilePath

# Remove aliases
Remove-Item -Path Alias:np
Remove-Item -Path Alias:ct
# Load aliases from JSON and restore
$importedAliasData = Get-Content -Raw -Path "alias.json" | ConvertFrom-Json
foreach ($aliasEntry in $importedAliasData) {
    New-Alias -Name $aliasEntry.Name -Value $aliasEntry.Value
}
# Test if alias was restored 
Get-Alias np

