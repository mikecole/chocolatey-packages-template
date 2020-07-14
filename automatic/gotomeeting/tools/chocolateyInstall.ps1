$ErrorActionPreference = 'Stop'

$checksum = 'ba90683cbf878f87a5f55afd082ff05aa82a4dc931c6ddccf07c7b24cd0d67e2'
$url = 'https://builds.cdn.getgo.com/builds/g2m/18068/G2MSetup10.11.18068_IT.msi?c_prod=g2mwt&c_cmp=care'

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
