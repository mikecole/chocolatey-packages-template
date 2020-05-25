$checksum = '423ad972eacd5175084fe1825d3b7e5c87a7bd4798438dfc7ed26a4d63784618'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.19.3.2852-219a9974e/windows/PlexMediaServer-1.19.3.2852-219a9974e-x86.exe'

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
