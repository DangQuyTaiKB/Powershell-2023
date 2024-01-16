function Display_DirectoryInfo {
    param (
        [string]$path
    )

    Write-Host "Current Directory: $path"
    $files = Get-ChildItem -Path $path | Where-Object { $_.PSIsContainer -eq $false }

    if ($files.Count -gt 0) {
        $sizes = $files | ForEach-Object { $_.Length }

        $minSize = $sizes | Measure-Object -Minimum | Select-Object -ExpandProperty Minimum
        $maxSize = $sizes | Measure-Object -Maximum | Select-Object -ExpandProperty Maximum
        
        Write-Host "Number of files: $($files.Count)"
        Write-Host "Minimum file size: $minSize"
        Write-Host "Maximum file size: $maxSize"
        
    }
    else {
        Write-Host "No files in this directory."
    }
}

function Navigate_Directory {
    param (
        [string]$path
    )

    $initialPath = $path

    while ($true) {
        Display_DirectoryInfo -path $path
        $dirs = Get-ChildItem -Path $path | Where-Object { $_.PSIsContainer -eq $true }

        for ($i = 0; $i -lt $dirs.Count; $i++) {
            Write-Host "$($i + 1). $($dirs[$i].Name)"
        }

        Write-Host "*********"
        Write-Host "Q. Quit"
        Write-Host "U. Go up to the parent directory"
        $choice = Read-Host "Choose a directory, display all folders, go up, or quit"

        switch ($choice) {
            { $_.ToLower() -eq 'q' } {
                return
            }
            { $_.ToLower() -eq 'u' } {
                $parentPath = (Get-Item $path).Parent
                if ($parentPath) {
                    $path = $parentPath.FullName
                }
                else {
                    Write-Host "You are at the root directory of this disk. Returning to the initial directory."
                    $path = $initialPath
                }
            }
            { $_ -match '^\d+$' -and 1 -le $_ -and $_ -le $dirs.Count } {
                $path = Join-Path -Path $path -ChildPath $dirs[$_ - 1].Name
            }
            default {
                Write-Host "Invalid choice. Please try again."
            }
        }
    }
}

Navigate_Directory -path (Get-Location).Path
