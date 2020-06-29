$ErrorActionPreference = 'Stop'
 
$checksum = 'bbc2723b92dbdfee0c19b7d3cc099a8e3cb19e953ee3a6a2d06906dd93228b3b'
$url = 'https://zoom.us/client/5.1.28546.0628/ZoomInstallerFull.msi'

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
