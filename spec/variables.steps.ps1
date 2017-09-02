Given 'we have a source folder' {
    mkdir testdrive:\JsonSnippets\Variables -ErrorAction SilentlyContinue
    'testdrive:\JsonSnippets\Variables' | Should Exist
}

And 'we have a source variables JSON snippet' {
    param($Data)

    $filePath = 'testdrive:\JsonSnippets\Variables\variablesSnippet.json'

    $Data | 
        Out-File -FilePath $filePath
    
    $filePath | Should Exist
}

Given 'we have a destination folder' {
    mkdir testdrive:\packer -ErrorAction SilentlyContinue
    'testdrive:\packer' | Should Exist
}

When 'we create a packer file with a variables hashtable' {
    param($Data)

    $hashtable = $Data | 
        ConvertFrom-StringData

    PackerFile testVariables {
        Destination 'testdrive:\packer'
        Variables $hashtable
    }
    'testdrive:\packer\testVariables.json' | Should Exist
}

Then 'the packer file should exist' {
    'testdrive:\packer\testVariables.json' | Should Exist
}

And 'the packer file should have a variables section' {
    $packerFile = Get-Content -Path 'testdrive:\packer\testVariables.json' -Raw |
        ConvertFrom-Json

    $packerFile.variables | Should Not Be Null
}

And 'the property should equal the value' {
    param($Table)

    $packerFile = Get-Content -Path 'testdrive:\packer\testVariables.json' -Raw |
    ConvertFrom-Json

    foreach ($row in $Table) {
        $packerFile.variables."$($row.property)" | Should Be $row.value
    }
}

When 'we create a packer file with a variables JSON snippet' {

    PackerFile testVariables {
        Source 'testdrive:\JsonSnippets'
        Destination 'testdrive:\packer'
        Variables variablesSnippet
    }
    'testdrive:\packer\testVariables.json' | Should Exist
}

Given 'we have a snippet destination folder' {
    mkdir testdrive:\JsonSnippets\Variables -ErrorAction SilentlyContinue
    'testdrive:\JsonSnippets\Variables' | Should Exist
}

When 'we create a variables JSON snippet file' {
    param($Data)
    
        $hashtable = $Data | 
            ConvertFrom-StringData

    PackerFile testVariables {
        Destination 'testdrive:\JsonSnippets\Variables'
        Variables CreateVariablesSnippet Snippet $hashtable
    }
    'testdrive:\JsonSnippets\Variables\CreateVariablesSnippet.json' | Should Exist
}

Then 'the snippet property should equal the value' {
    param($Table)
    
    $snippetFile = Get-Content -Path 'testdrive:\JsonSnippets\Variables\CreateVariablesSnippet.json' -Raw |
    ConvertFrom-Json

    foreach ($row in $Table) {
        $snippetFile."$($row.property)" | Should Be $row.value
    }
}