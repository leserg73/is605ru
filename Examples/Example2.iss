; -- Example2.iss --
;
; Этот пример аналогичен сценарию Example1.iss, за исключением места создания значка.
; Он будет создан в меню ПУСК -> Программы, а также на Рабочем столе.

; ОБРАТИТЕСЬ К СПРАВОЧНОЙ ДОКУМЕНТАЦИИ, ЧТОБЫ ИСПОЛЬЗОВАТЬ ВСЕ ВОЗМОЖНОСТИ INNO SETUP!

[Setup]
AppName=My Program
AppVersion=1.5
WizardStyle=modern
DefaultDirName={autopf}\My Program

; Поскольку мы не будем создавать значки в "{group}", то
; укажем мастеру не запрашивать имя папки в меню ПУСК:
DisableProgramGroupPage=yes

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
Name: "{autoprograms}\My Program"; Filename: "{app}\MyProg.exe"
Name: "{autodesktop}\My Program"; Filename: "{app}\MyProg.exe"
