$script_root = $PSScriptRoot

$local_resources = 'C:\deployment'

$source = "\\fileserver01\resources\it\software\Autodesk\2017\windows\updates\autodesk_maya_2017_update5_win.exe"
$destination = "C:\deployment\autodesk_maya_2017_update5_win.exe"

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
Write-Host $current_time.ToShortTimeString() - 'COPYING MAYA UPDATE 5'
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
Write-Host $current_time.ToShortTimeString() - 'INSTALLING MAYA UPDATE 5'
Write-Host '--------------------------------'
Start-Process -FilePath $destination /passive
$current_time = Get-Date
