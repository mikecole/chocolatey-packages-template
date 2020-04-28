$ErrorActionPreference = 'Stop'
$checksum = '0429e74afc50fe6a04d605a6f546595d2b245218ec56562b4845cdb090cb3fec'
$url = 'https://zoom.us/client/5.0.23168.0427/ZoomInstallerFull.msi'

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
