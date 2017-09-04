Feature: Packer File Post Processors
    As a Packer File Author
    I should be able to create Post Processors with a hashtable
    And I should be able to create Post Processors with a JSON snippet
    And I should be able to create a Post Processors JSON snippet file

Background: Create a Post Processors JSON snippet
    Given we have a Post Processors source folder
    And we have a source Post Processors JSON snippet
        """
        {
            "type": "vagrant",
            "keep_input_artifact": false,
            "output": "./output/box/{{.Provider}}-{{user `os_name`}}-base.box",
            "vagrantfile_template": "./vagrantfile/vagrantfile-windows.template"
        }
        """

# Scenario: I should be able to create Post Processors from a hashtable
#     Given we have a packer file destination folder
#     When we create a packer file with a Post Processors hashtable
#         """
#         type = vagrant
#         keep_input_artifact = false
#         output = ./output/box/{{.Provider}}-{{user `os_name`}}-base.box
#         vagrantfile_template = ./vagrantfile/vagrantfile-windows.template
#         """
#     Then the packer file should exist
#     And the packer file should have a Post Processors section
#     And the packer file Post Processors section properties should equal the values
#     | property              | value                                                     |
#     | type                  | vagrant                                                   |
#     | keep_input_artifact   | false                                                     |
#     | output                | ./output/box/{{.Provider}}-{{user `os_name`}}-base.box    |
#     | vagrantfile_template  | ./vagrantfile/vagrantfile-windows.template                |

# Scenario: I should be able to create Post Processors from a JSON snippet
#     Given we have a packer file destination folder
#     When we create a packer file with a Post Processors JSON snippet
#     Then the packer file should exist
#     And the packer file should have a Post Processors section
#     And the packer file Post Processors section properties should equal the values
#     | property              | value                                                     |
#     | type                  | vagrant                                                   |
#     | keep_input_artifact   | false                                                     |
#     | output                | ./output/box/{{.Provider}}-{{user `os_name`}}-base.box    |
#     | vagrantfile_template  | ./vagrantfile/vagrantfile-windows.template                |

# Scenario: I should be able to create a Post Processors JSON snippet file
#     Given we have a Post Processors snippet destination folder
#     When we create a Post Processors JSON snippet file
#         """
#         type = vagrant
#         keep_input_artifact = false
#         output = ./output/box/{{.Provider}}-{{user `os_name`}}-base.box
#         vagrantfile_template = ./vagrantfile/vagrantfile-windows.template
#         """
#     Then the Post Processors snippet properties should equal the values
#     | property              | value                                                     |
#     | type                  | vagrant                                                   |
#     | keep_input_artifact   | false                                                     |
#     | output                | ./output/box/{{.Provider}}-{{user `os_name`}}-base.box    |
#     | vagrantfile_template  | ./vagrantfile/vagrantfile-windows.template                |
