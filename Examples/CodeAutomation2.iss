; -- CodeAutomation2.iss --
;
; Демонстрирует использование IUnknown на основе объектов COM Automation.
;
; Примечание: некоторые ненужные интерфейсные функции, которые имели специальные типы,
; были заменены на фиктивные (заглушки), чтобы избежать необходимости их определения.
; Не удаляйте эти заглушки, так как это может изменить индексы функций. Кроме того,
; не все прототипы функций были протестированы, только те, что используются в этом примере.

; ОБРАТИТЕСЬ К СПРАВОЧНОЙ ДОКУМЕНТАЦИИ, ЧТОБЫ ИСПОЛЬЗОВАТЬ ВСЕ ВОЗМОЖНОСТИ INNO SETUP!

[Setup]
AppName=My Program
AppVersion=1.5
WizardStyle=modern
DisableWelcomePage=no
CreateAppDir=no
DisableProgramGroupPage=yes
DefaultGroupName=My Program
UninstallDisplayIcon={app}\MyProg.exe
OutputDir=userdocs:Inno Setup Examples Output

; Применение стиля к диалогам инсталлятора/деинсталлятора
; ("SetupStyleFile=" определяет путь и файл стиля *.vsf)
SetupStyleFile="compiler:Examples\Glow.vsf"

[Languages]
Name: ru; MessagesFile: "compiler:Languages\Russian.isl"

[Code]

{--- IShellLink ---}

const
  CLSID_ShellLink = '{00021401-0000-0000-C000-000000000046}';

type
  IShellLinkW = interface(IUnknown)
    '{000214F9-0000-0000-C000-000000000046}'
    procedure Dummy;
    procedure Dummy2;
    procedure Dummy3;
    function GetDescription(pszName: String; cchMaxName: Integer): HResult;
    function SetDescription(pszName: String): HResult;
    function GetWorkingDirectory(pszDir: String; cchMaxPath: Integer): HResult;
    function SetWorkingDirectory(pszDir: String): HResult;
    function GetArguments(pszArgs: String; cchMaxPath: Integer): HResult;
    function SetArguments(pszArgs: String): HResult;
    function GetHotkey(var pwHotkey: Word): HResult;
    function SetHotkey(wHotkey: Word): HResult;
    function GetShowCmd(out piShowCmd: Integer): HResult;
    function SetShowCmd(iShowCmd: Integer): HResult;
    function GetIconLocation(pszIconPath: String; cchIconPath: Integer;
      out piIcon: Integer): HResult;
    function SetIconLocation(pszIconPath: String; iIcon: Integer): HResult;
    function SetRelativePath(pszPathRel: String; dwReserved: DWORD): HResult;
    function Resolve(Wnd: HWND; fFlags: DWORD): HResult;
    function SetPath(pszFile: String): HResult;
  end;

  IPersist = interface(IUnknown)
    '{0000010C-0000-0000-C000-000000000046}'
    function GetClassID(var classID: TGUID): HResult;
  end;

  IPersistFile = interface(IPersist)
    '{0000010B-0000-0000-C000-000000000046}'
    function IsDirty: HResult;
    function Load(pszFileName: String; dwMode: Longint): HResult;
    function Save(pszFileName: String; fRemember: BOOL): HResult;
    function SaveCompleted(pszFileName: String): HResult;
    function GetCurFile(out pszFileName: String): HResult;
  end;

procedure IShellLinkButtonOnClick(Sender: TObject);
var
  Obj: IUnknown;
  SL: IShellLinkW;
  PF: IPersistFile;
begin
  { Создание главного объекта ShellLink COM Automation }
  Obj := CreateComObject(StringToGuid(CLSID_ShellLink));

  { Установка свойств ярлыка }
  SL := IShellLinkW(Obj);
  OleCheck(SL.SetPath(ExpandConstant('{srcexe}')));
  OleCheck(SL.SetArguments(''));
  OleCheck(SL.SetShowCmd(SW_SHOWNORMAL));

  { Запись ярлыка }
  PF := IPersistFile(Obj);
  OleCheck(PF.Save(ExpandConstant('{autodesktop}\CodeAutomation2 Test.lnk'), True));

  MsgBox('Ярлык с именем ''CodeAutomation2 Test'' сохранён на общем Рабочем столе.', mbInformation, mb_Ok);
end;

{--- ITaskScheduler ---}

const
  CLSID_TaskScheduler = '{148BD52A-A2AB-11CE-B11F-00AA00530503}';
  CLSID_Task = '{148BD520-A2AB-11CE-B11F-00AA00530503}';
  IID_Task = '{148BD524-A2AB-11CE-B11F-00AA00530503}';
  TASK_TIME_TRIGGER_DAILY = 1;

