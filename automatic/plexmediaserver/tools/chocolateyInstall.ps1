$checksum = 'e041613b2b7d8e96abec60fb7887f493ecc8cd9d324f92b25920ea44410d95b0'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.21.1.3795-ee64ab56f/windows/PlexMediaServer-1.21.1.3795-ee64ab56f-x86.exe'

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
