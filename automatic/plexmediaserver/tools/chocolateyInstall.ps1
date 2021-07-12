$checksum = 'd23471178873e53be9c09a3b51e75669238d44345ed11cd8545645d52db3881f'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.23.4.4805-186bae04e/windows/PlexMediaServer-1.23.4.4805-186bae04e-x86.exe'

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
