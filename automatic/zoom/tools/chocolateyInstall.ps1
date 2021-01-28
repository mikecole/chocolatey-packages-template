$ErrorActionPreference = 'Stop'
 
$checksum = 'f597d9a7baca73676301c34ac675008a73104527021ad811405d020a4e0c6506'
$url = 'https://zoom.us/client/5.4.59931.0110/ZoomInstallerFull.msi'

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
