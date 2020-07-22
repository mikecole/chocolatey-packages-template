$checksum = 'a8bb82e26f816f9fde79ee6392547f4d99e1c46e031b16a464e6942d5f390660'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.19.5.3112-b23ab3896/windows/PlexMediaServer-1.19.5.3112-b23ab3896-x86.exe'

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
