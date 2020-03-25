$checksum = '6ed6c88e763e249348ed040c3979fb3f54e9296ceea583605ca79eddb0b1156b'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.18.9.2571-e106a8a91/windows/PlexMediaServer-1.18.9.2571-e106a8a91-x86.exe'

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
