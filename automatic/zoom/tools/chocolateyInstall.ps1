$ErrorActionPreference = 'Stop'
 
$checksum = '4873eaccf2a965d19b07e23b26f24192b13c0a8853ac1d74ce49b0df016bcba2'
$url = 'https://zoom.us/client/5.3.53291.1011/ZoomInstallerFull.msi'

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
