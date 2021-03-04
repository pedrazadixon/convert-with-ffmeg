Dim ext, Cmd, WshShell, wDir, file, sDir

ext = InputBox("Extension: ")

If Not IsEmpty(ext) Then

	Set WshShell = CreateObject("WScript.Shell")
	Set objFSO = CreateObject("Scripting.FileSystemObject")
	sFile = Wscript.ScriptFullName
	Set oScript = objFSO.GetFile(sFile)
	sDir = objFSO.GetParentFolderName(oScript)
	wDir = WshShell.CurrentDirectory
	file = WScript.Arguments.Item(0)
	Cmd = "cmd.exe /C """"" & sDir & "\ffmpeg.exe"" -y -i """ & file & """ """ & file & "." & ext & """"""
	WshShell.Run Cmd, 1, true
	MsgBox "Ok"
	Set objFSO = Nothing
	Set oScript = Nothing
	Set WshShell = Nothing

End If
