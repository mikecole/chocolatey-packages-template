$ErrorActionPreference = 'Stop'
$packageArgs = @{
  packageName    = 'line'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'exe'
  url            = 'http://dl.desktop.line.naver.jp/naver/LINE/win/LineInst.exe'
  silentArgs     = '/S'
  validExitCodes = @(0)
  softwareName   = 'Line*'
  checksum       = 'EEDB00ED1BEF350F7F97513FB8336BC4092A3B3B9B16CD9F1DA2C42EA7709139'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs