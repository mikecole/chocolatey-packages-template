$checksum = '984bdfd663c799d20353181298a73b52d33cf67843c6252751f2e1076e29eb09'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.22.3.4523-d0ce30438/windows/PlexMediaServer-1.22.3.4523-d0ce30438-x86.exe'

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
