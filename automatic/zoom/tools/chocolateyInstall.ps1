$ErrorActionPreference = 'Stop'
 
$checksum = 'f4434eeec423cebfef82086eea33213ab565c3e59d6fd5fd553b66dcb86f2567'
$url = 'https://zoom.us/client/5.0.23502.0430/ZoomInstallerFull.msi'

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
