$checksum = '414c30182d0070a23dfbdf7bab27b884c6a1bdf8e0a5e72d8250c21ae7853645'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.19.4.2935-79e214ead/windows/PlexMediaServer-1.19.4.2935-79e214ead-x86.exe'

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
