$checksum = 'd7ca4382023f39876acc8d8f7c5fa869121744989367f9a6e00c4fb7c51c342f'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.20.3.3437-f1f08d65b/windows/PlexMediaServer-1.20.3.3437-f1f08d65b-x86.exe'

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
