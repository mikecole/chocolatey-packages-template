$ErrorActionPreference = 'Stop'
 
$checksum = 'f83550d728e4a2028e545c95a62768c0b891c85c2ffae70b6d9d6889edd078d2'
$url = 'https://zoom.us/client/5.4.58698.1027/ZoomInstallerFull.msi'

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
