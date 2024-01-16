# Check if Numlock is enabled for user login

$registryPath = "Registry::HKEY_USERS\.DEFAULT\Control Panel\Keyboard"

$numlockValue = (Get-ItemProperty -Path $registryPath -Name "InitialKeyboardIndicators").InitialKeyboardIndicators



if ($numlockValue -eq 2) {

    Write-Host "Numlock is already set to enabled for user login."

}
else {

    # Set Numlock to enabled for user login

    Set-ItemProperty -Path $registryPath -Name "InitialKeyboardIndicators" -Value 2

    Write-Host "Numlock has been set to enabled for user login."

}



# HKEY_CURRENT_USER

New-Item-PathHKCU:\ -Name"PowerShell_Games"

New-Item -Path HKCU:\PowerShell_Games -Name"User_Name"-Value "TaiMilan"

New-Item -Path HKCU:\PowerShell_Games -Name"Computer_Name"-Value -Value "TaiMilan_Note"

New-Item -Path HKCU:\PowerShell_Games -Name"Curr_Date"-Value(Get-Date)

New-Item -Path HKCU:\PowerShell_Games -Name"PS_Version"-Value $PSVersionTable.PSVersion



Get-ItemProperty -Path HKCU:\PowerShell_Games