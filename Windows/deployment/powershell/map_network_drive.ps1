New-PSDrive -Name "v" -Root "\\10.0.0.251\renders" -Persist -PSProvider "FileSystem"
New-PSDrive -Name "u" -Root "\\10.0.0.251\\10.0.0.251\pipeline" -Persist -PSProvider "FileSystem"
New-PSDrive -Name "z" -Root "\\10.0.0.251\tfdemo_pipeline" -Persist -PSProvider "FileSystem"