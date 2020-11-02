$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = 'caffeine'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'zip'
  url            = 'http://www.zhornsoftware.co.uk/caffeine/caffeine.zip'
  validExitCodes = @(0)
  checksum       = 'FEEB7F7643D660C125E22E9D34B7EAA1B02C0F62D5536648EEF9EAC7E3800DBE'
  checksumType   = 'sha256'
}

echo "If an older version of Caffeine is running on this machine, it will be closed prior to the installation of the newer version."
ps caffeine -ea 0 | kill

Install-ChocolateyZipPackage @packageArgs