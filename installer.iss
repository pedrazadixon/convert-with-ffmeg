#define MyAppName "FFmpeg"
#define ContextItemName "Convert with FFmpeg"

[Setup]
AppName={#MyAppName}
AppVersion=0.1
AppPublisher=Dixon Pedraza
WizardStyle=modern
DefaultDirName={autoappdata}\Dixon\FFmpeg
UninstallDisplayIcon={app}\icon.ico
// Compression=lzma2
Compression=none
SolidCompression=yes
OutputDir=userdocs:Inno Setup Examples Output
PrivilegesRequired=admin

DisableWelcomePage=yes
LicenseFile=License.txt

[Files]
Source: "Readme.txt";     DestDir: "{app}"; Flags: isreadme
Source: "ffmpeg.exe";     DestDir: "{app}"
Source: "contexMenu.vbs"; DestDir: "{app}"
Source: "icon.ico";       DestDir: "{app}"

[Registry]
Root: HKCR; Subkey: "SystemFileAssociations\.g729\Shell\{#MyAppName}"; Flags: uninsdeletekey
Root: HKCR; Subkey: "SystemFileAssociations\.g729\Shell\{#ContextItemName}"; ValueType: string; ValueName: "Icon"; ValueData: "{app}\icon.ico"; Flags: uninsdeletekey
Root: HKCR; Subkey: "SystemFileAssociations\.g729\Shell\{#ContextItemName}\Command"; ValueType: string; ValueName: ""; ValueData: "wscript.exe ""{app}\contexMenu.vbs"" ""%1"""; Flags: uninsdeletekey

