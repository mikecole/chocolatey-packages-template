$ErrorActionPreference = 'Stop'
 
$checksum = 'aaf0d99f19da0b96486007a2451a632739b70c78e3948bccdaadfe066d19bed1'
$url = 'https://zoom.us/client/5.1.28642.0705/ZoomInstallerFull.msi'

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
