Dim response
response = MsgBox("Are you sure to run fake malware?", vbOKCancel + vbExclamation, "Warning!")

If response = vbOK Then
    Set fso = CreateObject("Scripting.FileSystemObject")
    Set shell = CreateObject("WScript.Shell")

    ' Folder path
    scriptFolder = "C:\Users\jylez\Desktop\fake virus\files"
    songPath = scriptFolder & "\SCARY MONSTERS AND NICE SPRITES.mp3"

    ' Play and loop music
    If fso.FileExists(songPath) Then
        Set WMP = CreateObject("WMPlayer.OCX")
        WMP.URL = songPath
        WMP.settings.setMode "loop", True
        WMP.Controls.play
    End If

    ' Fake CMD window
    shell.Run "cmd.exe /k title wininit.exe && color 1F && echo Initializing critical services... && ping localhost -n 5 >nul && echo Starting Windows Kernel... && ping localhost -n 5 >nul && echo Done. Press any key to continue...", 1, False

    ' Safe websites
    Dim sites
    sites = Array( _
        "https://www.nasa.gov", _
        "https://www.khanacademy.org", _
        "https://www.nationalgeographic.com", _
        "https://www.coolmathgames.com", _
        "https://www.britannica.com" _
    )

    ' Fake error messages
    Dim messages
    messages = Array( _
        "Critical system error! Please restart.", _
        "Warning: Unknown application stopped working.", _
        "Error: Unable to locate file C:\Windows\System32\kernel.dll", _
        "Alert: System memory is critically low.", _
        "Fatal exception at 0x0040F3A2" _
    )

    Dim startTime, halfTime
    startTime = Timer
    halfTime = startTime + 30
    Randomize

    Do
        ' Open random website
        Dim rndSite
        rndSite = Int(Rnd * (UBound(sites) + 1))
        shell.Run sites(rndSite), 0, False

        ' Show random popup
        Dim rndMsg, msg, tempVbsPath, tempVbsFile, code
        rndMsg = Int(Rnd * (UBound(messages) + 1))
        msg = messages(rndMsg)

        tempVbsPath = fso.GetSpecialFolder(2) & "\tempPopup_" & rndMsg & "_" & Int(Rnd*10000) & ".vbs"
        code = "MsgBox """ & msg & """, vbCritical, ""System Error"""

        Set tempVbsFile = fso.CreateTextFile(tempVbsPath, True)
        tempVbsFile.WriteLine(code)
        tempVbsFile.Close

        shell.Run "wscript.exe """ & tempVbsPath & """", 0, False

        WScript.Sleep 1000

        If Timer < startTime Then startTime = startTime - 86400

        ' Launch Tunnel effect once after 30 seconds
        If Timer >= halfTime Then
            shell.Run "powershell.exe -WindowStyle Hidden -File """ & scriptFolder & "\tunnel.ps1""", 0, False
            Exit Do
        End If

    Loop

    ' Start flashing effect (runs until BSOD)
    shell.Run "powershell.exe -WindowStyle Hidden -File """ & scriptFolder & "\flash.ps1""", 0, False

    ' Narrator speaks before BSOD
    Set speaker = CreateObject("SAPI.SpVoice")
    speaker.Speak "The virus is complete. Here is a gift for you."

    WScript.Sleep 3000

    ' Trigger BSOD with NotMyFault
    notMyFaultPath = """" & scriptFolder & "\notmyfault64.exe"""
    shell.Run notMyFaultPath & " /crash", 1, False
End If
