function Out-JsonFile {
    [CmdletBinding()]
    param(
        [Parameter( Mandatory = $true,
                    ValueFromPipelineByPropertyName = $true,
                    ValueFromPipeline = $true )]
        [object]$Object,
        
        [Parameter( Mandatory = $true)]
        [string]$Path,

        [Parameter( Mandatory = $true)]
        [string]$FileName
    )
    try {
        if (-not (Test-Path -Path $Path)) {
            [void](New-Item -Path $Path -ItemType Directory -Force)
        }

        $destinationPath = Join-Path -Path $Path -ChildPath $FileName

        $Object | 
            ConvertTo-Json -Depth 10 |
            Out-File -FilePath $destinationPath -Encoding utf8 -Force
    }
    catch {
        throw $PSItem
    }
}