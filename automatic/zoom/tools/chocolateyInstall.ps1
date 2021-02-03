$ErrorActionPreference = 'Stop'
 
$checksum = 'a8ec4e5f2080fb1577110938e3b8b13313bb38af7f754d8441f0fa56a8113dbf'
$url = 'https://zoom.us/client/5.5.12488.0202/ZoomInstallerFull.msi'

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
