<#
    .SYNOPSIS
        Get SEP server version

    .NOTES
        URL: https://apidocs.symantec.com/home/saep
#>
[CmdLetBinding(SupportsShouldProcess = $False)]
Param (
    [Parameter(Mandatory = $True, Position = 0, ValueFromPipeline = $True)]
    [Object] $AuthToken,

    [Parameter(Mandatory = $False, Position = 1)]
    [String] $Server = "server.domain.local:8446"
)

[System.Net.ServicePointManager]::ServerCertificateValidationCallback = { $True }
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12;

# format HTTP header
$header = @{ Authorization='Bearer '+ $authToken.Token }

Write-Output (Invoke-RestMethod -Uri https://$($Server)/sepm/api/v1/version -Headers $header)
