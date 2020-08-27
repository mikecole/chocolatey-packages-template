$checksum = 'da69fdc13bd1a6e56be4bcf8339db398759a25f1d56daa4f2b8e6e48cbc2825d'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.20.1.3252-a78fef9a9/windows/PlexMediaServer-1.20.1.3252-a78fef9a9-x86.exe'

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
