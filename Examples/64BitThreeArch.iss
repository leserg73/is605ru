; -- 64BitThreeArch.iss --
;
; Демонстрирует установку программы, собранной для трех различных
; архитектур (x86, x64, ARM64), используя один инсталлятор.

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

; "ArchitecturesInstallIn64BitMode=x64 arm64" указывает выполнять установку
; в "64-бит режиме" на x64 & ARM64 системах. Это означает, что будет
; использоваться 64-бит каталог "Program Files" и 64-бит представление
; реестра. На всех остальных архитектурах установка будет в "32-бит режиме".
ArchitecturesInstallIn64BitMode=x64 arm64

; Применение стиля к диалогам инсталлятора/деинсталлятора
; ("SetupStyleFile=" определяет путь и файл стиля *.vsf)
SetupStyleFile="compiler:Examples\Glow.vsf"

[Languages]
Name: ru; MessagesFile: "compiler:Languages\Russian.isl"

[Files]
; Файл MyProg-x64.exe будет установлен при запуске на x64 системе
; Файл MyProg-ARM64.exe будет установлен при запуске на ARM64 системе 
; Файл MyProg.exe будет установлен во всех остальных случаях

; Поместите здесь все x64 файлы
Source: "MyProg-x64.exe"; DestDir: "{app}"; DestName: "MyProg.exe"; Check: InstallX64

; Поместите здесь все ARM64 файлы, для первого должен быть установлен флаг 'solidbreak'
Source: "MyProg-ARM64.exe"; DestDir: "{app}"; DestName: "MyProg.exe"; Check: InstallARM64; Flags: solidbreak

; Поместите здесь все x86 файлы, для первого должен быть установлен флаг 'solidbreak'
Source: "MyProg.exe"; DestDir: "{app}"; Check: InstallOtherArch; Flags: solidbreak

; Поместите здесь все общие файлы, для первого должен быть установлен флаг 'solidbreak'
Source: "MyProg.chm"; DestDir: "{app}"; Flags: solidbreak
Source: "Readme.txt"; DestDir: "{app}"; Flags: isreadme

[Icons]
Name: "{group}\My Program"; Filename: "{app}\MyProg.exe"

[Code]
function InstallX64: Boolean;
begin
  Result := Is64BitInstallMode and (ProcessorArchitecture = paX64);
end;

function InstallARM64: Boolean;
begin
  Result := Is64BitInstallMode and (ProcessorArchitecture = paARM64);
end;

function InstallOtherArch: Boolean;
begin
  Result := not InstallX64 and not InstallARM64;
end;
