$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = 'caffeine'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'zip'
  url            = 'http://www.zhornsoftware.co.uk/caffeine/caffeine.zip'
  validExitCodes = @(0)
  checksum       = 'EAB54785DBBFCDDE4E1CE694676DD184B638549A5B6FDF3DF5E2E344BBFEBF2F'
  checksumType   = 'sha256'
}

Write-Output "If an older version of Caffeine is running on this machine, it will be closed prior to the installation of the newer version."
Get-Process caffeine -ea 0 | Stop-Process

Install-ChocolateyZipPackage @packageArgs