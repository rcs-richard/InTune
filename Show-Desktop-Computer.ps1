<#
.SYNOPSIS
    Manage the 'This PC' shortcut on the desktop in Microsoft Windows.

.NOTES
    Filename: Remediate-ThisPCDesktop.ps1
    Version: 1.0
#>

# Desired values to reset This PC shortcut on desktop
$Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel"
$AttrName = "{20D04FE0-3AEA-1069-A2D8-08002B30309D}"
$AttrType = "DWORD"
$AttrValue = "0"

# set values in registry
If (!(Test-Path $Path)) {
    New-Item -Path $Path -Force | Out-Null
    New-ItemProperty -Path $Path -Name $AttrName -Value $AttrValue -PropertyType $AttrType -Force | Out-Null
} else {
    Set-ItemProperty -Path $Path -Name $AttrName -Type $AttrType -Value $AttrValue 
}