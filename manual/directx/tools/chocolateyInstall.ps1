
$curDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$tempDir = Join-Path $curDir 'temp'
$upperDir = Split-Path -parent $curDir

$packageArgs = @{
  packageName   = 'directx'
  unzipLocation = $tempDir
  fileType      = 'exe'
  url           = Join-Path $curDir 'directx_Jun2010_redist.exe'
  silentArgs    = "/Q /T:$tempDir"
  validExitCodes= @(0)
  softwareName  = 'directx*'
  checksum      = '8746EE1A84A083A90E37899D71D50D5C7C015E69688A466AA80447F011780C0D'
  checksumType  = 'sha256'
  useOriginalLocation = $true
}

Install-ChocolateyPackage @packageArgs

# Run the actual installer
$dxSetup = Join-Path $tempDir 'DXSETUP.exe'
Install-ChocolateyInstallPackage 'directx' 'exe' '/silent' "$dxSetup"

Remove-Item $tempDir -Recurse
Remove-Item $curDir -Recurse

# Remove choco install files (not needed anyway)
$file = Join-Path $upperDir 'directx.nuspec'
if (Test-Path $file) 
{
    Remove-Item $file
}

$file = Join-Path $upperDir 'directx.nupkg'
if (Test-Path $file) 
{
    Remove-Item $file
}

Remove-Item $upperDir