type
  ITaskScheduler = interface(IUnknown)
    '{148BD527-A2AB-11CE-B11F-00AA00530503}'
    function SetTargetComputer(pwszComputer: String): HResult;
    function GetTargetComputer(out ppwszComputer: String): HResult;
    procedure Dummy;
    function Activate(pwszName: String; var riid: TGUID; out ppUnk: IUnknown): HResult;
    function Delete(pwszName: String): HResult;
    function NewWorkItem(pwszTaskName: String; var rclsid: TGUID; var riid: TGUID; out ppUnk: IUnknown): HResult;
    procedure Dummy2;
    function IsOfType(pwszName: String; var riid: TGUID): HResult;
  end;

  TDaily = record
    DaysInterval: WORD;
  end;

  TWeekly = record
    WeeksInterval: WORD;
    rgfDaysOfTheWeek: WORD;
  end;

  TMonthyDate = record
    rgfDays: DWORD;
    rgfMonths: WORD;
  end;

  TMonthlyDow = record
    wWhichWeek: WORD;
    rgfDaysOfTheWeek: WORD;
    rgfMonths: WORD;
  end;

  { ROPS не поддерживает объединения, замените его на нужный вам тип и настройте отступы (конечный размер должен быть 48). }
  TTriggerTypeUnion = record
    Daily: TDaily;
    Pad1: WORD;
    Pad2: WORD;
    Pad3: WORD;
  end;

  TTaskTrigger = record
    cbTriggerSize: WORD;
    Reserved1: WORD;
    wBeginYear: WORD;
    wBeginMonth: WORD;
    wBeginDay: WORD;
    wEndYear: WORD;
    wEndMonth: WORD;
    wEndDay: WORD;
    wStartHour: WORD;
    wStartMinute: WORD;
    MinutesDuration: DWORD;
    MinutesInterval: DWORD;
    rgFlags: DWORD;
    TriggerType: DWORD;
    Type_: TTriggerTypeUnion;
    Reserved2: WORD;
    wRandomMinutesInterval: WORD;
  end;

  ITaskTrigger = interface(IUnknown)
    '{148BD52B-A2AB-11CE-B11F-00AA00530503}'
    function SetTrigger(var pTrigger: TTaskTrigger): HResult;
    function GetTrigger(var pTrigger: TTaskTrigger): HResult;
    function GetTriggerString(var ppwszTrigger: String): HResult;
  end;

  IScheduledWorkItem = interface(IUnknown)
    '{A6B952F0-A4B1-11D0-997D-00AA006887EC}'
    function CreateTrigger(out piNewTrigger: Word; out ppTrigger: ITaskTrigger): HResult;
    function DeleteTrigger(iTrigger: Word): HResult;
    function GetTriggerCount(out pwCount: Word): HResult;
    function GetTrigger(iTrigger: Word; var ppTrigger: ITaskTrigger): HResult;
    function GetTriggerString(iTrigger: Word; out ppwszTrigger: String): HResult;
    procedure Dummy;
    procedure Dummy2;
    function SetIdleWait(wIdleMinutes: Word; wDeadlineMinutes: Word): HResult;
    function GetIdleWait(out pwIdleMinutes: Word; out pwDeadlineMinutes: Word): HResult;
    function Run: HResult;
    function Terminate: HResult;
    function EditWorkItem(hParent: HWND; dwReserved: DWORD): HResult;
    procedure Dummy3;
    function GetStatus(out phrStatus: HResult): HResult;
    function GetExitCode(out pdwExitCode: DWORD): HResult;
    function SetComment(pwszComment: String): HResult;
    function GetComment(out ppwszComment: String): HResult;
    function SetCreator(pwszCreator: String): HResult;
    function GetCreator(out ppwszCreator: String): HResult;
    function SetWorkItemData(cbData: Word; var rgbData: Byte): HResult;
    function GetWorkItemData(out pcbData: Word; out prgbData: Byte): HResult;
    function SetErrorRetryCount(wRetryCount: Word): HResult;
    function GetErrorRetryCount(out pwRetryCount: Word): HResult;
    function SetErrorRetryInterval(wRetryInterval: Word): HResult;
    function GetErrorRetryInterval(out pwRetryInterval: Word): HResult;
    function SetFlags(dwFlags: DWORD): HResult;
    function GetFlags(out pdwFlags: DWORD): HResult;
    function SetAccountInformation(pwszAccountName: String; pwszPassword: String): HResult;
    function GetAccountInformation(out ppwszAccountName: String): HResult;
  end;

  ITask = interface(IScheduledWorkItem)
    '{148BD524-A2AB-11CE-B11F-00AA00530503}'
    function SetApplicationName(pwszApplicationName: String): HResult;
    function GetApplicationName(out ppwszApplicationName: String): HResult;
    function SetParameters(pwszParameters: String): HResult;
    function GetParameters(out ppwszParameters: String): HResult;
    function SetWorkingDirectory(pwszWorkingDirectory: String): HResult;
    function GetWorkingDirectory(out ppwszWorkingDirectory: String): HResult;
    function SetPriority(dwPriority: DWORD): HResult;
    function GetPriority(out pdwPriority: DWORD): HResult;
    function SetTaskFlags(dwFlags: DWORD): HResult;
    function GetTaskFlags(out pdwFlags: DWORD): HResult;
    function SetMaxRunTime(dwMaxRunTimeMS: DWORD): HResult;
    function GetMaxRunTime(out pdwMaxRunTimeMS: DWORD): HResult;
  end;


