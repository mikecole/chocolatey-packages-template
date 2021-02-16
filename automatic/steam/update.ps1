$ErrorActionPreference = 'Stop'
import-module au

$url = 'http://cdn.akamai.steamstatic.com/client/installer/SteamSetup.exe'

function global:au_SearchReplace {
    @{
        'tools\ChocolateyInstall.ps1' = @{
            "(^[$]checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
        }
     }
}

function global:au_GetLatest {
    $temp_file = $env:TEMP + '\SteamSetup.exe'

    Invoke-WebRequest $url -OutFile $temp_file

    # Versioning in choco doesn't match installer. Rigging this to make updater work.
    $version = '3.0.1.' + (Get-Command $temp_file).Version.ToString().Replace(".","")

    $Latest = @{ URL = $url; Version = $version }
    return $Latest
}

update -NoCheckUrl -ChecksumFor 32
