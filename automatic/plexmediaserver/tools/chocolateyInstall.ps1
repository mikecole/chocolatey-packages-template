$checksum = 'e761c6ef0a00d6ccc886c4f766bc615a468fba2b1f17796a63ecb899f9520351'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.19.4.2902-69560ce1e/windows/PlexMediaServer-1.19.4.2902-69560ce1e-x86.exe'

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
