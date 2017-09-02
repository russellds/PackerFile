function PackerFile {
    [CmdletBinding( DefaultParameterSetName = 'NoName' )]
    param(
        [Parameter( ParameterSetName = 'Name',
                    Position = 0,
                    Mandatory = $true )]
        [string]$Name,

        [Parameter( ParameterSetName = 'Name',
                    Position =1,
                    Mandatory = $true )]
        [Parameter( ParameterSetName = 'NoName',
                    Position = 0,
                    Mandatory = $true )]
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

    if ($PSCmdlet.ParameterSetName -eq 'Name') {
        $Script:ThisPackerFile |
            Out-JsonFile -Path $Script:ThisPackerInfo.Destination -FileName $Script:ThisPackerInfo.JsonBaseName
    }
}