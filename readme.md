# Installation Web-Invoke
Gegebenenfalls muss das Ausführen von Scripten unter Windows erlaubt werden
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
Anschließend folgenden Befehl ausführen
    Invoke-WebRequest https://raw.githubusercontent.com/koshisinthehouse/windows-dev-setup/main/install.ps1 -OutFile .\install.ps1;.\install.ps1;C:\dev\windows-setup\setup.ps1 -USER "koshisinthehouse" -USER_EMAIL "koshisinthehouse@googlemail.com"

# Setup Lokal
    .\setup.ps1 -USER "koshisinthehouse" -USER_EMAIL "koshisinthehouse@googlemail.com"
