$checksum = '41c12bb6f43cbebff2cea65051d93e2d942f768aa8ab5afab28476c5cdc22ac9'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.21.4.4079-1b7748a7b/windows/PlexMediaServer-1.21.4.4079-1b7748a7b-x86.exe'

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
