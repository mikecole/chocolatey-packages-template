$ErrorActionPreference = 'Stop'
 
$checksum = 'f66aea21e64baee51084e3e19f3d61cb84f16f1e8190147f89b1d60ba57d0c03'
$url = 'https://zoom.us/client/5.0.24951.0515/ZoomInstallerFull.msi'

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
