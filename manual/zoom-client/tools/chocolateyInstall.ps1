$ErrorActionPreference = 'Stop'
$checksum = 'EE5C4A8E9230DFEE0C2A7F475D52034FD8C72B6840AD7F14B49CEB68CC7CB018'
$url = 'https://zoom.us/client/4.6.20613.0421/ZoomInstallerFull.msi'

$packageArgs = @{
  packageName    = 'zoom-client'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = $url
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'zoom*'
  checksum       = $checksum
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
