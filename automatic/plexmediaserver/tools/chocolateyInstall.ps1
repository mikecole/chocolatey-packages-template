$checksum = '68610f91c1a5becec802c650a3ea2f74c8be0f388623e886350dbaa0ba8166dd'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.21.3.4046-3c1c83ba4/windows/PlexMediaServer-1.21.3.4046-3c1c83ba4-x86.exe'

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
