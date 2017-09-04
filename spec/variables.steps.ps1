When 'we create a packer file with a Variables hashtable' {
    param($Data)

    $hashtable = $Data | 
        ConvertFrom-StringData

    PackerFile testPacker {
        Destination 'testdrive:\packer'
        Variables $hashtable
    }
    'testdrive:\packer\testPacker.json' | Should Exist
}

When 'we create a packer file with a Variables JSON snippet' {
    
    PackerFile testPacker {
        Source 'testdrive:\JsonSnippets'
        Destination 'testdrive:\packer'
        Variables VariablesSnippet
    }
    'testdrive:\packer\testPacker.json' | Should Exist
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
    