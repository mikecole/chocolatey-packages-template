$ErrorActionPreference = 'Stop'
$checksum = '6e36c5eb8643dc56c6eba357c2b1e0012f6b32b17c602205764040c10de935bd'
$checksum64 = '8ab3a6dcabcb01876c0c5d3090c7c449e1da25c720dbd4eaed50a80e01f994c0'

$url = 'https://cdn.zoom.us/prod/5.6.6.961/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.6.6.961/x64/ZoomInstallerFull.msi'

$packageArgs = @{
  packageName    = 'zoom-client'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = $url
  url64          = $url64
  silentArgs     = '/quiet /norestart ZoomAutoUpdate=True'
  validExitCodes = @(0)
  softwareName   = 'zoom*'
  checksum       = $checksum
  checksum64     = $checksum64
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageArgs
