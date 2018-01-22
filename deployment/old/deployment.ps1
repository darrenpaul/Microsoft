Set-ExecutionPolicy -Scope Process -ExecutionPolicy AllSigned

#PATHS
$local_resources = 'C:\deploy_temp'
$server_resources_01 = '\\fileserver01\resources\it\software\Windows_Software\workstation'
$path_to_software = "\\fileserver01\resources\it\software"

$windows_setup = 'Windows Setup', "$local_resources\pip_installs.txt", "$server_resources_01\pip_installs.txt", 0
$pip_installs = 'PIP Installs', "$local_resources\pip_installs.txt", "$server_resources_01\pip_installs.txt", 0
$pip = 'Python PIP', "$local_resources\get-pip.py", "$server_resources_01\get-pip.py", 0
$get_last_pc = 'Windows Setup', "$local_resources\get_last_win_pc.py", "$server_resources_01\get_last_win_pc.py", 0
$remote_assist = 'Remote Desktop Assist', "C:\deploy_temp\WindowsTH-RSAT_WS2016-x64.msu /quiet", "$server_resources_01\WindowsTH-RSAT_WS2016-x64.msu", 0
$nvidia = 'Nvidia', "$local_resources\382.53-desktop-win10-64bit-international-whql.exe", "$server_resources_01\382.53-desktop-win10-64bit-international-whql.exe", 0
$firefox = 'Mozilla Firefox', "$local_resources\FirefoxSetup.exe", "$server_resources_01\FirefoxSetup.exe", 0
$thunderbird = 'Mozilla Thunderbird', "$local_resources\ThunderbirdSetup.exe", "$server_resources_01\ThunderbirdSetup.exe", 0
$vlc = 'VLC', "$local_resources\vlcSetup.exe", "$server_resources_01\vlcSetup.exe", 0
$shotgun = 'Shotgun Desktop', "$local_resources\ShotgunInstaller_Current.exe", "$server_resources_01\ShotgunInstaller_Current.exe", 0
$pycharm = 'PyCharm', "$local_resources\pycharm-community-2017.1.2.exe", "$server_resources_01\pycharm-community-2017.1.2.exe", 0
$slack = 'Slack', "$local_resources\SlackSetup.exe", "$server_resources_01\SlackSetup.exe", 0
$chrome = 'Google Chrome', "/qb! /i C:\deploy_temp\googlechromestandaloneenterprise64.msi", "$server_resources_01\googlechromestandaloneenterprise64.msi", 0
$github = 'Github', "$local_resources\GitHubDesktopSetup.exe", "$server_resources_01\GitHubDesktopSetup.exe", 0
$python = 'Python 2.7', "/qb! /i C:\deploy_temp\python-2.7.8.amd64.msi", "$server_resources_01\python-2.7.8.amd64.msi", 0

