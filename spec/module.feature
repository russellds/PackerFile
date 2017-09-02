Feature: You are creating a PowerShell Module

Scenario: The module is valid PowerShell
    Given we have script files
    Then the script files should be valid Powershell
    And the module should import cleanly