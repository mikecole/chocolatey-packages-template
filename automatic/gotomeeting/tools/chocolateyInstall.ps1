$ErrorActionPreference = 'Stop'

$checksum = 'dfb885d103ba0dc0f196a00953ac9d95637394abbd03d98c12f5c0632218fce3'
$url = 'https://builds.cdn.getgo.com/builds/g2m/18705/G2MSetup10.13.18705_IT.msi?c_prod=g2mwt&c_cmp=care?c_prod=g2mwt&c_cmp=care'

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
