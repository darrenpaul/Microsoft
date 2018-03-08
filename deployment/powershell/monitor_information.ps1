$Monitors = Get-WmiObject WmiMonitorID -Namespace root\wmi
$curHost = (Get-WmiObject -Class Win32_ComputerSystem -Property Name).Name.ToLower()
$LogFile = "\\fileserver01\personal\darrenpaul\pc_specs-monitors\$curHost.txt"
$gpuData = Get-WmiObject Win32_VideoController

$gpu = $gpuData.Name

"GPU: $gpu" | Out-File $LogFile -Append

$count = 0
ForEach ($Monitor in $Monitors)
{
	$Manufacturer = ($Monitor.ManufacturerName -notmatch 0 | ForEach{[char]$_}) -join ""
    $Name = ($Monitor.UserFriendlyName -notmatch 0 | ForEach{[char]$_}) -join ""
    if(($Manufacturer.Equals("GSM"))){
        $Manufacturer = "LG Electronics"
    }

    
    $width = Get-WmiObject -Namespace root\wmi -Class WmiMonitorBasicDisplayParams | select @{ N="Computer"; E={$_.__SERVER} }, InstanceName, @{ N="Horizonal"; E={[System.Math]::Round(($_.MaxHorizontalImageSize/2.54), 2)} }, @{ N="Vertical"; E={[System.Math]::Round(($_.MaxVerticalImageSize/2.54), 2)} }, @{N="Size"; E={[System.Math]::Round(([System.Math]::Sqrt([System.Math]::Pow($_.MaxHorizontalImageSize, 2) + [System.Math]::Pow($_.MaxVerticalImageSize, 2))/2.54),2)} }, @{N="Ratio";E={[System.Math]::Round(($_.MaxHorizontalImageSize)/($_.MaxVerticalImageSize),2)} }
    $width = $width.Size[$count].tostring("##")

    $count++
    "EDID Name: $Manufacturer $width$Name" | Out-File $LogFile -Append
}
$curTime = Get-Date -UFormat "%Y-%m-%d %H:%M"
$env:UserName | Out-File $LogFile -Append
$curTime | Out-File $LogFile -Append