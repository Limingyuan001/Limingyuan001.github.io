$ErrorActionPreference = "Stop"

$siteRoot = Split-Path -Parent $PSScriptRoot
$siteDir = Join-Path $siteRoot "_site"
$port = 4000

if (-not (Test-Path -LiteralPath $siteDir)) {
  throw "_site was not found. Run the build task first."
}

$listeners = Get-NetTCPConnection -LocalPort $port -State Listen -ErrorAction SilentlyContinue |
  Select-Object -ExpandProperty OwningProcess -Unique

foreach ($processId in $listeners) {
  Stop-Process -Id $processId -Force -ErrorAction SilentlyContinue
}

Set-Location -LiteralPath $siteRoot
python -m http.server $port --bind 127.0.0.1 --directory _site
