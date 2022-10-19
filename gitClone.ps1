param ([string] $REPOSITORY, $DEST, $CHANGE_REPO)
echo "CLONI $DEST"
If(-Not (test-path $DEST) ) {
    Write-Output "clone repo: $REPOSITORY, dest: $DEST"
    git clone $REPOSITORY $DEST
    If($CHANGE_REPO) {
        Invoke-Expression "git -C $DEST remote set-url origin $CHANGE_REPO"
    }    
}
