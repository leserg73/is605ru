; -- Example1.iss --
;
; Демонстрирует установку 3-х файлов и создание значка.

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

; Применение стиля к диалогам инсталлятора/деинсталлятора
; ("SetupStyleFile=" определяет путь и файл стиля *.vsf)
SetupStyleFile="compiler:Examples\Glow.vsf"

[Languages]
Name: ru; MessagesFile: "compiler:Languages\Russian.isl"

[Files]
Source: "MyProg.exe"; DestDir: "{app}"
Source: "MyProg.chm"; DestDir: "{app}"
Source: "Readme.txt"; DestDir: "{app}"; Flags: isreadme

[Icons]
Name: "{group}\My Program"; Filename: "{app}\MyProg.exe"
