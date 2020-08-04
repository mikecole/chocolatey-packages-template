$ErrorActionPreference = 'Stop'
 
$checksum = 'e0ddd234ec6c2c2ab6e2e2c66299355e139a3c66acceffb71cd0516915bd5442'
$url = 'https://zoom.us/client/5.2.42619.0804/ZoomInstallerFull.msi'

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
