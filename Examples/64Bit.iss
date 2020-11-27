; -- 64Bit.iss --
;
; Демонстрирует установку программы, собранной для x64 (a.k.a. AMD64) архитектуры.
; Для успешного запуска этого инсталлятора и программы, которую он устанавливает,
; у вас должна быть 64-бит версия Windows.

; ОБРАТИТЕСЬ К СПРАВОЧНОЙ ДОКУМЕНТАЦИИ, ЧТОБЫ ИСПОЛЬЗОВАТЬ ВСЕ ВОЗМОЖНОСТИ INNO SETUP!

[Setup]
AppName=My Program
AppVersion=1.5
WizardStyle=modern
DefaultDirName={autopf}\My Program
DefaultGroupName=My Program
UninstallDisplayIcon={app}\MyProg.exe
Compression=lzma2
SolidCompression=yes
OutputDir=userdocs:Inno Setup Examples Output

; "ArchitecturesAllowed=x64" указывает возможность запуска
; программы установки только на x64 архитектуре.
ArchitecturesAllowed=x64

; "ArchitecturesInstallIn64BitMode=x64" указывает выполнять установку
; в "64-бит режиме" на x64 системе. Это означает, что будет использоваться
; 64-бит каталог "Program Files" и 64-бит представление реестра.
ArchitecturesInstallIn64BitMode=x64

; Применение стиля к диалогам инсталлятора/деинсталлятора
; ("SetupStyleFile=" определяет путь и файл стиля *.vsf)
SetupStyleFile="compiler:Examples\Glow.vsf"

[Languages]
Name: ru; MessagesFile: "compiler:Languages\Russian.isl"

[Files]
Source: "MyProg-x64.exe"; DestDir: "{app}"; DestName: "MyProg.exe"
Source: "MyProg.chm"; DestDir: "{app}"
Source: "Readme.txt"; DestDir: "{app}"; Flags: isreadme

[Icons]
Name: "{group}\My Program"; Filename: "{app}\MyProg.exe"
