$ErrorActionPreference = 'Stop'

$checksum = '3aa138de3f8c5aaa079e995f448eeed09c1e2f3e3d96065362cb5ea0845649e6'
$url = 'https://builds.cdn.getgo.com/builds/g2m/18425/G2MSetup10.12.18425_IT.msi?c_prod=g2mwt&c_cmp=care?c_prod=g2mwt&c_cmp=care'

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
