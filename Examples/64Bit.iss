; -- 64Bit.iss --
;
; ������������� ��������� ���������, ��������� ��� x64 (a.k.a. AMD64) �����������.
; ��� ��������� ������� ����� ������������ � ���������, ������� �� �������������,
; � ��� ������ ���� 64-��� ������ Windows.

; ���������� � ���������� ������������, ����� ������������ ��� ����������� INNO SETUP!

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

; "ArchitecturesAllowed=x64" ��������� ����������� �������
; ��������� ��������� ������ �� x64 �����������.
ArchitecturesAllowed=x64

; "ArchitecturesInstallIn64BitMode=x64" ��������� ��������� ���������
; � "64-��� ������" �� x64 �������. ��� ��������, ��� ����� ��������������
; 64-��� ������� "Program Files" � 64-��� ������������� �������.
ArchitecturesInstallIn64BitMode=x64

; ���������� ����� � �������� ������������/��������������
; ("SetupStyleFile=" ���������� ���� � ���� ����� *.vsf)
SetupStyleFile="compiler:Examples\Glow.vsf"

[Languages]
Name: ru; MessagesFile: "compiler:Languages\Russian.isl"

[Files]
Source: "MyProg-x64.exe"; DestDir: "{app}"; DestName: "MyProg.exe"
Source: "MyProg.chm"; DestDir: "{app}"
Source: "Readme.txt"; DestDir: "{app}"; Flags: isreadme

[Icons]
Name: "{group}\My Program"; Filename: "{app}\MyProg.exe"
