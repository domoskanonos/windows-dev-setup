param ([string] $REPOSITORY, $DEST, $CHANGE_REPO)
If(-Not (test-path $DEST) ) {
    Write-Output "clone repo: $REPOSITORY, dest: $DEST"
    git clone $REPOSITORY $DEST
    If($CHANGE_REPO) {
    	Set-Variable -Name "currentDirectory" -Value ([System.Environment]::CurrentDirectory)
        echo "change git repo, current directory: $currentDirectory"
        cd $DEST
        echo "destination: $CHANGE_REPO"
        git remote set-url origin $CHANGE_REPO
        echo "destination: $DEST"
        
        cd $currentDirectory
    }    
}
