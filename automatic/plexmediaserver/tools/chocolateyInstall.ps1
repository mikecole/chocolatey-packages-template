$checksum = 'a53ae86b3c71a4976afc8f20d6b48b5dfc6d5bff1e4d2e39b364d8d178af29bd'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.21.0.3711-b509cc236/windows/PlexMediaServer-1.21.0.3711-b509cc236-x86.exe'

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
