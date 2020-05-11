$ErrorActionPreference = 'Stop'
 
$checksum = '8515a469f6cff7f2da7b765905bd13b3d256d9d569ddab6b0d13f3de552bdcc9'
$url = 'https://zoom.us/client/5.0.24046.0510/ZoomInstallerFull.msi'

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
