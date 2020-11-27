; -- CodeDlg.iss --
;
; Демонстрирует создание собственных страниц мастера установки и их обработку.
; Кроме того показывает, как настроить передачу данных между секцией [Code] и
; обычными секциями Inno Setup, используя константы {code:...}. И наконец
; показывает, как изменить параметры текста на странице "Все готово установке".

; ОБРАТИТЕСЬ К СПРАВОЧНОЙ ДОКУМЕНТАЦИИ, ЧТОБЫ ИСПОЛЬЗОВАТЬ ВСЕ ВОЗМОЖНОСТИ INNO SETUP!

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

; Применение стиля к диалогам инсталлятора/деинсталлятора
; ("SetupStyleFile=" определяет путь и файл стиля *.vsf)
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
; и так далее.

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
  { Создаем страницы }
  
  UserPage := CreateInputQueryPage(wpWelcome,
    'Персональные данные', 'Кто Вы?',
    'Введите ваше имя и компанию, в которой вы работаете, затем нажмите "Далее".');
  UserPage.Add('Имя:', False);
  UserPage.Add('Компания:', False);

  UsagePage := CreateInputOptionPage(UserPage.ID,
    'Персональные данные', 'Как Вы будете использовать "My Program"?',
    'Выберите, в каком режиме вы планируете использовать "My Program", затем нажмите "Далее".',
    True, False);
  UsagePage.Add('Бесплатный (с рекламой, ограниченная функциональность)');
  UsagePage.Add('Временный (с рекламой, полная функциональность)');
  UsagePage.Add('Платный (без рекламы, полная функциональность)');

  LightMsgPage := CreateOutputMsgPage(UsagePage.ID,
    'Персональные данные', 'Как Вы будете использовать "My Program"',
    'Примечание: Чтобы воспользоваться всеми функциями, которые может предложить ' +
    '"My Program", и поддержать её дальнейшую разработку, вы в любое время в меню ' +
    '"Справка" можете выбрать режим использования "My Program" уже после установки.'#13#13 +
    'Нажмите "Назад", если хотите изменить режим использования сейчас, или нажмите ' +
    '"Далее", чтобы продолжить установку.');

  KeyPage := CreateInputQueryPage(UsagePage.ID,
    'Персональные данные', 'У Вас есть ключ регистрации?',
    'Введите ваш ключ регистрации и нажмите "Далее", чтобы продолжить установку. Если у вас нет ' +
    'ключа регистрации, нажмите "Назад" и выберите другой режим использования.');
  KeyPage.Add('Ключ регистрации:', False);

  ProgressPage := CreateOutputProgressPage('Персональные данные',
    'Ваш ключ регистрации?');

  DataDirPage := CreateInputDirPage(wpSelectDir,
    'Каталог персональных данных', 'Место установки файлов с персональными данными?',
    'Выберите папку, в которую будут установлены файлы с персональными данными, и нажмите "Далее".',
    False, '');
  DataDirPage.Add('');

  { Устанавливаем значения по умолчанию, используя параметры, сохраненные ранее }

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
  { Сохраняем параметры для повторного использования }
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
  { Пропускаем страницы, которые не должны быть показаны }
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
  { Проверка страниц на введенные данные }
  if CurPageID = UserPage.ID then begin
    if UserPage.Values[0] = '' then begin
      MsgBox('Вы должны ввести имя.', mbError, MB_OK);
      Result := False;
    end else begin
      if DataDirPage.Values[0] = '' then
        DataDirPage.Values[0] := 'C:\' + UserPage.Values[0];
      Result := True;
    end;
  end else if CurPageID = KeyPage.ID then begin
    { Just to show how 'OutputProgress' pages work.
      Always use a try..finally between the Show and Hide calls as shown below. }
    ProgressPage.SetText('Проверка ключа регистрации...', '');
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
      MsgBox('Ключ недействительный. (Подсказка: введите "inno".)', mbError, MB_OK);
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
  { Формирование текста для 'Ready Memo' с обычными и собственными параметрами }
  S := '';
  S := S + 'Персональные данные:' + NewLine;
  S := S + Space + UserPage.Values[0] + NewLine;
  if UserPage.Values[1] <> '' then
    S := S + Space + UserPage.Values[1] + NewLine;
  S := S + NewLine;
  
  S := S + 'Режим использования:' + NewLine + Space;
  case UsagePage.SelectedValueIndex of
    0: S := S + 'Бесплатный';
    1: S := S + 'Временный';
    2: S := S + 'Платный';
  end;
  S := S + NewLine + NewLine;
  
  S := S + MemoDirInfo + NewLine;
  S := S + Space + DataDirPage.Values[0] + ' (файлы персональных данных)' + NewLine;

  Result := S;
end;

function GetUser(Param: String): String;
begin
  { Получение пользовательских значений }
  { Также можно разделить на отдельные функции GetUserName и GetUserCompany }
  if Param = 'Name' then
    Result := UserPage.Values[0]
  else if Param = 'Company' then
    Result := UserPage.Values[1];
end;

function GetDataDir(Param: String): String;
begin
  { Возвращение выбранного каталога DataDir }
  Result := DataDirPage.Values[0];
end;
