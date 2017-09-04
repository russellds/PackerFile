# When 'we create a packer file with a PostProcessors hashtable' {
#     param($Data)

#     $hashtable = $Data | 
#         ConvertFrom-StringData

#     PackerFile testPacker {
#         Destination "testdrive:\packer\PostProcessors"
#         PostProcessors {
#             PostProcessor $hashtable
#         } 
#     }
#     "testdrive:\packer\PostProcessors\testPacker.json" | Should Exist
# }


When 'we create a PostProcessors packer file with a PostProcessors JSON snippet' {
    
    PackerFile testPacker {
        Source 'testdrive:\JsonSnippets'
        Destination "testdrive:\packer\PostProcessors"
        PostProcessors {
            PostProcessor PostProcessorsSnippet
        }
    }
    "testdrive:\packer\PostProcessors\testPacker.json" | Should Exist
}

# When 'we create a PostProcessors JSON snippet file' {
#     param($Data)
    
#         $hashtable = $Data | 
#             ConvertFrom-StringData

#     PackerFile testPacker {
#         Destination 'testdrive:\JsonSnippets\PostProcessors'
#         PostProcessors {
#             PostProcessor CreatePostProcessorsSnippet Snippet $hashtable
#         }
#     }
#     'testdrive:\JsonSnippets\PostProcessors\CreatePostProcessorsSnippet.json' | Should Exist
# }
    