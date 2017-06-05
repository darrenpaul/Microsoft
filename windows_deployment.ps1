Set-ExecutionPolicy -Scope Process -ExecutionPolicy AllSigned

#PATHS
$local_resources = 'C:\deploy_temp'
$server_resources_01 = '\\fileserver01\resources\it\software\Windows_Software\workstation'
$path_to_software = "\\fileserver01\resources\it\software"

$firefox = 'Mozilla Thunderbird', "$local_resources\ThunderbirdSetup.exe", "$server_resources_01\ThunderbirdSetup.exe"
$thunderbird = 'Mozilla Firefox', "$local_resources\FirefoxSetup.exe", "$server_resources_01\FirefoxSetup.exe"
$vlc = 'VLC', "$local_resources\vlcSetup.exe", "$server_resources_01\vlcSetup.exe"
$shotgun = 'Shotgun Desktop', "$local_resources\ShotgunInstaller_Current.exe", "$server_resources_01\ShotgunInstaller_Current.exe"
$pycharm = 'PyCharm', "$local_resources\pycharm-community-2017.1.2.exe", "$server_resources_01\pycharm-community-2017.1.2.exe"
$slack = 'Slack', "$local_resources\SlackSetup.exe", "$server_resources_01\SlackSetup.exe"
$chrome = 'Google Chrome', "/qb! /i C:\deploy_temp\googlechromestandaloneenterprise64.msi", "$server_resources_01\googlechromestandaloneenterprise64.msi"
$github = 'Github', "$local_resources\GitHubDesktopSetup.exe", "$server_resources_01\GitHubDesktopSetup.exe"

$python = 'Python 2.7', "/qb! /i C:\deploy_temp\python-2.7.8.amd64.msi", "$server_resources_01\python-2.7.8.amd64.msi"

#Maya
#2015
$maya_path_2015 = "Autodesk\maya\Maya_2015\Maya_2015_Windows"
$maya2015 = "Maya 2015", "$local_resources\Autodesk_Maya_2015_dlm.sfx.exe", "$path_to_software\$maya_path_2015\Autodesk_Maya_2015_dlm.sfx.exe"
$maya2015Update1 = "Maya 2015 Update 1", "/qb! /update C:\deploy_temp\Autodesk_Maya_2015_SP1_English_Japanese_SimplifiedChinese_Win.msp", "$path_to_software\$maya_path_2015\Autodesk_Maya_2015_SP1_English_Japanese_SimplifiedChinese_Win.msp"
$maya2015Update2 = "Maya 2015 Update 2", "/qb! /update C:\deploy_temp\Autodesk_Maya_2015_SP2_English_Japanese_SimplifiedChinese_Win.msp", "$path_to_software\$maya_path_2015\Autodesk_Maya_2015_SP2_English_Japanese_SimplifiedChinese_Win.msp"
$maya2015Update3 = "Maya 2015 Update 3", "/qb! /update C:\deploy_temp\Autodesk_Maya_2015_SP3_English_Japanese_SimplifiedChinese_Win.msp", "$path_to_software\$maya_path_2015\Autodesk_Maya_2015_SP3_English_Japanese_SimplifiedChinese_Win.msp"
$maya2015Update4 = "Maya 2015 Update 4", "/qb! /update C:\deploy_temp\Autodesk_Maya_2015_SP4_English_Japanese_SimplifiedChinese_Win.msp", "$path_to_software\$maya_path_2015\Autodesk_Maya_2015_SP4_English_Japanese_SimplifiedChinese_Win.msp"
$maya2015Update5 = "Maya 2015 Update 5", "/qb! /update C:\deploy_temp\Autodesk_Maya_2015_SP5_English_Japanese_SimplifiedChinese_Win.msp", "$path_to_software\$maya_path_2015\Autodesk_Maya_2015_SP5_English_Japanese_SimplifiedChinese_Win.msp"
$maya2015Update6 = "Maya 2015 Update 6", "/qb! /update C:\deploy_temp\Autodesk_Maya_2015_SP6_EN_JP_ZH_Win.msp", "$path_to_software\$maya_path_2015\Autodesk_Maya_2015_SP6_EN_JP_ZH_Win.msp"
#2017
$maya_path_2017 = "Autodesk\maya\Maya_2017\Windows"
$maya2017 = "Maya 2017", "$local_resources\Autodesk_Maya_2017_EN_JP_ZH_Win_64bit_dlm.sfx.exe", "$path_to_software\$maya_path_2017\Autodesk_Maya_2017_EN_JP_ZH_Win_64bit_dlm.sfx.exe"
$maya2017Update1 = "Maya 2017 Update 1", "/qb! /update C:\Autodesk_Maya_2017_Update1_x64.exe", "$path_to_software\$maya_path_2017\Autodesk_Maya_2017_Update1_x64.exe"
$maya2017Update2 = "Maya 2017 Update 2", "/qb! /update C:\Autodesk_Maya_2017_Update2_x64.exe", "$path_to_software\$maya_path_2017\Autodesk_Maya_2017_Update2_x64.exe"
$maya2017Update3 = "Maya 2017 Update 3", "/qb! /update C:\Autodesk_Maya_2017_Update3_x64.exe", "$path_to_software\$maya_path_2017\Autodesk_Maya_2017_Update3_x64.exe"

