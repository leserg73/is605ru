; -- 64BitTwoArch.iss --
;
; ������������� ��������� ���������, ��������� ��� ���� ���������
; ���������� (x86 � x64), ��������� ���� �����������: �� "x86"
; ��������� Windows ����� ����������� x86 ������ ���������, � ��
; "x64" ��������� Windows ����� ����������� x64 ������.

; ���������� � ���������� ������������, ����� ������������ ��� ����������� INNO SETUP!

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

; "ArchitecturesInstallIn64BitMode=x64" ��������� ��������� ���������
; � "64-��� ������" �� x64 & ARM64 ��������. ��� ��������, ��� �����
; �������������� 64-��� ������� "Program Files" � 64-��� �������������
; �������. �� ���� ��������� ������������ ��������� ����� � "32-��� ������".
ArchitecturesInstallIn64BitMode=x64
; ����������: �� �� ���������� ProcessorsAllowed, �.�. �����, �����
; ����������� ��� ���� ������� �� ���� ������������ (������� Itanium,
; ��� ��� �� ����� �������� ��������� 32-��� ���).

; ���������� ����� � �������� ������������/��������������
; ("SetupStyleFile=" ���������� ���� � ���� ����� *.vsf)
SetupStyleFile="compiler:Examples\Glow.vsf"

[Languages]
Name: ru; MessagesFile: "compiler:Languages\Russian.isl"

[Files]
; ���� MyProg-x64.exe ����� ���������� ��� ������� �� x64 �������
; ���� MyProg.exe ����� ���������� �� ���� ��������� �������

; ��������� ����� ��� x64 �����
Source: "MyProg-x64.exe"; DestDir: "{app}"; DestName: "MyProg.exe"; Check: Is64BitInstallMode

; ��������� ����� ��� x86 �����, ��� ������� ������ ���� ���������� ���� 'solidbreak'
Source: "MyProg.exe"; DestDir: "{app}"; Check: not Is64BitInstallMode; Flags: solidbreak

; ��������� ����� ��� ����� �����, ��� ������� ������ ���� ���������� ���� 'solidbreak'
Source: "MyProg.chm"; DestDir: "{app}"; Flags: solidbreak
Source: "Readme.txt"; DestDir: "{app}"; Flags: isreadme

[Icons]
Name: "{group}\My Program"; Filename: "{app}\MyProg.exe"
