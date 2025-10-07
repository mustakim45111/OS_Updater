# Set log file path
$logFile = "$env:USERPROFILE\Documents\windows-update-$(Get-Date -Format yyyy-MM-dd).log"

# Start time
$startTime = Get-Date
Add-Content -Path $logFile -Value "System update started at $startTime`n"

# Update Windows
Add-Content -Path $logFile -Value "Checking for Windows Updates..."
# Requires PSWindowsUpdate module
if (!(Get-Module -ListAvailable -Name PSWindowsUpdate)) {
    Install-Module -Name PSWindowsUpdate -Force -Confirm:$false
}
Import-Module PSWindowsUpdate
$updates = Get-WindowsUpdate -AcceptAll -Install -IgnoreReboot
Add-Content -Path $logFile -Value "Updates installed:`n$($updates | Out-String)"

# Clean temp files
Add-Content -Path $logFile -Value "Cleaning temp files..."
$TempPath = "$env:TEMP\*"
Remove-Item -Path $TempPath -Recurse -Force -ErrorAction SilentlyContinue
Add-Content -Path $logFile -Value "Temp files cleaned."

# End time
$endTime = Get-Date
$duration = $endTime - $startTime
Add-Content -Path $logFile -Value "`nSystem update completed at $endTime"
Add-Content -Path $logFile -Value "Total duration: $($duration.Hours)h $($duration.Minutes)m $($duration.Seconds)s"

Write-Output "System update completed! Log saved at $logFile"
