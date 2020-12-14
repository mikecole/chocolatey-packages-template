$checksum = '7b4c48b72d8029400ade6674ec1790e47ca399050605a6ec9698d62162649a0b'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.21.1.3766-7e23ef53c/windows/PlexMediaServer-1.21.1.3766-7e23ef53c-x86.exe'

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
