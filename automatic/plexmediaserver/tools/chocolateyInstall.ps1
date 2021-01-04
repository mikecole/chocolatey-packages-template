$checksum = 'dbc0b1384f6eb7ed962a361767f7307d3cbb70451f68bb914cbf32121c2ecb85'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.21.1.3842-b0c7a97d9/windows/PlexMediaServer-1.21.1.3842-b0c7a97d9-x86.exe'

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
