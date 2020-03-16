$checksum = 'ebddf9ccdb104817d23c0e0eca534890c142f79c406d4169ee103e03039d819f'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.18.8.2527-740d4c206/windows/PlexMediaServer-1.18.8.2527-740d4c206-x86.exe'

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
