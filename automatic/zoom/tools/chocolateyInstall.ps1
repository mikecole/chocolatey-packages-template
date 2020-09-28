$ErrorActionPreference = 'Stop'
 
$checksum = '5d3881419b738a2e231ac5b0a6da8539327dfc439e850acea00a30ce729401c0'
$url = 'https://zoom.us/client/5.3.52879.0927/ZoomInstallerFull.msi'

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
