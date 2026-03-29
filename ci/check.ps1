$ErrorActionPreference = 'Stop'
Write-Output "Running oc-hub CI checks..."

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$root = Resolve-Path (Join-Path $scriptDir '..')

if (-not (Test-Path -Path (Join-Path $root 'index.html'))) {
  Write-Error "ERROR: index.html not found at $((Join-Path $root 'index.html'))"
  exit 1
}

if (-not (Test-Path -Path (Join-Path $root 'CNAME'))) {
  Write-Error "ERROR: CNAME not found at $((Join-Path $root 'CNAME'))"
  exit 1
}

$domain = (Get-Content (Join-Path $root 'CNAME') -Raw).Trim()
if ($domain -ne 'openconfidential.ai') {
  Write-Error "ERROR: CNAME does not contain openconfidential.ai (found: '$domain')"
  exit 1
}

$content = Get-Content (Join-Path $root 'index.html') -Raw
if ($content -notmatch 'oc-hub') {
  Write-Error "ERROR: index.html does not mention 'oc-hub'"
  exit 1
}

Write-Output "All checks passed."
