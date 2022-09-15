param ([string] $PATH)
$envPath = [Environment]::GetEnvironmentVariable('Path', 'User');
if(-Not $envPath.Contains("$PATH")){
    Write-Output "add to env path, value: $PATH"
    [System.Environment]::SetEnvironmentVariable("Path", $envPath + ";$PATH", "User")
}
#$Env:Path = [System.Environment]::GetEnvironmentVariable("Path", "User")