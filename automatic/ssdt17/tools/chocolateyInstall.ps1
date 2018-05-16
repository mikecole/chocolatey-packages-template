$checksum = 'd94817183b2590f732b4674fcbe56bb0288353a1e246d826a247cf0c6a3c59de'
$url = 'https://go.microsoft.com/fwlink/?linkid=871368'

(Get-WmiObject -Class Win32_OperatingSystem).Version -match "(?<Major>\d+).(?<Minor>\d+).(?<Build>\d+)" | Out-Null
 
if ($Matches.Major -eq 6 -and $Matches.Minor -eq 3)
{
    # Windows 8.1 / Server 2012 R2 requires a prerequisite hotfix 
    if (-not (Get-HotFix -Id KB2919355 -ErrorAction SilentlyContinue))
    {
        Write-Error "A prerequisite for installing SQL Server Data Tools for Visual Studio 2017 on Windows 8.1 and Windows Server 2012 R2 is to have hotfix KB2919355 installed. See https://msdn.microsoft.com/library/ms143506.aspx for more details"
    }
}

$pp = Get-PackageParameters

$packageArgs = @{
  packageName   = 'ssdt17'
  unzipLocation = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType      = 'exe'
  url           = $url
  silentArgs    = '/passive /norestart'
  validExitCodes= @(0)
  softwareName  = 'ssdt17*'
  checksum      = $checksum
  checksumType  = 'sha256'
}

if ($pp['analysis'] -and $pp['integration'] -and $pp['reporting'] -and ($pp['analysis'] -eq $pp['integration'] -eq $pp['reporting']))
{
    $packageArgs.silentArgs += " INSTALLALL"
    if ($pp['analysis'] -ne 'true')
    {
        # we know that all the parameters have the same VS2017 instances so we just take the value of one of the parameters.
        $packageArgs.silentArgs += ":$($pp['analysis'])"
    }
}
else 
{
    if ($pp['analysis'])
    {
        $packageArgs.silentArgs += " INSTALLAS"
        if ($pp['analysis'] -ne 'true')
        {
            $packageArgs.silentArgs += ":$($pp['analysis'])"
        }
    }

    if ($pp['integration'])
    {
        $packageArgs.silentArgs += " INSTALLIS"
        if ($pp['integration'] -ne 'true')
        {
            $packageArgs.silentArgs += ":$($pp['integration'])"
        }
    }

    if ($pp['reporting'])
    {
        $packageArgs.silentArgs += " INSTALLRS"
        if ($pp['reporting'] -ne 'true')
        {
            $packageArgs.silentArgs += ":$($pp['reporting'])"
        }
    }

    # else default installation of tools
}

Install-ChocolateyPackage @packageArgs