#Maya
#2015
$maya_path_2015 = "Autodesk\maya\Maya_2015\Windows"
$maya2015 = "Maya 2015", "$local_resources\Autodesk_Maya_2015_dlm.sfx.exe", "$path_to_software\$maya_path_2015\Autodesk_Maya_2015_dlm.sfx.exe", 0
$maya2015Update1 = "Maya 2015 Update 1", "/qb! /update C:\deploy_temp\Autodesk_Maya_2015_SP1_English_Japanese_SimplifiedChinese_Win.msp", "$path_to_software\$maya_path_2015\Autodesk_Maya_2015_SP1_English_Japanese_SimplifiedChinese_Win.msp", 0
$maya2015Update2 = "Maya 2015 Update 2", "/qb! /update C:\deploy_temp\Autodesk_Maya_2015_SP2_English_Japanese_SimplifiedChinese_Win.msp", "$path_to_software\$maya_path_2015\Autodesk_Maya_2015_SP2_English_Japanese_SimplifiedChinese_Win.msp", 0
$maya2015Update3 = "Maya 2015 Update 3", "/qb! /update C:\deploy_temp\Autodesk_Maya_2015_SP3_English_Japanese_SimplifiedChinese_Win.msp", "$path_to_software\$maya_path_2015\Autodesk_Maya_2015_SP3_English_Japanese_SimplifiedChinese_Win.msp", 0
$maya2015Update4 = "Maya 2015 Update 4", "/qb! /update C:\deploy_temp\Autodesk_Maya_2015_SP4_English_Japanese_SimplifiedChinese_Win.msp", "$path_to_software\$maya_path_2015\Autodesk_Maya_2015_SP4_English_Japanese_SimplifiedChinese_Win.msp", 0
$maya2015Update5 = "Maya 2015 Update 5", "/qb! /update C:\deploy_temp\Autodesk_Maya_2015_SP5_English_Japanese_SimplifiedChinese_Win.msp", "$path_to_software\$maya_path_2015\Autodesk_Maya_2015_SP5_English_Japanese_SimplifiedChinese_Win.msp", 0
$maya2015Update6 = "Maya 2015 Update 6", "/qb! /update C:\deploy_temp\Autodesk_Maya_2015_SP6_EN_JP_ZH_Win.msp", "$path_to_software\$maya_path_2015\Autodesk_Maya_2015_SP6_EN_JP_ZH_Win.msp", 0
#2017
$maya_path_2017 = "Autodesk\maya\Maya_2017\Windows"
$maya2017 = "Maya 2017", "$local_resources\Autodesk_Maya_2017_EN_JP_ZH_Win_64bit_dlm.sfx.exe", "$path_to_software\$maya_path_2017\Autodesk_Maya_2017_EN_JP_ZH_Win_64bit_dlm.sfx.exe", 0
$maya2017Update1 = "Maya 2017 Update 1", "C:\deploy_temp\Autodesk_Maya_2017_Update1_x64.exe", "$path_to_software\$maya_path_2017\Autodesk_Maya_2017_Update1_x64.exe", 1
$maya2017Update2 = "Maya 2017 Update 2", "C:\deploy_temp\Autodesk_Maya_2017_Update2_x64.exe", "$path_to_software\$maya_path_2017\Autodesk_Maya_2017_Update2_x64.exe", 1
$maya2017Update3 = "Maya 2017 Update 3", "C:\deploy_temp\Autodesk_Maya_2017_Update3_x64.exe", "$path_to_software\$maya_path_2017\Autodesk_Maya_2017_Update3_x64.exe", 1

#Houdini
$houndini_path_15 = "\\fileserver01\resources\it\software\sidefx\Windows\Houdini15"
$houdini15_5_523 = "Houdini 15.5.523", "$local_resources\houdini-15.5.523-win64-vc14.exe", "$houndini_path_15\houdini-15.5.523-win64-vc14.exe", 0
$houdini15_5_717 = "Houdini 15.5.717", "$local_resources\houdini-15.5.717-win64-vc14.exe", "$houndini_path_15\houdini-15.5.717-win64-vc14.exe", 0
$houndini_path_16 = "\\fileserver01\resources\it\software\sidefx\Windows\Houdini16"
$houdini16_0_600 = "Houdini 16.0.600", "$local_resources\houdini-16.0.600-win64-vc14.exe", "$houndini_path_16\houdini-16.0.600-win64-vc14.exe", 0

#Nuke
#10
$nuke_path = "foundry\nuke"
$nuke10 = "Nuke 10", "$local_resources\Nuke10.5v3-win-x86-release-64.exe", "$path_to_software\$nuke_path\Nuke10.5v3-win-x86-release-64.exe", 0

#Mari
#10
$mari_path = "foundry\mari"
$mari3 = "Mari 3.3", "$local_resources\Mari3.3v1-win-x86-release-64.exe", "$path_to_software\$mari_path\Mari3.3v1-win-x86-release-64.exe", 0

#zbrush
$zbrush_path = "\Zbrush"
$zbrush = "Zbrush 4R8", "$local_resources\ZBrush_4R8_Installer_WIN.exe", "$path_to_software\$zbrush_path\ZBrush_4R8_Installer_WIN.exe", 0

