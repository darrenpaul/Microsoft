$script_root = $PSScriptRoot

$local_resources = 'C:\deployment'

$software = "NUKE 11.1v2"

$source = "\\fileserver01\resources\it\software\foundry\nuke\windows\Nuke11.1v2-win-x86-release-64.zip"
$unzip = "C:\deployment\nuke"
$destination = "C:\deployment\nuke\Nuke11.1v2-win-x86-release-64.exe"

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
Write-Host $current_time.ToShortTimeString() - 'UNZIPPING', $software
Write-Host '--------------------------------'
if(!(Test-Path $destination)){
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    [System.IO.Compression.ZipFile]::ExtractToDirectory($source, $unzip)
}
$current_time = Get-Date
Write-Host '--------------------------------'
Write-Host $current_time.ToShortTimeString() - 'COPY FINISHED'
Write-Host '--------------------------------'
$current_time = Get-Date
Write-Host '--------------------------------'
Write-Host $current_time.ToShortTimeString() - 'INSTALLING', $software
Write-Host '--------------------------------'
Start-Process -FilePath $destination /Silent -Wait
$current_time = Get-Date
