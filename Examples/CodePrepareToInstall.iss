; -- CodePrepareToInstall.iss --
;
; ������������� ����������� ������������� ������� ������� PrepareToInstall
; ��� ��������� ������ ������, �������� ������������ � ��������� �����
; ������������, ��������� ��������� ������������� �����.

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
; ���������� ����� ��� ������ �����, ��������:
; Source: "MyProg-Prerequisite-setup.exe"; Flags: dontcopy

; ���������� ����� ��� ��������� ����� ����� ������
Source: "MyProg.exe"; DestDir: "{app}";
Source: "MyProg.chm"; DestDir: "{app}";
Source: "Readme.txt"; DestDir: "{app}"; Flags: isreadme;

[Icons]
Name: "{group}\My Program"; Filename: "{app}\MyProg.exe"

[Code]
const
  (*** ������ ��������� (�������� �� �������� ����������� �������). ***)
  RunOnceName = '���������� ��������� My Program';

  QuitMessageReboot = '��������� ������ ������ ��������� �� ���� ���������. ����� ��������� ���������, ���������� ������������� ���������.'#13#13'����� ������������ ���������� ��������� ����� ����������, ��� ������ ������������� ������ � �������.';
  QuitMessageError = '������. ���������� ���������� ���������.';

var
  Restarted: Boolean;

function InitializeSetup(): Boolean;
begin
  Restarted := ExpandConstant('{param:restart|0}') = '1';

  if not Restarted then begin
    Result := not RegValueExists(HKA, 'Software\Microsoft\Windows\CurrentVersion\RunOnce', RunOnceName);
    if not Result then
      MsgBox(QuitMessageReboot, mbError, mb_Ok);
  end else
    Result := True;
end;

function DetectAndInstallPrerequisites: Boolean;
begin
  (*** ���������� ���� ��� ����������� ������������, ���������� � ���������. ***)
  (*** ������� ����� False, ���� ������ ����� �� ������� ��� �� ��������� �� �������, ����� True. ***)

  //<������� ����� ��� ���>
  //������ ����������: ExtractTemporaryFile('MyProg-Prerequisite-setup.exe');

  Result := True;

  (*** ������� ��������� ���� ����. �� ������������ ������ ��� �������� ��������� ������������ � ������������. ***)
  if not Restarted then
    RestartReplace(ParamStr(0), '');
end;

function Quote(const S: String): String;
begin
  Result := '"' + S + '"';
end;

function AddParam(const S, P, V: String): String;
begin
  if V <> '""' then
    Result := S + ' /' + P + '=' + V;
end;

function AddSimpleParam(const S, P: String): String;
begin
 Result := S + ' /' + P;
end;

procedure CreateRunOnceEntry;
var
  RunOnceData: String;
begin
  RunOnceData := Quote(ExpandConstant('{srcexe}')) + ' /restart=1';
  RunOnceData := AddParam(RunOnceData, 'LANG', ExpandConstant('{language}'));
  RunOnceData := AddParam(RunOnceData, 'DIR', Quote(WizardDirValue));
  RunOnceData := AddParam(RunOnceData, 'GROUP', Quote(WizardGroupValue));
  if WizardNoIcons then
     RunOnceData := AddSimpleParam(RunOnceData, 'NOICONS');
  RunOnceData := AddParam(RunOnceData, 'TYPE', Quote(WizardSetupType(False)));
  RunOnceData := AddParam(RunOnceData, 'COMPONENTS', Quote(WizardSelectedComponents(False)));
  RunOnceData := AddParam(RunOnceData, 'TASKS', Quote(WizardSelectedTasks(False)));

  (*** ���������� ���� ��������� ������������� ������, ������� ���������� ���������. ***)

  //<������� ����� ��� ���>
  
  RegWriteStringValue(HKA, 'Software\Microsoft\Windows\CurrentVersion\RunOnce', RunOnceName, RunOnceData);
end;

function PrepareToInstall(var NeedsRestart: Boolean): String;
var
  ChecksumBefore, ChecksumAfter: String;
begin
  ChecksumBefore := MakePendingFileRenameOperationsChecksum;
  if DetectAndInstallPrerequisites then begin
    ChecksumAfter := MakePendingFileRenameOperationsChecksum;
    if ChecksumBefore <> ChecksumAfter then begin
      CreateRunOnceEntry;
      NeedsRestart := True;
      Result := QuitMessageReboot;
    end;
  end else
    Result := QuitMessageError;
end;

function ShouldSkipPage(PageID: Integer): Boolean;
begin
  Result := Restarted;
end;

