$checksum = 'acbb0074a85379855a26ebfa510afbaadbbf1b73f294d7786a2eb168e4f71878'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.19.1.2701-6327e27bf/windows/PlexMediaServer-1.19.1.2701-6327e27bf-x86.exe'

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
