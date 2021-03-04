#define MyAppName "Convert with FFmpeg"
#define ContextItemName "Convert with FFmpeg"

[Setup]
AppName={#MyAppName}
AppVersion=0.2
AppPublisher=Dixon Pedraza
WizardStyle=modern
DefaultDirName={autoappdata}\{#MyAppName}
UninstallDisplayIcon={app}\icon.ico
; Compression=none
Compression=lzma2
SolidCompression=yes
OutputDir=userdocs:Inno Setup Examples Output
PrivilegesRequired=admin

DisableWelcomePage=no
LicenseFile=License.txt

[Files]
Source: "Readme.txt";     DestDir: "{app}"; Flags: isreadme
Source: "ffmpeg.exe";     DestDir: "{app}"
Source: "contexMenu.vbs"; DestDir: "{app}"
Source: "icon.ico";       DestDir: "{app}"

[Registry]
Root: HKCR; Subkey: "SystemFileAssociations\.g729\Shell\{#ContextItemName}"; Flags: uninsdeletekey
Root: HKCR; Subkey: "SystemFileAssociations\.g729\Shell\{#ContextItemName}"; ValueType: string; ValueName: "Icon"; ValueData: "{app}\icon.ico"; Flags: uninsdeletekey
Root: HKCR; Subkey: "SystemFileAssociations\.g729\Shell\{#ContextItemName}\Command"; ValueType: string; ValueName: ""; ValueData: "wscript.exe ""{app}\contexMenu.vbs"" ""%1"""; Flags: uninsdeletekey
