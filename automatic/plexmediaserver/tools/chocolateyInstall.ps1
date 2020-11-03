$checksum = '8176b056e14135ae29681de5c02fe3f1c48cc9bb1af41e8d737544ab94b08784'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.20.4.3517-ab5e1197c/windows/PlexMediaServer-1.20.4.3517-ab5e1197c-x86.exe'

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
