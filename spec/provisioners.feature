Feature: Packer File Provisioners
    As a Packer File Author
    I should be able to create Provisioners with a hashtable
    And I should be able to create Provisioners with a JSON snippet
    And I should be able to create a Provisioners JSON snippet file

Background: Create a Provisioners JSON snippet
    Given we have a Provisioners source folder
    And we have a source Provisioners JSON snippet
        """
        {
            "type": "file",
            "source": "software/",
            "destination": "C:/Temp"
        }
        """

# Scenario: I should be able to create Provisioners from a hashtable
#     Given we have a packer file destination folder
#     When we create a packer file with a Provisioners hashtable
#         """
#         type = file
#         source = software/
#         destination = C:/Temp
#         """
#     Then the packer file should exist
#     And the packer file should have a Provisioners section
#     And the packer file Provisioners section properties should equal the values
#     | property      | value     |
#     | type          | file      |
#     | source        | software/ |
#     | destination   | C:/Temp   |

Scenario: I should be able to create Provisioners from a JSON snippet
    Given we have a Provisioners packer file destination folder
    When we create a Provisioners packer file with a Provisioners JSON snippet
    Then the Provisioners packer file should exist
    And the packer file should have a Provisioners section
    And the packer file Provisioners section properties should equal the values
    | property      | value     |
    | type          | file      |
    | source        | software/ |
    | destination   | C:/Temp   |

# Scenario: I should be able to create a Provisioners JSON snippet file
#     Given we have a Provisioners snippet destination folder
#     When we create a Provisioners JSON snippet file
#         """
#         type = file
#         source = software/
#         destination = C:/Temp
#         """
#     Then the Provisioners snippet properties should equal the values
#     | property      | value     |
#     | type          | file      |
#     | source        | software/ |
#     | destination   | C:/Temp   |
