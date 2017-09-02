Feature: Packer File variables
    As a Packer File Author
    I should be able to create variables with a hashtable
    And I should be able to create variables with a JSON snippet
    And I should be able to create a variables JSON snippet file

Background: Create a Variables JSON snippet
    Given we have a source folder
    And we have a source variables JSON snippet
        """
        {
            "os_name":  "win2012r2",
            "headless":  "true",
            "iso_checksum":  "849734F37346385DAC2C101E4AACBA4626BB141C",
            "iso_checksum_type":  "SHA1",
            "iso_url":  "http://care.dlservice.microsoft.com/dl/download/6/2/A/62A76ABB-9990-4EFC-A4FE-C7D698DAEB96/9600.17050.WINBLUE_REFRESH.140317-1640_X64FRE_SERVER_EVAL_EN-US-IR3_SSS_X64FREE_EN-US_DV9.ISO",
            "guest_os_type":  "Windows2012_64",
            "install_vbox_tools":  "true"
        }
        """

Scenario: I should be able to create variables with a hashtable
    Given we have a destination folder
    When we create a packer file with a variables hashtable
        """
        os_name = win2012r2
        headless = true
        iso_checksum = 849734F37346385DAC2C101E4AACBA4626BB141C
        iso_checksum_type = SHA1
        iso_url = http://care.dlservice.microsoft.com/dl/download/6/2/A/62A76ABB-9990-4EFC-A4FE-C7D698DAEB96/9600.17050.WINBLUE_REFRESH.140317-1640_X64FRE_SERVER_EVAL_EN-US-IR3_SSS_X64FREE_EN-US_DV9.ISO
        guest_os_type = Windows2012_64
        install_vbox_tools = true
        """
    Then the packer file should exist
    And the packer file should have a variables section
    And the property should equal the value
    | property              | value                                                                                                                                                                                     |
    | os_name               | win2012r2                                                                                                                                                                                 |
    | headless              | true                                                                                                                                                                                      |
    | iso_checksum          | 849734F37346385DAC2C101E4AACBA4626BB141C                                                                                                                                                  |
    | iso_checksum_type     | SHA1                                                                                                                                                                                      |
    | iso_url               | http://care.dlservice.microsoft.com/dl/download/6/2/A/62A76ABB-9990-4EFC-A4FE-C7D698DAEB96/9600.17050.WINBLUE_REFRESH.140317-1640_X64FRE_SERVER_EVAL_EN-US-IR3_SSS_X64FREE_EN-US_DV9.ISO  |
    | guest_os_type         | Windows2012_64                                                                                                                                                                            |
    | install_vbox_tools    | true                                                                                                                                                                                      |

Scenario: I should be able to create variables with a JSON snippet
    Given we have a destination folder
    When we create a packer file with a variables JSON snippet
    Then the packer file should exist
    And the packer file should have a variables section
    And the property should equal the value
    | property              | value                                                                                                                                                                                     |
    | os_name               | win2012r2                                                                                                                                                                                 |
    | headless              | true                                                                                                                                                                                      |
    | iso_checksum          | 849734F37346385DAC2C101E4AACBA4626BB141C                                                                                                                                                  |
    | iso_checksum_type     | SHA1                                                                                                                                                                                      |
    | iso_url               | http://care.dlservice.microsoft.com/dl/download/6/2/A/62A76ABB-9990-4EFC-A4FE-C7D698DAEB96/9600.17050.WINBLUE_REFRESH.140317-1640_X64FRE_SERVER_EVAL_EN-US-IR3_SSS_X64FREE_EN-US_DV9.ISO  |
    | guest_os_type         | Windows2012_64                                                                                                                                                                            |
    | install_vbox_tools    | true                                                                                                                                                                                      |

Scenario: I should be able to create a variables JSON snippet file
    Given we have a snippet destination folder
    When we create a variables JSON snippet file
        """
        os_name = win2012r2
        headless = true
        iso_checksum = 849734F37346385DAC2C101E4AACBA4626BB141C
        iso_checksum_type = SHA1
        iso_url = http://care.dlservice.microsoft.com/dl/download/6/2/A/62A76ABB-9990-4EFC-A4FE-C7D698DAEB96/9600.17050.WINBLUE_REFRESH.140317-1640_X64FRE_SERVER_EVAL_EN-US-IR3_SSS_X64FREE_EN-US_DV9.ISO
        guest_os_type = Windows2012_64
        install_vbox_tools = true
        """
    Then the snippet property should equal the value
    | property              | value                                                                                                                                                                                     |
    | os_name               | win2012r2                                                                                                                                                                                 |
    | headless              | true                                                                                                                                                                                      |
    | iso_checksum          | 849734F37346385DAC2C101E4AACBA4626BB141C                                                                                                                                                  |
    | iso_checksum_type     | SHA1                                                                                                                                                                                      |
    | iso_url               | http://care.dlservice.microsoft.com/dl/download/6/2/A/62A76ABB-9990-4EFC-A4FE-C7D698DAEB96/9600.17050.WINBLUE_REFRESH.140317-1640_X64FRE_SERVER_EVAL_EN-US-IR3_SSS_X64FREE_EN-US_DV9.ISO  |
    | guest_os_type         | Windows2012_64                                                                                                                                                                            |
    | install_vbox_tools    | true                                                                                                                                                                                      |
