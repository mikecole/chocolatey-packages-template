$checksum = 'ae6a75bb540825d7cc3e956c29fb39a8c569e212dd455d9d7b20134309f20dd8'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.21.0.3616-d87012962/windows/PlexMediaServer-1.21.0.3616-d87012962-x86.exe'

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
