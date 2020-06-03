$ErrorActionPreference = 'Stop'
 
$checksum = '6d0333ba23c706cd49a1bc816fd636533f4af41d3583ee79c50aaa157371fe4e'
$url = 'https://zoom.us/client/5.0.26213.0602/ZoomInstallerFull.msi'

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
