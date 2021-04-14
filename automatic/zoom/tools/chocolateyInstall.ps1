$ErrorActionPreference = 'Stop'
$checksum = '1C8E0F3DC13C2ED71A001B0ACB0B393CA2307198E7C4D1865697B3EF00CF083D'
$checksum64 = 'F725BCA0198B470568AB65356A151C47B66985752CB7672569A7F7AFEBDA79DA'

$packageArgs = @{
  packageName    = 'zoom-client'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://cdn.zoom.us/prod/5.6.1.617/ZoomInstallerFull.msi'
  url64          = 'https://cdn.zoom.us/prod/5.6.1.617/x64/ZoomInstallerFull.msi'
  silentArgs     = '/quiet /norestart ZoomAutoUpdate=True'
  validExitCodes = @(0)
  softwareName   = 'zoom*'
  checksum       = $checksum
  checksum64     = $checksum64
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageArgs
