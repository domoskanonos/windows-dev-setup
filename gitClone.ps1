param ([string] $REPOSITORY, $DEST)
If(-Not (test-path $DEST) ) {
    Write-Output "clone repo: $REPOSITORY, dest: $DEST"
    git clone $REPOSITORY $DEST
}