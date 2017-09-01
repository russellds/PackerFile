PackerFile ExampleVariablesJson {
    Source 'C:\code\PackerFile\Json'
    Destination 'C:\code'
    Builders {
        Builder vboxM8C2
    }
    Provisioners {
        Provisioner MakeTmpDir
        Provisioner CopySoftwareToTmp
    }
    PostProcessors {
        PostProcessor vagrant
    }
    Variables win2012r2
}
