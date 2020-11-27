; -- CodeExample1.iss --
;
; Демонстрирует возможности использования секции [Code].

; ОБРАТИТЕСЬ К СПРАВОЧНОЙ ДОКУМЕНТАЦИИ, ЧТОБЫ ИСПОЛЬЗОВАТЬ ВСЕ ВОЗМОЖНОСТИ INNO SETUP!

[Setup]
AppName=My Program
AppVersion=1.5
WizardStyle=modern
DisableWelcomePage=no
DefaultDirName={code:MyConst}\My Program
DefaultGroupName=My Program
UninstallDisplayIcon={app}\MyProg.exe
InfoBeforeFile=Readme.txt
OutputDir=userdocs:Inno Setup Examples Output

; Применение стиля к диалогам инсталлятора/деинсталлятора
; ("SetupStyleFile=" определяет путь и файл стиля *.vsf)
SetupStyleFile="compiler:Examples\Glow.vsf"

[Languages]
Name: ru; MessagesFile: "compiler:Languages\Russian.isl"

[Files]
Source: "MyProg.exe"; DestDir: "{app}"; Check: MyProgCheck; BeforeInstall: BeforeMyProgInstall('MyProg.exe'); AfterInstall: AfterMyProgInstall('MyProg.exe')
Source: "MyProg.chm"; DestDir: "{app}"; Check: MyProgCheck; BeforeInstall: BeforeMyProgInstall('MyProg.chm'); AfterInstall: AfterMyProgInstall('MyProg.chm')
Source: "Readme.txt"; DestDir: "{app}"; Flags: isreadme

[Icons]
Name: "{group}\My Program"; Filename: "{app}\MyProg.exe"

[Code]
var
  MyProgChecked: Boolean;
  MyProgCheckResult: Boolean;
  FinishedInstall: Boolean;

