$ErrorActionPreference = 'Stop'
$checksum = '65A7FC311B272E4C11ED30FC343F5922E2D07F538B161EBE6E783A005A329370'
$url = 'https://www.zoom.us/client/latest/ZoomInstallerFull.msi'

$packageArgs = @{
  packageName    = 'zoom'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = $url
  silentArgs     = '/quiet /norestart ZoomAutoUpdate="true"'
  validExitCodes = @(0)
  softwareName   = 'zoom*'
  checksum       = $checksum
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
