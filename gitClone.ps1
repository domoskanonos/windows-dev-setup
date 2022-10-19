param ([string] $REPOSITORY, $DEST, $CHANGE_REPO)
If(-Not (test-path $DEST) ) {
    Write-Output "clone repo: $REPOSITORY, dest: $DEST"
    git clone $REPOSITORY $DEST
    If($CHANGE_REPO) {
    	Set-Variable -Name "currentDirectory" -Value ($PSScriptRoot)
        echo "change git repo, current directory: $currentDirectory"
        cd $DEST
        echo "destination: $CHANGE_REPO"
        git remote set-url origin $CHANGE_REPO
        echo "current: ([System.Environment]::CurrentDirectory)"
        
        cd $currentDirectory
          echo "current 2: ([System.Environment]::CurrentDirectory)"
  }    
}
