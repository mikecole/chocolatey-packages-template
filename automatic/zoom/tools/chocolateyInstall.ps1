$ErrorActionPreference = 'Stop'
 
$checksum = '2d40ed9427f2433f32689e637de7ffbf8594635d5a68ad60601c0a0defbf0b49'
$url = 'https://zoom.us/client/5.4.58740.1105/ZoomInstallerFull.msi'

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
