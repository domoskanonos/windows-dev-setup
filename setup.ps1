param ($INSTALLATION_PATH, $WINDOWS_SETUP_PATH, $USER, $USER_EMAIL)
$global:INSTALLATION_PATH = $INSTALLATION_PATH
$global:WINDOWS_SETUP_PATH = $WINDOWS_SETUP_PATH
$global:DOWNLOAD_PATH = (Join-Path $global:INSTALLATION_PATH \downloads)

If(-Not (test-path $global:DOWNLOAD_PATH) )
{
    New-Item -ItemType Directory -Force -Path $DOWNLOAD_PATH
}
$global:EXTRACT_PATH = (Join-Path $global:INSTALLATION_PATH \extract)
If(-Not (test-path $global:EXTRACT_PATH) )
{
    New-Item -ItemType Directory -Force -Path $EXTRACT_PATH
}
$global:CERT_PATH = (Join-Path $global:INSTALLATION_PATH \cert)
If(-Not (test-path $global:CERT_PATH) )
{
    New-Item -ItemType Directory -Force -Path $CERT_PATH
}
$global:REPO_PATH = (Join-Path $global:INSTALLATION_PATH \repositories)
If(-Not (test-path $global:REPO_PATH) )
{
    New-Item -ItemType Directory -Force -Path $global:REPO_PATH
}

#ssh - start
$SSH_PATH = "$home\.ssh";
If(-Not (test-path $SSH_PATH) )
{
    New-Item -ItemType Directory -Force -Path $SSH_PATH
}
Copy-Item "$global:WINDOWS_SETUP_PATH\config" -Destination "$SSH_PATH" -Recurse -force
Invoke-Expression "$global:WINDOWS_SETUP_PATH\ssh.ps1 -SSH_FILE_PATH $SSH_PATH/id_koshisinthehouse -EMAIL koshisinthehouse@googlemail.com"
Invoke-Expression "$global:WINDOWS_SETUP_PATH\ssh.ps1 -SSH_FILE_PATH $SSH_PATH/id_domoskanonos -EMAIL domoskanonos@googlemail.com"
#ssh - end

#putty - start
$PUTTY_PATH = "$global:EXTRACT_PATH/putty"
Invoke-Expression "$global:WINDOWS_SETUP_PATH\download.ps1 -DOWNLOAD_PATH $global:DOWNLOAD_PATH -ZIP_FILE_NAME putty.zip -ZIP_FILE_URL 'https://the.earth.li/~sgtatham/putty/latest/w64/putty.zip' -EXTRACT_PATH '$PUTTY_PATH' -CHECK_PATH '$PUTTY_PATH'"
#putty - end

#vscode - start
$VS_CODE_PATH = "$global:EXTRACT_PATH/VSCode-win32-x64-1.72.1"
Invoke-Expression "$global:WINDOWS_SETUP_PATH\download.ps1 -DOWNLOAD_PATH $global:DOWNLOAD_PATH -ZIP_FILE_NAME VSCode-win32-x64-1.72.1.zip -ZIP_FILE_URL 'https://update.code.visualstudio.com/1.72.1/win32-x64-archive/stable' -EXTRACT_PATH '$VS_CODE_PATH' -CHECK_PATH '$VS_CODE_PATH'"
#vscode - end

#notepad++ - start
$NOTEPAD_PATH = "$global:EXTRACT_PATH/npp"
Invoke-Expression "$global:WINDOWS_SETUP_PATH\download.ps1 -DOWNLOAD_PATH $global:DOWNLOAD_PATH -ZIP_FILE_NAME npp.8.4.5.portable.x64.zip -ZIP_FILE_URL 'https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v8.4.5/npp.8.4.5.portable.x64.zip' -EXTRACT_PATH '$NOTEPAD_PATH' -CHECK_PATH '$NOTEPAD_PATH'"
#notepad++ - end

#git - start
$GIT_PATH = "$global:EXTRACT_PATH\MinGit-2.38.0-64"
Invoke-Expression "$global:WINDOWS_SETUP_PATH\download.ps1 -DOWNLOAD_PATH '$global:DOWNLOAD_PATH' -ZIP_FILE_NAME 'MinGit-2.38.0-64-bit.zip' -ZIP_FILE_URL 'https://github.com/git-for-windows/git/releases/download/v2.38.0.windows.1/MinGit-2.38.0-64-bit.zip' -EXTRACT_PATH '$GIT_PATH' -CHECK_PATH '$GIT_PATH'"
Invoke-Expression "$global:WINDOWS_SETUP_PATH\env.ps1 -KEY 'GIT_HOME' -VALUE '$GIT_PATH\mingw64' -PATH_SUFFIX 'bin'"
git config --global --unset https.proxy
git config --global --unset http.proxy
git config --global http.sslVerify false
#Write-Output "write git user.name $USER";
#git config --global --replace-all user.name "$USER"
#Write-Output "write git user.email $USER_EMAIL";
#git config --global --replace-all user.email "$USER_EMAIL"
#git - end
#node - start
$NODE_PATH ="$global:EXTRACT_PATH\node-v16.18.0-win-x64"
$NPM_PATH = "$NODE_PATH\node_modules\npm\bin"
Invoke-Expression "$global:WINDOWS_SETUP_PATH\download.ps1 -DOWNLOAD_PATH '$global:DOWNLOAD_PATH' -ZIP_FILE_NAME 'node-v16.18.0-win-x64.zip' -ZIP_FILE_URL 'https://nodejs.org/dist/v16.18.0/node-v16.18.0-win-x64.zip' -EXTRACT_PATH '$global:EXTRACT_PATH' -CHECK_PATH '$NODE_PATH'"
Invoke-Expression "$global:WINDOWS_SETUP_PATH\env.ps1 -KEY 'NODE_HOME' -VALUE '$NODE_PATH'"
Invoke-Expression "$global:WINDOWS_SETUP_PATH\envPath.ps1 -PATH '$NPM_PATH' -TYPE 'User'"
Invoke-Expression "$global:WINDOWS_SETUP_PATH\envPath.ps1 -PATH '$NPM_PATH' -TYPE 'Machine'"
#npm config set always-auth false
npm config set loglevel verbose
npm config set strict-ssl false
#node - end

