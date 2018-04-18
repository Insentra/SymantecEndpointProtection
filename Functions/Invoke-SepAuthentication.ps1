<#
    .SYNOPSIS
        Authenticate to the SEP server

    .NOTES
        URL: https://apidocs.symantec.com/home/saep
#>
[CmdLetBinding(SupportsShouldProcess = $False)]
Param (
    [Parameter(Mandatory = $False, Position = 1)]
    [String] $Server = "server.domain.local:8446"
)

[System.Net.ServicePointManager]::ServerCertificateValidationCallback = { $True }
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12;

# Create credentiaal and convert to JSON
$cred = @{
    username = ""
    password = ""
    domain   = ""
}
$auth = $cred | ConvertTo-Json

Write-Output (Invoke-RestMethod -Uri https://$($Server)/sepm/api/v1/identity/authenticate -Method Post -Body $auth -ContentType 'application/json')
