; -- CodeDll.iss --
;
; Демонстрирует использование вызовов из внешних динамических библиотек DLL
; (подобно функциям Windows API) во время выполнения, а также обработку
; прямых обратных вызовов из этих функций в функции сценария.

; ОБРАТИТЕСЬ К СПРАВОЧНОЙ ДОКУМЕНТАЦИИ, ЧТОБЫ ИСПОЛЬЗОВАТЬ ВСЕ ВОЗМОЖНОСТИ INNO SETUP!

[Setup]
AppName=My Program
AppVersion=1.5
WizardStyle=modern
DefaultDirName={autopf}\My Program
DisableProgramGroupPage=yes
DisableWelcomePage=no
UninstallDisplayIcon={app}\MyProg.exe
OutputDir=userdocs:Inno Setup Examples Output

; Применение стиля к диалогам инсталлятора/деинсталлятора
; ("SetupStyleFile=" определяет путь и файл стиля *.vsf)
SetupStyleFile="compiler:Examples\Glow.vsf"

[Languages]
Name: ru; MessagesFile: "compiler:Languages\Russian.isl"

[Files]
Source: "MyProg.exe"; DestDir: "{app}"
Source: "MyProg.chm"; DestDir: "{app}"
Source: "Readme.txt"; DestDir: "{app}"; Flags: isreadme
; Установка нашего файла DLL в {app}, чтобы получить к нему доступ при деинсталляции.
; Используйте "Flags: dontcopy", если не нужен доступ во время деинсталляции.
Source: "MyDll.dll"; DestDir: "{app}"

[Code]
const
  MB_ICONINFORMATION = $40;

// Импорт функции (Unicode) Windows API.
function MessageBox(hWnd: Integer; lpText, lpCaption: String; uType: Cardinal): Integer;
external 'MessageBoxW@user32.dll stdcall';

// Импорт собственной функции (ANSI) из DLL сначала для установки, потом для удаления.
procedure MyDllFuncSetup(hWnd: Integer; lpText, lpCaption: AnsiString; uType: Cardinal);
external 'MyDllFunc@files:MyDll.dll stdcall setuponly';

procedure MyDllFuncUninstall(hWnd: Integer; lpText, lpCaption: AnsiString; uType: Cardinal);
external 'MyDllFunc@{app}\MyDll.dll stdcall uninstallonly';

// Отложенный импорт собственной функции (ANSI) для DLL.
procedure DelayLoadedFunc(hWnd: Integer; lpText, lpCaption: AnsiString; uType: Cardinal);
external 'DllFunc@DllWhichMightNotExist.dll stdcall delayload';

function NextButtonClick(CurPage: Integer): Boolean;
var
  hWnd: Integer;
begin
  if CurPage = wpWelcome then begin
    hWnd := StrToInt(ExpandConstant('{wizardhwnd}'));

    MessageBox(hWnd, 'Привет от функции Windows API', 'MessageBoxA', MB_OK or MB_ICONINFORMATION);

    MyDllFuncSetup(hWnd, 'Привет от функции DLL', 'MyDllFunc', MB_OK or MB_ICONINFORMATION);

    try
      // Если этой DLL не существует (не обязательно), будет вызвано исключение. Чтобы продолжить, нажмите F9.
      DelayLoadedFunc(hWnd, 'Привет отложенной функции', 'DllFunc', MB_OK or MB_ICONINFORMATION);
    except
      // <Здесь дескриптор отсутствующей DLL>
    end;
  end;
  Result := True;
end;

procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
begin
  // Вызов нашей функции из DLL перед началом процесса деинсталляции.
  if CurUninstallStep = usUninstall then begin
    MyDllFuncUninstall(0, 'Привет от функции DLL', 'MyDllFunc', MB_OK or MB_ICONINFORMATION);
    
    // После завершения выгружаем наш файл MyDll.dll из памяти.
    // Это необходимо сделать для того, чтобы деинсталлятор смог удалить файл DLL и каталог {app}.
    UnloadDLL(ExpandConstant('{app}\MyDll.dll'));
  end;
end;

// Следующий код показывает использование обратных вызовов.

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
