$ErrorActionPreference = 'Stop'
$packageArgs = @{
  packageName    = 'line'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'exe'
  url            = 'http://dl.desktop.line.naver.jp/naver/LINE/win/LineInst.exe'
  silentArgs     = '/S'
  validExitCodes = @(0)
  softwareName   = 'Line*'
  checksum       = '9D45F39B01425B663EEAE83C58FE2E9D4BB72DBD191BC402B4B544332C050688'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs