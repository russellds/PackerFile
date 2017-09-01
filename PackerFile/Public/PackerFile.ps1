function PackerFile {
    [CmdletBinding()]
    param(
        [Parameter( Mandatory = $true)]
        [string]$Name,

        [Parameter( Mandatory = $true)]
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

    $Script:ThisPackerFile |
        Out-JsonFile -Path $Script:ThisPackerInfo.Destination -FileName $Script:ThisPackerInfo.JsonBaseName
}