#Houdini
$houndini_path = "\\fileserver01\resources\it\software\sidefx\Windows\Houdini15"
$houdini15_5_523 = "Houdini 15.5.523", "$local_resources\houdini-15.5.523-win64-vc14.exe", "$houndini_path\houdini-15.5.523-win64-vc14.exe"
$houdini15_5_717 = "Houdini 15.5.717", "$local_resources\houdini-15.5.717-win64-vc14.exe", "$houndini_path\houdini-15.5.717-win64-vc14.exe"
$houdini16_0_600 = "Houdini 16.0.600", "$local_resources\houdini-16.0.600-win64-vc14.exe", "$houndini_path\houdini-16.0.600-win64-vc14.exe"
#Quicktime
$quicktime = "quicktime_installer.bat", "$local_resources\QuickTime\quicktime_installer.bat", "$server_resources_01\QuickTime*"

#redistributables
$vcredist_2013_32 = "vcredist c++ 2013 32bit", "$local_resources\vcredist_x86.exe", "$server_resources_01\redistributables\vc++ 2013\vcredist_x86.exe"
$vcredist_2013_64 = "vcredist c++ 2013 64bit", "$local_resources\vcredist_x64.exe", "$server_resources_01\redistributables\vc++ 2013\vcredist_x64.exe"

$vcredist_2015_32 = "vcredist c++ 2015 32bit", "$local_resources\vc_redist.x86.exe", "$server_resources_01\redistributables\vc++ 2015\vc_redist.x86.exe"
$vcredist_2015_64 = "vcredist c++ 2015 64bit", "$local_resources\vc_redist.x64.exe", "$server_resources_01\redistributables\vc++ 2015\vc_redist.x64.exe"

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
	$maya2017Update1,
    $maya2017Update2,
    $maya2017Update3,
    $houdini15_5_523,
    $houdini15_5_717,
	$houdini16_0_600,
    $quicktime,
    $vcredist_2013_32,
    $vcredist_2015_32,
    $vcredist_2013_64,
    $vcredist_2015_64
)

$exe_files_simple = @(
    $firefox,
    $thunderbird,
    $vlc,
    $shotgun,
    $vcredist_2013_32,
    $vcredist_2015_32,
    $vcredist_2013_64,
    $vcredist_2015_64
)

$maya_service_packs = @(
    $maya2015Update1,
    $maya2015Update2,
    $maya2015Update3,
    $maya2015Update4,
    $maya2015Update5,
    $maya2015Update6
)

$maya_2017_updates = @(
	$maya2017Update1,
    $maya2017Update2,
    $maya2017Update3
)

if(!(Test-Path $local_resources)){
    New-Item -ItemType directory -Path $local_resources
}

