param ([string] $REPOSITORY, $DEST, $CHANGE_REPO)
If(-Not (test-path $DEST) ) {
    Write-Output "clone repo: $REPOSITORY, dest: $DEST"
    git clone $REPOSITORY $DEST
    If($CHANGE_REPO) {
    	
       $repoPath = (Join-Path $DEST \git)
        echo "current: $repoPath remote set-url origin $CHANGE_REPO"
        
        Invoke-Expression "$repoPath remote set-url origin $CHANGE_REPO"
        
       
        
        
  }    
}
