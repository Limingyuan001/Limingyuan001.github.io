$ErrorActionPreference = "Stop"
if (Get-Variable -Name PSNativeCommandUseErrorActionPreference -ErrorAction SilentlyContinue) {
  $PSNativeCommandUseErrorActionPreference = $false
}

$rubyBin = "F:\softwares\Ruby33-x64\bin"
$ruby = Join-Path $rubyBin "ruby.exe"
$jekyll = Join-Path $rubyBin "jekyll"
$siteRoot = Split-Path -Parent $PSScriptRoot

if (-not (Test-Path -LiteralPath $jekyll)) {
  throw "Jekyll was not found at $jekyll"
}

$env:Path = "$rubyBin;$env:Path"
$env:JEKYLL_NO_BUNDLER_REQUIRE = "true"

Set-Location -LiteralPath $siteRoot

$maxAttempts = 5

for ($attempt = 1; $attempt -le $maxAttempts; $attempt++) {
  Write-Host "Jekyll build attempt $attempt of $maxAttempts..."

  $process = [System.Diagnostics.Process]::new()
  $process.StartInfo.FileName = $env:ComSpec
  $process.StartInfo.WorkingDirectory = $siteRoot
  $process.StartInfo.UseShellExecute = $false
  $stdoutPath = [System.IO.Path]::GetTempFileName()
  $stderrPath = [System.IO.Path]::GetTempFileName()
  $process.StartInfo.RedirectStandardOutput = $false
  $process.StartInfo.RedirectStandardError = $false
  $process.StartInfo.Arguments = "/d /c `"`"$ruby`" `"$jekyll`" build --trace > `"$stdoutPath`" 2> `"$stderrPath`"`""
  $process.StartInfo.Environment["Path"] = $env:Path
  $process.StartInfo.Environment["JEKYLL_NO_BUNDLER_REQUIRE"] = $env:JEKYLL_NO_BUNDLER_REQUIRE

  [void]$process.Start()
  $process.WaitForExit()

  $stdout = Get-Content -Raw -LiteralPath $stdoutPath -ErrorAction SilentlyContinue
  $stderr = Get-Content -Raw -LiteralPath $stderrPath -ErrorAction SilentlyContinue
  Remove-Item -LiteralPath $stdoutPath, $stderrPath -Force -ErrorAction SilentlyContinue

  $text = $stdout + [Environment]::NewLine + $stderr
  $failed = $process.ExitCode -ne 0 -or
    $text -match "Liquid Exception" -or
    $text -match "RuntimeError" -or
    $text -match "FrozenError"

  if (-not $failed -and $text -match "done in") {
    Write-Host $stdout
    exit 0
  }

  if ($attempt -lt $maxAttempts) {
    Write-Warning "Jekyll hit an intermittent Ruby/Liquid error. Retrying..."
    Start-Sleep -Seconds 1
  } else {
    Write-Host $stdout
    if ($stderr) {
      Write-Host $stderr
    }
    throw "Jekyll build failed after $maxAttempts attempts."
  }
}
