$ErrorActionPreference = 'Stop'
 
$checksum = '1c8e0f3dc13c2ed71a001b0acb0b393ca2307198e7c4d1865697b3ef00cf083d'
$url = 'https://zoom.us/client/5.6.1.617/ZoomInstallerFull.msi'

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
