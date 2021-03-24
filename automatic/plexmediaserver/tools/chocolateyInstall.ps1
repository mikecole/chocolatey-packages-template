$checksum = '49421313ece1ff47ece1f005a9b9be0d6b101ec8b203fceffa5af4daca5c725c'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.22.1.4228-724c56e62/windows/PlexMediaServer-1.22.1.4228-724c56e62-x86.exe'

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
