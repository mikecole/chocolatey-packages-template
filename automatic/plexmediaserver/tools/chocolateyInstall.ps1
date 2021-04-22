$checksum = 'ad004549ea1be1f118c478fc34a714ad0f37a103f47f82476a12583b240b3bb8'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.22.3.4392-d7c624def/windows/PlexMediaServer-1.22.3.4392-d7c624def-x86.exe'

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
