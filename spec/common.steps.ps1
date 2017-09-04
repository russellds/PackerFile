$projectRoot = Resolve-Path "$PSScriptRoot\.."
$moduleRoot = Split-Path (Resolve-Path "$projectRoot\*\*.psm1")
BeforeEachFeature {
    $projectRoot = Resolve-Path "$PSScriptRoot\.."
    $moduleRoot = Split-Path (Resolve-Path "$projectRoot\*\*.psm1")
    $moduleName = Split-Path $moduleRoot -Leaf
    if (-not (Get-Module -Name $moduleName)) {
        Import-Module (Join-Path $moduleRoot "$moduleName.psm1") -force
    }
}
AfterEachFeature {
    $projectRoot = Resolve-Path "$PSScriptRoot\.."
    $moduleRoot = Split-Path (Resolve-Path "$projectRoot\*\*.psm1")
    $moduleName = Split-Path $moduleRoot -Leaf
    if (Get-Module -Name $moduleName) {
        Remove-Module $moduleName
    }
}


Given 'we have a (?<Name>\S*|(\S+)\s+(\S+)) source folder' {
    param(
        $Name
    )
    $Name = $Name -replace '\s', ''

    [void](New-Item -Path "testdrive:\JsonSnippets\$Name" -ItemType Directory -ErrorAction SilentlyContinue)
    "testdrive:\JsonSnippets\$Name" | Should Exist
}

And 'we have a source (?<Name>\S*|(\S+)\s+(\S+)) JSON snippet' {
    param(
        $Name,    
        $Data
    )
    $Name = $Name -replace '\s', ''

    $filePath = "testdrive:\JsonSnippets\$Name\$($Name)Snippet.json"

    $Data | 
        Out-File -FilePath $filePath
    
    $filePath | Should Exist

    Write-Host $filePath
}

Given 'we have a packer file destination folder' {
    mkdir testdrive:\packer -ErrorAction SilentlyContinue
    'testdrive:\packer' | Should Exist
}

Then 'the packer file should exist' {
    'testdrive:\packer\testPacker.json' | Should Exist
}

And 'the packer file should have a (?<Name>\S*|(\S+)\s+(\S+)) section' {
    param(
        [string]$Name
    )
    $Name = $Name.ToLower().Trim() -replace ' ', '-'

    $packerFile = Get-Content -Path 'testdrive:\packer\testPacker.json' -Raw |
        ConvertFrom-Json

    $packerFile."$Name" | Should Not Be Null
}

And 'the packer file (?<Name>\S*|(\S+)\s+(\S+)) section properties should equal the values' {
    param(
        $Name,
        $Table
    )
    $Name = $Name.ToLower().Trim() -replace ' ', '-'

    $packerFile = Get-Content -Path 'testdrive:\packer\testPacker.json' -Raw |
    ConvertFrom-Json

    foreach ($row in $Table) {
        $packerFile."$Name"."$($row.property)" | Should Be $row.value
    }
}

Given 'we have a (?<Name>\S*|(\S+)\s+(\S+)) snippet destination folder' {
    param(
        $Name
    )
    $Name = $Name -replace '\s', ''

    [void](New-Item -Path "testdrive:\JsonSnippets\$Name" -ItemType Directory -ErrorAction SilentlyContinue)
    "testdrive:\JsonSnippets\$Name" | Should Exist
}

Then 'the (?<Name>\S*|(\S+)\s+(\S+)) snippet properties should equal the values' {
    param(
        $Name,
        $Table
    )
    $Name = $Name -replace '\s', ''
    
    $snippetFile = Get-Content -Path "testdrive:\JsonSnippets\$Name\Create$($Name)Snippet.json" -Raw |
    ConvertFrom-Json

    foreach ($row in $Table) {
        $snippetFile."$($row.property)" | Should Be $row.value
    }
}