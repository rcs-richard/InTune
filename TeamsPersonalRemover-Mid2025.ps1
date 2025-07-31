
# Kill Teams Personal if running
Write-Host "Checking for running Teams Personal process..."
$teamsProcess = Get-Process -Name "msteams" -ErrorAction SilentlyContinue
if ($teamsProcess) {
    Write-Host "Killing Teams Personal process..."
    TASKKILL /IM msteams.exe /F
} else {
    Write-Host "Teams Personal is not running."
}

# Remove Teams Personal app for all users
Write-Host "Attempting to remove Microsoft Teams Personal..."
Get-AppxPackage *MSTeams* -AllUsers | Remove-AppxPackage -AllUsers

Write-Host "Script completed."
Exit 0
