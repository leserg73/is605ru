unit CompMsgs;

{
  Inno Setup
  Copyright (C) 1997-2019 Jordan Russell
  Portions by Martijn Laan
  For conditions of distribution and use, see LICENSE.TXT.

  Compiler Messages

  All language-specific text used by the compiler is in here. If you want to
  translate it into another language, all you need to change is this unit.
}

interface

const
  SNewLine = #13#10;  { line break }
  SNewLine2 = #13#10#13#10;  { double line break }

  { Compiler form labels }
  SCompilerFormCaption = 'Inno Setup Compiler';
  SCompilerScriptFileLabel = 'Сценарий:';
  SCompilerStatusLabel = 'Сообщения:';
  SCompilerScriptBrowseButton = 'Обзор...';
  SCompilerStartButton = 'Старт';
  SCompilerExitButton = 'Выход';
  SCompilerOpenFilter = 'Сценарии Inno Setup (*.iss)|*.iss|Все файлы|*.*';
  SCompilerExampleScripts = 'Примеры сценариев...';
  SCompilerMoreFiles = 'Другие файлы сценариев...';

  { Compiler Script Wizard }
  SWizardDefaultName = 'Мастер создания сценариев Inno Setup';
  SWizardWelcome = 'Добро пожаловать';
  SWizardAppInfo = 'Информация о приложении';
  SWizardAppInfo2 = 'Пожалуйста, введите информацию о вашем приложении.';
  SWizardAppDir = 'Каталог установки';
  SWizardAppDir2 = 'Пожалуйста, укажите папку для установки вашего приложения.';
  SWizardAppFiles = 'Файлы приложения';
  SWizardAppFiles2 = 'Пожалуйста, укажите файлы вашего приложения.';
  SWizardAppFiles3 = 'Пожалуйста, укажите папку с исходными файлами:';
  SWizardAppFilesSubDirsMessage = 'Следует ли также добавить все файлы, находящиеся в подпапках "%s"?';
  SWizardAppExeFilter = 'Файлы приложений (*.exe)|*.exe|Все файлы|*.*';
  SWizardAppExeDefaultExt = 'exe';
  SWizardAppIcons = 'Иконки приложения';
  SWizardAppIcons2 = 'Пожалуйста, укажите место создания иконок для вашего приложения.';
  SWizardAppDocs = 'Документация приложения';
  SWizardAppDocs2 = 'Пожалуйста, укажите текстовую информацию, которая должна быть показана в процессе установки.';
  SWizardAppDocsFilter = 'Файлы документов (*.rtf,*.txt)|*.rtf;*.txt|Все файлы|*.*';
  SWizardAppDocsDefaultExt = 'rtf';
  SWizardPrivilegesRequired = 'Режим установки';
  SWizardPrivilegesRequired2 = 'Пожалуйста, выберите режим запуска установки.';
  SWizardLanguages = 'Языковая поддержка';
  SWizardLanguages2 = 'Пожалуйста, выберите языки, которые необходимо добавить к установке вашего приложения.';
  SWizardCompiler = 'Параметры компилятора';
  SWizardCompiler2 = 'Пожалуйста, укажите основные параметры компилятора.';
  SWizardCompilerSetupIconFileFilter = 'Файлы значков (*.ico)|*.ico|Все файлы|*.*';
  SWizardCompilerSetupIconFileDefaultExt = 'ico';
  SWizardCompilerOutputDir = 'Пожалуйста, укажите папку.';
  SWizardISPP = 'Препроцессор Inno Setup';
  SWizardISPP2 = 'Укажите пожалуйста, должен ли использоваться препроцессор Inno Setup.';
  SWizardISPPLabel = '[name] может использовать директивы компилятора #define, что позволит упростить ваш сценарий. Хотя в этом нет особой необходимости, позже будет легче вручную изменить сценарий.' + SNewLine2 + 'Вы хотите, чтобы Мастер использовал директивы #define?';
  SWizardISPPCheck = 'Да, использовать директивы компилятора #define';
  SWizardFinished = 'Завершено';

  SWizardNextButton = 'Далее >';
  SWizardFinishButton = 'Готово';
  SWizardCancelMessage = 'Работа Мастера создания сценариев Inno Setup не завершена.'#13'Если вы подтвердите свой выход, то сценарий создан не будет.'#13#13'Вы действительно хотите прекратить работу Мастера?';

  SWizardAllFilesFilter = 'Все файлы|*.*';

  SWizardAppNameError = 'Пожалуйста, введите название приложения.';
  SWizardAppVersionError = 'Пожалуйста, введите версию приложения.';
  SWizardAppRootDirError = 'Пожалуйста, укажите папку установки приложения.';
  SWizardAppDirNameError = 'Пожалуйста, введите название папки.';
  SWizardAppExeError = 'Пожалуйста, укажите главный исполняемый файл приложения.';
  SWizardAppGroupNameError = 'Пожалуйста, укажите папку приложения для меню ПУСК.';
  SWizardFileDestRootDirError = 'Пожалуйста, укажите основную папку установки.';
  SWizardFileAppDestRootDirError = 'Пожалуйста, укажите основную папку установки отличную от папки приложения.';
  SWizardLanguagesSelError = 'Пожалуйста, выберите не менее одного языка поддержки.';

  SWizardScriptHeader = '; Этот сценарий создан с помощью Мастера Inno Setup.' + SNewLine  + '; ОБРАТИТЕСЬ К СПРАВОЧНОЙ ДОКУМЕНТАЦИИ, ЧТОБЫ ИСПОЛЬЗОВАТЬ ВСЕ ВОЗМОЖНОСТИ INNO SETUP!';

  { Compiler-specific messages }
  SCompilerVersion = 'version %s';

  SCompilerNotOnWin32s = 'The 32-bit compiler will not run on Win32s.';
  SCompilerCommandLineHelp3 = 'Command line usage:' + SNewLine +
    SNewLine +
    'compil32 /cc <script file>' + SNewLine +
    'compil32 /wizard <wizard name> <script file>' + SNewLine +
    SNewLine +
    'Examples:' + SNewLine +
    'compil32 /cc c:\isetup\sample32\sample1.iss' + SNewLine +
    'compil32 /cc "C:\Inno Setup\Sample32\My script.iss"' + SNewLine +
    'compil32 /wizard "My Script Wizard" c:\temp.iss';

  { Status messages }
  SCompilerStatusStarting = '*** Запуск компиляции.  [%s]';
  SCompilerStatusCreatingOutputDir = 'Создание папки вывода: %s';
  SCompilerStatusCreatingSignedUninstallerDir = 'Создание цифровой подписи для деинсталлятора: %s';
  SCompilerStatusDeletingPrevious = 'Удаление %s из папки вывода';
  SCompilerStatusParsingSectionLine = 'Анализ секции [%s], строка %d';
  SCompilerStatusParsingSectionLineFile = 'Анализ секции [%s], строка %d из %s';
  SCompilerStatusFilesVerInfo = '   Чтение версии: %s';
  SCompilerStatusReadingFile = 'Чтение файла (%s)';
  SCompilerStatusPreparingSetupExe = 'Подготовка программы установки';
  SCompilerStatusSkippingPreparingSetupExe = 'Пропуск подготовки исполняемого файла программы установки, вывод отключен';
  SCompilerStatusSignedUninstallerNew = '   Создание нового подписанного файла деинсталляции: %s';
  SCompilerStatusSignedUninstallerExisting = '   Использование существующего подписанного файла деинсталляции: %s';
  SCompilerStatusDeterminingCodePages = 'Определение кодовых страниц языка';
  SCompilerStatusConvertCodePage = '   Преобразование кодовой страницы: %d';
  SCompilerStatusReadingDefaultMessages = 'Чтение сообщений из Default.isl';
  SCompilerStatusParsingMessages = 'Анализ секций [LangOptions], [Messages] и [CustomMessages]';
  SCompilerStatusReadingCode = 'Чтение секции [Code]';
  SCompilerStatusCompilingCode = 'Компиляция секции [Code]';
  SCompilerStatusReadingInFile = '   Файл: %s';
  SCompilerStatusReadingInScriptMsgs = '   Сообщения из файла сценария';
  SCompilerStatusCreateSetupFiles = 'Создание файлов установки';
  SCompilerStatusSkippingCreateSetupFiles = 'Пропуск создания установочных файлов, вывод отключен';
  SCompilerStatusCreateManifestFile = 'Создание файла манифеста';
  SCompilerStatusFilesInitEncryption = '   Инициализация шифрования';
  SCompilerStatusFilesCompressing = '   Сжатие: %s';
  SCompilerStatusFilesCompressingVersion = '   Сжатие: %s   (%u.%u.%u.%u)';
  SCompilerStatusFilesStoring = '   Сохранение: %s';
  SCompilerStatusFilesStoringVersion = '   Сохранение: %s   (%u.%u.%u.%u)';
  SCompilerStatusCompressingSetupExe = '   Сжатие файла установки';
  SCompilerStatusUpdatingVersionInfo = '   Обновление версии (%s)';
  SCompilerStatusUpdatingIcons = '   Обновление значков (%s)';
  SCompilerStatusUpdatingStyles = '   Добавление стиля (%s)';
{$IFNDEF PS_MINIVCL}
  SCompilerStatusUpdatingRes = '   Обновление ресурсов (%s)';
{$ENDIF}
  SCompilerStatusCreatingDisk = '   Создание диска %d';
  SCompilerStatusFinished = '*** Компиляция завершена.  [%s, прошло %s]';
  SCompilerStatusError = 'ОШИБКА:';
  SCompilerStatusErrorAborted = '*** Компиляция прервана.';
  SCompilerStatusReset = '*** Достигнут предельный размер отчета. Выполнена очистка.';
  SCompilerStatusWarning = 'Внимание! ';
  SCompilerStatusSigningSetup = '   Цифровая подпись файла установки';
  SCompilerStatusSigningSourceFile = '   Цифровая подпись: %s';
  SCompilerStatusSourceFileAlreadySigned = '   Цифровая подпись пропущена, уже существует: %s';
  SCompilerStatusSigning = '   Выполнение Sign Tool %s: %s';
  SCompilerStatusSigningWithDelay = '   Выполнение Sign Tool %s в %d (миллисекунд): %s';
  SCompilerStatusWillRetrySigning = '   Ошибка выполнения команды Sign Tool (%s). Будет предпринята новая попытка (сделано попыток: %d).';

  SCompilerSuccessfulMessage2 = 'Изображения установки были успешно созданы ' +
    'в папке вывода:' + SNewLine +
    '%s' + SNewLine +
    SNewLine +
    'Вы хотите выполнить проверку установки?';
  SCompilerSuccessfulTitle = 'Компиляция успешно завершена';
  SCompilerNeedCompiledExe = 'Невозможно запустить установку в текущий момент. Дождитесь успешного завершения компиляции с получением файла установки.';
  SCompilerNeedUninstExe = 'Не удается получить доступ к Деинсталляции. Пожалуйста, выполните сначала Установку.';
  SCompilerExecuteSetupError2 = 'Ошибка выполнения "%s":' + SNewLine2 + '%d: %s';

  SCompilerAborted = 'Компиляция прервана. Пожалуйста, устраните проблему и попробуйте снова.';

  { Fatal errors }
  SCompilerScriptMissing2 = 'Указанный файл сценария не существует';
  SCompilerOutputNotEmpty2 = 'Выходной каталог не должен содержать каких-либо ' +
    'установочных файлов. При запуске компиляции все файлы с именами SETUP.* ' +
    'будут автоматически удалены.';
  SCompilerUnknownFilenamePrefix = 'Неизвестный префикс в имени файла "%s"';
  SCompilerSourceFileDoesntExist = 'Исходный файл "%s" не существует';
  SCompilerCopyError3 = 'Не удается скопировать "%s" в "%s".' + SNewLine2 + 'Ошибка %d: %s';
  SCompilerReadError = 'Не удается прочитать "%s".' + SNewLine2 + 'Ошибка: %s';
  SCompilerCompressError2 = 'Произошла внутренняя ошибка при попытке сжатия "%s"';
  SCompilerNotEnoughSpaceOnFirstDisk = 'На диске Недостаточно свободного места для копирования всех необходимых файлов.';
  SCompilerSetup0Mismatch = 'Внутренняя ошибка SC1';
  SCompilerMustUseDiskSpanning = 'Необходимо включить разбиение на диски для создания файлов установки размером более чем %d байт.';
  SCompilerCompileCodeError = 'Произошла ошибка при компиляции секции [Code]:' + SNewLine2 + '%s';
  SCompilerISCryptMissing = 'Шифрование невозможно, т.к. отсутствует файл ISCrypt.dll.' + SNewLine2 +
    'Примечание: Это файл не входит в стандартную поставку Inno Setup, и может быть загружен с веб-сайта Inno Setup.';
  SCompilerFunctionFailedWithCode = 'Не удалось %s. Ошибка %d: %s';

  { [Setup] }
  SCompilerUnknownDirective = 'В секции [%s] не удалось распознать директиву "%s".';
  SCompilerEntryObsolete = 'В секции [%s] директива "%s" является устаревшей и этой версией Inno Setup не учитывается.';
  SCompilerEntrySuperseded2 = 'В секции [%s] директива "%s" была заменена на %s" в этой версии Inno Setup.';
  SCompilerEntryMissing2 = 'Требуемая в секции [%s] директива "%s" не указана.';
  SCompilerEntryInvalid2 = 'В секции [%s] значение директивы "%s" является недействительным.';
  SCompilerEntryAlreadySpecified = 'В секции [%s] директива "%s" уже определена.';
  SCompilerAppVersionOrAppVerNameRequired = 'Секция [Setup] должна содержать директиву AppVersion или AppVerName.';
  SCompilerMinVersionWinMustBeZero = 'Минимальная версия Windows, определенная для MinVersion, должна быть 0. (Windows 95/98/Me больше не поддерживаются.)';
  SCompilerMinVersionNTTooLow = 'Минимальное значение версии NT для параметра "MinVersion" должно быть не меньше %s. (Windows 2000/XP/Server 2003 больше не поддерживаются.)';
  SCompilerDiskSliceSizeInvalid = 'Значение DiskSliceSize должно быть между %d и %d, или "max"';
  SCompilerDiskClusterSizeInvalid = 'Значение DiskClusterSize должно быть в пределах от 1 до 32768';
  SCompilerInstallModeObsolete = 'В секции [%s] директива "%s" является устаревшей и этой версией Inno Setup не учитывается. Вместо неё используйте параметры командной строки.';
  SCompilerMessagesFileObsolete = 'Директива MessagesFile устарела и больше не поддерживается. Используйте вместо неё секцию [Languages].';
  SCompilerDirectiveIsNTOnly = 'В секции [%s] директива "%s" может не использоваться, если компиляция выполняется на Windows 95/98/Me';
  SCompilerDirectiveRequiresWindows2000 = 'В секции [%s] директива "%s" может не использоваться, если компиляция выполняется на Windows 95/98/Me/NT4';
  SCompilerMustUseDisableStartupPrompt = 'DisableStartupPrompt должна быть установлена в "yes", если включены константы AppName.';
  SCompilerMustNotUsePreviousLanguage = 'UsePreviousLanguage должна быть установлена в "no", если включены константы AppId.';
  SCompilerMustNotUsePreviousPrivileges = 'UsePreviousPrivileges должна быть установлена в "no", если включены константы AppId и PrivilegesRequiredOverridesAllowed принимает "dialog"';
  SCompilerDirectiveNotUsingDefault = 'В секции [Setup] директива "%s" отклонит значение по умолчанию, т.к. %s содержит константы.';
  SCompilerDirectiveNotUsingPreferredDefault = 'В секции [Setup] директива "%s" по умолчанию будет установлена в %s, т.к. %s содержит константы.';
  SCompilerDirectivePatternTooLong = 'В секции [Setup] директива "%s" содержит слишком длинное значение.';
  SCompilerOutputBaseFileNameSetup = 'Не рекомендуется в секции [Setup] для параметра "OutputBaseFileName" указывать имя "setup", т.к. все исполняемые файлы вида "setup.exe" на системе Windows используются для обеспечения совместимости приложений ' +
                                     'и загрузки дополнительных файлов DLL, таких как version.dll и др. Загрузка этих файлов DLL является небезопасной и система Windows может быть взломана. Попробуйте использовать другое имя, например "mysetup".';

  { Signing }
  SCompilerSignatureNeeded = 'Включен режим подписи деинсталляции. Используя ' +
    'внешний инструмент цифровой подписи, пожалуйста, прикрепите вашу цифровую подпись ' +
    'к следующему исполняемому файлу:' + SNewLine2 + '%s' + SNewLine2 +
    'и выполните компиляцию снова.';
  SCompilerSignatureInvalid = 'Недопустимая цифровая подпись';
  SCompilerSignedFileContentsMismatchRetry = 'Содержимое подписанного файла:' +
    SNewLine2 + '%s' + SNewLine2 + 'коренным образом отличается от исходного файла. ' +
    'Попробуйте удалить подписанный файл и выполнить компиляцию снова. Если эта ошибка ' +
    'повторится, пожалуйста, сообщите нам о проблеме.';
  SCompilerSignedFileContentsMismatch = 'Содержимое подписанного файла:' +
    SNewLine2 + '%s' + SNewLine2 + 'коренным образом отличается от исходного ' +
    'файла.';
  SCompilerNoSetupLdrSignError = 'Директивы SignTool и SignedUninstaller не будут применены, если UseSetupLdr установлена в "no"';
  SCompilerSignToolFileNameSequenceNotFound = 'Не удается запустить Sign Tool %s: отсутствует последовательность $f.'; 
  SCompilerSignToolCreateProcessFailed = 'Не удалось выполнить команду Sign Tool.' +
    SNewLine2 + 'Ошибка %d: %s'; 
  SCompilerSignToolNonZeroExitCode = 'Сбой команды Sign Tool с кодом выхода 0x%x';
  SCompilerSignToolSucceededButNoSignature = 'Команда The Sign Tool вернула ' +
    'код выхода 0, но файл не получил цифровую подпись.';

  { Line parsing }
  SCompilerLineTooLong = 'Строка слишком длинная';
  SCompilerSectionTagInvalid = 'Недействительный тег секции';
  SCompilerSectionBadEndTag = 'Секция "%s" не закрыта, не найден закрывающий ' +
    'тег.';
  SCompilerTextNotInSection = 'Текст находится за пределами секции.';
  SCompilerInvalidDirective = 'Недействительная директива компилятора' +
    SNewLine2 + 'Чтобы использовать директивы компилятора кроме ''#include'', необходимо установить препроцессор Inno Setup (ISPP).' +
    SNewLine2 + 'Для этого переустановите Inno Setup с включенной опцией установки ISPP.';
  SCompilerErrorOpeningIncludeFile = 'Не удалось открыть подключенный файл "%s": %s';
  SCompilerRecursiveInclude = 'Рекурсия включает "%s"';
  SCompilerIllegalNullChar = 'Недопустимый нулевой символ в строке %d';
  SCompilerISPPMissing = 'Не найден файл ISPP.dll';

  { Constant checks }
  SCompilerTwoBraces = 'Используйте подряд два символа "{", если хотите ' +
    'встроить единственный символ "{" вместо константы.';
  SCompilerUnknownConst = 'Неизвестная константа "%s".' +
    SNewLine2 + SCompilerTwoBraces;
  SCompilerUnterminatedConst = 'Отсутствует закрывающая скобка "}" в объявлении константы "%s".' +
    SNewLine2 + SCompilerTwoBraces;
  SCompilerConstCannotUse = 'Использование здесь константы "%s" недопустимо.';
  SCompilerBadEnvConst = 'Недействительная константа окружения "%s"';
  SCompilerBadRegConst = 'Недействительная константа реестра "%s"';
  SCompilerBadIniConst = 'Недействительная константа INI "%s"';
  SCompilerBadParamConst = 'Недействительная константа параметров командной строки "%s"';
  SCompilerBadCodeConst = 'Недействительная константа кода "%s"';
  SCompilerBadDriveConst = 'Недействительная константа диска "%s"';
  SCompilerBadCustomMessageConst = 'Недействительная константа пользовательского сообщения "%s"';
  SCompilerBadBoolConst = 'Недействительная логическая константа "%s"';
  SCompilerConstantRenamed = 'Константа "%s" была переименована. Вместо неё используйте "%s".';
  SCompilerCommonConstantRenamed = 'Константа "%s" была переименована. Вместо неё используйте "%s" или рассмотрите применение её формы "auto".';

  { Area checks }
  SCompilerUsedUserAreasWarning = 'В секции [%s] для директивы "%s" установлено значение "%s", ' + SNewLine +
    'но в сценарии используется пользовательская область (%s). При административном ' + SNewLine +
    'режиме установки, независимо от версии Windows, требуется соблюдать осторожность, выполняя ' + SNewLine +
    'изменения в пользовательской области: они могут привести к другим, неожиданным результатам. ' + SNewLine +
    'Для получения дополнительной информации обратитесь к справке, главе "UsedUserAreasWarning".';

  { Directive parsing }
  SCompilerDirectiveNameMissing = 'Отсутствует имя директивы';
  SCompilerDirectiveHasNoValue = 'Директива "%s" не содержит значение';

  { Parameter parsing }
  SCompilerParamHasNoValue = 'Указанный параметр "%s" не содержит значение';
  SCompilerParamQuoteError = 'Неуместные кавычки или их несоответствие для параметра "%s"';
  SCompilerParamMissingClosingQuote = 'Отсутствует закрывающая кавычка для параметра "%s"';
  SCompilerParamDataTooLong = 'Данные параметра "%s" слишком велики';
  SCompilerParamUnknownParam = 'Не распознанное имя параметра "%s"';
  SCompilerParamDuplicated = 'Не может содержать несколько параметров "%s"';
  SCompilerParamEmpty2 = 'Параметр "%s" пустой';
  SCompilerParamNotSpecified = 'Требуемый параметр "%s" не указан';
  SCompilerParamNoQuotes2 = 'Параметр "%s" не может содержать кавычки (")';
  SCompilerParamNoBackslash = 'Параметр "%s" не может содержать обратную косую черту  (\)';
  SCompilerParamNoPrecedingBackslash = 'Параметр "%s" не может начинаться с обратной косой черты (\)';
  SCompilerParamInvalid2 = 'Параметр "%s" содержит недопустимое значение';

  { Flags }
  SCompilerParamUnknownFlag2 = 'Параметр "%s" содержит неизвестный флаг';
  SCompilerParamErrorBadCombo2 = 'Параметр "%s" не может содержать оба флага: "%s" и "%s"';
  SCompilerParamUnsupportedFlag = 'Параметр "%s" содержит флаг, который не поддерживается в этой секции';
  SCompilerParamFlagMissing = 'Флаг "%s" должен использоваться совместно с флагом "%s"';
  SCompilerParamFlagMissing2 = 'Флаг "%s" должен использоваться совместно с параметром "%s"';

  { Types, components, tasks, check, beforeinstall, afterinstall }
  SCompilerParamUnknownType = 'Параметр "%s" содержит неизвестный тип';
  SCompilerParamUnknownComponent = 'Параметр "%s" содержит неизвестный компонент';
  SCompilerParamUnknownTask = 'Параметр "%s" содержит неизвестную задачу';
  SCompilerExpressionError = 'Ошибка выражения в директиве или параметре "%s": %s';
  SCompilerBadCheckOrInstall = 'Недействительный параметр "%s" для Check, BeforeInstall или AfterInstall';

  { Permissions }
  SCompilerPermissionsInvalidValue = 'Параметр "Permissions" содержит искаженное значение: "%s"';
  SCompilerPermissionsUnknownSid = 'Параметр "Permissions" содержит неизвестный SID: "%s"';
  SCompilerPermissionsUnknownMask = 'Параметр "Permissions" содержит неизвестный тип доступа: "%s"';
  SCompilerPermissionsValueLimitExceeded = 'Параметр "Permissions" не может содержать более чем %d значений';
  SCompilerPermissionsTooMany = 'Слишком много уникальных значений в параметре "Permissions"';

  { [Code] }
  SCompilerCodeUnsupportedEventFunction = 'Событие именованной функции "%s" больше не поддерживается. Создайте функцию "%s" вместо нёе';
  SCompilerCodeFunctionRenamed = 'Функция "%s" была переименована. Вместо неё используйте "%s".';
  SCompilerCodeFunctionRenamedWithAlternative = 'Функция "%s" была переименована. Вместо неё используйте "%s" или рассмотрите применение "%s".';

  { [Types] }
  SCompilerTypesCustomTypeAlreadyDefined = 'Пользовательский тип уже был объявлен';

  { [Components], [Tasks], [Languages] }
  SCompilerComponentsOrTasksBadName = 'Параметр "Name" содержит недопустимые символы.' + SNewLine2 +
    'Разрешается использовать только алфавитно-цифровые символы, знак подчеркивания и наклонные (/) или (\), причем цифры не должны быть первыми, а наклонные первыми и последними. Имена ''not'', ''and'' и ''or'' зарезервированы приложением.';
  SCompilerComponentsInvalidLevel = 'Компонент не может содержать более одного вложения.';
  SCompilerTasksInvalidLevel = 'Задача не может содержать более одного вложения.'; 
  SCompilerLanguagesBadName = 'Параметр "Name" содержит недопустимые символы.' + SNewLine2 + 'Разрешается использовать только алфавитно-цифровые символы и знак подчеркивания. Имена ''not'', ''and'' и ''or'' зарезервированы приложением.';

  { [Languages] }
  SCompilerParamUnknownLanguage = 'Параметр "%s" содержит неизвестный язык';

  { [Messages] }
  SCompilerMessagesMissingEquals = 'Отсутствует разделитель "=" между именем и текстом сообщения.';
  SCompilerMessagesNotRecognizedDefault = 'Имя сообщения "%s" в Default.isl для этой версии Inno Setup является недействительным.';
  SCompilerMessagesNotRecognizedWarning = 'Имя сообщения "%s" для этой версии Inno Setup является недействительным. Пропущено.';
  SCompilerMessagesNotRecognizedInFileWarning = 'Имя сообщения "%s" в "%s" для этой версии Inno Setup является недействительным. Пропущено.';
  SCompilerMessagesMissingDefaultMessage = 'Сообщение с именем "%s" в файле Default.isl не объявлено. Это необходимо для этой версии Inno Setup.';
  SCompilerMessagesMissingMessageWarning = 'Сообщение с именем "%s" для языка "%s" не объявлено. Будет использовано сообщение на английском языке из Default.isl.';

  { [CustomMessages] }
  SCompilerCustomMessageBadName = 'Имя пользовательского сообщения может состоять только алфавитно-цифровых символов и знака подчеркивания, причем цифры не должны быть первыми.';
  SCompilerCustomMessagesMissingLangWarning = 'Пользовательское сообщение "%s" для языка "%s" не объявлено. Будет использовано сообщение из начального языка, где оно было объявлено: "%s".';
  SCompilerCustomMessagesMissingName = 'Имя пользовательского сообщения "%s" не объявлено.';

  { [Messages] & [LangOptions] }
  SCompilerUnknownLanguage = 'Неизвестное имя языка "%s".';
  SCompilerCantSpecifyLanguage = 'Возможно имя языка не объявлено в файле сообщений.';
  SCompilerCantSpecifyLangOption = 'Параметр "%s" не может быть применён ко всем языкам.';

  { [Files] }
  SCompilerFilesTmpBadFlag = 'Параметр "Flags" не может иметь флаг "%s" для ' +
    'копирования файла в каталог {tmp}, или когда используется флаг ' +
    '"deleteafterinstall" или "dontcopy".';
  SCompilerFilesWildcardNotMatched = 'Файлы, соответствующие "%s", не найдены.';
  SCompilerFilesDestNameCantBeSpecified = 'Нельзя указывать параметр "DestName", если ' +
    'параметр "Source" содержит специальные символы.';
  SCompilerFilesStrongAssemblyNameMustBeSpecified = 'Должен быть указан параметр "StrongAssemblyName", если ' +
    'используется флаг "gacinstall".';
  SCompilerFilesCantHaveExternalExclude = 'Можно не указывать параметр "Excludes", если ' +
    'используется флаг "external".';
  SCompilerFilesCantHaveNonExternalExternalSize = 'Параметр "ExternalSize" может применён только тогда, когда ' +
    'используется флаг "external".';
  SCompilerFilesExcludeTooLong = 'Параметр "Excludes" содержит слишком длинное значение.';
  SCompilerFilesCantReadVersionInfoOn64BitImage = 'Чтобы иметь возможность получать информацию из 64-бит данных, ' +
    'компилятор должен быть запущен на системе Windows 2000 или выше.';
  SCompilerFilesUnsafeFile = 'Обнаружен небезопасный файл: %s.' + SNewLine2 +
    'Ознакомьтесь с разделом "Небезопасные файлы" в справке Inno Setup.';
  SCompilerFilesSystemDirUsed = 'Попытка использования файла DLL из системного каталога Windows.' + SNewLine2 +
    'Смотрите раздел "Небезопасные файлы" в справке Inno Setup, почему это опасно и следует избегать.';
  SCompilerFilesSystemDirNotUsed = 'Попытка регистрации файла %s в каталоге отличном от {sys}.' + SNewLine2 +
    'Смотрите раздел "Небезопасные файлы" в справке Inno Setup, почему это опасно и следует избегать.';
  SCompilerFilesIgnoreVersionUsedUnsafely =
    'Небезопасное использование флага для файла "%s": Флаг "ignoreversion" нельзя использовать ' +
    'при установке файлов в системный каталог Windows ("{sys}").';
  SCompilerFilesWarningCopyMode = 'В этой версии Inno Setup "CopyMode: %s" был ' +
    'заменён на "Flags: %s". Работает так, как будто "Flags: %s" был указан.';
  SCompilerFilesWarningASISOO = '"CopyMode: alwaysskipifsameorolder" устарел и в этой версии ' +
    'Inno Setup не учитывается. Теперь такое поведение используется по умолчанию.';
  SCompilerFilesWarningSharedFileSysWow64 = 'DestDir не может быть установлен в ' +
    '"{syswow64}", если используется флаг "sharedfile". Смотрите справочную ' +
    'документацию по использованию "sharedfile".';

  { [Icons] }
  SCompilerIconsNamePathNotSpecified = 'Параметр "Name" должен содержать путь к значку, ' +
    'например, "{group}\My Icon".';
  SCompilerIconsIconIndexInvalid = 'Параметр "IconIndex" не является действительным целым числом.';

  { [Registry] }
  SCompilerRegistryDeleteKeyProhibited = 'Использование флагов "uninsdeletekey" и ' +
    '"deletekey" для указанного ключа запрещены, т.к. приводили к негативным последствиям. ' +
    '(Возможно вы хотите удалить только значение ключа.)';

  { [Run] }
  SCompilerRunCantUseRunOnceId = 'Параметр "RunOnceId" может использоваться только ' +
    'в секции [UninstallRun].';
  SCompilerRunFlagObsolete = 'Флаг "%s" является устаревшим. Вместо него используйте флаг "%s".';
  SCompilerRunMultipleWaitFlags = 'Параметр "Flags" не может содержать несколько флагов "wait".';

  { [UninstallRun] }
  SCompilerUninstallRunCantUseDescription = 'Параметр "Description" может использоваться только ' +
    'в секции [Run].';

implementation

end.
