; -- Example3.iss --
;
; ���� ������ ���������� �������� Example1.iss, �� ��� ������������� 
; ������� ����� � ������� � ��������� ������������ ������� ����� ���������
; (���������������� ��� �� ����������������).

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
ChangesAssociations=yes
UserInfoPage=yes
PrivilegesRequiredOverridesAllowed=dialog

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
Name: "{group}\My Program"; Filename: "{app}\MyProg.exe"

; ���������: ����������� ���������� �� ��������� �������������� ��������� �����
; � �������. ���� �� �� ������, ��� ����� "������" � ��� ��� ����� ������������,
; �� ������ ����� ������ [Registry] ��� �� �����.

[Registry]
; ������� ���� "Software\My Company\My Program" � ������� CURRENT_USER ���
; LOCAL_MACHINE � ����������� �� ������ ��������� (���������������� ��� ��
; ����������������). ����� ��������� �������� ����� "My Program" � ��������
; ����� "My Company", ���� �� ������, ��� �������������.
Root: HKA; Subkey: "Software\My Company"; Flags: uninsdeletekeyifempty
Root: HKA; Subkey: "Software\My Company\My Program"; Flags: uninsdeletekey
Root: HKA; Subkey: "Software\My Company\My Program\Settings"; ValueType: string; ValueName: "Language"; ValueData: "{language}"

; ���������� ������ � ����������� .myp � ���������� "My Program"
; (��������� ������������ ChangesAssociations=yes)
Root: HKA; Subkey: "Software\Classes\.myp"; ValueType: string; ValueName: ""; ValueData: "MyProgramFile.myp"; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\.myp\OpenWithProgids"; ValueType: string; ValueName: "MyProgramFile.myp"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\MyProgramFile.myp"; ValueType: string; ValueName: ""; ValueData: "My Program File"; Flags: uninsdeletekey
Root: HKA; Subkey: "Software\Classes\MyProgramFile.myp\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\MyProg.exe,0"
Root: HKA; Subkey: "Software\Classes\MyProgramFile.myp\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\MyProg.exe"" ""%1"""

; ������� ������� HKA (� HKCU) ������� ������������ ������ ��� ��������,
; ������� ���������� � ������������� ���������, ������� ����� ���������,
; ��� ����, ������ ���� �������� � HKLM, ��� �������� ������ � ������
; ���������������� ���������.
Root: HKLM; Subkey: "Software\My Company"; Flags: uninsdeletekeyifempty; Check: IsAdminInstallMode
Root: HKLM; Subkey: "Software\My Company\My Program"; Flags: uninsdeletekey; Check: IsAdminInstallMode
Root: HKLM; Subkey: "Software\My Company\My Program\Settings"; ValueType: string; ValueName: "InstallPath"; ValueData: "{app}"; Check: IsAdminInstallMode

; ���������������� ��������� ������ ������ ���� �������� � HKCU,
; ��� ������ ���� ������� ������ � ������ �� ���������������� ���������.
Root: HKCU; Subkey: "Software\My Company\My Program\Settings"; ValueType: string; ValueName: "UserName"; ValueData: "{userinfoname}"; Check: not IsAdminInstallMode
Root: HKCU; Subkey: "Software\My Company\My Program\Settings"; ValueType: string; ValueName: "UserOrganization"; ValueData: "{userinfoorg}"; Check: not IsAdminInstallMode

[Code]
function ShouldSkipPage(PageID: Integer): Boolean;
begin
  // �������� � ������� ������������ ����� ���� ��������� � ������ ���������������� ���������
  Result := IsAdminInstallMode and (PageID = wpUserInfo);
end;
