function PostProcessor {
    [CmdletBinding()]
    param(
        [Parameter( Mandatory = $true)]
        [string]$Name
    )
    try {
        $path = Join-Path -Path $Script:ThisPackerInfo.Source -ChildPath "PostProcessors\$Name.json"

        if (Test-Path -Path $path) {
            $Script:ThisPackerFile.'post-processors' += Get-Content -Path $path | ConvertFrom-Json
        }
        else {
            throw "PostProcessor: $path - not found!"
        }
    }
    catch {
        throw $PSItem
    }
}