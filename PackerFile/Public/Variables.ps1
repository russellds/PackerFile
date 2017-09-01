function Variables {
    [cmdletbinding( DefaultParameterSetName = 'NoName' )]
    param(
        [parameter( ParameterSetName = 'Name',
                    Position = 0,
                    Mandatory = $true)]
        [string]$Name,

        [parameter( ParameterSetName = 'NoName',
                    Position = 0,
                    Mandatory = $true )]
        [System.Collections.Hashtable]$Variables
    )
    if ($PSCmdlet.ParameterSetName -eq 'NoName') {
        $Script:ThisPackerFile.variables = $Variables
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