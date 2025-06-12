<#
.SYNOPSIS
    Manage the 'This PC' shortcut on the desktop in Microsoft Windows.

.NOTES
    Filename: Remediate-ThisPCDesktop.ps1
    Version: 1.0
#>

# Desired values to reset This PC shortcut on desktop
$Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel"
$AttrName = "{59031a47-3f72-44a7-89c5-5595fe6b30ee}"
$AttrType = "DWORD"
$AttrValue = "0"

# set values in registry
If (!(Test-Path $Path)) {
    New-Item -Path $Path -Force | Out-Null
    New-ItemProperty -Path $Path -Name $AttrName -Value $AttrValue -PropertyType $AttrType -Force | Out-Null
} else {
    Set-ItemProperty -Path $Path -Name $AttrName -Type $AttrType -Value $AttrValue 
}