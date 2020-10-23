$checksum = '0c38252006709d7869cdfbc3756210ca16fa953ec70950869d01ade3333a02b8'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.20.3.3483-211702a9f/windows/PlexMediaServer-1.20.3.3483-211702a9f-x86.exe'

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
