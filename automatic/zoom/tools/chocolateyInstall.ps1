$ErrorActionPreference = 'Stop'
$checksum = '43b291f0f7a96e917f3976e757c8fa28b954e29eea9e4400b03e6d5a069f10dd'
$checksum64 = 'acb1f7654e970020acd696ae363568f852da717f4203c49541d90c74b25e9745'

$url = 'https://cdn.zoom.us/prod/5.6.4.799/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.6.4.799/x64/ZoomInstallerFull.msi'

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
