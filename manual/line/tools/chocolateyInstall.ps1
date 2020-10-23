$ErrorActionPreference = 'Stop'
$packageArgs = @{
  packageName    = 'line'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'exe'
  url            = 'http://dl.desktop.line.naver.jp/naver/LINE/win/LineInst.exe'
  silentArgs     = '/S'
  validExitCodes = @(0)
  softwareName   = 'Line*'
  checksum       = '7453D2FFAEAABD24888E384D5E54332B6A82A376BD34B4B153D98A436942DCE6'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs