$checksum = '09b0e03b69620e4bcea4c120b736a8779cef91ca34aedc63bd7b7d64ff6c04cd'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.19.2.2737-b69929dab/windows/PlexMediaServer-1.19.2.2737-b69929dab-x86.exe'

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
