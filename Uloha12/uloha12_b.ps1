$adresar = "D:\Documents\Unob_7\Milan\Powershell_code\Uloha\uloha12"
$logSoubor = "D:\Documents\Unob_7\Milan\Powershell_code\Uloha\uloha12\outlog.txt"


function ZapisDoLogu ($obsah) {
    Add-Content -Path $logSoubor -Value $obsah
}


while ($true) {
    $soubory = Get-ChildItem -Path $adresar -File | Where-Object { $_.CreationTime -gt $posledniKontrola }
    
    foreach ($soubor in $soubory) {
        $jmenoSouboru = $soubor.Name
        $casVytvoreni = $soubor.CreationTime
        $informace = "Novy soubor vytvoren: $jmenoSouboru, Cas: $casVytvoreni"
        ZapisDoLogu $informace
    }


    $posledniKontrola = Get-Date
    Start-Sleep -Seconds 5
}