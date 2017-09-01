function Variables {
    [cmdletbinding()]
    param(
        [parameter( Position = 0,
                    Mandatory = $True,
                    ValueFromPipeline = $True,
                    ValueFromPipelineByPropertyName = $True)]
        [System.Collections.Hashtable]$Variables
    )
    begin
    {
        $All = @{}
    }
    Process
    {
        $All += $Variables
    }
    end
    {
        $Script:ThisPackerFile.variables = $All
    }
}