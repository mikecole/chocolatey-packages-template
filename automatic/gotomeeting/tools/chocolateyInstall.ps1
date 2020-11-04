$ErrorActionPreference = 'Stop'

$checksum = '793edd6236d041ca752152c6a2e5fa63b84782bc2a2e7ed6496cd7080f6dcc7f'
$url = 'https://builds.cdn.getgo.com/builds/g2m/18962/G2MSetup10.14.18962_IT.msi?c_prod=g2mwt&c_cmp=care?c_prod=g2mwt&c_cmp=care'

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
