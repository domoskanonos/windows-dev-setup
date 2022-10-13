param ([string] $KEY, $VALUE, $PATH_SUFFIX)
$PATH =(Join-Path $VALUE $PATH_SUFFIX)
Write-Output "env.ps1: key: $KEY, value: $VALUE, pathSuffix: $PATH_SUFFIX, path: $PATH"
[System.Environment]::SetEnvironmentVariable($KEY, $VALUE, "User")
Invoke-Expression "$global:WINDOWS_SETUP_PATH\envPath.ps1 -PATH '$PATH'"
