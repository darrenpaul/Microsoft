
#PATHS
$local_resources = 'C:\deploy_temp'
$server_resources_01 = '\\fileserver01\resources\it\software\Windows_Software\workstation'
$path_to_software = "\\fileserver01\resources\it\software"

$firefox = 'Mozilla Firefox', "$local_resources\ThunderbirdSetup.exe", "$server_resources_01\ThunderbirdSetup.exe"
$thunderbird = 'Mozilla Thunderbird', "$local_resources\FirefoxSetup.exe", "$server_resources_01\FirefoxSetup.exe"
$vlc = 'VLC', "$local_resources\vlcSetup.exe", "$server_resources_01\vlcSetup.exe"
$shotgun = 'Shotgun Desktop', "$local_resources\ShotgunInstaller_Current.exe", "$server_resources_01\ShotgunInstaller_Current.exe"
$pycharm = 'PyCharm', "$local_resources\pycharm-community-2017.1.2.exe", "$server_resources_01\pycharm-community-2017.1.2.exe"
$slack = 'Slack', "$local_resources\SlackSetup.exe", "$server_resources_01\SlackSetup.exe"
$chrome = 'Google Chrome', "/qb! /i C:\deploy_temp\googlechromestandaloneenterprise64.msi", "$server_resources_01\googlechromestandaloneenterprise64.msi"
$github = 'Github', "$local_resources\GitHubDesktopSetup.exe", "$server_resources_01\GitHubDesktopSetup.exe"

$python = 'Python 2.7', "/qb! /i C:\deploy_temp\python-2.7.8.amd64.msi", "$server_resources_01\python-2.7.8.amd64.msi"

#Maya
$maya_path = "Autodesk\maya\Maya_2015\Maya_2015_Windows"
$maya2015 = "Maya 2015", "$local_resources\Autodesk_Maya_2015_dlm.sfx.exe", "$path_to_software\$maya_path\Autodesk_Maya_2015_dlm.sfx.exe"
$maya2015Update1 = "Maya 2015 Update 1", "/qb! /update C:\deploy_temp\Autodesk_Maya_2015_SP1_English_Japanese_SimplifiedChinese_Win.msp", "$path_to_software\$maya_path\Autodesk_Maya_2015_SP1_English_Japanese_SimplifiedChinese_Win.msp"
$maya2015Update2 = "Maya 2015 Update 2", "/qb! /update C:\deploy_temp\Autodesk_Maya_2015_SP2_English_Japanese_SimplifiedChinese_Win.msp", "$path_to_software\$maya_path\Autodesk_Maya_2015_SP2_English_Japanese_SimplifiedChinese_Win.msp"
$maya2015Update3 = "Maya 2015 Update 3", "/qb! /update C:\deploy_temp\Autodesk_Maya_2015_SP3_English_Japanese_SimplifiedChinese_Win.msp", "$path_to_software\$maya_path\Autodesk_Maya_2015_SP3_English_Japanese_SimplifiedChinese_Win.msp"
$maya2015Update4 = "Maya 2015 Update 4", "/qb! /update C:\deploy_temp\Autodesk_Maya_2015_SP4_English_Japanese_SimplifiedChinese_Win.msp", "$path_to_software\$maya_path\Autodesk_Maya_2015_SP4_English_Japanese_SimplifiedChinese_Win.msp"
$maya2015Update5 = "Maya 2015 Update 5", "/qb! /update C:\deploy_temp\Autodesk_Maya_2015_SP5_English_Japanese_SimplifiedChinese_Win.msp", "$path_to_software\$maya_path\Autodesk_Maya_2015_SP5_English_Japanese_SimplifiedChinese_Win.msp"
$maya2015Update6 = "Maya 2015 Update 6", "/qb! /update C:\deploy_temp\Autodesk_Maya_2015_SP6_EN_JP_ZH_Win.msp", "$path_to_software\$maya_path\Autodesk_Maya_2015_SP6_EN_JP_ZH_Win.msp"

#Houdini
$houndini_path = "\\fileserver01\resources\it\software\sidefx\Windows\Houdini15"
$houdini15_5_523 = "Houdini 15.5.523", "$local_resources\houdini-15.5.523-win64-vc14.exe", "$houndini_path\houdini-15.5.523-win64-vc14.exe"
$houdini15_5_717 = "Houdini 15.5.717", "$local_resources\houdini-15.5.717-win64-vc14.exe", "$houndini_path\houdini-15.5.717-win64-vc14.exe"

