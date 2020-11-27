; -- Languages.iss --
;
; ������������� ������������ ���������.

; ���������� � ���������� ������������, ����� ������������ ��� ����������� INNO SETUP!

[Setup]
AppName={cm:MyAppName}
AppId=My Program
AppVerName={cm:MyAppVerName,1.5}
WizardStyle=modern
DefaultDirName={autopf}\{cm:MyAppName}
DefaultGroupName={cm:MyAppName}
UninstallDisplayIcon={app}\MyProg.exe
VersionInfoDescription=My Program Setup
VersionInfoProductName=My Program
OutputDir=userdocs:Inno Setup Examples Output

; ���������������� ��� ���������� ������� "����� ����� ���������"
; � ��������������� ������ �������� �������� ���������� �������.
;ShowLanguageDialog=no

; ���������� ����� � �������� ������������/��������������
; ("SetupStyleFile=" ���������� ���� � ���� ����� *.vsf)
SetupStyleFile="compiler:Examples\Glow.vsf"

[Languages]
Name: en; MessagesFile: "compiler:Default.isl"
Name: nl; MessagesFile: "compiler:Languages\Dutch.isl"
Name: de; MessagesFile: "compiler:Languages\German.isl"
Name: ru; MessagesFile: "compiler:Languages\Russian.isl"

[Messages]
en.BeveledLabel=English
nl.BeveledLabel=Nederlands
de.BeveledLabel=Deutsch
ru.BeveledLabel=�������

[CustomMessages]
en.MyDescription=My description
en.MyAppName=My Program
en.MyAppVerName=My Program %1
nl.MyDescription=Mijn omschrijving
nl.MyAppName=Mijn programma
nl.MyAppVerName=Mijn programma %1
de.MyDescription=Meine Beschreibung
de.MyAppName=Meine Anwendung
de.MyAppVerName=Meine Anwendung %1
ru.MyDescription=��������
ru.MyAppName=��������� ����
ru.MyAppVerName=��������� ���� %1

[Files]
Source: "MyProg.exe"; DestDir: "{app}"
Source: "MyProg.chm"; DestDir: "{app}"; Languages: en
Source: "Readme.txt"; DestDir: "{app}"; Languages: en; Flags: isreadme
Source: "Readme-Dutch.txt"; DestName: "Leesmij.txt"; DestDir: "{app}"; Languages: nl; Flags: isreadme
Source: "Readme-German.txt"; DestName: "Liesmich.txt"; DestDir: "{app}"; Languages: de; Flags: isreadme
Source: "Readme-Russian.txt"; DestName: "����������.txt"; DestDir: "{app}"; Languages: ru; Flags: isreadme

[Icons]
Name: "{group}\{cm:MyAppName}"; Filename: "{app}\MyProg.exe"
Name: "{group}\{cm:UninstallProgram,{cm:MyAppName}}"; Filename: "{uninstallexe}"

[Tasks]
; ��������� ������ ������ �� ������ � ������ ������ ��� ������������ [CustomMessages]
Name: mytask; Description: "{cm:MyDescription}"
