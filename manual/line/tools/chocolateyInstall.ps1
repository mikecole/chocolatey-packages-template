$ErrorActionPreference = 'Stop'
$packageArgs = @{
  packageName    = 'line'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'exe'
  url            = 'http://dl.desktop.line.naver.jp/naver/LINE/win/LineInst.exe'
  silentArgs     = '/S'
  validExitCodes = @(0)
  softwareName   = 'Line*'
  checksum       = '612B1F8EB7B59B87F6D6B9751AB34522F6D2FA966A1F804EDC6ADCFCB7453415'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs