#Vytvoření hashtable pro parametry
$souborParametry = @{
    Path  = "D:\Documents\Unob_7\Milan\Powershell-2023\Uloha9\uloha9_souboru.txt"
    Value = "Hello world."
    Force = $true  # Přepíše soubor, pokud již existuje
}

Set-Content @souborParametry


# Definujte parametry jako hashtable
$logParams = @{
    LogName   = "System"
    EntryType = "Error"
    After     = (Get-Date).AddDays(-10)
    Before    = Get-Date
    Newest    = 10 
}

# Získání událostí z logu pomocí splattingu
$logEvents = Get-EventLog @logParams
$souborCesta = "D:\Documents\Unob_7\Milan\Powershell-2023\Uloha9\uloha9_udalosti.txt"

foreach ($event in $logEvents) {
    # Write-Output ("Time: $($event.TimeGenerated)`nType: $($event.EntryType)`nMessage: $($event.Message)`n")
    $zaznam = "Time: $($event.TimeGenerated)`nType: $($event.EntryType)`nMessage: $($event.Message)`n"
    Add-Content -Path $souborCesta -Value $zaznam
}

