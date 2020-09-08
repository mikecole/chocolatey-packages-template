$ErrorActionPreference = 'Stop'
 
$checksum = '8974514185962c7bffe94bdbf27bbd6dec710d42009c45561e2cd0b785b21654'
$url = 'https://zoom.us/client/5.2.45120.0906/ZoomInstallerFull.msi'

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
