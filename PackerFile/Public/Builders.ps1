function Builders {
    [CmdletBinding()]
    param(
        [Parameter( Mandatory = $true)]
        [scriptblock]$Script
    )
    . $Script
}