param ([string] $USER, $USER_EMAIL)
$global:INSTALLATION_PATH = "C:/dev";
If(-Not (test-path $global:INSTALLATION_PATH) )
{
    New-Item -ItemType Directory -Force -Path $global:INSTALLATION_PATH
}
$global:WINDOWS_SETUP_PATH = (Join-Path $global:INSTALLATION_PATH \windows-setup)
If(test-path $global:WINDOWS_SETUP_PATH )
{
Remove-Item $global:WINDOWS_SETUP_PATH -Recurse -Force
}
Invoke-WebRequest https://github.com/koshisinthehouse/windows-dev-setup/archive/refs/heads/main.zip -OutFile $global:INSTALLATION_PATH/windows-setup.zip
Get-ChildItem $global:INSTALLATION_PATH -Filter windows-setup.zip | Expand-Archive -DestinationPath $global:WINDOWS_SETUP_PATH -Force

#powershell.exe "$global:WINDOWS_SETUP_PATH/setup.ps1 -USER $USER -USER_EMAIL $USER_EMAIL"
