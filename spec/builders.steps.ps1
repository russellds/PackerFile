# When 'we create a packer file with a Builders hashtable' {
#     param($Data)

#     $hashtable = $Data | 
#         ConvertFrom-StringData

#     PackerFile testPacker {
#         Destination "testdrive:\packer\Builders"
#         Builders {
#             Builder $hashtable
#         } 
#     }
#     "testdrive:\packer\Builders\testPacker.json" | Should Exist
# }

When 'we create a Builders packer file with a Builders JSON snippet' {
    
    PackerFile testPacker {
        Source 'testdrive:\JsonSnippets'
        Destination "testdrive:\packer\Builders"
        Builders {
            Builder BuildersSnippet
        }
    }
    "testdrive:\packer\Builders\testPacker.json" | Should Exist
}

# When 'we create a Builders JSON snippet file' {
#     param($Data)
    
#         $hashtable = $Data | 
#             ConvertFrom-StringData

#     PackerFile testPacker {
#         Destination 'testdrive:\JsonSnippets\Builders'
#         Builders {
#             Builder CreateBuildersSnippet Snippet $hashtable
#         }
#     }
#     'testdrive:\JsonSnippets\Builders\CreateBuildersSnippet.json' | Should Exist
# }
    