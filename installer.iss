#define MyAppName "Convert with FFmpeg"
#define ContextItemName "Convert with FFmpeg"

[Setup]
AppName={#MyAppName}
AppVersion=2.1
AppPublisher=Dixon Pedraza
WizardStyle=modern
DefaultDirName={autoappdata}\{#MyAppName}
UninstallDisplayIcon={app}\icon.ico
; Compression=none
Compression=lzma2
SolidCompression=yes
OutputDir=userdocs:Inno Setup Examples Output
PrivilegesRequired=admin
DisableDirPage=False

DisableWelcomePage=no
LicenseFile=License.txt

[Files]
Source: "Readme.txt";     DestDir: "{app}"; Flags: isreadme
Source: "ffmpeg.exe";     DestDir: "{app}"
Source: "contexMenu.vbs"; DestDir: "{app}"
Source: "icon.ico";       DestDir: "{app}"

[Registry]
Check: checkCheckbox(0); Root: HKCR; Subkey: "SystemFileAssociations\audio\Shell\{#ContextItemName}"; Flags: uninsdeletekey
Check: checkCheckbox(0); Root: HKCR; Subkey: "SystemFileAssociations\audio\Shell\{#ContextItemName}"; ValueType: string; ValueName: "Icon"; ValueData: "{app}\icon.ico"; Flags: uninsdeletekey
Check: checkCheckbox(0); Root: HKCR; Subkey: "SystemFileAssociations\audio\Shell\{#ContextItemName}\Command"; ValueType: string; ValueName: ""; ValueData: "wscript.exe ""{app}\contexMenu.vbs"" ""%1"""; Flags: uninsdeletekey

Check: checkCheckbox(1); Root: HKCR; Subkey: "SystemFileAssociations\video\Shell\{#ContextItemName}"; Flags: uninsdeletekey
Check: checkCheckbox(1); Root: HKCR; Subkey: "SystemFileAssociations\video\Shell\{#ContextItemName}"; ValueType: string; ValueName: "Icon"; ValueData: "{app}\icon.ico"; Flags: uninsdeletekey
Check: checkCheckbox(1); Root: HKCR; Subkey: "SystemFileAssociations\video\Shell\{#ContextItemName}\Command"; ValueType: string; ValueName: ""; ValueData: "wscript.exe ""{app}\contexMenu.vbs"" ""%1"""; Flags: uninsdeletekey 

Check: checkCheckbox(2); Root: HKCR; Subkey: "SystemFileAssociations\.mp4\Shell\{#ContextItemName}"; Flags: uninsdeletekey
Check: checkCheckbox(2); Root: HKCR; Subkey: "SystemFileAssociations\.mp4\Shell\{#ContextItemName}"; ValueType: string; ValueName: "Icon"; ValueData: "{app}\icon.ico"; Flags: uninsdeletekey
Check: checkCheckbox(2); Root: HKCR; Subkey: "SystemFileAssociations\.mp4\Shell\{#ContextItemName}\Command"; ValueType: string; ValueName: ""; ValueData: "wscript.exe ""{app}\contexMenu.vbs"" ""%1"""; Flags: uninsdeletekey

Check: checkCheckbox(3); Root: HKCR; Subkey: "SystemFileAssociations\.g729\Shell\{#ContextItemName}"; Flags: uninsdeletekey
Check: checkCheckbox(3); Root: HKCR; Subkey: "SystemFileAssociations\.g729\Shell\{#ContextItemName}"; ValueType: string; ValueName: "Icon"; ValueData: "{app}\icon.ico"; Flags: uninsdeletekey
Check: checkCheckbox(3); Root: HKCR; Subkey: "SystemFileAssociations\.g729\Shell\{#ContextItemName}\Command"; ValueType: string; ValueName: ""; ValueData: "wscript.exe ""{app}\contexMenu.vbs"" ""%1"""; Flags: uninsdeletekey

[Code]
var
  CustomPage: TWizardPage;
  CheckListBox: TNewCheckListBox;  

procedure InitializeWizard;
begin
  CustomPage := CreateCustomPage(wpSelectDir, 'Asociate with formats', 'Check in the list...');
  CheckListBox:=TNewCheckListBox.Create(CustomPage);
  CheckListBox.Parent:=CustomPage.Surface;
  CheckListBox.Left:=ScaleX(0);
  CheckListBox.Top:=ScaleY(0);
  CheckListBox.Width:=ScaleX(WizardForm.Width - 1);
  CheckListBox.Height:=ScaleY(WizardForm.Height - 100);              

  CheckListBox.AddCheckBox('Windows audio formats','',0,True,True,False,True,Nil); // 0
  CheckListBox.AddCheckBox('Windows video formats','',0,True,True,False,True,Nil); // 1
  CheckListBox.AddCheckBox('.mp4','',0,True,True,False,True,Nil); // 2
  CheckListBox.AddCheckBox('.g729','',0,True,True,False,True,Nil); // 3
end;

function checkCheckbox(index: Integer): Boolean;
begin
    Result := CheckListBox.Checked[index];
    Log('index ' + IntToStr(index) + '=' + IntToStr(Integer(CheckListBox.Checked[index])));
end;