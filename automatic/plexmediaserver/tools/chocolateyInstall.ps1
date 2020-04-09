$checksum = 'f6bdd8a65efbba764205ceb96e9bf9fc8143eb3db8d14f4ff3dad631c0f7dc15'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.19.1.2645-ccb6eb67e/windows/PlexMediaServer-1.19.1.2645-ccb6eb67e-x86.exe'

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
