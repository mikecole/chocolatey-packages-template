$ErrorActionPreference = 'Stop'
$checksum = 'D64C29929E402F71821AB07D5D4985E51A28E0EC0E254CE764AD3E18090095AD'
$url = 'https://zoom.us/client/4.6.20033.0407/ZoomInstallerFull.msi'

$packageArgs = @{
  packageName    = 'zoom-client'
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
