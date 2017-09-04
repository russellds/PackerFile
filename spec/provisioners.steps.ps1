# When 'we create a packer file with a Provisioners hashtable' {
#     param($Data)

#     $hashtable = $Data | 
#         ConvertFrom-StringData

#     PackerFile testPacker {
#         Destination "testdrive:\packer\Provisioners"
#         Provisioners {
#             Provisioner $hashtable
#         } 
#     }
#     "testdrive:\packer\Provisioners\testPacker.json" | Should Exist
# }

When 'we create a Provisioners packer file with a Provisioners JSON snippet' {
    
    PackerFile testPacker {
        Source 'testdrive:\JsonSnippets'
        Destination "testdrive:\packer\Provisioners"
        Provisioners {
            Provisioner ProvisionersSnippet
        }
    }
    "testdrive:\packer\Provisioners\testPacker.json" | Should Exist
}

# When 'we create a Provisioners JSON snippet file' {
#     param($Data)
    
#         $hashtable = $Data | 
#             ConvertFrom-StringData

#     PackerFile testPacker {
#         Destination 'testdrive:\JsonSnippets\Provisioners'
#         Provisioners {
#             Provisioner CreateProvisionersSnippet Snippet $hashtable
#         }
#     }
#     'testdrive:\JsonSnippets\Provisioners\CreateProvisionersSnippet.json' | Should Exist
# }
    