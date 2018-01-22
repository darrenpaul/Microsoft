$script_root = $PSScriptRoot

$local_resources = 'C:\deployment'

$url = "https://bootstrap.pypa.io/get-pip.py"
$output = "C:\deployment\get-pip.py"

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
Write-Host $current_time.ToShortTimeString() - 'DOWNLOADING PIP'
Write-Host '--------------------------------'
Invoke-WebRequest -Uri $url -OutFile $output
$current_time = Get-Date
Write-Host '--------------------------------'
Write-Host $current_time.ToShortTimeString() - 'DOWNLOAD FINISHED'
Write-Host '--------------------------------'
$current_time = Get-Date
Write-Host '--------------------------------'
Write-Host $current_time.ToShortTimeString() - 'INSTALLING PIP'
Write-Host '--------------------------------'
Start-Process -FilePath $output
$current_time = Get-Date
Write-Host $current_time.ToShortTimeString() - "PIP INSTALLATION COMPLETED"
Write-Output "Time taken: $(($end_time).Subtract($start_time).Seconds) second(s)"
Write-Host '--------------------------------'
Read-Host -Prompt "Press Enter to exit"
-noexit