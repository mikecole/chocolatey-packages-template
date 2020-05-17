$ErrorActionPreference = 'Stop'
$packageArgs = @{
  packageName    = 'money-manager-ex'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'exe'  
  silentArgs     = '/VERYSILENT /NORESTART'
  validExitCodes = @(0)
  softwareName   = 'MoneyManagerEX*'
  url32bit       = 'https://managedway.dl.sourceforge.net/project/moneymanagerex/v1.3.4/mmex-1.3.4-win32.exe'
  checksum32     = 'E196E9E03DA66719D5B0D7CB2A0D868BDBCA2D7178EBCC4335316EC3E800E1FE'
  checksumType32 = 'sha256'
  url64bit       = 'https://astuteinternet.dl.sourceforge.net/project/moneymanagerex/v1.3.3/mmex_1.3.3_x64_setup.exe'
  checksum64     = '645D945EFEBC8F61E5E3D6E3BEFA64265B6AF3042E170D27C5C4DC5DFD347FE4'
  checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageArgs
