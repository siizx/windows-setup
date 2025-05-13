# --- Config ---
$anticheatPath = "C:\Path\To\FaceIT\anticheat.exe"
$externalDrives = "E:", "F:"  # Add SSD letters

# --- Check Drives ---
$blockedDrive = $externalDrives | Where-Object { Test-Path $_ }
if ($blockedDrive) {
    Write-Host "WARNING: External SSD ($blockedDrive) is connected! Disconnect it first!" -ForegroundColor Red
    Write-Host "Disconnect the blacklisted drive, then solve the following problem to continue:\n" -ForegroundColor Blue
    do {
        $num1 = Get-Random -Minimum 1 -Maximum 11
        $num2 = Get-Random -Minimum 1 -Maximum 11
        $sum = $num1 + $num2
        $answer = Read-Host "Solve this: $num1 + $num2 = ?"
    } while ($answer -ne $sum.ToString())
}
# --- Launch ---
Start-Process $anticheatPath
