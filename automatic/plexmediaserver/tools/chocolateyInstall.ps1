$checksum = '973d1548e30b6865f2cdea94df596485e75a0859543520e7329b387893f72063'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.21.2.3939-3945797bd/windows/PlexMediaServer-1.21.2.3939-3945797bd-x86.exe'

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
