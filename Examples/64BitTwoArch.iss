; -- 64BitTwoArch.iss --
;
; Демонстрирует установку программы, собранной для двух различных
; архитектур (x86 и x64), используя один инсталлятор: на "x86"
; редакциях Windows будет установлена x86 версия программы, а на
; "x64" редакциях Windows будет установлена x64 версия.

; ОБРАТИТЕСЬ К СПРАВОЧНОЙ ДОКУМЕНТАЦИИ, ЧТОБЫ ИСПОЛЬЗОВАТЬ ВСЕ ВОЗМОЖНОСТИ INNO SETUP!

[Setup]
AppName=My Program
AppVersion=1.5
DefaultDirName={autopf}\My Program
DefaultGroupName=My Program
UninstallDisplayIcon={app}\MyProg.exe
WizardStyle=modern
Compression=lzma2
SolidCompression=yes
OutputDir=userdocs:Inno Setup Examples Output

; "ArchitecturesInstallIn64BitMode=x64" указывает выполнять установку
; в "64-бит режиме" на x64 & ARM64 системах. Это означает, что будет
; использоваться 64-бит каталог "Program Files" и 64-бит представление
; реестра. На всех остальных архитектурах установка будет в "32-бит режиме".
ArchitecturesInstallIn64BitMode=x64
; Примечание: мы не используем ProcessorsAllowed, т.к. хотим, чтобы
; инсталлятор мог быть запущен на всех архитектурах (включая Itanium,
; так как он также способен выполнять 32-бит код).

; Применение стиля к диалогам инсталлятора/деинсталлятора
; ("SetupStyleFile=" определяет путь и файл стиля *.vsf)
SetupStyleFile="compiler:Examples\Glow.vsf"

[Languages]
Name: ru; MessagesFile: "compiler:Languages\Russian.isl"

[Files]
; Файл MyProg-x64.exe будет установлен при запуске на x64 системе
; Файл MyProg.exe будет установлен во всех остальных случаях

; Поместите здесь все x64 файлы
Source: "MyProg-x64.exe"; DestDir: "{app}"; DestName: "MyProg.exe"; Check: Is64BitInstallMode

; Поместите здесь все x86 файлы, для первого должен быть установлен флаг 'solidbreak'
Source: "MyProg.exe"; DestDir: "{app}"; Check: not Is64BitInstallMode; Flags: solidbreak

; Поместите здесь все общие файлы, для первого должен быть установлен флаг 'solidbreak'
Source: "MyProg.chm"; DestDir: "{app}"; Flags: solidbreak
Source: "Readme.txt"; DestDir: "{app}"; Flags: isreadme

[Icons]
Name: "{group}\My Program"; Filename: "{app}\MyProg.exe"
