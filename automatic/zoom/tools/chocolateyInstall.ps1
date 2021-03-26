$ErrorActionPreference = 'Stop'
 
$checksum = 'eb2ab0f4acead83c8ce3b5d78ea123f1eb280a4c1f1c749fd4e31560a1a9c7d8'
$url = 'https://zoom.us/client/5.6.0.589/ZoomInstallerFull.msi'

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
