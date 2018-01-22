New-PSDrive -Name "p" -Root "\\10.0.0.251\personal" -PSProvider "FileSystem"
New-PSDrive -Name "v" -Root "\\10.0.0.251\renders" -PSProvider "FileSystem"
New-PSDrive -Name "u" -Root "\\10.0.0.251\10.0.0.251\pipeline" -PSProvider "FileSystem"
New-PSDrive -Name "z" -Root "\\10.0.0.251\tfdemo_pipeline" -PSProvider "FileSystem"