#Quicktime
$quicktime = "quicktime_installer.bat", "$local_resources\QuickTime\quicktime_installer.bat", "$server_resources_01\QuickTime*", 0

#redistributables
$vcredist_2013_32 = "vcredist c++ 2013 32bit", "$local_resources\vcredist_x86.exe", "$server_resources_01\redistributables\vc++ 2013\vcredist_x86.exe", 0 
$vcredist_2013_64 = "vcredist c++ 2013 64bit", "$local_resources\vcredist_x64.exe", "$server_resources_01\redistributables\vc++ 2013\vcredist_x64.exe", 0
$vcredist_2015_32 = "vcredist c++ 2015 32bit", "$local_resources\vc_redist.x86.exe", "$server_resources_01\redistributables\vc++ 2015\vc_redist.x86.exe", 0 
$vcredist_2015_64 = "vcredist c++ 2015 64bit", "$local_resources\vc_redist.x64.exe", "$server_resources_01\redistributables\vc++ 2015\vc_redist.x64.exe", 0

$files_to_copy = @(
    $get_last_pc,
	$pip,
	$pip_installs,
    $firefox,
	$nvidia,
	$remote_assist,
    $thunderbird,
    $vlc,
    $shotgun,
    $pycharm,
    $python,
    $slack,
    $github,
    $chrome,
    $maya2015,
	$maya2017,
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
	$nuke10,
    $mari3,
	$zbrush,
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


#create new temp directory
if(!(Test-Path $local_resources)){
    New-Item -ItemType directory -Path $local_resources
}

#copy all the resources from the server into the temo directory
foreach($item in $files_to_copy){
	if($item[3] -eq 1){
		$cur_time = Get-Date
		Write-Host $cur_time.ToShortTimeString() - 'Copying'$item[0]
		Copy-Item $item[2] $local_resources -Recurse
	}
}

#python
if($python[3] -eq 1){
	$cur_time = Get-Date
	Write-Host $cur_time.ToShortTimeString() - 'Installing'$python[0]
	Start-Process -FilePath msiexec -ArgumentList $python[1] -Wait
	Write-Host "Setting up python environment"
	[Environment]::SetEnvironmentVariable("PYTHON_HOME", "c:\Python27", "User")
	[Environment]::SetEnvironmentVariable("Path", "$env:Path;C:\Python27\;C:\Python27\Scripts\", "User")
}

#slack
if($slack[3] -eq 1){
	$cur_time = Get-Date
	Write-Host $cur_time.ToShortTimeString() - 'Installing'$slack[0]
	Write-Host "Close slack after installation"
	Start-Process -FilePath $slack[1] -Wait
}

	#github
if($github[3] -eq 1){
	$cur_time = Get-Date
	Write-Host $cur_time.ToShortTimeString() - 'Installing'$github[0]
	Write-Host "Close github after installation"
	Start-Process -FilePath $github[1] -Wait
}

#pycharm
if($pycharm[3] -eq 1){
	$cur_time = Get-Date
	Write-Host $cur_time.ToShortTimeString() - 'Installing'$pycharm[0]
	Start-Process -FilePath $pycharm[1] -wait
}

#maya
#2015
if($maya2015[3] -eq 1){
	$cur_time = Get-Date
	Write-Host $cur_time.ToShortTimeString() - 'Installing'$maya2015[0]
	Write-Host "Close Maya and Autodesk application manager  after installation"
	Start-Process -FilePath $maya2015[1] -wait
}
#2017
if($maya2017[3] -eq 1){
	$cur_time = Get-Date
	Write-Host $cur_time.ToShortTimeString() - 'Installing'$maya2017[0]
	Write-Host "Close Maya and Autodesk application manager  after installation"
	Start-Process -FilePath $maya2017[1] -wait
}

#chrome
if($chrome[3] -eq 1){
	$cur_time = Get-Date
	Write-Host $cur_time.ToShortTimeString() - 'Installing'$chrome[0]
	Start-Process -FilePath msiexec -ArgumentList $chrome[1] -Wait

}

#Remote Desktop Assist
if($remote_assist[3] -eq 1){
	$cur_time = Get-Date
	Write-Host $cur_time.ToShortTimeString() - 'Installing'$remote_assist[0]
	Start-Process -FilePath wusa.exe -ArgumentList $remote_assist[1] -Wait
}

#Nvidia
if($nvidia[3] -eq 1){
	$cur_time = Get-Date
	Write-Host $cur_time.ToShortTimeString() - 'Installing'$nvidia[0]
	Start-Process -FilePath $nvidia[1] -ArgumentList "/n /s /noeula /nofinish" -Wait

}


#simple exes
foreach($item in $exe_files_simple){
	if($item[3] -eq 1){
		$cur_time = Get-Date
		Write-Host $cur_time.ToShortTimeString() - 'Installing'$item[0]
		Start-Process -FilePath $item[1] -ArgumentList /S -Wait
	}
}


if($quicktime[3] -eq 1){
	#Quicktime
	$cur_time = Get-Date
	Write-Host $cur_time.ToShortTimeString() - 'Installing'$quicktime[0]
	Start-Process $quicktime[1] -Wait
}

#Houdini
#15_5_523
if($houdini15_5_523[3] -eq 1){
	$cur_time = Get-Date
	Write-Host $cur_time.ToShortTimeString() - 'Installing'$houdini15_5_523[0]
	Start-Process -FilePath $houdini15_5_523[1] -ArgumentList "/S /AcceptEula=yes" -Wait
}
#15_5_717
if($houdini15_5_717[3] -eq 1){
	$cur_time = Get-Date
	Write-Host $cur_time.ToShortTimeString() - 'Installing'$houdini15_5_717[0]
	Start-Process -FilePath $houdini15_5_717[1] -ArgumentList "/S /AcceptEula=yes" -Wait
}
#16_0_600
if($houdini16_0_600[3] -eq 1){
	$cur_time = Get-Date
	Write-Host $cur_time.ToShortTimeString() - 'Installing'$houdini16_0_600[0]
	Start-Process -FilePath $houdini16_0_600[1] -ArgumentList "/S /AcceptEula=yes" -Wait
}

#Nuke
if($nuke10[3] -eq 1){
	$cur_time = Get-Date
	Write-Host $cur_time.ToShortTimeString() - 'Installing'$nuke10[0]
	Start-Process -FilePath $nuke10[1] -ArgumentList /silent -Wait
}

#Mari
if($Mari3[3] -eq 1){
	$cur_time = Get-Date
	Write-Host $cur_time.ToShortTimeString() - 'Installing'$Mari3[0]
	Start-Process -FilePath $Mari3[1] -ArgumentList /silent -Wait
}

#Zbrush
if($zbrush[3] -eq 1){
	$cur_time = Get-Date
	Write-Host $cur_time.ToShortTimeString() - 'Installing'$zbrush[0]
	Start-Process $zbrush[1] '--mode unattended' -Wait
}

#Maya 2015 updates
foreach($item in $maya_service_packs){
	if($item[3] -eq 1){
		$cur_time = Get-Date
		Write-Host $cur_time.ToShortTimeString() - 'Installing'$item[0]
		Start-Process -FilePath msiexec -ArgumentList $item[1] -Wait
	}
}
#Maya 2017 updates
if($maya2017Update3[3] -eq 1){
	$cur_time = Get-Date
	Write-Host $cur_time.ToShortTimeString() - 'Installing'$maya2017Update3[0]
	Start-Process -FilePath $maya2017Update3[1] -ArgumentList /SP -Wait
}

#rename windows machine
if($windows_setup[3] -eq 1){
	python "$local_resources\get_last_win_pc.py"
	$get_hostname = Get-Content "$local_resources\hostname_log.txt"
	Write-Host $get_hostname
	Rename-Computer $get_hostname
}

#Remove-Item $local_resources -recurse
#Restart-Computer -Force