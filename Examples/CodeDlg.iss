; -- CodeDlg.iss --
;
; ������������� �������� ����������� ������� ������� ��������� � �� ���������.
; ����� ���� ����������, ��� ��������� �������� ������ ����� ������� [Code] �
; �������� �������� Inno Setup, ��������� ��������� {code:...}. � �������
; ����������, ��� �������� ��������� ������ �� �������� "��� ������ ���������".

; ���������� � ���������� ������������, ����� ������������ ��� ����������� INNO SETUP!

[Setup]
AppName=My Program
AppVersion=1.5
WizardStyle=modern
DisableWelcomePage=no
DefaultDirName={autopf}\My Program
DisableProgramGroupPage=yes
UninstallDisplayIcon={app}\MyProg.exe
OutputDir=userdocs:Inno Setup Examples Output
PrivilegesRequired=lowest

; ���������� ����� � �������� ������������/��������������
; ("SetupStyleFile=" ���������� ���� � ���� ����� *.vsf)
SetupStyleFile="compiler:Examples\Glow.vsf"

[Languages]
Name: ru; MessagesFile: "compiler:Languages\Russian.isl"

[Files]
Source: "MyProg.exe"; DestDir: "{app}"
Source: "MyProg.chm"; DestDir: "{app}"
Source: "Readme.txt"; DestDir: "{app}"; Flags: isreadme

[Registry]
Root: HKA; Subkey: "Software\My Company"; Flags: uninsdeletekeyifempty
Root: HKA; Subkey: "Software\My Company\My Program"; Flags: uninsdeletekey
Root: HKA; Subkey: "Software\My Company\My Program\Settings"; ValueType: string; ValueName: "Name"; ValueData: "{code:GetUser|Name}"
Root: HKA; Subkey: "Software\My Company\My Program\Settings"; ValueType: string; ValueName: "Company"; ValueData: "{code:GetUser|Company}"
Root: HKA; Subkey: "Software\My Company\My Program\Settings"; ValueType: string; ValueName: "DataDir"; ValueData: "{code:GetDataDir}"
; � ��� �����.

[Dirs]
Name: {code:GetDataDir}; Flags: uninsneveruninstall

[Code]
var
  UserPage: TInputQueryWizardPage;
  UsagePage: TInputOptionWizardPage;
  LightMsgPage: TOutputMsgWizardPage;
  KeyPage: TInputQueryWizardPage;
  ProgressPage: TOutputProgressWizardPage;
  DataDirPage: TInputDirWizardPage;
  
procedure InitializeWizard;
begin
  { ������� �������� }
  
  UserPage := CreateInputQueryPage(wpWelcome,
    '������������ ������', '��� ��?',
    '������� ���� ��� � ��������, � ������� �� ���������, ����� ������� "�����".');
  UserPage.Add('���:', False);
  UserPage.Add('��������:', False);

  UsagePage := CreateInputOptionPage(UserPage.ID,
    '������������ ������', '��� �� ������ ������������ "My Program"?',
    '��������, � ����� ������ �� ���������� ������������ "My Program", ����� ������� "�����".',
    True, False);
  UsagePage.Add('���������� (� ��������, ������������ ����������������)');
  UsagePage.Add('��������� (� ��������, ������ ����������������)');
  UsagePage.Add('������� (��� �������, ������ ����������������)');

  LightMsgPage := CreateOutputMsgPage(UsagePage.ID,
    '������������ ������', '��� �� ������ ������������ "My Program"',
    '����������: ����� ��������������� ����� ���������, ������� ����� ���������� ' +
    '"My Program", � ���������� � ���������� ����������, �� � ����� ����� � ���� ' +
    '"�������" ������ ������� ����� ������������� "My Program" ��� ����� ���������.'#13#13 +
    '������� "�����", ���� ������ �������� ����� ������������� ������, ��� ������� ' +
    '"�����", ����� ���������� ���������.');

  KeyPage := CreateInputQueryPage(UsagePage.ID,
    '������������ ������', '� ��� ���� ���� �����������?',
    '������� ��� ���� ����������� � ������� "�����", ����� ���������� ���������. ���� � ��� ��� ' +
    '����� �����������, ������� "�����" � �������� ������ ����� �������������.');
  KeyPage.Add('���� �����������:', False);

  ProgressPage := CreateOutputProgressPage('������������ ������',
    '��� ���� �����������?');

  DataDirPage := CreateInputDirPage(wpSelectDir,
    '������� ������������ ������', '����� ��������� ������ � ������������� �������?',
    '�������� �����, � ������� ����� ����������� ����� � ������������� �������, � ������� "�����".',
    False, '');
  DataDirPage.Add('');

  { ������������� �������� �� ���������, ��������� ���������, ����������� ����� }

  UserPage.Values[0] := GetPreviousData('Name', ExpandConstant('{sysuserinfoname}'));
  UserPage.Values[1] := GetPreviousData('Company', ExpandConstant('{sysuserinfoorg}'));

  case GetPreviousData('UsageMode', '') of
    'light': UsagePage.SelectedValueIndex := 0;
    'sponsored': UsagePage.SelectedValueIndex := 1;
    'paid': UsagePage.SelectedValueIndex := 2;
  else
    UsagePage.SelectedValueIndex := 1;
  end;

  DataDirPage.Values[0] := GetPreviousData('DataDir', '');
