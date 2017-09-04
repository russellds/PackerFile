Feature: Packer File PostProcessors
    As a Packer File Author
    I should be able to create PostProcessors with a hashtable
    And I should be able to create PostProcessors with a JSON snippet
    And I should be able to create a PostProcessors JSON snippet file

Background: Create a PostProcessors JSON snippet
    Given we have a PostProcessors source folder
    And we have a source PostProcessors JSON snippet
        """
        {
            "type": "vagrant",
            "keep_input_artifact": false,
            "output": "./output/box/{{.Provider}}-{{user `os_name`}}-base.box",
            "vagrantfile_template": "./vagrantfile/vagrantfile-windows.template"
        }
        """

# Scenario: I should be able to create PostProcessors from a hashtable
#     Given we have a packer file destination folder
#     When we create a packer file with a PostProcessors hashtable
#         """
#         type = vagrant
#         keep_input_artifact = false
#         output = ./output/box/{{.Provider}}-{{user `os_name`}}-base.box
#         vagrantfile_template = ./vagrantfile/vagrantfile-windows.template
#         """
#     Then the packer file should exist
#     And the packer file should have a PostProcessors section
#     And the packer file PostProcessors section properties should equal the values
#     | property              | value                                                     |
#     | type                  | vagrant                                                   |
#     | keep_input_artifact   | false                                                     |
#     | output                | ./output/box/{{.Provider}}-{{user `os_name`}}-base.box    |
#     | vagrantfile_template  | ./vagrantfile/vagrantfile-windows.template                |

Scenario: I should be able to create PostProcessors from a JSON snippet
    Given we have a PostProcessors packer file destination folder
    When we create a PostProcessors packer file with a PostProcessors JSON snippet
    Then the PostProcessors packer file should exist
    And the packer file should have a PostProcessors section
    And the packer file PostProcessors section properties should equal the values
    | property              | value                                                     |
    | type                  | vagrant                                                   |
    | keep_input_artifact   | false                                                     |
    | output                | ./output/box/{{.Provider}}-{{user `os_name`}}-base.box    |
    | vagrantfile_template  | ./vagrantfile/vagrantfile-windows.template                |

# Scenario: I should be able to create a PostProcessors JSON snippet file
#     Given we have a PostProcessors snippet destination folder
#     When we create a PostProcessors JSON snippet file
#         """
#         type = vagrant
#         keep_input_artifact = false
#         output = ./output/box/{{.Provider}}-{{user `os_name`}}-base.box
#         vagrantfile_template = ./vagrantfile/vagrantfile-windows.template
#         """
#     Then the PostProcessors snippet properties should equal the values
#     | property              | value                                                     |
#     | type                  | vagrant                                                   |
#     | keep_input_artifact   | false                                                     |
#     | output                | ./output/box/{{.Provider}}-{{user `os_name`}}-base.box    |
#     | vagrantfile_template  | ./vagrantfile/vagrantfile-windows.template                |
