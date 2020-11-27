; -- UninstallCodeExample1.iss --
;
; Демонстрирует особенности использования секции [Code] для деинсталляции (Uninstall).

; ОБРАТИТЕСЬ К СПРАВОЧНОЙ ДОКУМЕНТАЦИИ, ЧТОБЫ ИСПОЛЬЗОВАТЬ ВСЕ ВОЗМОЖНОСТИ INNO SETUP!

[Setup]
AppName=My Program
AppVersion=1.5
WizardStyle=modern
DefaultDirName={autopf}\My Program
DefaultGroupName=My Program
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

[Code]
function InitializeUninstall(): Boolean;
begin
  Result := MsgBox('InitializeUninstall:' #13#13 'Выполнена инициализация деинсталлятора. Вы действительно хотите начать удаление?', mbConfirmation, MB_YESNO) = idYes;
  if Result = False then
    MsgBox('InitializeUninstall:' #13#13 'Ну, ладно. Пока-пока.', mbInformation, MB_OK);
end;

procedure DeinitializeUninstall();
begin
  MsgBox('DeinitializeUninstall:' #13#13 'Пока-пока!', mbInformation, MB_OK);
end;

procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
begin
  case CurUninstallStep of
    usUninstall:
      begin
        MsgBox('CurUninstallStepChanged:' #13#13 'Скоро начнется деинсталляция.', mbInformation, MB_OK)
        // ...здесь вставьте код для выполнения каких-то задач перед деинсталляцией...
      end;
    usPostUninstall:
      begin
        MsgBox('CurUninstallStepChanged:' #13#13 'Деинсталляция завершена.', mbInformation, MB_OK);
        // ...здесь вставьте код для выполнения каких-то задач после деинсталляции...
      end;
  end;
end;
