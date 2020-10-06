$checksum = 'fb10debf86e50a7914514c0a9e76ae89a942bf442496be3b5496dd44a2b0ebaf'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.20.2.3402-0fec14d92/windows/PlexMediaServer-1.20.2.3402-0fec14d92-x86.exe'

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
