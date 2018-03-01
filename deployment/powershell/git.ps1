$script_root = $PSScriptRoot

$software = "GIT"

$local_resources = 'C:\deployment'

$url = "https://github-production-release-asset-2e65be.s3.amazonaws.com/23216272/caadf4ec-1641-11e8-8f85-577fa933ab56?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20180301%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20180301T081125Z&X-Amz-Expires=300&X-Amz-Signature=cb1076e34f434dbdb49541aaa07c1ee0969b02ee1f1215d71cbd517681a58f19&X-Amz-SignedHeaders=host&actor_id=0&response-content-disposition=attachment%3B%20filename%3DGit-2.16.2-64-bit.exe&response-content-type=application%2Foctet-stream"
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
