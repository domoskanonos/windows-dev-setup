param ([string] $DOWNLOAD_PATH, $ZIP_FILE_URL, $ZIP_FILE_NAME, $EXTRACT_PATH)
Write-Output "`download path: $DOWNLOAD_PATH, zip file url: $ZIP_FILE_URL, zip file name: $ZIP_FILE_NAME, extract suffix: $EXTRACT_PATH"
$ZIP_FILE_PATH = (Join-Path $DOWNLOAD_PATH $ZIP_FILE_NAME);
If(-Not (test-path $ZIP_FILE_PATH) ) {
    Write-Output "$ZIP_FILE_NAME wird heruntergeladen und gespeichert unter $ZIP_FILE_PATH";
    Invoke-WebRequest $ZIP_FILE_URL -OutFile $ZIP_FILE_PATH
};
Get-ChildItem $DOWNLOAD_PATH -Filter $ZIP_FILE_NAME  | Expand-Archive -DestinationPath $EXTRACT_PATH -Force