end;

procedure RegisterPreviousData(PreviousDataKey: Integer);
var
  UsageMode: String;
begin
  { ��������� ��������� ��� ���������� ������������� }
  SetPreviousData(PreviousDataKey, 'Name', UserPage.Values[0]);
  SetPreviousData(PreviousDataKey, 'Company', UserPage.Values[1]);
  case UsagePage.SelectedValueIndex of
    0: UsageMode := 'light';
    1: UsageMode := 'sponsored';
    2: UsageMode := 'paid';
  end;
  SetPreviousData(PreviousDataKey, 'UsageMode', UsageMode);
  SetPreviousData(PreviousDataKey, 'DataDir', DataDirPage.Values[0]);
end;

function ShouldSkipPage(PageID: Integer): Boolean;
begin
  { ���������� ��������, ������� �� ������ ���� �������� }
  if (PageID = LightMsgPage.ID) and (UsagePage.SelectedValueIndex <> 0) then
    Result := True
  else if (PageID = KeyPage.ID) and (UsagePage.SelectedValueIndex <> 2) then
    Result := True
  else
    Result := False;
end;

function NextButtonClick(CurPageID: Integer): Boolean;
var
  I: Integer;
begin
  { �������� ������� �� ��������� ������ }
  if CurPageID = UserPage.ID then begin
    if UserPage.Values[0] = '' then begin
      MsgBox('�� ������ ������ ���.', mbError, MB_OK);
      Result := False;
    end else begin
      if DataDirPage.Values[0] = '' then
        DataDirPage.Values[0] := 'C:\' + UserPage.Values[0];
      Result := True;
    end;
  end else if CurPageID = KeyPage.ID then begin
    { Just to show how 'OutputProgress' pages work.
      Always use a try..finally between the Show and Hide calls as shown below. }
    ProgressPage.SetText('�������� ����� �����������...', '');
    ProgressPage.SetProgress(0, 0);
    ProgressPage.Show;
    try
      for I := 0 to 10 do begin
        ProgressPage.SetProgress(I, 10);
        Sleep(100);
      end;
    finally
      ProgressPage.Hide;
    end;
    if GetSHA1OfString('codedlg' + KeyPage.Values[0]) = '8013f310d340dab18a0d0cda2b5b115d2dcd97e4' then
      Result := True
    else begin
      MsgBox('���� ����������������. (���������: ������� "inno".)', mbError, MB_OK);
      Result := False;
    end;
  end else
    Result := True;
end;

function UpdateReadyMemo(Space, NewLine, MemoUserInfoInfo, MemoDirInfo, MemoTypeInfo,
  MemoComponentsInfo, MemoGroupInfo, MemoTasksInfo: String): String;
var
  S: String;
begin
  { ������������ ������ ��� 'Ready Memo' � �������� � ������������ ����������� }
  S := '';
  S := S + '������������ ������:' + NewLine;
  S := S + Space + UserPage.Values[0] + NewLine;
  if UserPage.Values[1] <> '' then
    S := S + Space + UserPage.Values[1] + NewLine;
  S := S + NewLine;
  
  S := S + '����� �������������:' + NewLine + Space;
  case UsagePage.SelectedValueIndex of
    0: S := S + '����������';
    1: S := S + '���������';
    2: S := S + '�������';
  end;
  S := S + NewLine + NewLine;
  
  S := S + MemoDirInfo + NewLine;
  S := S + Space + DataDirPage.Values[0] + ' (����� ������������ ������)' + NewLine;

  Result := S;
end;

function GetUser(Param: String): String;
begin
  { ��������� ���������������� �������� }
  { ����� ����� ��������� �� ��������� ������� GetUserName � GetUserCompany }
  if Param = 'Name' then
    Result := UserPage.Values[0]
  else if Param = 'Company' then
    Result := UserPage.Values[1];
end;

function GetDataDir(Param: String): String;
begin
  { ����������� ���������� �������� DataDir }
  Result := DataDirPage.Values[0];
end;
