$checksum = 'aa63f2faec30c5174d32a5d9feed19854f1588d8daab44b77413334e2b78c0cb'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.21.1.3876-3c3adfcb4/windows/PlexMediaServer-1.21.1.3876-3c3adfcb4-x86.exe'

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
