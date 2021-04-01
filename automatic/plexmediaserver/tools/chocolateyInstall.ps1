$checksum = '7cd6be32e89c56abaf67c6d78ebe425e959a9f9b9c127498c2127ba1fd38436e'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.22.1.4271-b86a5e175/windows/PlexMediaServer-1.22.1.4271-b86a5e175-x86.exe'

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
