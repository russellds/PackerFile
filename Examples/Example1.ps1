Packer Example1 {
    Source 'C:\code\PackerDsl\Json'
    Destination 'C:\code\PackerDsl'
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
    Variables @{
       os_name = ''
      headless = 'true'
      iso_checksum = ''
      iso_checksum_type = ''
      iso_url = ''
      guest_os_type = ''
      install_vbox_tools = ''
    }
}
