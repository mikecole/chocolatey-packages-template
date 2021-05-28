$checksum = '5a86507be0e530b860d9c2d40a0164765a2a0f9c5b6c9a4c7e7806ad3e9a0545'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.23.1.4602-280ab6053/windows/PlexMediaServer-1.23.1.4602-280ab6053-x86.exe'

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
