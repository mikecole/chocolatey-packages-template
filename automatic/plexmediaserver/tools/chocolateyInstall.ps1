$checksum = '2c5bb524ffbafc7fa39e830fad2a9754ad497ab4d6e92d1df8a8dc3225735838'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.22.1.4275-48e10484b/windows/PlexMediaServer-1.22.1.4275-48e10484b-x86.exe'

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
