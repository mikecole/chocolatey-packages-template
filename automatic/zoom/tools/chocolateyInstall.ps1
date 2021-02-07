$ErrorActionPreference = 'Stop'
 
$checksum = 'aee7b00bc50adf30b79f428515a61d48bd9a5393983b275c7c9fdc2a93177473'
$url = 'https://zoom.us/client/5.5.12494.0204/ZoomInstallerFull.msi'

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
