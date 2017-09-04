When 'we create a Variables packer file with a Variables hashtable' {
    param($Data)

    $hashtable = $Data | 
        ConvertFrom-StringData

    PackerFile testPacker {
        Destination "testdrive:\packer\Variables"
        Variables $hashtable
    }
    "testdrive:\packer\Variables\testPacker.json" | Should Exist
}

When 'we create a Variables packer file with a Variables JSON snippet' {
    
    PackerFile testPacker {
        Source 'testdrive:\JsonSnippets'
        Destination "testdrive:\packer\Variables"
        Variables VariablesSnippet
    }
    "testdrive:\packer\Variables\testPacker.json" | Should Exist
}

When 'we create a Variables JSON snippet file' {
        param($Data)
        
            $hashtable = $Data | 
                ConvertFrom-StringData
    
        PackerFile testPacker {
            Destination 'testdrive:\JsonSnippets\Variables'
            Variables CreateVariablesSnippet Snippet $hashtable
        }
        'testdrive:\JsonSnippets\Variables\CreateVariablesSnippet.json' | Should Exist
    }
    