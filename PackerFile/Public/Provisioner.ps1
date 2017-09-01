function Provisioner {
    [CmdletBinding()]
    param(
        [Parameter( Mandatory = $true)]
        [string]$Name
    )
    try {
        $path = Join-Path -Path $Script:ThisPackerInfo.Source -ChildPath "Provisioners\$Name.json"

        if (Test-Path -Path $path) {
            $Script:ThisPackerFile.provisioners += Get-Content -Path $path | ConvertFrom-Json
        }
        else {
            throw "Provisioner: $path - not found!"
        }
    }
    catch {
        throw $PSItem
    }
}