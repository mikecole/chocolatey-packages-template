$ErrorActionPreference = 'Stop'
 
$packageArgs = @{
  packageName    = 'zoom-client'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://cdn.zoom.us/prod/5.6.1.617/ZoomInstaller.exe'
  url64          = 'https://cdn.zoom.us/prod/5.6.1.617/x64/ZoomInstaller.exe'
  silentArgs     = '/quiet /norestart ZoomAutoUpdate=True'
  validExitCodes = @(0)
  softwareName   = 'zoom*'
  checksum       = '1c8e0f3dc13c2ed71a001b0acb0b393ca2307198e7c4d1865697b3ef00cf083d'
  checksum64     = '9070A396A89EE62D2987942EF8E7E936FEF384334E8FCC58492EE0B2CC62D75B'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageArgs
