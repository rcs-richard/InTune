$hostsPath = "$env:windir\System32\drivers\etc\hosts"
$hosts = @(
    "192.168.240.21	gfg-fs01",
    "192.168.247.4	gfm-dcs",
    "192.168.247.9	gfm-pdm",
    "192.168.247.5	gfm-ord"
)

# Create the hosts file if it doesn't exist, then wait 30 seconds
if (!(Test-Path $hostsPath)) {
    New-Item -Path $hostsPath -ItemType File -Force | Out-Null
    Write-Host "Hosts file created. Waiting 10 seconds..."
    Start-Sleep -Seconds 10
}

# Read current content of the hosts file
$content = Get-Content $hostsPath

# Add entries only if they don't already exist
foreach ($entry in $hosts) {
    if (-not ($content -contains $entry)) {
        Add-Content -Path $hostsPath -Value $entry
        Write-Host "Adding - $entry then having a 5 second snooze..." 
        Start-Sleep -Seconds 5
    }
}
