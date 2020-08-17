$ErrorActionPreference = 'Stop'
 
$checksum = 'b0a70da5640820230ec11b1c933023ce54cef7a384f957d65bf80d51c39b49bd'
$url = 'https://zoom.us/client/5.2.44052.0816/ZoomInstallerFull.msi'

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
