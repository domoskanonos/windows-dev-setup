# Beschreibung
Dieses Projekt ist ein Powershell Script, welches mir bei der Einrichtung meiner Windows-Entwicklerumgebung hilft. Es installiert Tools wie VSCode, Java, Maven, Git und weitere. Es soll mir bei einer Neuinstallation von Windows die Arbeit zur Einrichtung erleichtern.

## Installation

### Gegebenenfalls muss das Ausführen von Scripten unter Windows erlaubt werden
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
    
### Anschließend folgenden Befehl ausführen
    $INSTALLATION_PATH="C:/_dev";$WINDOWS_SETUP_PATH="$INSTALLATION_PATH\windows-dev-setup-main";If(test-path $INSTALLATION_PATH){Remove-Item -Recurse -Force $INSTALLATION_PATH};New-Item -ItemType Directory -Force -Path $INSTALLATION_PATH;Invoke-WebRequest https://github.com/koshisinthehouse/windows-dev-setup/archive/refs/heads/main.zip -OutFile $INSTALLATION_PATH/windows-setup.zip;Get-ChildItem $global:INSTALLATION_PATH -Filter windows-setup.zip | Expand-Archive -DestinationPath $INSTALLATION_PATH -Force;Invoke-Expression "$WINDOWS_SETUP_PATH\setup.ps1 -INSTALLATION_PATH '$INSTALLATION_PATH' -WINDOWS_SETUP_PATH '$WINDOWS_SETUP_PATH'"

### Github Account SSH Key  hinzufügen
Während der Installation wird ein SSH Key generiert, falls noch keiner vorhanden ist.
Dieser kann für die Authentifizierung mit einem Github Account verwendet werden.
Dazu den Inhalt der Datei ~/.ssh/id_ed25519.pub in die Zwischenablage kopieren und 
anschließend in dem entsprechenden Github Account unter "Settings-> SSH and GPG keys" einfügen.
Der Titel ist dabei frei wählbar.
