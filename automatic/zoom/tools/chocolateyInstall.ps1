$ErrorActionPreference = 'Stop'
 
$checksum = '3b2d3a11503bd57dad6445e76d9117364df100ba3eacba3c2a0f72f0cc499771'
$url = 'https://zoom.us/client/5.1.28656.0709/ZoomInstallerFull.msi'

$packageArgs = @{
  packageName    = 'zoom-client'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = $url
  silentArgs     = '/quiet /norestart ZoomAutoUpdate=True'
  validExitCodes = @(0)
  softwareName   = 'zoom*'
  checksum       = $checksum
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
