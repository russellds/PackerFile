Feature: Packer File Builders
    As a Packer File Author
    I should be able to create Builders with a hashtable
    And I should be able to create Builders with a JSON snippet
    And I should be able to create a Builders JSON snippet file

Background: Create a Builders JSON snippet
    Given we have a Builders source folder
    And we have a source Builders JSON snippet
        """
        {
            "type": "file",
            "source": "software/",
            "destination": "C:/Temp"
        }
        """

# Scenario: I should be able to create Builders from a hashtable
#     Given we have a packer file destination folder
#     When we create a packer file with a Builders hashtable
#         """
#         type = file
#         source = software/
#         destination = C:/Temp
#         """
#     Then the packer file should exist
#     And the packer file should have a Builders section
#     And the packer file Builders section properties should equal the values
#     | property      | value     |
#     | type          | file      |
#     | source        | software/ |
#     | destination   | C:/Temp   |

Scenario: I should be able to create Builders from a JSON snippet
    Given we have a Builders packer file destination folder
    When we create a Builders packer file with a Builders JSON snippet
    Then the Builders packer file should exist
    And the packer file should have a Builders section
    And the packer file Builders section properties should equal the values
    | property      | value     |
    | type          | file      |
    | source        | software/ |
    | destination   | C:/Temp   |

# Scenario: I should be able to create a Builders JSON snippet file
#     Given we have a Builders snippet destination folder
#     When we create a Builders JSON snippet file
#         """
#         type = file
#         source = software/
#         destination = C:/Temp
#         """
#     Then the Builders snippet properties should equal the values
#     | property      | value     |
#     | type          | file      |
#     | source        | software/ |
#     | destination   | C:/Temp   |
