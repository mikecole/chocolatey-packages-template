$checksum = '2f966bcee9eb4f0b06f23356191251b817a67441725e4dbf0f668c7e51072146'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.21.3.4021-5a0a3e4b2/windows/PlexMediaServer-1.21.3.4021-5a0a3e4b2-x86.exe'

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
