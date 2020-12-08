$ErrorActionPreference = 'Stop'
 
$checksum = '50de419cbf617e1e62d24ddbce79b4d96fabbd92c706e1bb1038911b21c596ec'
$url = 'https://zoom.us/client/5.4.59296.1207/ZoomInstallerFull.msi'

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
