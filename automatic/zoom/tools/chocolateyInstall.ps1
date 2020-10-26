$ErrorActionPreference = 'Stop'
 
$checksum = 'c980cd0c8ae79c07b564cb953c326742dddce16f8260c0d6c41778e1fb960ac3'
$url = 'https://zoom.us/client/5.4.58636.1026/ZoomInstallerFull.msi'

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