procedure ITaskSchedulerButtonOnClick(Sender: TObject);
var
  Obj, Obj2: IUnknown;
  TaskScheduler: ITaskScheduler;
  G1, G2: TGUID;
  Task: ITask;
  iNewTrigger: WORD;
  TaskTrigger: ITaskTrigger;
  TaskTrigger2: TTaskTrigger;
  PF: IPersistFile;
begin
  { Создание главного объекта TaskScheduler COM Automation }
  Obj := CreateComObject(StringToGuid(CLSID_TaskScheduler));

  { Создание объекта Task COM Automation }
  TaskScheduler := ITaskScheduler(Obj);
  G1 := StringToGuid(CLSID_Task);
  G2 := StringToGuid(IID_Task);
  // Вызываем исключение, если задание уже существует
  OleCheck(TaskScheduler.NewWorkItem('CodeAutomation2 Test', G1, G2, Obj2));

  { Установка свойств задания }
  Task := ITask(Obj2);
  OleCheck(Task.SetComment('CodeAutomation2 Test Comment'));
  OleCheck(Task.SetApplicationName(ExpandConstant('{srcexe}')));

  { Установка данных учетной записи задания }
  // Раскомментируйте команду ниже и предоставьте фактические данные о пользователе, чтобы получить работоспособное задание
  //OleCheck(Task.SetAccountInformation('username', 'password'));

  { Создание объекта TaskTrigger COM Automation }
  OleCheck(Task.CreateTrigger(iNewTrigger, TaskTrigger));

  { Установка свойств срабатывания задания }
  with TaskTrigger2 do begin
    cbTriggerSize := SizeOf(TaskTrigger2);
    wBeginYear := 2009;
    wBeginMonth := 10;
    wBeginDay := 1;
    wStartHour := 12;
    TriggerType := TASK_TIME_TRIGGER_DAILY;
    Type_.Daily.DaysInterval := 1;
  end;
  OleCheck(TaskTrigger.SetTrigger(TaskTrigger2));

  { Запись задания }
  PF := IPersistFile(Obj2);
  OleCheck(PF.Save('', True));

  MsgBox('Создано ежедневное задание с именем ''CodeAutomation2 Test''.' + #13#13 + 'Примечание: Информация об учётной записи не предоставлена, поэтому задание будет неработоспособным. Раскомментируйте вызов SetAccountInfo и укажите фактические данные учётной записи, чтобы получить работоспособное задание.', mbInformation, mb_Ok);
end;

{---}

procedure CreateButton(ALeft, ATop: Integer; ACaption: String; ANotifyEvent: TNotifyEvent);
begin
  with TButton.Create(WizardForm) do begin
    Left := ALeft;
    Top := ATop;
    Width := (WizardForm.CancelButton.Width*3)/2;
    Height := WizardForm.CancelButton.Height;
    Caption := ACaption;
    OnClick := ANotifyEvent;
    Parent := WizardForm.WelcomePage;
  end;
end;

procedure InitializeWizard();
var
  Left, LeftInc, Top, TopInc: Integer;
begin
  Left := WizardForm.WelcomeLabel2.Left;
  LeftInc := (WizardForm.CancelButton.Width*3)/2 + ScaleX(8);
  TopInc := WizardForm.CancelButton.Height + ScaleY(8);
  Top := WizardForm.WelcomeLabel2.Top + WizardForm.WelcomeLabel2.Height - 4*TopInc;

  CreateButton(Left, Top, '&IShellLink...', @IShellLinkButtonOnClick);
  Top := Top + TopInc;
  CreateButton(Left, Top, '&ITaskScheduler...', @ITaskSchedulerButtonOnClick);
end;





