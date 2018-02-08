$script_root = $PSScriptRoot

$local_resources = 'C:\deployment'

$source = "\\fileserver01\resources\it\software\solidangle\arnold\maya\windows\MtoA-2.1.0.2-2017.exe"
$destination = "C:\deployment\MtoA-2.1.0.2-2017.exe"

$command = "/passive"

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
Write-Host $current_time.ToShortTimeString() - 'COPYING ARNOLD FOR MAYA 2.1.0.2-2017'
Write-Host '--------------------------------'
if(!(Test-Path $destination)){
    copy-item -path $source -destination $destination
}
$current_time = Get-Date
Write-Host '--------------------------------'
Write-Host $current_time.ToShortTimeString() - 'COPY FINISHED'
Write-Host '--------------------------------'
$current_time = Get-Date
Write-Host '--------------------------------'
Write-Host $current_time.ToShortTimeString() - 'INSTALLING ARNOLD FOR MAYA 2.1.0.2-2017'
Write-Host '--------------------------------'
Start-Process -FilePath $destination /S -Wait
$current_time = Get-Date
