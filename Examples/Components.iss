; -- Components.iss --
;
; ������������� ��������� � ������� �����������.

; ���������� � ���������� ������������, ����� ������������ ��� ����������� INNO SETUP!

[Setup]
AppName=My Program
AppVersion=1.5
WizardStyle=modern
DefaultDirName={autopf}\My Program
DefaultGroupName=My Program
UninstallDisplayIcon={app}\MyProg.exe
OutputDir=userdocs:Inno Setup Examples Output

; ���������� ����� � �������� ������������/��������������
; ("SetupStyleFile=" ���������� ���� � ���� ����� *.vsf)
SetupStyleFile="compiler:Examples\Glow.vsf"

[Languages]
Name: ru; MessagesFile: "compiler:Languages\Russian.isl"

[Types]
Name: "full"; Description: "������ ���������"
Name: "compact"; Description: "����������� ���������"
Name: "custom"; Description: "�������� ���������"; Flags: iscustom

[Components]
Name: "program"; Description: "����� ���������"; Types: full compact custom; Flags: fixed
Name: "help"; Description: "���� �������"; Types: full
Name: "readme"; Description: "���� Readme"; Types: full
Name: "readme\en"; Description: "�� ���������� �����"; Flags: exclusive
Name: "readme\de"; Description: "�� �������� �����"; Flags: exclusive
Name: "readme\ru"; Description: "�� ������� �����"; Flags: exclusive

[Files]
Source: "MyProg.exe"; DestDir: "{app}"; Components: program
Source: "MyProg.chm"; DestDir: "{app}"; Components: help
Source: "Readme.txt"; DestDir: "{app}"; Components: readme\en; Flags: isreadme
Source: "Readme-German.txt"; DestName: "Liesmich.txt"; DestDir: "{app}"; Components: readme\de; Flags: isreadme
Source: "Readme-Russian.txt"; DestName: "����������.txt"; DestDir: "{app}"; Components: readme\ru; Flags: isreadme

[Icons]
Name: "{group}\My Program"; Filename: "{app}\MyProg.exe"
