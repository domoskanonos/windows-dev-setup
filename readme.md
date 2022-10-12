# Installation Web-Invoke
## Gegebenenfalls muss das Ausführen von Scripten unter Windows erlaubt werden
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
## Anschließend folgenden Befehl ausführen
    $INSTALLATION_PATH = "C:/dev";Remove-Item -Recurse -Force $INSTALLATION_PATH;New-Item -ItemType Directory -Force -Path $INSTALLATION_PATH;Invoke-WebRequest https://github.com/koshisinthehouse/windows-dev-setup/archive/refs/heads/main.zip -OutFile $INSTALLATION_PATH/windows-setup.zip;Get-ChildItem $global:INSTALLATION_PATH -Filter windows-setup.zip | Expand-Archive -DestinationPath $INSTALLATION_PATH -Force;Invoke-Expression "$INSTALLATION_PATH\windows-dev-setup-main\setup.ps1 -INSTALLATION_PATH '$INSTALLATION_PATH'-USER 'koshisinthehouse' -USER_EMAIL 'koshisinthehouse@googlemail.com'"
