$soubor = "D:\Documents\Unob_7\Milan\Powershell_code\Uloha\uloha13\log.txt"



function Monitoruj-Schranku {
    $posledniObsah = Get-Clipboard
    while ($true) {
        Start-Sleep -Seconds 5
        $aktualniObsah = Get-Clipboard
        if ($aktualniObsah -ne $posledniObsah) {
            $posledniObsah = $aktualniObsah
            Uloz-DoSouboru -Obsah $aktualniObsah -Soubor $soubor
        }
    }
}

function Uloz-DoSouboru {
    param (
        [string]$Obsah,
        [string]$Soubor
    )

    if ($Obsah -match "heslo") {
        Write-Host ("Obsah schránky byl přidán do souboru: $Soubor") -ForegroundColor Red
    }
    else {
        Write-Host ("Obsah schránky byl přidán do souboru: $Soubor") -ForegroundColor White
    }

    Add-Content -Path $Soubor -Value "$Obsah`r`n"
}
Monitoruj-Schranku