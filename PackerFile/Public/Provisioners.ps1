function Provisioners {
    [CmdletBinding()]
    param(
        [Parameter( Mandatory = $true)]
        [scriptblock]$Script
    )
    . $Script
}