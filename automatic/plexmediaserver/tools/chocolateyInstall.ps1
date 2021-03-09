$checksum = '7d7aca29df226220ceaa33daea0116dd06bbe2e80604f549c004cacb5c967b98'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.22.0.4163-d8c4875dd/windows/PlexMediaServer-1.22.0.4163-d8c4875dd-x86.exe'

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
