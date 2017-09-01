function Destination {
    [CmdletBinding()]
    param(
        [parameter( Mandatory = $true)]
        [string]$Name
    )
    try {
        $Script:ThisPackerInfo.Destination = $Name
    }
    catch {
        throw $PSItem
    }
}