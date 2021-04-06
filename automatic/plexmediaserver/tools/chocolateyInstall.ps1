$checksum = '1baa3b0aef58837b94df24cf58bb71c7fd13b8e2a1aa649092788f9795d2f308'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.22.2.4282-a97b03fad/windows/PlexMediaServer-1.22.2.4282-a97b03fad-x86.exe'

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
