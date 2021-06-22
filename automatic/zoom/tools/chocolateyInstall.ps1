$ErrorActionPreference = 'Stop'
$checksum = 'a4d211b6344971a908c1a4a172e558611f7cbb04efe9758fd67c5acc47ee8db1'
$checksum64 = 'a36b8ebc42adf864a5b5bc274fec900c549f71442e7816b92f2903ecfa1a1be2'

$url = 'https://cdn.zoom.us/prod/5.7.0.522/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.7.0.522/x64/ZoomInstallerFull.msi'

$packageArgs = @{
  packageName    = 'zoom-client'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = $url
  url64          = $url64
  silentArgs     = '/quiet /norestart ZoomAutoUpdate=True'
  validExitCodes = @(0)
  softwareName   = 'zoom*'
  checksum       = $checksum
  checksum64     = $checksum64
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageArgs
