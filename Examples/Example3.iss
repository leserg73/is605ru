; -- Example3.iss --
;
; Этот пример аналогичен сценарию Example1.iss, но ещё дополнительно 
; создает ключи в реестре и позволяет пользователю выбрать режим установки
; (административный или не административный).

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
ChangesAssociations=yes
UserInfoPage=yes
PrivilegesRequiredOverridesAllowed=dialog

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

; ПРМЕЧАНИЕ: Большинству приложений не требуется предварительно создавать ключи
; в реестре. Если вы не знаете, что такое "Реестр" и как его нужно использовать,
; то скорее всего раздел [Registry] вам не нужен.

[Registry]
; Создаем ключ "Software\My Company\My Program" в разделе CURRENT_USER или
; LOCAL_MACHINE в зависимости от режима установки (административный или не
; административный). Флаги указывают удаление ключа "My Program" и удаление
; ключа "My Company", если он пустой, при деинсталляции.
Root: HKA; Subkey: "Software\My Company"; Flags: uninsdeletekeyifempty
Root: HKA; Subkey: "Software\My Company\My Program"; Flags: uninsdeletekey
Root: HKA; Subkey: "Software\My Company\My Program\Settings"; ValueType: string; ValueName: "Language"; ValueData: "{language}"

; Ассоциация файлов с расширением .myp с программой "My Program"
; (требуется использовать ChangesAssociations=yes)
Root: HKA; Subkey: "Software\Classes\.myp"; ValueType: string; ValueName: ""; ValueData: "MyProgramFile.myp"; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\.myp\OpenWithProgids"; ValueType: string; ValueName: "MyProgramFile.myp"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\MyProgramFile.myp"; ValueType: string; ValueName: ""; ValueData: "My Program File"; Flags: uninsdeletekey
Root: HKA; Subkey: "Software\Classes\MyProgramFile.myp\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\MyProg.exe,0"
Root: HKA; Subkey: "Software\Classes\MyProgramFile.myp\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\MyProg.exe"" ""%1"""

; Разделы реестра HKA (и HKCU) следует использовать только для настроек,
; которые совместимы с перемещаемыми профилями, поэтому такие настройки,
; как пути, должны быть записаны в HKLM, что возможно только в режиме
; административной установки.
Root: HKLM; Subkey: "Software\My Company"; Flags: uninsdeletekeyifempty; Check: IsAdminInstallMode
Root: HKLM; Subkey: "Software\My Company\My Program"; Flags: uninsdeletekey; Check: IsAdminInstallMode
Root: HKLM; Subkey: "Software\My Company\My Program\Settings"; ValueType: string; ValueName: "InstallPath"; ValueData: "{app}"; Check: IsAdminInstallMode

; Пользовательские настройки всегда должны быть записаны в HKCU,
; что должно быть сделано только в режиме не административной установки.
Root: HKCU; Subkey: "Software\My Company\My Program\Settings"; ValueType: string; ValueName: "UserName"; ValueData: "{userinfoname}"; Check: not IsAdminInstallMode
Root: HKCU; Subkey: "Software\My Company\My Program\Settings"; ValueType: string; ValueName: "UserOrganization"; ValueData: "{userinfoorg}"; Check: not IsAdminInstallMode

[Code]
function ShouldSkipPage(PageID: Integer): Boolean;
begin
  // Страница с данными пользователя может быть пропущена в режиме административной установки
  Result := IsAdminInstallMode and (PageID = wpUserInfo);
end;
