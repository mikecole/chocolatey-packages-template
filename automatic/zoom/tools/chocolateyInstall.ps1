$ErrorActionPreference = 'Stop'
 
$checksum = '0d414f5ca120418b4cd83e84e378893e8fd7c6821b0e6595173f9167f60efda4'
$url = 'https://zoom.us/client/5.2.45108.0831/ZoomInstallerFull.msi'

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
