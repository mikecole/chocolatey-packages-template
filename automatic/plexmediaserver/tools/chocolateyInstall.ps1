$checksum = 'c6d0da5889174efd4a483fbf6904d9d8b8d032b0fd8c732c4269aafdcd9ee20d'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.19.3.2764-ef515a800/windows/PlexMediaServer-1.19.3.2764-ef515a800-x86.exe'

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
