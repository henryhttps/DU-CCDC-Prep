$AllowedTCPPorts = @(22, 80, 443, 3389) # TODO
$AllowedUDPPorts = @(53) # TODO

foreach ($port in $AllowedTCPPorts) {
    New-NetFirewallRule `
        -DisplayName "ALLOW IN TCP $port" `
        -Direction Inbound `
        -Protocol TCP `
        -LocalPort $port `
        -Action Allow `
        -Profile Domain,Private,Public
}

foreach ($port in $AllowedUDPPorts) {
    New-NetFirewallRule `
        -DisplayName "ALLOW IN UDP $port" `
        -Direction Inbound `
        -Protocol UDP `
        -LocalPort $port `
        -Action Allow `
        -Profile Domain,Private,Public
}

Write-Output "Inbound firewall rules created."
