$ErrorActionPreference = 'Stop'
$checksum = 'CC5936096FFAAD4E173C340E43FDC3F08CCC76CFA496F6FA03529957B974EAFF'
$url = 'https://zoom.us/client/4.6.19253.0401/ZoomInstallerFull.msi'

$packageArgs = @{
  packageName    = 'zoom'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = $url
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'zoom*'
  checksum       = $checksum
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
