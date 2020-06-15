$ErrorActionPreference = 'Stop'
 
$checksum = 'ba27249fbd5fbdbb4c0418d1e03f4d06c09756caa15d1094c7c90b43c1505015'
$url = 'https://zoom.us/client/5.1.27830.0612/ZoomInstallerFull.msi'

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
