; -- UnicodeExample1.iss --
;
; Демонстрирует некоторые функциональные возможности Unicode.
; ВНИМАНИЕ! КОДИРОВКА СЦЕНАРИЯ UTF-8-BOM

; ОБРАТИТЕСЬ К СПРАВОЧНОЙ ДОКУМЕНТАЦИИ, ЧТОБЫ ИСПОЛЬЗОВАТЬ ВСЕ ВОЗМОЖНОСТИ INNO SETUP!

[Setup]
AppName=ɯɐɹƃoɹd ʎɯ
AppVerName=ɯɐɹƃoɹd ʎɯ version 1.5
WizardStyle=modern
DefaultDirName={autopf}\ɯɐɹƃoɹd ʎɯ
DefaultGroupName=ɯɐɹƃoɹd ʎɯ
UninstallDisplayIcon={app}\ƃoɹdʎɯ.exe
Compression=lzma2
SolidCompression=yes
OutputDir=userdocs:Inno Setup Examples Output

; Применение стиля к диалогам инсталлятора/деинсталлятора
; ("SetupStyleFile=" определяет путь и файл стиля *.vsf)
SetupStyleFile=compiler:Examples\Glow.vsf

[Files]
Source: "MyProg.exe"; DestDir: "{app}"; DestName: "ƃoɹdʎɯ.exe"
Source: "MyProg.chm"; DestDir: "{app}"; DestName: "ƃoɹdʎɯ.chm"
Source: "Readme.txt"; DestDir: "{app}"; Flags: isreadme

[Icons]
Name: "{group}\ɯɐɹƃoɹd ʎɯ"; Filename: "{app}\ƃoɹdʎɯ.exe"

[Code]
function InitializeSetup: Boolean;
begin
  MsgBox('ɯɐɹƃoɹd ʎɯ', mbInformation, MB_OK);
  Result := True;
end;