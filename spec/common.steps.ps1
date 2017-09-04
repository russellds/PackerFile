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


Given 'we have a (?<Name>\S*) source folder' {
    param(
        $Name
    )

    [void](New-Item -Path "testdrive:\JsonSnippets\$Name" -ItemType Directory -ErrorAction SilentlyContinue)
    "testdrive:\JsonSnippets\$Name" | Should Exist
}

And 'we have a source (?<Name>\S*) JSON snippet' {
    param(
        $Name,    
        $Data
    )

    $filePath = "testdrive:\JsonSnippets\$Name\$($Name)Snippet.json"

    $Data | 
        Out-File -FilePath $filePath
    
    $filePath | Should Exist
}

Given 'we have a (?<Name>\S*) packer file destination folder' {
    param(
        $Name
    )

    [void](New-Item -Path "testdrive:\packer\$Name" -ItemType Directory -ErrorAction SilentlyContinue)
    "testdrive:\packer\$Name" | Should Exist
}

Then 'the (?<Name>\S*) packer file should exist' {
    param(
        $Name
    )

    "testdrive:\packer\$Name\testPacker.json" | Should Exist
}

And 'the packer file should have a (?<Name>\S*) section' {
    param(
        [string]$Name
    )
    if ($Name -eq 'PostProcessors') {
        $property = 'post-processors'
    }
    else {
        $property = $Name.ToLower().Trim()
    }

    $packerFile = Get-Content -Path "testdrive:\packer\$Name\testPacker.json" -Raw |
        ConvertFrom-Json

    $packerFile."$property" | Should Not Be Null
}

And 'the packer file (?<Name>\S*) section properties should equal the values' {
    param(
        $Name,
        $Table
    )
    if ($Name -eq 'PostProcessors') {
        $property = 'post-processors'
    }
    else {
        $property = $Name.ToLower().Trim()
    }

    $packerFile = Get-Content -Path "testdrive:\packer\$Name\testPacker.json" -Raw |
        ConvertFrom-Json

    foreach ($row in $Table) {
        $packerFile."$property"."$($row.property)" | Should Be $row.value
    }
}

Given 'we have a (?<Name>\S*) snippet destination folder' {
    param(
        $Name
    )

    [void](New-Item -Path "testdrive:\JsonSnippets\$Name" -ItemType Directory -ErrorAction SilentlyContinue)
    "testdrive:\JsonSnippets\$Name" | Should Exist
}

Then 'the (?<Name>\S*) snippet properties should equal the values' {
    param(
        $Name,
        $Table
    )
    
    $snippetFile = Get-Content -Path "testdrive:\JsonSnippets\$Name\Create$($Name)Snippet.json" -Raw |
    ConvertFrom-Json

    foreach ($row in $Table) {
        $snippetFile."$($row.property)" | Should Be $row.value
    }
}