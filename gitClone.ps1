param ([string] $REPOSITORY, $DEST, $CHANGE_REPO)
If(-Not (test-path $DEST) ) {
    Write-Output "clone repo: $REPOSITORY, dest: $DEST"
    git clone $REPOSITORY $DEST
    If($CHANGE_REPO) {
    	Set-Variable -Name "currentDirectory" -Value ([System.Environment]::CurrentDirectory)
        cd $DEST
        git remote set-url origin $CHANGE_REPO
        cd $currentDirectory
    }    
}
