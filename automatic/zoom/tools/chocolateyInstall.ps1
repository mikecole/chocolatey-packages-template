$ErrorActionPreference = 'Stop'
 
$checksum = '29cb6222237fa071b32612e2fe90802715536c7eb43dd7c49156a9025d1a4096'
$url = 'https://zoom.us/client/5.5.12454.0131/ZoomInstallerFull.msi'

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
