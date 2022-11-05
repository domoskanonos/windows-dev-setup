param ([string] $SSH_FILE_PATH, $EMAIL)
#ssh key pair - start
If(-Not (test-path $SSH_FILE_PATH) )
{
    ssh-keygen -t ed25519 -f $SSH_FILE_PATH -N '""' -C "$EMAIL"
}
#ssh key pair - end
