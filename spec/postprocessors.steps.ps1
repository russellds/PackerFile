When 'we create a packer file with a Post Processors hashtable' {
    param($Data)

    $hashtable = $Data | 
        ConvertFrom-StringData

    PackerFile testPacker {
        Destination 'testdrive:\packer'
        PostProcessors {
            PostProcessor $hashtable
        } 
    }
    'testdrive:\packer\testPacker.json' | Should Exist
}

When 'we create a packer file with a Post Processors JSON snippet' {
    
    PackerFile testPacker {
        Source 'testdrive:\JsonSnippets'
        Destination 'testdrive:\packer'
        PostProcessors {
            PostProcessor PostProcessorsSnippet
        }
    }
    'testdrive:\packer\testPacker.json' | Should Exist
}


When 'we create a Post Processors JSON snippet file' {
        param($Data)
        
            $hashtable = $Data | 
                ConvertFrom-StringData
    
        PackerFile testPacker {
            Destination 'testdrive:\JsonSnippets\PostProcessors'
            PostProcessors {
                PostProcessor CreatePostProcessorsSnippet Snippet $hashtable
            }
        }
        'testdrive:\JsonSnippets\PostProcessors\CreatePostProcessorsSnippet.json' | Should Exist
    }
    