$ErrorActionPreference = 'Stop'
 
$checksum = '28a376f9860ce024d8c774dcaa62e1f07fd3a30b43de88b0e61b52c03dc8c238'
$url = 'https://zoom.us/client/5.4.58891.1115/ZoomInstallerFull.msi'

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
