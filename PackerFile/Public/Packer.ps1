function Packer {
    [CmdletBinding()]
    param(
        [parameter( Mandatory = $true)]
        [string]$Name,

        [parameter( Mandatory = $true)]
        [scriptblock]$Script
    )
    $Script:ThisPackerInfo = [pscustomobject]@{
        JsonBaseName = "$Name.json"
        Source = $null
        Destination = $null
    }

    $Script:ThisPackerFile = [pscustomobject]@{
        builders = @()
        provisioners = @()
        'post-processors' = @()
        variables = @{}
    }

    . $Script

    try {
        $destinationPath = Join-Path -Path $Script:ThisPackerInfo.Destination -ChildPath $Script:ThisPackerInfo.JsonBaseName

        $Script:ThisPackerFile | 
            ConvertTo-Json -Depth 10 |
            Out-File -FilePath $destinationPath -Encoding utf8 -Force
    }
    catch {
        throw $PSItem
    }
}