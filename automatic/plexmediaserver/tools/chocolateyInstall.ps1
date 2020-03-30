$checksum = '507475e6bf750518758010d0e371225a7b0db092672188cdec77c3c6742b2c11'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.18.9.2578-513b381af/windows/PlexMediaServer-1.18.9.2578-513b381af-x86.exe'

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
