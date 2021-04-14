$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = 'caffeine'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'zip'
  url            = 'http://www.zhornsoftware.co.uk/caffeine/caffeine.zip'
  validExitCodes = @(0)
  checksum       = '1C8E0F3DC13C2ED71A001B0ACB0B393CA2307198E7C4D1865697B3EF00CF083D'
  checksumType   = 'sha256'
}

Write-Output "If an older version of Caffeine is running on this machine, it will be closed prior to the installation of the newer version."
Get-Process caffeine -ea 0 | Stop-Process

Install-ChocolateyZipPackage @packageArgs