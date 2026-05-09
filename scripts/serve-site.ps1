$ErrorActionPreference = "Stop"

$scriptDir = $PSScriptRoot

& (Join-Path $scriptDir "build-site.ps1")
& (Join-Path $scriptDir "preview-site.ps1")
