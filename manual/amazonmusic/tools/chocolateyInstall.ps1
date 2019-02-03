$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = 'amazonmusic'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'EXE'
  url            = 'https://images-na.ssl-images-amazon.com/images/G/01/digital/music/morpho/installers/20181218/064306c06f/AmazonMusicInstaller.exe'
  checksum       = 'DD4A0B901B9598AD93BAD560557D5305090BC0F45A9B36BEC99E1A5B4B228DC1'
  checksumType   = 'sha256'
  silentArgs     = ''
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs