$ErrorActionPreference = 'Stop'
$checksum = '85d64a4357a3b3598bb831d697fd2de5088458998b3b205b5f2f600d05b4ee70'
$checksum64 = '65a4861bdfe4ae599fd6470c82c8cb5fdea4014abb6200b42f383830322b0b5e'

$url = 'https://cdn.zoom.us/prod/5.7.1.543/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.7.1.543/x64/ZoomInstallerFull.msi'

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
