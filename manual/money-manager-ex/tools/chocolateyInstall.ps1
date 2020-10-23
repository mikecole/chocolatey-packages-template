$ErrorActionPreference = 'Stop'
$packageArgs = @{
  packageName    = 'money-manager-ex'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'exe'  
  silentArgs     = '/VERYSILENT /NORESTART'
  validExitCodes = @(0)
  softwareName   = 'MoneyManagerEX*'
  url32bit       = 'https://ayera.dl.sourceforge.net/project/moneymanagerex/v1.3.5/mmex-1.3.5-win32.exe'
  checksum32     = 'BACAAE63C878769A0F574CD06FB406F4C71935BBF20102A738FC23E539F88B43'
  checksumType32 = 'sha256'
  url64bit       = 'https://phoenixnap.dl.sourceforge.net/project/moneymanagerex/v1.3.5/mmex-1.3.5-win64.exe'
  checksum64     = '16AF9E4035794E9AD0CD1C2419E7A65AA0EDEEC1EF94F840BD910C293A157977'
  checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageArgs
