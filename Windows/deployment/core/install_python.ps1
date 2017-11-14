$script_root = $PSScriptRoot
$config = $script_root + "\config\install_python.txt"

$local_resources = 'C:\deployment'

$install_directory = "C:\Python27\python.exe"
$url = "https://www.python.org/ftp/python/2.7.14/python-2.7.14.msi"
$output = "C:\deployment\python-2.7.14.msi"
$command = "/qb! /i $output"

$start_time = Get-Date
$current_time = $start_time
Write-Host '--------------------------------'
Write-Host $current_time.ToShortTimeString() - 'MAKING TEMP DIRECTORY'
Write-Host '--------------------------------'
if(!(Test-Path $local_resources)){
    New-Item -ItemType directory -Path $local_resources
}
$current_time = Get-Date
Write-Host '--------------------------------'
Write-Host $current_time.ToShortTimeString() - 'DONE MAKING DIRECTORY'
Write-Host '--------------------------------'

$current_time = Get-Date
Write-Host '--------------------------------'
Write-Host $current_time.ToShortTimeString() - 'DOWNLOADING PYTHON 2.7'
Write-Host '--------------------------------'
$wc = New-Object System.Net.WebClient
$wc.DownloadFile($url, $output)
$current_time = Get-Date
Write-Host '--------------------------------'
Write-Host $current_time.ToShortTimeString() - 'DOWNLOAD FINISHED'
Write-Host '--------------------------------'

$current_time = Get-Date
Write-Host '--------------------------------'
Write-Host $current_time.ToShortTimeString() - 'INSTALLING PYTHON 2.7'
Write-Host '--------------------------------'
Start-Process -FilePath msiexec -ArgumentList $command -Wait
$current_time = Get-Date
Write-Host '--------------------------------'
Write-Host $current_time.ToShortTimeString() - "SETTING UP ENVIRONMENT VARIABLES"
Write-Host '--------------------------------'
[Environment]::SetEnvironmentVariable("PYTHON_HOME", "c:\Python27", "User")
[Environment]::SetEnvironmentVariable("Path", "$env:Path;C:\Python27\;C:\Python27\Scripts\", "User")
$end_time = Get-Date
$current_time = $end_time
Write-Host '--------------------------------'
Write-Host $current_time.ToShortTimeString() - "PYTHON 2.7 INSTALLATION COMPLETED"
Write-Output "Time taken: $(($end_time).Subtract($start_time).Seconds) second(s)"
Write-Host '--------------------------------'
Read-Host -Prompt ""