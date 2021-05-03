$ErrorActionPreference = 'Stop'
$checksum = '15e6aeb2b775bbdc611f43bf9c631cc7b5b47a09f00bfef16a727ecef20cab85'
$checksum64 = 'da1e644772a6e2709114a5583b315795c9ce72c7e11058ebe9fb870e0d7ec76c'

$url = 'https://cdn.zoom.us/prod/5.6.5.823/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.6.5.823/x64/ZoomInstallerFull.msi'

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
