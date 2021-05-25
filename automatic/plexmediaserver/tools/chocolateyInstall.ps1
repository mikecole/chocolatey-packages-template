$checksum = 'd2e20e582d86d61c3a84f81c57e25b4011ef57fec89bf73b9b1e16acc5df92b4'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.23.1.4571-6119e8eed/windows/PlexMediaServer-1.23.1.4571-6119e8eed-x86.exe'

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