foreach($item in $files_to_copy){
    $cur_time = Get-Date
    Write-Host $cur_time.ToShortTimeString() - 'Copying'$item[0]
    Copy-Item $item[2] $local_resources -Recurse
}

#slack
$cur_time = Get-Date
Write-Host $cur_time.ToShortTimeString() - 'Installing'$slack[0]
Write-Host "Close slack after installation"
Start-Process -FilePath $slack[1] -Wait

#github
$cur_time = Get-Date
Write-Host $cur_time.ToShortTimeString() - 'Installing'$github[0]
Write-Host "Close github after installation"
Start-Process -FilePath $github[1] -Wait

#pycharm
$cur_time = Get-Date
Write-Host $cur_time.ToShortTimeString() - 'Installing'$pycharm[0]
Start-Process -FilePath $pycharm[1] -wait

#maya
#2015
$cur_time = Get-Date
Write-Host $cur_time.ToShortTimeString() - 'Installing'$maya2015[0]
Write-Host "Close Maya and Autodesk application manager  after installation"
Start-Process -FilePath $maya2015[1] -wait
#2017
$cur_time = Get-Date
Write-Host $cur_time.ToShortTimeString() - 'Installing'$maya2015[0]
Write-Host "Close Maya and Autodesk application manager  after installation"
Start-Process -FilePath $maya2017[1] -wait

foreach($item in $exe_files_simple){
    $cur_time = Get-Date
    Write-Host $cur_time.ToShortTimeString() - 'Installing'$item[0]
    Start-Process -FilePath $item[1] -ArgumentList /S -Wait
}

#chrome
$cur_time = Get-Date
Write-Host $cur_time.ToShortTimeString() - 'Installing'$chrome[0]
Start-Process -FilePath msiexec -ArgumentList $chrome[1] -Wait

#python
$cur_time = Get-Date
Write-Host $cur_time.ToShortTimeString() - 'Installing'$python[0]
Start-Process -FilePath msiexec -ArgumentList $python[1] -Wait
Write-Host "Setting up python environment"
[Environment]::SetEnvironmentVariable("PYTHON_HOME", "c:\Python27", "User")
[Environment]::SetEnvironmentVariable("Path", "$env:Path;C:\Python27\;C:\Python27\Scripts\", "User")

#Quicktime
$cur_time = Get-Date
Write-Host $cur_time.ToShortTimeString() - 'Installing'$quicktime[0]
Start-Process $quicktime[1] -Wait

#Houdini
#15_5_523
$cur_time = Get-Date
Write-Host $cur_time.ToShortTimeString() - 'Installing'$houdini15_5_523[0]
Start-Process -FilePath $houdini15_5_523[1] -ArgumentList "/S /AcceptEula=yes" -Wait
#15_5_717
$cur_time = Get-Date
Write-Host $cur_time.ToShortTimeString() - 'Installing'$houdini15_5_717[0]
Start-Process -FilePath $houdini15_5_717[1] -ArgumentList "/S /AcceptEula=yes" -Wait
#16_0_600
$cur_time = Get-Date
Write-Host $cur_time.ToShortTimeString() - 'Installing'$houdini16_0_600[0]
Start-Process -FilePath $houdini16_0_600[1] -ArgumentList "/S /AcceptEula=yes" -Wait

#Maya 2015 updates
foreach($item in $maya_service_packs){
    $cur_time = Get-Date
    Write-Host $cur_time.ToShortTimeString() - 'Installing'$item[0]
    Start-Process -FilePath msiexec -ArgumentList $item[1] -Wait
}
#Maya 2017 updates
foreach($item in $maya_2017_updates){
    $cur_time = Get-Date
    Write-Host $cur_time.ToShortTimeString() - 'Installing'$item[0]
    Start-Process -FilePath $item[1] -ArgumentList /S -Wait
}

Remove-Item $local_resources -recurse
Write-Host $cur_time.ToShortTimeString() - 'Deployment Completed'