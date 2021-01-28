$ErrorActionPreference = 'Stop'

$checksum = 'ed6e4cb0e96043e9f746c18bbed528da93bc1c7a96e1d9060687358180548123'
$url = 'https://builds.cdn.getgo.com/builds/g2m/19228/G2MSetup10.15.19228_IT.msi?c_prod=g2mwt&c_cmp=care?c_prod=g2mwt&c_cmp=care'

$packageArgs = @{
  packageName    = 'gotomeeting'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = $url
  silentArgs     = '/quiet'
  validExitCodes = @(0)
  softwareName   = 'gotomeeting*'
  checksum       = $checksum
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
