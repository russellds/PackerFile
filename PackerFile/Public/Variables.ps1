function Variables {
    [cmdletbinding( DefaultParameterSetName = 'NoName' )]
    param(
        [Parameter( ParameterSetName = 'Name',
                    Position = 0,
                    Mandatory = $true)]
        [Parameter( ParameterSetName = 'Snippet',
                    Position = 0,
                    Mandatory = $true )]
        [string]$Name,

        [Parameter( ParameterSetName = 'Snippet',
                    Position = 1,
                    Mandatory = $true)]
        [ValidateSet( 'Snippet' )]
        [string]$Snippet,

        [Parameter( ParameterSetName = 'Snippet',
                    Position = 2,
                    Mandatory = $true )]
        [Parameter( ParameterSetName = 'NoName',
                    Position = 0,
                    Mandatory = $true )]
        [System.Collections.Hashtable]$Variables
    )
    if ($PSCmdlet.ParameterSetName -eq 'NoName') {
        $Script:ThisPackerFile.variables = $Variables
    }
    elseif ($PSCmdlet.ParameterSetName -eq 'Snippet') {
        $fileName = "$Name.json"

        [pscustomobject]$Variables |
            Out-JsonFile -Path $Script:ThisPackerInfo.Destination -FileName $fileName
    }
    else {
        try {
            $path = Join-Path -Path $Script:ThisPackerInfo.Source -ChildPath "Variables\$Name.json"
    
            if (Test-Path -Path $path) {
                $Script:ThisPackerFile.variables = Get-Content -Path $path | 
                    ConvertFrom-Json |
                    ConvertTo-HashTable
            }
            else {
                throw "Variables: $path - not found!"
            }
        }
        catch {
            throw $PSItem
        }
    }
}