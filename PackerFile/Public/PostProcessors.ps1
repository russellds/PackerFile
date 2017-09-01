function PostProcessors {
    [CmdletBinding()]
    param(
        [Parameter( Mandatory = $true)]
        [scriptblock]$Script
    )
    . $Script
}