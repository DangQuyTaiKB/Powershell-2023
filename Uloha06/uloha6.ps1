
# printer configuration properties 


Get-CimInstance -ClassName Win32_PrinterConfiguration -Property *



# Check the fax printer

Get-CimInstance -ClassName Win32_Printer | Where-Object { $_.Name -eq "Fax" }





# Change the name of drive C:

$CDrive = Get-CimInstance -ClassName Win32_Volume -Filter "DriveLetter='C:'"

$CDrive.Label = "SYSTEM"

Set-CimInstance -CimInstance $CDrive



# Change the name of drive D:

$DDrive = Get-CimInstance -ClassName Win32_Volume -Filter "DriveLetter='D:'"

$DDrive.Label = "DATA"

Set-CimInstance -CimInstance $DDrive



$DDrive.Label

$CDrive.Label 

