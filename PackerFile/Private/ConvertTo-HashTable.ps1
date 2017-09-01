function ConvertTo-HashTable {
    [CmdletBinding()]
    param ( 
        [Parameter( Mandatory = $true,   
                    ValueFromPipeline = $true,  
                    ValueFromPipelineByPropertyName = $true )] 
            [pscustomobject[]]$Object 
    ); 
    
    process { 
        foreach ($customObject in $Object) { 
            $output = @{}
            $customObject.psobject.properties | ForEach-Object { 
                $output.($_.name) = $_.Value
            } 
            $output
        } 
    } 
}