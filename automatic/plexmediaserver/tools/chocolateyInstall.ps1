$checksum = '5ccba5673bf6460b63f8af476efa5bab18eafd468856f3c6e07bfcc3467e3d9f'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.19.3.2831-181d9145d/windows/PlexMediaServer-1.19.3.2831-181d9145d-x86.exe'

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
