#PATHS
$local_resources = 'C:\deploy_temp'
$server_resources_01 = '\\fileserver01\resources\it\software\Windows_Software\workstation'
$path_to_software = "\\fileserver01\resources\it\software"


$firefox = 'Mozilla Firefox', "$local_resources\FirefoxSetup.exe", "$server_resources_01\FirefoxSetup.exe"
$vlc = 'VLC', "$local_resources\vlcSetup.exe", "$server_resources_01\vlcSetup.exe"
$shotgun = 'Shotgun Desktop', "$local_resources\ShotgunInstaller_Current.exe", "$server_resources_01\ShotgunInstaller_Current.exe"
$slack = 'SlackSetup.exe', "$local_resources\SlackSetup.exe", "$server_resources_01\SlackSetup.exe"

$chrome = 'Google Chrome', "$local_resources\ChromeSetup.msi", "$server_resources_01\ChromeSetup.msi"

#Maya
$maya_path = "Autodesk\maya\Maya_2015\Maya_2015_Windows"
$maya2015 = "Maya 2015", "$local_resources\Autodesk_Maya_2015_dlm.sfx.exe", "$path_to_software\$maya_path\Autodesk_Maya_2015_dlm.sfx.exe"
$maya2015Update1 = "Maya 2015 Update 1", "$local_resources\Autodesk_Maya_2015_SP1_English_Japanese_SimplifiedChinese_Win.msp", "$path_to_software\$maya_path\Autodesk_Maya_2015_SP1_English_Japanese_SimplifiedChinese_Win.msp"
$maya2015Update2 = "Maya 2015 Update 2", "$local_resources\Autodesk_Maya_2015_SP2_English_Japanese_SimplifiedChinese_Win.msp", "$path_to_software\$maya_path\Autodesk_Maya_2015_SP2_English_Japanese_SimplifiedChinese_Win.msp"
$maya2015Update3 = "Maya 2015 Update 3", "$local_resources\Autodesk_Maya_2015_SP3_English_Japanese_SimplifiedChinese_Win.msp", "$path_to_software\$maya_path\Autodesk_Maya_2015_SP3_English_Japanese_SimplifiedChinese_Win.msp"
$maya2015Update4 = "Maya 2015 Update 4", "$local_resources\Autodesk_Maya_2015_SP4_English_Japanese_SimplifiedChinese_Win.msp", "$path_to_software\$maya_path\Autodesk_Maya_2015_SP4_English_Japanese_SimplifiedChinese_Win.msp"
$maya2015Update5 = "Maya 2015 Update 5", "$local_resources\Autodesk_Maya_2015_SP5_English_Japanese_SimplifiedChinese_Win.msp", "$path_to_software\$maya_path\Autodesk_Maya_2015_SP5_English_Japanese_SimplifiedChinese_Win.msp"
$maya2015Update6 = "Maya 2015 Update 6", "$local_resources\Autodesk_Maya_2015_SP6_EN_JP_ZH_Win.msp", "$path_to_software\$maya_path\Autodesk_Maya_2015_SP6_EN_JP_ZH_Win.msp"

#Houdini
$houndini_path = "\\fileserver01\resources\it\software\sidefx\Windows\Houdini15"
$houdini15_5_523 = "Houdini 15.5.523", "$local_resources\houdini-15.5.523-win64-vc14.exe", "$houndini_path\houdini-15.5.523-win64-vc14.exe"
$houdini15_5_717 = "Houdini 15.5.717", "$local_resources\houdini-15.5.717-win64-vc14.exe", "$houndini_path\houdini-15.5.717-win64-vc14.exe"

#Quicktime
$quicktime = "quicktime_installer.bat", "$local_resources\QuickTime", "$server_resources_01\QuickTime"

$files_to_copy = @(
    $firefox, 
    $vlc, 
    $shotgun, 
    $slack, 
    $chrome,
    $maya2015, 
    $maya2015Update1, 
    $maya2015Update2, 
    $maya2015Update3, 
    $maya2015Update4, 
    $maya2015Update5, 
    $maya2015Update6, 
    $houdini15_5_523, 
    $houdini15_5_717
)

$exe_files_simple = @(
    $firefox, 
    $vlc, 
    $shotgun, 
    $slack
)

$exe_setup = @($firefox, $vlc)

if(!(Test-Path $local_resources)){
    New-Item -ItemType directory -Path $local_resources
}

foreach($item in $files_to_copy){
    $cur_time = Get-Date
    Write-Host $cur_time.ToShortTimeString() - 'Preparing to copy'$item[0]
    #Copy-Item $item[2] $local_resources
}

foreach($item in $exe_files){
    $cur_time = Get-Date
    Write-Host $cur_time.ToShortTimeString() - 'Installing'$item[0]
    #Start-Process -FilePath $item[1] -ArgumentList /S -Wait
}

$cur_time = Get-Date
Write-Host $cur_time.ToShortTimeString() - 'Installing'$houdini15_5_523[0]
Start-Process -FilePath "$local_resources\houdini-15.5.523-win64-vc14.exe" -ArgumentList "/S /AcceptEula=yes" -Wait

Write-Host $cur_time.ToShortTimeString() - 'Installing'$houdini15_5_717[0]
#Start-Process -FilePath $houdini15_5_717[1] -ArgumentList /S/AcceptEula=yes/LicenseServer=licserver01 -Wait


Write-Host $cur_time.ToShortTimeString() - 'Deployment Completed'