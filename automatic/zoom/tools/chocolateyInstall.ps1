$ErrorActionPreference = 'Stop'
 
$checksum = '4ed05da0edff5fe70fa740b14bcdead03377ed19475145dc42ae205480bf858c'
$url = 'https://zoom.us/client/5.5.13142.0301/ZoomInstallerFull.msi'

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
