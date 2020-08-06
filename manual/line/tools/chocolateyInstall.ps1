$ErrorActionPreference = 'Stop'
$packageArgs = @{
  packageName    = 'line'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'exe'
  url            = 'http://dl.desktop.line.naver.jp/naver/LINE/win/LineInst.exe'
  silentArgs     = '/S'
  validExitCodes = @(0)
  softwareName   = 'Line*'
  checksum       = 'ED32C23E7E1039A08AE0DD6B001D27BB31D116AECC4432A8C58E2A7CC81D950A'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs