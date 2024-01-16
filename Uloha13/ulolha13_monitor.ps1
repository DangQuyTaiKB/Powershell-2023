# Create a script that will monitor the contents of the clipboard and write the changes to a text file. 
# If it detects that the clipboard contains the selected keyword, e.g. "password", it will print it in color in the terminal.
# Install a password manager (KeePass, KeepasXC) and verify, here it is resistant to clipboard monitoring.

Add-Type -AssemblyName System.Windows.Forms
#Cesta k textovému souboru pro záznam změn v schránce
$logfile = "D:\Documents\Unob_7\Milan\Powershell_code\Uloha\uloha13\log.txt"
#Klíčové slovo k vyhledání
$keyword = "heslo"
#Funkce pro monitorování schránky
function Monitor-Clipboard {
    $lastClipboardContent = [System.Windows.Forms.Clipboard]::GetText()
    while ($true) {
        $currentClipboardContent = [System.Windows.Forms.Clipboard]::GetText()
        if ($currentClipboardContent -ne $lastClipboardContent) {
            # Záznam do logu
            $changeLog = "Změna v schránce: $(Get-Date) - Obsah: $currentClipboardContent"
            $changeLog | Out-File -Append -FilePath $logfile
            # Výpis do terminálu
            if ($currentClipboardContent -match $keyword) {
                Write-Host -ForegroundColor Green "Nalezeno klíčové slovo: $keyword"
            }
        }
        $lastClipboardContent = $currentClipboardContent
        # Krátká pauza před dalším průzkumem
        Start-Sleep -Seconds 1
    }
}
#Spuštění monitorování
Monitor-Clipboard