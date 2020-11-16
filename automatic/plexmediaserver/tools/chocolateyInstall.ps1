$checksum = '20c9d83aa0e6cd2f9b9ea58f06305fc8cf6ec668b64147480e51f1e6f6829025'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.20.5.3600-47c0d9038/windows/PlexMediaServer-1.20.5.3600-47c0d9038-x86.exe'

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
