; -- UninstallCodeExample1.iss --
;
; ������������� ����������� ������������� ������ [Code] ��� ������������� (Uninstall).

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

[Files]
Source: "MyProg.exe"; DestDir: "{app}"
Source: "MyProg.chm"; DestDir: "{app}"
Source: "Readme.txt"; DestDir: "{app}"; Flags: isreadme

[Code]
function InitializeUninstall(): Boolean;
begin
  Result := MsgBox('InitializeUninstall:' #13#13 '��������� ������������� ��������������. �� ������������� ������ ������ ��������?', mbConfirmation, MB_YESNO) = idYes;
  if Result = False then
    MsgBox('InitializeUninstall:' #13#13 '��, �����. ����-����.', mbInformation, MB_OK);
end;

procedure DeinitializeUninstall();
begin
  MsgBox('DeinitializeUninstall:' #13#13 '����-����!', mbInformation, MB_OK);
end;

procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
begin
  case CurUninstallStep of
    usUninstall:
      begin
        MsgBox('CurUninstallStepChanged:' #13#13 '����� �������� �������������.', mbInformation, MB_OK)
        // ...����� �������� ��� ��� ���������� �����-�� ����� ����� ��������������...
      end;
    usPostUninstall:
      begin
        MsgBox('CurUninstallStepChanged:' #13#13 '������������� ���������.', mbInformation, MB_OK);
        // ...����� �������� ��� ��� ���������� �����-�� ����� ����� �������������...
      end;
  end;
end;