# Java - START
$JAVA_PATH = "$global:EXTRACT_PATH\java-17-openjdk-17.0.3.0.6-1.win.x86_64"
Invoke-Expression "$global:WINDOWS_SETUP_PATH\download.ps1 -DOWNLOAD_PATH '$global:DOWNLOAD_PATH' -ZIP_FILE_NAME 'java-17-openjdk-17.0.3.0.6-1.win.x86_64.zip' -ZIP_FILE_URL 'https://github.com/ojdkbuild/ojdkbuild/releases/download/java-17-openjdk-17.0.3.0.6-1/java-17-openjdk-17.0.3.0.6-1.win.x86_64.zip' -EXTRACT_PATH '$global:EXTRACT_PATH' -CHECK_PATH '$JAVA_PATH'"
Invoke-Expression "$global:WINDOWS_SETUP_PATH\env.ps1 -KEY 'JAVA_HOME' -VALUE '$JAVA_PATH' -PATH_SUFFIX 'bin'"
# Java - ENDE

#gradle - start
$GRADLE_PATH = "$global:EXTRACT_PATH\gradle-7.5"
Invoke-Expression "$global:WINDOWS_SETUP_PATH\download.ps1 -DOWNLOAD_PATH '$global:DOWNLOAD_PATH' -ZIP_FILE_NAME 'gradle-7.5-bin.zip' -ZIP_FILE_URL 'https://services.gradle.org/distributions/gradle-7.5-bin.zip' -EXTRACT_PATH '$global:EXTRACT_PATH' -CHECK_PATH '$GRADLE_PATH'"
Invoke-Expression "$global:WINDOWS_SETUP_PATH\env.ps1 -KEY 'GRADLE_HOME' -VALUE '$GRADLE_PATH' -PATH_SUFFIX 'bin'"
#gradle - start

# maven - START
#URL NOT WORKING ANYMORE
#$MAVEN_PATH = "$global:EXTRACT_PATH\apache-maven-3.8.6"
#Invoke-Expression "$global:WINDOWS_SETUP_PATH\download.ps1 -DOWNLOAD_PATH '$global:DOWNLOAD_PATH' -ZIP_FILE_NAME 'apache-maven-3.8.6-bin.zip' -ZIP_FILE_URL 'https://dlcdn.apache.org/maven/maven-3/3.8.6/binaries/apache-maven-3.8.6-bin.zip' -EXTRACT_PATH '$global:EXTRACT_PATH' -CHECK_PATH '$MAVEN_PATH'"
#Invoke-Expression "$global:WINDOWS_SETUP_PATH\env.ps1 -KEY 'MAVEN_HOME' -VALUE '$MAVEN_PATH' -PATH_SUFFIX 'bin'"
# maven - ENDE

#python - START

$PYTHON_PATH = "$global:EXTRACT_PATH\python-3.10.0-embed-amd64"
Invoke-Expression "$global:WINDOWS_SETUP_PATH\download.ps1 -DOWNLOAD_PATH '$global:DOWNLOAD_PATH' -ZIP_FILE_NAME 'python-3.10.0-embed-amd64.zip' -ZIP_FILE_URL 'https://www.python.org/ftp/python/3.10.0/python-3.10.0-embed-amd64.zip' -EXTRACT_PATH '$PYTHON_PATH' -CHECK_PATH '$PYTHON_PATH'"
Invoke-Expression "$global:WINDOWS_SETUP_PATH\envPath.ps1 -PATH '$PYTHON_PATH' -TYPE 'User'"
Invoke-Expression "$global:WINDOWS_SETUP_PATH\envPath.ps1 -PATH '$PYTHON_PATH' -TYPE 'Machine'"

Copy-Item "$global:WINDOWS_SETUP_PATH\python310._pth" -Destination "$PYTHON_PATH"

Invoke-Expression "python --version"

$PYTHON_SCRIPT_PATH = "$PYTHON_PATH\Scripts"
Invoke-Expression "$global:WINDOWS_SETUP_PATH\envPath.ps1 -PATH '$PYTHON_SCRIPT_PATH' -TYPE 'User'"
Invoke-Expression "$global:WINDOWS_SETUP_PATH\envPath.ps1 -PATH '$PYTHON_SCRIPT_PATH' -TYPE 'Machine'"

Invoke-WebRequest "https://bootstrap.pypa.io/get-pip.py" -OutFile ./get-pip.py
Invoke-Expression "$PYTHON_PATH\python get-pip.py"

Invoke-Expression "pip -V"

#python - ENDE

# clone repos - START
#Invoke-Expression "$global:WINDOWS_SETUP_PATH\gitClone.ps1 -REPOSITORY 'https://github.com/koshisinthehouse/windows-dev-setup.git' -DEST '$global:REPO_PATH\windows-dev-setup'"
#Invoke-Expression "$global:WINDOWS_SETUP_PATH\gitClone.ps1 -REPOSITORY 'https://github.com/koshisinthehouse/replacerboy.git' -DEST '$global:REPO_PATH\replacerboy'"
#Invoke-Expression "$global:WINDOWS_SETUP_PATH\gitClone.ps1 -REPOSITORY 'https://github.com/koshisinthehouse/homeserver.git' -DEST '$global:REPO_PATH\homeserver'"
# clone repos - END
