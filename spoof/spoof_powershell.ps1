# Define the registry path and value names
$regPath = "HKLM:\HARDWARE\DESCRIPTION\System\BIOS"
$manufacturerValueName = "SystemManufacturer"
$productNameValueName = "SystemProductName"

# Define the new values
$newManufacturer = "Samsung"
$newProductName = "NP960XFG-KC4UK"

# Get the current user's desktop path
$desktopPath = [System.Environment]::GetFolderPath("Desktop")
$backupFilePath = Join-Path $desktopPath "RegistryBackup.txt"

# Backup the current values
$originalManufacturer = Get-ItemProperty -Path $regPath -Name $manufacturerValueName
$originalProductName = Get-ItemProperty -Path $regPath -Name $productNameValueName

# Create a backup file and write the original values
$backupContent = @"
Original ${manufacturerValueName}: $($originalManufacturer.$manufacturerValueName)
Original ${productNameValueName}: $($originalProductName.$productNameValueName)
"@
$backupContent | Out-File -FilePath $backupFilePath

# Set the new values
Set-ItemProperty -Path $regPath -Name $manufacturerValueName -Value $newManufacturer
Set-ItemProperty -Path $regPath -Name $productNameValueName -Value $newProductName

Write-Output "Registry values updated and backup created at $backupFilePath"

