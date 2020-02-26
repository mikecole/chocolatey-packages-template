$ErrorActionPreference = 'Stop'
$checksum = '58539775d0c283c553ff09ff6304e03bcd5faab8fd2ac5ff7e881f661cb01d96'

$packageArgs = @{
  packageName   = 'glip'
  unzipLocation = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType      = 'exe'
  url           = 'http://downloads.ringcentral.com/glip/rc/19.11.1/x64/RingCentral-19.11.1-x64.exe'
  silentArgs    = '/VERYSILENT'
  validExitCodes= @(0)
  softwareName  = 'glip*'
  checksum      = $checksum
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
