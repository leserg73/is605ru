; -- 64BitThreeArch.iss --
;
; ������������� ��������� ���������, ��������� ��� ���� ���������
; ���������� (x86, x64, ARM64), ��������� ���� �����������.

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

; "ArchitecturesInstallIn64BitMode=x64 arm64" ��������� ��������� ���������
; � "64-��� ������" �� x64 & ARM64 ��������. ��� ��������, ��� �����
; �������������� 64-��� ������� "Program Files" � 64-��� �������������
; �������. �� ���� ��������� ������������ ��������� ����� � "32-��� ������".
ArchitecturesInstallIn64BitMode=x64 arm64

; ���������� ����� � �������� ������������/��������������
; ("SetupStyleFile=" ���������� ���� � ���� ����� *.vsf)
SetupStyleFile="compiler:Examples\Glow.vsf"

[Languages]
Name: ru; MessagesFile: "compiler:Languages\Russian.isl"

[Files]
; ���� MyProg-x64.exe ����� ���������� ��� ������� �� x64 �������
; ���� MyProg-ARM64.exe ����� ���������� ��� ������� �� ARM64 ������� 
; ���� MyProg.exe ����� ���������� �� ���� ��������� �������

; ��������� ����� ��� x64 �����
Source: "MyProg-x64.exe"; DestDir: "{app}"; DestName: "MyProg.exe"; Check: InstallX64

; ��������� ����� ��� ARM64 �����, ��� ������� ������ ���� ���������� ���� 'solidbreak'
Source: "MyProg-ARM64.exe"; DestDir: "{app}"; DestName: "MyProg.exe"; Check: InstallARM64; Flags: solidbreak

; ��������� ����� ��� x86 �����, ��� ������� ������ ���� ���������� ���� 'solidbreak'
Source: "MyProg.exe"; DestDir: "{app}"; Check: InstallOtherArch; Flags: solidbreak

; ��������� ����� ��� ����� �����, ��� ������� ������ ���� ���������� ���� 'solidbreak'
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
