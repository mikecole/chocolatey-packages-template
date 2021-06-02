$checksum = '33707202f0525a80721fe157ae8423fed2da9bdacf9d74458d49a6f8af3c8e9a'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.23.2.4625-a83d2d0f9/windows/PlexMediaServer-1.23.2.4625-a83d2d0f9-x86.exe'

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
