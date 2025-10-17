$filePath = Join-Path $env:LOCALAPPDATA "привет.txt"
"привет" | Out-File -FilePath $filePath -Encoding UTF8
Invoke-Item $filePath
