$ErrorActionPreference = 'Stop'
$checksum = '4d41607fef219e4edb23bddf2ff15312cf20ef158eb0ccd0ca7a1314c42dd579'

$packageArgs = @{
  packageName    = 'caffeine'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'zip'
  url            = 'http://www.zhornsoftware.co.uk/caffeine/caffeine.zip'
  validExitCodes = @(0)
  checksum       = $checksum 
  checksumType   = 'sha256'
}

Write-Output "If an older version of Caffeine is running on this machine, it will be closed prior to the installation of the newer version."
Get-Process caffeine -ea 0 | Stop-Process

Install-ChocolateyZipPackage @packageArgs