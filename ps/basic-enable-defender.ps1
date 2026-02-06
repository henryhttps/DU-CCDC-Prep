Write-Output "example console log text"

# set windows defender services to automatic
Set-Service -Name WinDefend -StartupType Automatic

# start the windefend service
Start-Service -Name WinDefend

# set the "disable realtime monitoring" preference to false
Set-MpPreference -DisableRealtimeMonitoring $false

# set the "disable behavior monitoring" preference to false
Set-MpPreference -DisableBehaviorMonitoring $false

# Enable script scanning (malicious VBScript, JavaScript, or PowerShell execution)
Set-MpPreference -DisableScriptScanning $false


# enable firewall for all profiles
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True

Write-Output "Firewall Status:"
Get-NetFirewallProfile | Select Name, Enabled

Write-Output "Defender Status:"
Get-MpComputerStatus | Select RealTimeProtectionEnabled
