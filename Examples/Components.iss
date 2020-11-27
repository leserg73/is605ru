; -- Components.iss --
;
; Демонстрирует установку с выбором компонентов.

; ОБРАТИТЕСЬ К СПРАВОЧНОЙ ДОКУМЕНТАЦИИ, ЧТОБЫ ИСПОЛЬЗОВАТЬ ВСЕ ВОЗМОЖНОСТИ INNO SETUP!

[Setup]
AppName=My Program
AppVersion=1.5
WizardStyle=modern
DefaultDirName={autopf}\My Program
DefaultGroupName=My Program
UninstallDisplayIcon={app}\MyProg.exe
OutputDir=userdocs:Inno Setup Examples Output

; Применение стиля к диалогам инсталлятора/деинсталлятора
; ("SetupStyleFile=" определяет путь и файл стиля *.vsf)
SetupStyleFile="compiler:Examples\Glow.vsf"

[Languages]
Name: ru; MessagesFile: "compiler:Languages\Russian.isl"

[Types]
Name: "full"; Description: "Полная установка"
Name: "compact"; Description: "Минимальная установка"
Name: "custom"; Description: "Выборная установка"; Flags: iscustom

[Components]
Name: "program"; Description: "Файлы программы"; Types: full compact custom; Flags: fixed
Name: "help"; Description: "Файл справки"; Types: full
Name: "readme"; Description: "Файл Readme"; Types: full
Name: "readme\en"; Description: "На английском языке"; Flags: exclusive
Name: "readme\de"; Description: "На немецком языке"; Flags: exclusive
Name: "readme\ru"; Description: "На русском языке"; Flags: exclusive

[Files]
Source: "MyProg.exe"; DestDir: "{app}"; Components: program
Source: "MyProg.chm"; DestDir: "{app}"; Components: help
Source: "Readme.txt"; DestDir: "{app}"; Components: readme\en; Flags: isreadme
Source: "Readme-German.txt"; DestName: "Liesmich.txt"; DestDir: "{app}"; Components: readme\de; Flags: isreadme
Source: "Readme-Russian.txt"; DestName: "ПрочтиМеня.txt"; DestDir: "{app}"; Components: readme\ru; Flags: isreadme

[Icons]
Name: "{group}\My Program"; Filename: "{app}\MyProg.exe"
