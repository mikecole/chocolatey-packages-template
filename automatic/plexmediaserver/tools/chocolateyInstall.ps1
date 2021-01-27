$checksum = '0fbcf3b546e005e43ea177af903ed596fdc6cecc5f202589328349219489f273'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.21.2.3943-a91458577/windows/PlexMediaServer-1.21.2.3943-a91458577-x86.exe'

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
