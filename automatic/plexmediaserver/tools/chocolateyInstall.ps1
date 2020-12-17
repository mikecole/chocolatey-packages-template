$checksum = '58816d59a7c6fa5217bf9867d636c1ac129e0c67b76b76054e77cc18035fd6ea'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.21.1.3830-6c22540d5/windows/PlexMediaServer-1.21.1.3830-6c22540d5-x86.exe'

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
