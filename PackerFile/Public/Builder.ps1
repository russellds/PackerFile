function Builder {
    [CmdletBinding()]
    param(
        [Parameter( Mandatory = $true)]
        [string]$Name
    )
    try {
        $path = Join-Path -Path $Script:ThisPackerInfo.Source -ChildPath "Builders\$Name.json"

        if (Test-Path -Path $path) {
            $Script:ThisPackerFile.builders += Get-Content -Path $path | ConvertFrom-Json
        }
        else {
            throw "Builder: $path - not found!"
        }
    }
    catch {
        throw $PSItem
    }
}