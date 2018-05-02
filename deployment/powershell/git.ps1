$script_root = $PSScriptRoot

$software = "GIT"

$local_resources = 'C:\deployment'

$url = "https://github-production-release-asset-2e65be.s3.amazonaws.com/23216272/54765672-374b-11e8-95c2-b0759fe7c908?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20180502%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20180502T135856Z&X-Amz-Expires=300&X-Amz-Signature=5030f64091e7e11979fa52fc64172de1a18c216279acb7c1152a055113f0fa85&X-Amz-SignedHeaders=host&actor_id=0&response-content-disposition=attachment%3B%20filename%3DGit-2.17.0-64-bit.exe&response-content-type=application%2Foctet-stream"
$output = "C:\deployment\git.exe"

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
Write-Host $current_time.ToShortTimeString() - 'DOWNLOADING', $software
Write-Host '--------------------------------'
if(!(Test-Path $output)){
    $wc = New-Object System.Net.WebClient
    $wc.DownloadFile($url, $output)
    $current_time = Get-Date
}
Write-Host '--------------------------------'
Write-Host $current_time.ToShortTimeString() - 'DOWNLOAD FINISHED'
Write-Host '--------------------------------'
$current_time = Get-Date
Write-Host '--------------------------------'
Write-Host $current_time.ToShortTimeString() - 'INSTALLING', $software
Write-Host '--------------------------------'
Start-Process -FilePath $output /Silent -Wait
$current_time = Get-Date
