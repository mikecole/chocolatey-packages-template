$checksum = 'e4285198ff796c7406ebe273f342954a2a2f9bbef03c970bbfa5313bf7b1f585'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.23.2.4656-85f0adf5b/windows/PlexMediaServer-1.23.2.4656-85f0adf5b-x86.exe'

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
