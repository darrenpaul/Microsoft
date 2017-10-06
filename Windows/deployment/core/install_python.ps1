#if (Test-Path $path) {
 #   throw "File already exists."
#} else {

   # The thing you really wanted to do.
#}


$script_root = $PSScriptRoot
$config = $script_root + "\config\install_python.txt"

$install_directory_pattern = "^(.*)install_directory = (.*)$"
$download_url_pattern = "[^download_url = ]"
$downloaded_path_pattern = "[^downloaded_path = ]"

$install_directory = ""
$download_url = ""
$downloaded_path = ""

foreach($line in Get-Content $config) {
    if($line -match $install_directory_pattern){
        $var = $line -match $install_directory_pattern
        Write-Host $var
    }
}

#if (Test-Path $path) {
#    throw "File already exists."
#} else {
#   # The thing you really wanted to do.
#}