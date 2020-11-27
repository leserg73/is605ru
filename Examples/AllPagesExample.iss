; -- AllPagesExample.iss --
;
; Демонстрирует все страницы мастера программы установки,
; которые потенциально могут быть показаны пользователю.

; ОБРАТИТЕСЬ К СПРАВОЧНОЙ ДОКУМЕНТАЦИИ, ЧТОБЫ ИСПОЛЬЗОВАТЬ ВСЕ ВОЗМОЖНОСТИ INNO SETUP!

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

DisableWelcomePage=no
LicenseFile=license.txt
#define Password 'password'
Password={#Password}
InfoBeforeFile=readme.txt
UserInfoPage=yes
PrivilegesRequired=lowest
DisableDirPage=no
DisableProgramGroupPage=no
InfoAfterFile=readme.txt

; Применение стиля к диалогам инсталлятора/деинсталлятора
; ("SetupStyleFile=" определяет путь и файл стиля *.vsf)
SetupStyleFile="compiler:Examples\Glow.vsf"

[Languages]
Name: ru; MessagesFile: "compiler:Languages\Russian.isl"

[Files]
Source: "MyProg.exe"; DestDir: "{app}"
Source: "MyProg.chm"; DestDir: "{app}"
Source: "Readme.txt"; DestDir: "{app}"; Flags: isreadme

[Icons]
Name: "{group}\My Program"; Filename: "{app}\MyProg.exe"

[Components]
Name: "component"; Description: "Компонент программы";

[Tasks]
Name: "task"; Description: "Задача";

[Code]
var
  OutputProgressWizardPage: TOutputProgressWizardPage;
  OutputProgressWizardPageAfterID: Integer;

procedure InitializeWizard;
var
  InputQueryWizardPage: TInputQueryWizardPage;
  InputOptionWizardPage: TInputOptionWizardPage;
  InputDirWizardPage: TInputDirWizardPage;
  InputFileWizardPage: TInputFileWizardPage;
  OutputMsgWizardPage: TOutputMsgWizardPage;
  OutputMsgMemoWizardPage: TOutputMsgMemoWizardPage;
  AfterID: Integer;
begin
  WizardForm.PasswordEdit.Text := '{#Password}';

  AfterID := wpSelectTasks;
  
  AfterID := CreateCustomPage(AfterID, 'CreateCustomPage', 'ADescription').ID;
  
  InputQueryWizardPage := CreateInputQueryPage(AfterID, 'CreateInputQueryPage', 'ADescription', 'ASubCaption');
  InputQueryWizardPage.Add('&APrompt:', False);
  AfterID := InputQueryWizardPage.ID;
  
  InputOptionWizardPage := CreateInputOptionPage(AfterID, 'CreateInputOptionPage', 'ADescription', 'ASubCaption', False, False);
  InputOptionWizardPage.Add('&AOption');
  AfterID := InputOptionWizardPage.ID;

  InputDirWizardPage := CreateInputDirPage(AfterID, 'CreateInputDirPage', 'ADescription', 'ASubCaption', False, 'ANewFolderName');
  InputDirWizardPage.Add('&APrompt:');
  InputDirWizardPage.Values[0] := 'C:\';
  AfterID := InputDirWizardPage.ID;

  InputFileWizardPage := CreateInputFilePage(AfterID, 'CreateInputFilePage', 'ADescription', 'ASubCaption');
  InputFileWizardPage.Add('&APrompt:', 'Исполняемые файлы|*.exe|Все файлы|*.*', '.exe');
  AfterID := InputFileWizardPage.ID;

  OutputMsgWizardPage := CreateOutputMsgPage(AfterID, 'CreateOutputMsgPage', 'ADescription', 'AMsg');
  AfterID := OutputMsgWizardPage.ID;

  OutputMsgMemoWizardPage := CreateOutputMsgMemoPage(AfterID, 'CreateOutputMsgMemoPage', 'ADescription', 'ASubCaption', 'AMsg');
  AfterID := OutputMsgMemoWizardPage.ID;

  OutputProgressWizardPage := CreateOutputProgressPage('CreateOutputProgressPage', 'ADescription');
  OutputProgressWizardPageAfterID := AfterID;
end;

function NextButtonClick(CurPageID: Integer): Boolean;
var
  Position, Max: Integer;
begin
  if CurPageID = OutputProgressWizardPageAfterID then begin
    try
      Max := 25;
      for Position := 0 to Max do begin
        OutputProgressWizardPage.SetProgress(Position, Max);
        if Position = 0 then
          OutputProgressWizardPage.Show;
        Sleep(2000 div Max);
      end;
    finally
      OutputProgressWizardPage.Hide;
    end;
  end;
  Result := True;
end;

function PrepareToInstall(var NeedsRestart: Boolean): String;
begin
  if SuppressibleMsgBox('Вы хотите остановить выполнение на странице подготовки к установке?', mbConfirmation, MB_YESNO, IDNO) = IDYES then
    Result := 'Остановлено пользователем';
end;