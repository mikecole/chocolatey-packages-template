$ErrorActionPreference = 'Stop'
$checksum = 'fcc794f98b613c988cc06d980b5e60cbe2ef8e348583883ee702d1962404e061'

$packageArgs = @{
  packageName    = 'microsoftazurestorageexplorer'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'exe'
  url            = 'https://download.microsoft.com/download/A/E/3/AE32C485-B62B-4437-92F7-8B6B2C48CB40/StorageExplorer.exe'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /ALLUSERS'
  validExitCodes = @(0)
  softwareName   = 'microsoftazurestorageexplorer*'
  checksum       = $checksum
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
