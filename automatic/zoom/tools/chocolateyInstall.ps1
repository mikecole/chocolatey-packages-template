$ErrorActionPreference = 'Stop'
 
$checksum = '93b9ed48bcb5450ba8bf2e22936017125092f47380aa90469d4afe8839440e55'
$url = 'https://zoom.us/client/5.4.59784.1220/ZoomInstallerFull.msi'

$packageArgs = @{
  packageName    = 'zoom-client'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = $url
  silentArgs     = '/quiet /norestart ZoomAutoUpdate=True'
  validExitCodes = @(0)
  softwareName   = 'zoom*'
  checksum       = $checksum
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