function InitializeSetup(): Boolean;
begin
  Log('InitializeSetup called');
  Result := MsgBox('InitializeSetup:' #13#13 'Выполнена инициализация программы установки. Вы хотите продолжить?', mbConfirmation, MB_YESNO) = idYes;
  if Result = False then
    MsgBox('InitializeSetup:' #13#13 'Ну, ладно. Пока-пока.', mbInformation, MB_OK);
end;

procedure InitializeWizard;
begin
  Log('InitializeWizard called');
end;

<event('InitializeWizard')>
procedure InitializeWizard2;
begin
  Log('InitializeWizard2 called');
end;

procedure DeinitializeSetup();
var
  FileName: String;
  ResultCode: Integer;
begin
  Log('DeinitializeSetup called');
  if FinishedInstall then begin
    if MsgBox('DeinitializeSetup:' #13#13 'Сценарий [Code] завершен. Вы хотите удалить "My Program"?', mbConfirmation, MB_YESNO) = idYes then begin
      FileName := ExpandConstant('{uninstallexe}');
      if not Exec(FileName, '', '', SW_SHOWNORMAL, ewNoWait, ResultCode) then
        MsgBox('DeinitializeSetup:' #13#13 'Запуск ''' + FileName + ''' не удался. ' + SysErrorMessage(ResultCode) + '.', mbError, MB_OK);
    end else
      MsgBox('DeinitializeSetup:' #13#13 'ОК, пока-пока.', mbInformation, MB_OK);
  end;
end;

procedure CurStepChanged(CurStep: TSetupStep);
begin
  Log('CurStepChanged(' + IntToStr(Ord(CurStep)) + ') called');
  if CurStep = ssPostInstall then
    FinishedInstall := True;
end;

procedure CurInstallProgressChanged(CurProgress, MaxProgress: Integer);
begin
  Log('CurInstallProgressChanged(' + IntToStr(CurProgress) + ', ' + IntToStr(MaxProgress) + ') called');
end;

function NextButtonClick(CurPageID: Integer): Boolean;
var
  ResultCode: Integer;
begin
  Log('NextButtonClick(' + IntToStr(CurPageID) + ') called');
  case CurPageID of
    wpSelectDir:
      MsgBox('NextButtonClick:' #13#13 'Ваш выбор: ''' + WizardDirValue + '''.', mbInformation, MB_OK);
    wpSelectProgramGroup:
      MsgBox('NextButtonClick:' #13#13 'Ваш выбор: ''' + WizardGroupValue + '''.', mbInformation, MB_OK);
    wpReady:
      begin
        if MsgBox('NextButtonClick:' #13#13 'Используя код сценария, файлы можно извлечь до начала установки. Например, мы можем извлечь файл ''MyProg.exe'' и запустить его.' #13#13 'Вы хотите это сделать?', mbConfirmation, MB_YESNO) = idYes then begin
          ExtractTemporaryFile('myprog.exe');
          if not ExecAsOriginalUser(ExpandConstant('{tmp}\myprog.exe'), '', '', SW_SHOWNORMAL, ewWaitUntilTerminated, ResultCode) then
            MsgBox('NextButtonClick:' #13#13 'Файл не может быть выполнен. ' + SysErrorMessage(ResultCode) + '.', mbError, MB_OK);
        end;
        BringToFrontAndRestore();
        MsgBox('NextButtonClick:' #13#13 'Теперь начнется обычная установка.', mbInformation, MB_OK);
      end;
  end;

  Result := True;
end;

function BackButtonClick(CurPageID: Integer): Boolean;
begin
  Log('BackButtonClick(' + IntToStr(CurPageID) + ') called');
  Result := True;
end;

function ShouldSkipPage(PageID: Integer): Boolean;
begin
  Log('ShouldSkipPage(' + IntToStr(PageID) + ') called');
  { Пропуск страницы wpInfoBefore; все остальные будут показаны }
  case PageID of
    wpInfoBefore:
      Result := True;
  else
    Result := False;
  end;
end;

procedure CurPageChanged(CurPageID: Integer);
begin
  Log('CurPageChanged(' + IntToStr(CurPageID) + ') called');
  case CurPageID of
    wpWelcome:
      MsgBox('CurPageChanged:' #13#13 'Вас приветствует пример использования секции [Code]. Здесь показаны некоторые особенности поддержки сценариев.' #13#13 'Обработчик сценариев использует библиотеку Pascal Script, разработанную Carlo Kok. Дополнительную информацию по адресу http://www.remobjects.com/ps.', mbInformation, MB_OK);
    wpFinished:
      MsgBox('CurPageChanged:' #13#13 'Завершающая страница программы установки. Чтобы выйти, нажмите "Завершить".', mbInformation, MB_OK);
  end;
end;

function PrepareToInstall(var NeedsRestart: Boolean): String;
begin
  Log('PrepareToInstall() called');
  if MsgBox('PrepareToInstall:' #13#13 'Идет подготовка к установке. С помощью сценария вы можете установить все необходимые компоненты, прервать установку, если произошла ошибка, и запросить перезапуск. Вы хотите получить сообщение об ошибке?', mbConfirmation, MB_YESNO or MB_DEFBUTTON2) = idYes then
    Result := '<укажите текст ошибки>.'
  else
    Result := '';
end;

function MyProgCheck(): Boolean;
begin
  Log('MyProgCheck() called');
  if not MyProgChecked then begin
    MyProgCheckResult := MsgBox('MyProgCheck:' #13#13 'С помощью сценария можно включить или исключить файлы из установки во время выполнения. Вы хотите установить MyProg.exe и MyProg.chm в ' + ExtractFilePath(CurrentFileName) + '?', mbConfirmation, MB_YESNO) = idYes;
    MyProgChecked := True;
  end;
  Result := MyProgCheckResult;
end;

procedure BeforeMyProgInstall(S: String);
begin
  Log('BeforeMyProgInstall(''' + S + ''') called');
  MsgBox('BeforeMyProgInstall:' #13#13 'Сейчас будет выполнена установка ' + S + ' как ' + CurrentFileName + '.', mbInformation, MB_OK);
end;

procedure AfterMyProgInstall(S: String);
begin
  Log('AfterMyProgInstall(''' + S + ''') called');
  MsgBox('AfterMyProgInstall:' #13#13 'Была выполнена установка ' + S + ' как ' + CurrentFileName + '.', mbInformation, MB_OK);
end;

function MyConst(Param: String): String;
begin
  Log('MyConst(''' + Param + ''') called');
  Result := ExpandConstant('{autopf}');
end;

