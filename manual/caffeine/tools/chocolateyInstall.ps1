$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = 'caffeine'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'zip'
  url            = 'http://www.zhornsoftware.co.uk/caffeine/caffeine.zip'
  validExitCodes = @(0)
  checksum       = '04C446C72F4F55AB75FAE7503DBE1AA9AF4ACA1DE4C301F3D14B87BAD3F58315'
  checksumType   = 'sha256'
}

echo "If an older version of Caffeine is running on this machine, it will be closed prior to the installation of the newer version."
ps caffeine -ea 0 | kill

Install-ChocolateyZipPackage @packageArgs