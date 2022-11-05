param ([string] $FILENAME, $EMAIL)
#ssh key pair - start
$SSH_PATH = "$home\.ssh";
If(-Not (test-path $SSH_PATH) )
{
    New-Item -ItemType Directory -Force -Path $SSH_PATH
    Copy-Item "$global:WINDOWS_SETUP_PATH\config" -Destination "$SSH_PATH" -Recurse -force
}
$SSH_FILE_PATH = "$SSH_PATH\$FILENAME";
If(-Not (test-path $SSH_FILE_PATH) )
{
    ssh-keygen -t ed25519 -f $SSH_FILE_PATH -N '""' -C "$EMAIL"
}
#ssh key pair - end
