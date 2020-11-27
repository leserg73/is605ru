; -- CodeDll.iss --
;
; ������������� ������������� ������� �� ������� ������������ ��������� DLL
; (������� �������� Windows API) �� ����� ����������, � ����� ���������
; ������ �������� ������� �� ���� ������� � ������� ��������.

; ���������� � ���������� ������������, ����� ������������ ��� ����������� INNO SETUP!

[Setup]
AppName=My Program
AppVersion=1.5
WizardStyle=modern
DefaultDirName={autopf}\My Program
DisableProgramGroupPage=yes
DisableWelcomePage=no
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
; ��������� ������ ����� DLL � {app}, ����� �������� � ���� ������ ��� �������������.
; ����������� "Flags: dontcopy", ���� �� ����� ������ �� ����� �������������.
Source: "MyDll.dll"; DestDir: "{app}"

[Code]
const
  MB_ICONINFORMATION = $40;

// ������ ������� (Unicode) Windows API.
function MessageBox(hWnd: Integer; lpText, lpCaption: String; uType: Cardinal): Integer;
external 'MessageBoxW@user32.dll stdcall';

// ������ ����������� ������� (ANSI) �� DLL ������� ��� ���������, ����� ��� ��������.
procedure MyDllFuncSetup(hWnd: Integer; lpText, lpCaption: AnsiString; uType: Cardinal);
external 'MyDllFunc@files:MyDll.dll stdcall setuponly';

procedure MyDllFuncUninstall(hWnd: Integer; lpText, lpCaption: AnsiString; uType: Cardinal);
external 'MyDllFunc@{app}\MyDll.dll stdcall uninstallonly';

// ���������� ������ ����������� ������� (ANSI) ��� DLL.
procedure DelayLoadedFunc(hWnd: Integer; lpText, lpCaption: AnsiString; uType: Cardinal);
external 'DllFunc@DllWhichMightNotExist.dll stdcall delayload';

function NextButtonClick(CurPage: Integer): Boolean;
var
  hWnd: Integer;
begin
  if CurPage = wpWelcome then begin
    hWnd := StrToInt(ExpandConstant('{wizardhwnd}'));

    MessageBox(hWnd, '������ �� ������� Windows API', 'MessageBoxA', MB_OK or MB_ICONINFORMATION);

    MyDllFuncSetup(hWnd, '������ �� ������� DLL', 'MyDllFunc', MB_OK or MB_ICONINFORMATION);

    try
      // ���� ���� DLL �� ���������� (�� �����������), ����� ������� ����������. ����� ����������, ������� F9.
      DelayLoadedFunc(hWnd, '������ ���������� �������', 'DllFunc', MB_OK or MB_ICONINFORMATION);
    except
      // <����� ���������� ������������� DLL>
    end;
  end;
  Result := True;
end;

procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
begin
  // ����� ����� ������� �� DLL ����� ������� �������� �������������.
  if CurUninstallStep = usUninstall then begin
    MyDllFuncUninstall(0, '������ �� ������� DLL', 'MyDllFunc', MB_OK or MB_ICONINFORMATION);
    
    // ����� ���������� ��������� ��� ���� MyDll.dll �� ������.
    // ��� ���������� ������� ��� ����, ����� ������������� ���� ������� ���� DLL � ������� {app}.
    UnloadDLL(ExpandConstant('{app}\MyDll.dll'));
  end;
end;

// ��������� ��� ���������� ������������� �������� �������.

function SetTimer(hWnd, nIDEvent, uElapse, lpTimerFunc: Longword): Longword;
external 'SetTimer@user32.dll stdcall';

var
  TimerCount: Integer;

procedure MyTimerProc(Arg1, Arg2, Arg3, Arg4: Longword);
begin
  Inc(TimerCount);
  WizardForm.BeveledLabel.Caption := ' Timer! ' + IntToStr(TimerCount) + ' ';
  WizardForm.BeveledLabel.Visible := True;
end;

procedure InitializeWizard;
begin
  SetTimer(0, 0, 1000, CreateCallback(@MyTimerProc));
end;
