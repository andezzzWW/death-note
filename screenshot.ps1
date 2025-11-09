Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$programDataPath = [Environment]::GetEnvironmentVariable("ProgramData")

# Найти свободное имя файла
$i = 1
do {
    $filename = "$i.png"
    $filepath = Join-Path $programDataPath $filename
    $i++
} while (Test-Path $filepath)

# Сделать скриншот
$bounds = [System.Windows.Forms.SystemInformation]::VirtualScreen
$bitmap = New-Object System.Drawing.Bitmap $bounds.Width, $bounds.Height
$graphics = [System.Drawing.Graphics]::FromImage($bitmap)
$graphics.CopyFromScreen($bounds.Location, [System.Drawing.Point]::Empty, $bounds.Size)
$bitmap.Save($filepath, [System.Drawing.Imaging.ImageFormat]::Png)

$graphics.Dispose()
$bitmap.Dispose()