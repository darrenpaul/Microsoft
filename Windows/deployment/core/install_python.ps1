




$script_root = $PSScriptRoot
Get-Content "path-to-install_python-config"

if (Test-Path $path) {
    throw "File already exists."
} else {
   # The thing you really wanted to do.
}