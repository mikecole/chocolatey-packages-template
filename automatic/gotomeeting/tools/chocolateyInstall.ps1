$ErrorActionPreference = 'Stop'

$checksum = 'ca0e57c978e899c6e47435e864baeceaff52a230e48a9c047c41d82d34ed4580'
$url = 'https://builds.cdn.getgo.com/builds/g2m/19598/G2MSetup10.16.19598_IT.msi?c_prod=g2mwt&c_cmp=care?c_prod=g2mwt&c_cmp=care'

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
