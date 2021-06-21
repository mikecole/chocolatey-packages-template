$checksum = '51aa2c7b4249bb9923a4a435ba865957810329cca9f403deda685cdda195e07e'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.23.3.4707-ebb5fe9f3/windows/PlexMediaServer-1.23.3.4707-ebb5fe9f3-x86.exe'

Start-CheckandStop "Plex Media Server"

$packageArgs = @{
  packageName   = 'plexmediaserver'
  unzipLocation = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType      = 'exe'
  url           = $url
  silentArgs    = '/quiet'
  validExitCodes= @(0)
  softwareName  = 'plexmediaserver*'
  checksum      = $checksum
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs

if ($ProcessWasRunning -eq "True") {&$ProcessFullPath}
