param ([string] $PATH, $TYPE)
$envPath = [Environment]::GetEnvironmentVariable('Path', $TYPE);
if(-Not $envPath.Contains("$PATH")){
    Write-Output "add to env path, value: $PATH"
    [System.Environment]::SetEnvironmentVariable("Path", $envPath + ";$PATH", $TYPE)
}
else {
    Write-Output "path in env path var already exist, ignore path value: $PATH"
}
$Env:Path = [System.Environment]::GetEnvironmentVariable("Path", $TYPE)
