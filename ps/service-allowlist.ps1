# show services with:
Get-Service | Select Name, DisplayName


# change service-level firewall rules with:

$AllowedServices = @(
    "TermService",   
    "W3SVC",         
    "DNS"           
)

foreach ($service in $AllowedServices) {
    New-NetFirewallRule `
        -DisplayName "ALLOW IN SERVICE $service" `
        -Direction Inbound `
        -Service $service `
        -Action Allow `
        -Profile Domain,Private,Public
}
