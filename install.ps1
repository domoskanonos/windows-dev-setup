param ([string] $USER, $USER_EMAIL)
$global:INSTALLATION_PATH = "C:/dev";
If(-Not (test-path $global:INSTALLATION_PATH) )
{
    New-Item -ItemType Directory -Force -Path $global:INSTALLATION_PATH
}
Invoke-WebRequest https://github.com/koshisinthehouse/windows-dev-setup/archive/refs/heads/main.zip -OutFile $global:INSTALLATION_PATH/windows-setup.zip
Get-ChildItem $global:INSTALLATION_PATH -Filter windows-setup.zip | Expand-Archive -DestinationPath $global:INSTALLATION_PATH -Force

#powershell.exe "$global:INSTALLATION_PATH/windows-dev-setup-main/setup.ps1 -USER $USER -USER_EMAIL $USER_EMAIL"
