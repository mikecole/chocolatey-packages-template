$checksum = 'eb8e88415d2e6ccaba6be7da308ca7524370307d2330f058d47440f3ef338e8b'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.21.3.4014-58bd20c02/windows/PlexMediaServer-1.21.3.4014-58bd20c02-x86.exe'

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