#Quicktime
$quicktime = "quicktime_installer.bat", "$local_resources\QuickTime\quicktime_installer.bat", "$server_resources_01\QuickTime*"

$files_to_copy = @(
    $firefox,
    $thunderbird,
    $vlc,
    $shotgun,
    $pycharm,
    $python,
    $slack,
    $github,
    $chrome,
    $maya2015,
    $maya2015Update1,
    $maya2015Update2,
    $maya2015Update3,
    $maya2015Update4,
    $maya2015Update5,
    $maya2015Update6,
    $houdini15_5_523,
    $houdini15_5_717,
    $quicktime
)

$exe_files_simple = @(
    $firefox,
    $thunderbird,
    $vlc,
    $pycharm,
    $shotgun
)

$maya_service_packs = @(
    $maya2015Update1,
    $maya2015Update2,
    $maya2015Update3,
    $maya2015Update4,
    $maya2015Update5,
    $maya2015Update6
)

if(!(Test-Path $local_resources)){
    New-Item -ItemType directory -Path $local_resources
}

foreach($item in $files_to_copy){
    $cur_time = Get-Date
    Write-Host $cur_time.ToShortTimeString() - 'Copying'$item[0]
    #Copy-Item $item[2] $local_resources -Recurse
}

#pycharm
$cur_time = Get-Date
Write-Host $cur_time.ToShortTimeString() - 'Installing'$pycharm[0]
Start-Process -FilePath $pycharm[1] -ArgumentList /S -wait

#maya
$cur_time = Get-Date
Write-Host $cur_time.ToShortTimeString() - 'Installing'$maya2015[0]
#Start-Process -FilePath $maya2015[1] -ArgumentList /S -wait

foreach($item in $exe_files_simple){
    $cur_time = Get-Date
    Write-Host $cur_time.ToShortTimeString() - 'Installing'$item[0]
    #Start-Process -FilePath $item[1] -ArgumentList /S -Wait
}

#chrome
$cur_time = Get-Date
Write-Host $cur_time.ToShortTimeString() - 'Installing'$chrome[0]
#Start-Process -FilePath msiexec -ArgumentList $chrome[1] -Wait

#python
$cur_time = Get-Date
Write-Host $cur_time.ToShortTimeString() - 'Installing'$python[0]
#Start-Process -FilePath msiexec -ArgumentList $python[1] -Wait
Write-Host "Setting up python environment"
#[Environment]::SetEnvironmentVariable("PYTHON_HOME", "c:\Python27", "User")
#[Environment]::SetEnvironmentVariable("Path", "$env:Path;C:\Python27\;C:\Python27\Scripts\", "User")

#pycharm
$cur_time = Get-Date
Write-Host $cur_time.ToShortTimeString() - 'Installing'$pycharm[0]
#Start-Process -FilePath $pycharm[1] /I -Wait

#Quicktime
$cur_time = Get-Date
Write-Host $cur_time.ToShortTimeString() - 'Installing'$quicktime[0]
#Start-Process $quicktime[1] -Wait

$cur_time = Get-Date
Write-Host $cur_time.ToShortTimeString() - 'Installing'$houdini15_5_523[0]
#Start-Process -FilePath $houdini15_5_523[1] -ArgumentList "/S /AcceptEula=yes" -Wait
Write-Host $cur_time.ToShortTimeString() - 'Installing'$houdini15_5_717[0]
#Start-Process -FilePath $houdini15_5_717[1] -ArgumentList "/S /AcceptEula=yes" -Wait

#slack
$cur_time = Get-Date
Write-Host $cur_time.ToShortTimeString() - 'Installing'$slack[0]
#Start-Process -FilePath $slack[1] -ArgumentList /S

#github
$cur_time = Get-Date
Write-Host $cur_time.ToShortTimeString() - 'Installing'$github[0]
#Start-Process -FilePath $github[1] -ArgumentList /S

foreach($item in $maya_service_packs){
    $cur_time = Get-Date
    Write-Host $cur_time.ToShortTimeString() - 'Installing'$item[0]
    Start-Process -FilePath msiexec -ArgumentList $item[1] -Wait
}

Remove-Item $local_resources -recurse
Write-Host $cur_time.ToShortTimeString() - 'Deployment Completed'