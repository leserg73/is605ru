; -- Example2.iss --
;
; ���� ������ ���������� �������� Example1.iss, �� ����������� ����� �������� ������.
; �� ����� ������ � ���� ���� -> ���������, � ����� �� ������� �����.

; ���������� � ���������� ������������, ����� ������������ ��� ����������� INNO SETUP!

[Setup]
AppName=My Program
AppVersion=1.5
WizardStyle=modern
DefaultDirName={autopf}\My Program

; ��������� �� �� ����� ��������� ������ � "{group}", ��
; ������ ������� �� ����������� ��� ����� � ���� ����:
DisableProgramGroupPage=yes

UninstallDisplayIcon={app}\MyProg.exe
Compression=lzma2
SolidCompression=yes
OutputDir=userdocs:Inno Setup Examples Output

; ���������� ����� � �������� ������������/��������������
; ("SetupStyleFile=" ���������� ���� � ���� ����� *.vsf)
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
