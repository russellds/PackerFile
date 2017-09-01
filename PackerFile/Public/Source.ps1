function Source {
    [CmdletBinding()]
    param(
        [parameter( Mandatory = $true)]
        [string]$Name
    )
    if (Test-Path -Path $Name){
        $Script:ThisPackerInfo.Source = $Name
    }
    else {
        throw "Source: $Name - not found!"
    }
}