param ([string] $USER, $USER_EMAIL)
$global:INSTALLATION_PATH = "C:/dev";
$global:WINDOWS_SETUP_PATH = (Join-Path $global:INSTALLATION_PATH \windows-setup)
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

#ssh key pair - start
$SSH_FILE_PATH = "$home\.ssh\id_ed25519";
If(-Not (test-path $SSH_FILE_PATH) )
{
    ssh-keygen -t ed25519 -f $SSH_FILE_PATH -N '""' -C "$USER_EMAIL"
}
#ssh key pair - end

#vscode - start
Invoke-Expression "$global:WINDOWS_SETUP_PATH\download.ps1 -DOWNLOAD_PATH $global:DOWNLOAD_PATH -ZIP_FILE_NAME vscode.zip -ZIP_FILE_URL 'https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user' -EXTRACT_PATH '$global:EXTRACT_PATH/vscode'"
#vscode - end

#notepad++ - start
Invoke-Expression "$global:WINDOWS_SETUP_PATH\download.ps1 -DOWNLOAD_PATH $global:DOWNLOAD_PATH -ZIP_FILE_NAME npp.8.4.5.portable.x64.zip -ZIP_FILE_URL 'https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v8.4.5/npp.8.4.5.portable.x64.zip' -EXTRACT_PATH '$global:EXTRACT_PATH/npp'"
#notepad++ - end

#git - start
Invoke-Expression "$global:WINDOWS_SETUP_PATH\download.ps1 -DOWNLOAD_PATH '$global:DOWNLOAD_PATH' -ZIP_FILE_NAME 'git-2.26.0.windows.1.zip' -ZIP_FILE_URL 'http://myspace/git/git-2.26.0.windows.1.zip' -EXTRACT_PATH '$global:EXTRACT_PATH'"
Invoke-Expression "$global:WINDOWS_SETUP_PATH\env.ps1 -KEY 'GIT_HOME' -VALUE '$global:EXTRACT_PATH\git-2.26.0.windows.1' -PATH_SUFFIX 'bin'"
git config --global --unset https.proxy
git config --global --unset http.proxy
git config --global http.sslVerify false
Write-Output "write git user.name $USER";
git config --global --replace-all user.name "$USER"
Write-Output "write git user.email $USER_EMAIL";
git config --global --replace-all user.email "$USER_EMAIL"
$GIT_CERT_PATH = (Join-Path $global:EXTRACT_PATH git-2.26.0.windows.1\mingw64\ssl\certs\ca-bundle.crt)
Write-Output "copy certifications to git folder: $GIT_CERT_PATH"
Copy-Item (Join-Path $global:CERT_PATH ca-bundle.crt) -Destination $GIT_CERT_PATH
#git - end

#node - start
Invoke-Expression "$global:WINDOWS_SETUP_PATH\download.ps1 -DOWNLOAD_PATH '$global:DOWNLOAD_PATH' -ZIP_FILE_NAME 'node-v16.14.2-win-x64.zip' -ZIP_FILE_URL 'http://myspace/NodeJS/node-v16.14.2-win-x64.zip' -EXTRACT_PATH '$global:EXTRACT_PATH'"
Invoke-Expression "$global:WINDOWS_SETUP_PATH\env.ps1 -KEY 'NODE_HOME' -VALUE '$global:EXTRACT_PATH\node-v16.14.2-win-x64'"
Invoke-Expression "$global:WINDOWS_SETUP_PATH\envPath.ps1 -PATH '%NODE_HOME%\node_modules\npm\bin'"
#npm config set loglevel verbose
#npm config set strict-ssl false
#npm config set always-auth false
#npm config set strict-ssl false
#node - end

# Java - START
Invoke-Expression "$global:WINDOWS_SETUP_PATH\download.ps1 -DOWNLOAD_PATH '$global:DOWNLOAD_PATH' -ZIP_FILE_NAME 'OpenJDK17.zip' -ZIP_FILE_URL 'http://myspace/java/win/OpenJDK17.zip' -EXTRACT_PATH '$global:EXTRACT_PATH'"
Invoke-Expression "$global:WINDOWS_SETUP_PATH\env.ps1 -KEY 'JAVA_HOME' -VALUE '$global:EXTRACT_PATH\jdk-17' -PATH_SUFFIX 'bin'"
Invoke-Expression "$global:WINDOWS_SETUP_PATH\env.ps1 -KEY 'SI_JAVA_HOME_64' -VALUE '$global:EXTRACT_PATH\jdk-17' -PATH_SUFFIX 'bin'"
$JAVA_CERT_PATH = (Join-Path $global:EXTRACT_PATH jdk-17\lib\security\cacerts)
Write-Output "copy certifications to java folder: $JAVA_CERT_PATH"
Copy-Item (Join-Path $global:CERT_PATH cacerts) -Destination $JAVA_CERT_PATH
# Java - ENDE

#gradle - start
Invoke-Expression "$global:WINDOWS_SETUP_PATH\download.ps1 -DOWNLOAD_PATH '$global:DOWNLOAD_PATH' -ZIP_FILE_NAME 'gradle-7.5-bin.zip' -ZIP_FILE_URL 'https://services.gradle.org/distributions/gradle-7.5-bin.zip' -EXTRACT_PATH '$global:EXTRACT_PATH'"
Invoke-Expression "$global:WINDOWS_SETUP_PATH\env.ps1 -KEY 'GRADLE_HOME' -VALUE '$global:EXTRACT_PATH\gradle-7.5' -PATH_SUFFIX 'bin'"
#gradle - start

# maven - START
Invoke-Expression "$global:WINDOWS_SETUP_PATH\download.ps1 -DOWNLOAD_PATH '$global:DOWNLOAD_PATH' -ZIP_FILE_NAME 'apache-maven-3.8.1-bin.zip' -ZIP_FILE_URL 'http://myspace/apache/maven/apache-maven-3.8.1-bin.zip' -EXTRACT_PATH '$global:EXTRACT_PATH'"
Invoke-Expression "$global:WINDOWS_SETUP_PATH\env.ps1 -KEY 'MAVEN_HOME' -VALUE '$global:EXTRACT_PATH\apache-maven-3.8.1' -PATH_SUFFIX 'bin'"
# maven - ENDE

# clone repos - START
Invoke-Expression "$global:WINDOWS_SETUP_PATH\gitClone.ps1 -REPOSITORY 'https://github.com/koshisinthehouse/windows-dev-setup.git' -DEST '$global:REPO_PATH\windows-dev-setup'"
# clone repos - END
