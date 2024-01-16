[Reflection.Assembly]::LoadWithPartialName("System.Drawing")
function screenshot([Drawing.Rectangle]$bounds, $path) {
    # Ensure the directory exists
    $directory = Split-Path $path -Parent
    if (!(Test-Path $directory)) {
        New-Item -ItemType Directory -Path $directory | Out-Null
    }

    $bmp = New-Object Drawing.Bitmap $bounds.width, $bounds.height
    $graphics = [Drawing.Graphics]::FromImage($bmp)

    $graphics.CopyFromScreen($bounds.Location, [Drawing.Point]::Empty, $bounds.size)

    $bmp.Save($path)

    $graphics.Dispose()
    $bmp.Dispose()
}

while ($true) {
    # $Directory = "D:\Documents\Unob_7\Milan\Powershell_code\Uloha\uloha15\Screenshot\"
    $Directory = "C:\Users\dangq\Pictures\Screenshot\"
    $timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
    $filename = "Screenshot_$timestamp.png"
    $filepath = Join-Path -Path $Directory -ChildPath $filename

    $bounds = [Drawing.Rectangle]::FromLTRB(0, 0, 1920, 1080)

    screenshot $bounds $filepath

    Write-Host "Screenshot captured and saved to $filepath"

    Start-Sleep -Seconds 5
}