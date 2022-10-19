param ([string] $REPOSITORY, $DEST, $CHANGE_REPO)
If(-Not (test-path $DEST) ) {
    Write-Output "clone repo: $REPOSITORY, dest: $DEST"
    git clone $REPOSITORY $DEST
    If($CHANGE_REPO) {
    	
       
        Invoke-Expression "$DESTgit remote set-url origin $CHANGE_REPO"
        
        echo "current: $DESTgit remote set-url origin $CHANGE_REPO"
        
        
  }    
}
