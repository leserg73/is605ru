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
  SCompilerScriptFileLabel = '��������:';
  SCompilerStatusLabel = '���������:';
  SCompilerScriptBrowseButton = '�����...';
  SCompilerStartButton = '�����';
  SCompilerExitButton = '�����';
  SCompilerOpenFilter = '�������� Inno Setup (*.iss)|*.iss|��� �����|*.*';
  SCompilerExampleScripts = '������� ���������...';
  SCompilerMoreFiles = '������ ����� ���������...';

  { Compiler Script Wizard }
  SWizardDefaultName = '������ �������� ��������� Inno Setup';
  SWizardWelcome = '����� ����������';
  SWizardAppInfo = '���������� � ����������';
  SWizardAppInfo2 = '����������, ������� ���������� � ����� ����������.';
  SWizardAppDir = '������� ���������';
  SWizardAppDir2 = '����������, ������� ����� ��� ��������� ������ ����������.';
  SWizardAppFiles = '����� ����������';
  SWizardAppFiles2 = '����������, ������� ����� ������ ����������.';
  SWizardAppFiles3 = '����������, ������� ����� � ��������� �������:';
  SWizardAppFilesSubDirsMessage = '������� �� ����� �������� ��� �����, ����������� � ��������� "%s"?';
  SWizardAppExeFilter = '����� ���������� (*.exe)|*.exe|��� �����|*.*';
  SWizardAppExeDefaultExt = 'exe';
  SWizardAppIcons = '������ ����������';
  SWizardAppIcons2 = '����������, ������� ����� �������� ������ ��� ������ ����������.';
  SWizardAppDocs = '������������ ����������';
  SWizardAppDocs2 = '����������, ������� ��������� ����������, ������� ������ ���� �������� � �������� ���������.';
  SWizardAppDocsFilter = '����� ���������� (*.rtf,*.txt)|*.rtf;*.txt|��� �����|*.*';
  SWizardAppDocsDefaultExt = 'rtf';
  SWizardPrivilegesRequired = '����� ���������';
  SWizardPrivilegesRequired2 = '����������, �������� ����� ������� ���������.';
  SWizardLanguages = '�������� ���������';
  SWizardLanguages2 = '����������, �������� �����, ������� ���������� �������� � ��������� ������ ����������.';
  SWizardCompiler = '��������� �����������';
  SWizardCompiler2 = '����������, ������� �������� ��������� �����������.';
  SWizardCompilerSetupIconFileFilter = '����� ������� (*.ico)|*.ico|��� �����|*.*';
  SWizardCompilerSetupIconFileDefaultExt = 'ico';
  SWizardCompilerOutputDir = '����������, ������� �����.';
  SWizardISPP = '������������ Inno Setup';
  SWizardISPP2 = '������� ����������, ������ �� �������������� ������������ Inno Setup.';
  SWizardISPPLabel = '[name] ����� ������������ ��������� ����������� #define, ��� �������� ��������� ��� ��������. ���� � ���� ��� ������ �������������, ����� ����� ����� ������� �������� ��������.' + SNewLine2 + '�� ������, ����� ������ ����������� ��������� #define?';
  SWizardISPPCheck = '��, ������������ ��������� ����������� #define';
  SWizardFinished = '���������';

  SWizardNextButton = '����� >';
  SWizardFinishButton = '������';
  SWizardCancelMessage = '������ ������� �������� ��������� Inno Setup �� ���������.'#13'���� �� ����������� ���� �����, �� �������� ������ �� �����.'#13#13'�� ������������� ������ ���������� ������ �������?';

  SWizardAllFilesFilter = '��� �����|*.*';

  SWizardAppNameError = '����������, ������� �������� ����������.';
  SWizardAppVersionError = '����������, ������� ������ ����������.';
  SWizardAppRootDirError = '����������, ������� ����� ��������� ����������.';
  SWizardAppDirNameError = '����������, ������� �������� �����.';
  SWizardAppExeError = '����������, ������� ������� ����������� ���� ����������.';
  SWizardAppGroupNameError = '����������, ������� ����� ���������� ��� ���� ����.';
  SWizardFileDestRootDirError = '����������, ������� �������� ����� ���������.';
  SWizardFileAppDestRootDirError = '����������, ������� �������� ����� ��������� �������� �� ����� ����������.';
  SWizardLanguagesSelError = '����������, �������� �� ����� ������ ����� ���������.';

  SWizardScriptHeader = '; ���� �������� ������ � ������� ������� Inno Setup.' + SNewLine  + '; ���������� � ���������� ������������, ����� ������������ ��� ����������� INNO SETUP!';

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
  SCompilerStatusStarting = '*** ������ ����������.  [%s]';
  SCompilerStatusCreatingOutputDir = '�������� ����� ������: %s';
  SCompilerStatusCreatingSignedUninstallerDir = '�������� �������� ������� ��� ��������������: %s';
  SCompilerStatusDeletingPrevious = '�������� %s �� ����� ������';
  SCompilerStatusParsingSectionLine = '������ ������ [%s], ������ %d';
  SCompilerStatusParsingSectionLineFile = '������ ������ [%s], ������ %d �� %s';
  SCompilerStatusFilesVerInfo = '   ������ ������: %s';
  SCompilerStatusReadingFile = '������ ����� (%s)';
  SCompilerStatusPreparingSetupExe = '���������� ��������� ���������';
  SCompilerStatusSkippingPreparingSetupExe = '������� ���������� ������������ ����� ��������� ���������, ����� ��������';
  SCompilerStatusSignedUninstallerNew = '   �������� ������ ������������ ����� �������������: %s';
  SCompilerStatusSignedUninstallerExisting = '   ������������� ������������� ������������ ����� �������������: %s';
  SCompilerStatusDeterminingCodePages = '����������� ������� ������� �����';
  SCompilerStatusConvertCodePage = '   �������������� ������� ��������: %d';
  SCompilerStatusReadingDefaultMessages = '������ ��������� �� Default.isl';
  SCompilerStatusParsingMessages = '������ ������ [LangOptions], [Messages] � [CustomMessages]';
  SCompilerStatusReadingCode = '������ ������ [Code]';
  SCompilerStatusCompilingCode = '���������� ������ [Code]';
  SCompilerStatusReadingInFile = '   ����: %s';
  SCompilerStatusReadingInScriptMsgs = '   ��������� �� ����� ��������';
  SCompilerStatusCreateSetupFiles = '�������� ������ ���������';
  SCompilerStatusSkippingCreateSetupFiles = '������� �������� ������������ ������, ����� ��������';
  SCompilerStatusCreateManifestFile = '�������� ����� ���������';
  SCompilerStatusFilesInitEncryption = '   ������������� ����������';
  SCompilerStatusFilesCompressing = '   ������: %s';
  SCompilerStatusFilesCompressingVersion = '   ������: %s   (%u.%u.%u.%u)';
  SCompilerStatusFilesStoring = '   ����������: %s';
  SCompilerStatusFilesStoringVersion = '   ����������: %s   (%u.%u.%u.%u)';
  SCompilerStatusCompressingSetupExe = '   ������ ����� ���������';
  SCompilerStatusUpdatingVersionInfo = '   ���������� ������ (%s)';
  SCompilerStatusUpdatingIcons = '   ���������� ������� (%s)';
  SCompilerStatusUpdatingStyles = '   ���������� ����� (%s)';
{$IFNDEF PS_MINIVCL}
  SCompilerStatusUpdatingRes = '   ���������� �������� (%s)';
{$ENDIF}
  SCompilerStatusCreatingDisk = '   �������� ����� %d';
  SCompilerStatusFinished = '*** ���������� ���������.  [%s, ������ %s]';
  SCompilerStatusError = '������:';
  SCompilerStatusErrorAborted = '*** ���������� ��������.';
  SCompilerStatusReset = '*** ��������� ���������� ������ ������. ��������� �������.';
  SCompilerStatusWarning = '��������! ';
  SCompilerStatusSigningSetup = '   �������� ������� ����� ���������';
  SCompilerStatusSigningSourceFile = '   �������� �������: %s';
  SCompilerStatusSourceFileAlreadySigned = '   �������� ������� ���������, ��� ����������: %s';
  SCompilerStatusSigning = '   ���������� Sign Tool %s: %s';
  SCompilerStatusSigningWithDelay = '   ���������� Sign Tool %s � %d (�����������): %s';
  SCompilerStatusWillRetrySigning = '   ������ ���������� ������� Sign Tool (%s). ����� ����������� ����� ������� (������� �������: %d).';

  SCompilerSuccessfulMessage2 = '����������� ��������� ���� ������� ������� ' +
    '� ����� ������:' + SNewLine +
    '%s' + SNewLine +
    SNewLine +
    '�� ������ ��������� �������� ���������?';
  SCompilerSuccessfulTitle = '���������� ������� ���������';
  SCompilerNeedCompiledExe = '���������� ��������� ��������� � ������� ������. ��������� ��������� ���������� ���������� � ���������� ����� ���������.';
  SCompilerNeedUninstExe = '�� ������� �������� ������ � �������������. ����������, ��������� ������� ���������.';
  SCompilerExecuteSetupError2 = '������ ���������� "%s":' + SNewLine2 + '%d: %s';

  SCompilerAborted = '���������� ��������. ����������, ��������� �������� � ���������� �����.';

  { Fatal errors }
  SCompilerScriptMissing2 = '��������� ���� �������� �� ����������';
  SCompilerOutputNotEmpty2 = '�������� ������� �� ������ ��������� �����-���� ' +
    '������������ ������. ��� ������� ���������� ��� ����� � ������� SETUP.* ' +
    '����� ������������� �������.';
  SCompilerUnknownFilenamePrefix = '����������� ������� � ����� ����� "%s"';
  SCompilerSourceFileDoesntExist = '�������� ���� "%s" �� ����������';
  SCompilerCopyError3 = '�� ������� ����������� "%s" � "%s".' + SNewLine2 + '������ %d: %s';
  SCompilerReadError = '�� ������� ��������� "%s".' + SNewLine2 + '������: %s';
  SCompilerCompressError2 = '��������� ���������� ������ ��� ������� ������ "%s"';
  SCompilerNotEnoughSpaceOnFirstDisk = '�� ����� ������������ ���������� ����� ��� ����������� ���� ����������� ������.';
  SCompilerSetup0Mismatch = '���������� ������ SC1';
  SCompilerMustUseDiskSpanning = '���������� �������� ��������� �� ����� ��� �������� ������ ��������� �������� ����� ��� %d ����.';
  SCompilerCompileCodeError = '��������� ������ ��� ���������� ������ [Code]:' + SNewLine2 + '%s';
  SCompilerISCryptMissing = '���������� ����������, �.�. ����������� ���� ISCrypt.dll.' + SNewLine2 +
    '����������: ��� ���� �� ������ � ����������� �������� Inno Setup, � ����� ���� �������� � ���-����� Inno Setup.';
  SCompilerFunctionFailedWithCode = '�� ������� %s. ������ %d: %s';

  { [Setup] }
  SCompilerUnknownDirective = '� ������ [%s] �� ������� ���������� ��������� "%s".';
  SCompilerEntryObsolete = '� ������ [%s] ��������� "%s" �������� ���������� � ���� ������� Inno Setup �� �����������.';
  SCompilerEntrySuperseded2 = '� ������ [%s] ��������� "%s" ���� �������� �� %s" � ���� ������ Inno Setup.';
  SCompilerEntryMissing2 = '��������� � ������ [%s] ��������� "%s" �� �������.';
  SCompilerEntryInvalid2 = '� ������ [%s] �������� ��������� "%s" �������� ����������������.';
  SCompilerEntryAlreadySpecified = '� ������ [%s] ��������� "%s" ��� ����������.';
  SCompilerAppVersionOrAppVerNameRequired = '������ [Setup] ������ ��������� ��������� AppVersion ��� AppVerName.';
  SCompilerMinVersionWinMustBeZero = '����������� ������ Windows, ������������ ��� MinVersion, ������ ���� 0. (Windows 95/98/Me ������ �� ��������������.)';
  SCompilerMinVersionNTTooLow = '����������� �������� ������ NT ��� ��������� "MinVersion" ������ ���� �� ������ %s. (Windows 2000/XP/Server 2003 ������ �� ��������������.)';
  SCompilerDiskSliceSizeInvalid = '�������� DiskSliceSize ������ ���� ����� %d � %d, ��� "max"';
  SCompilerDiskClusterSizeInvalid = '�������� DiskClusterSize ������ ���� � �������� �� 1 �� 32768';
  SCompilerInstallModeObsolete = '� ������ [%s] ��������� "%s" �������� ���������� � ���� ������� Inno Setup �� �����������. ������ �� ����������� ��������� ��������� ������.';
  SCompilerMessagesFileObsolete = '��������� MessagesFile �������� � ������ �� ��������������. ����������� ������ �� ������ [Languages].';
  SCompilerDirectiveIsNTOnly = '� ������ [%s] ��������� "%s" ����� �� ��������������, ���� ���������� ����������� �� Windows 95/98/Me';
  SCompilerDirectiveRequiresWindows2000 = '� ������ [%s] ��������� "%s" ����� �� ��������������, ���� ���������� ����������� �� Windows 95/98/Me/NT4';
  SCompilerMustUseDisableStartupPrompt = 'DisableStartupPrompt ������ ���� ����������� � "yes", ���� �������� ��������� AppName.';
  SCompilerMustNotUsePreviousLanguage = 'UsePreviousLanguage ������ ���� ����������� � "no", ���� �������� ��������� AppId.';
  SCompilerMustNotUsePreviousPrivileges = 'UsePreviousPrivileges ������ ���� ����������� � "no", ���� �������� ��������� AppId � PrivilegesRequiredOverridesAllowed ��������� "dialog"';
  SCompilerDirectiveNotUsingDefault = '� ������ [Setup] ��������� "%s" �������� �������� �� ���������, �.�. %s �������� ���������.';
  SCompilerDirectiveNotUsingPreferredDefault = '� ������ [Setup] ��������� "%s" �� ��������� ����� ����������� � %s, �.�. %s �������� ���������.';
  SCompilerDirectivePatternTooLong = '� ������ [Setup] ��������� "%s" �������� ������� ������� ��������.';
  SCompilerOutputBaseFileNameSetup = '�� ������������� � ������ [Setup] ��� ��������� "OutputBaseFileName" ��������� ��� "setup", �.�. ��� ����������� ����� ���� "setup.exe" �� ������� Windows ������������ ��� ����������� ������������� ���������� ' +
                                     '� �������� �������������� ������ DLL, ����� ��� version.dll � ��. �������� ���� ������ DLL �������� ������������ � ������� Windows ����� ���� ��������. ���������� ������������ ������ ���, �������� "mysetup".';

  { Signing }
  SCompilerSignatureNeeded = '������� ����� ������� �������������. ��������� ' +
    '������� ���������� �������� �������, ����������, ���������� ���� �������� ������� ' +
    '� ���������� ������������ �����:' + SNewLine2 + '%s' + SNewLine2 +
    '� ��������� ���������� �����.';
  SCompilerSignatureInvalid = '������������ �������� �������';
  SCompilerSignedFileContentsMismatchRetry = '���������� ������������ �����:' +
    SNewLine2 + '%s' + SNewLine2 + '�������� ������� ���������� �� ��������� �����. ' +
    '���������� ������� ����������� ���� � ��������� ���������� �����. ���� ��� ������ ' +
    '����������, ����������, �������� ��� � ��������.';
  SCompilerSignedFileContentsMismatch = '���������� ������������ �����:' +
    SNewLine2 + '%s' + SNewLine2 + '�������� ������� ���������� �� ��������� ' +
    '�����.';
  SCompilerNoSetupLdrSignError = '��������� SignTool � SignedUninstaller �� ����� ���������, ���� UseSetupLdr ����������� � "no"';
  SCompilerSignToolFileNameSequenceNotFound = '�� ������� ��������� Sign Tool %s: ����������� ������������������ $f.'; 
  SCompilerSignToolCreateProcessFailed = '�� ������� ��������� ������� Sign Tool.' +
    SNewLine2 + '������ %d: %s'; 
  SCompilerSignToolNonZeroExitCode = '���� ������� Sign Tool � ����� ������ 0x%x';
  SCompilerSignToolSucceededButNoSignature = '������� The Sign Tool ������� ' +
    '��� ������ 0, �� ���� �� ������� �������� �������.';

  { Line parsing }
  SCompilerLineTooLong = '������ ������� �������';
  SCompilerSectionTagInvalid = '���������������� ��� ������';
  SCompilerSectionBadEndTag = '������ "%s" �� �������, �� ������ ����������� ' +
    '���.';
  SCompilerTextNotInSection = '����� ��������� �� ��������� ������.';
  SCompilerInvalidDirective = '���������������� ��������� �����������' +
    SNewLine2 + '����� ������������ ��������� ����������� ����� ''#include'', ���������� ���������� ������������ Inno Setup (ISPP).' +
    SNewLine2 + '��� ����� �������������� Inno Setup � ���������� ������ ��������� ISPP.';
  SCompilerErrorOpeningIncludeFile = '�� ������� ������� ������������ ���� "%s": %s';
  SCompilerRecursiveInclude = '�������� �������� "%s"';
  SCompilerIllegalNullChar = '������������ ������� ������ � ������ %d';
  SCompilerISPPMissing = '�� ������ ���� ISPP.dll';

  { Constant checks }
  SCompilerTwoBraces = '����������� ������ ��� ������� "{", ���� ������ ' +
    '�������� ������������ ������ "{" ������ ���������.';
  SCompilerUnknownConst = '����������� ��������� "%s".' +
    SNewLine2 + SCompilerTwoBraces;
  SCompilerUnterminatedConst = '����������� ����������� ������ "}" � ���������� ��������� "%s".' +
    SNewLine2 + SCompilerTwoBraces;
  SCompilerConstCannotUse = '������������� ����� ��������� "%s" �����������.';
  SCompilerBadEnvConst = '���������������� ��������� ��������� "%s"';
  SCompilerBadRegConst = '���������������� ��������� ������� "%s"';
  SCompilerBadIniConst = '���������������� ��������� INI "%s"';
  SCompilerBadParamConst = '���������������� ��������� ���������� ��������� ������ "%s"';
  SCompilerBadCodeConst = '���������������� ��������� ���� "%s"';
  SCompilerBadDriveConst = '���������������� ��������� ����� "%s"';
  SCompilerBadCustomMessageConst = '���������������� ��������� ����������������� ��������� "%s"';
  SCompilerBadBoolConst = '���������������� ���������� ��������� "%s"';
  SCompilerConstantRenamed = '��������� "%s" ���� �������������. ������ �� ����������� "%s".';
  SCompilerCommonConstantRenamed = '��������� "%s" ���� �������������. ������ �� ����������� "%s" ��� ����������� ���������� � ����� "auto".';

  { Area checks }
  SCompilerUsedUserAreasWarning = '� ������ [%s] ��� ��������� "%s" ����������� �������� "%s", ' + SNewLine +
    '�� � �������� ������������ ���������������� ������� (%s). ��� ���������������� ' + SNewLine +
    '������ ���������, ���������� �� ������ Windows, ��������� ��������� ������������, �������� ' + SNewLine +
    '��������� � ���������������� �������: ��� ����� �������� � ������, ����������� �����������. ' + SNewLine +
    '��� ��������� �������������� ���������� ���������� � �������, ����� "UsedUserAreasWarning".';

  { Directive parsing }
  SCompilerDirectiveNameMissing = '����������� ��� ���������';
  SCompilerDirectiveHasNoValue = '��������� "%s" �� �������� ��������';

  { Parameter parsing }
  SCompilerParamHasNoValue = '��������� �������� "%s" �� �������� ��������';
  SCompilerParamQuoteError = '���������� ������� ��� �� �������������� ��� ��������� "%s"';
  SCompilerParamMissingClosingQuote = '����������� ����������� ������� ��� ��������� "%s"';
  SCompilerParamDataTooLong = '������ ��������� "%s" ������� ������';
  SCompilerParamUnknownParam = '�� ������������ ��� ��������� "%s"';
  SCompilerParamDuplicated = '�� ����� ��������� ��������� ���������� "%s"';
  SCompilerParamEmpty2 = '�������� "%s" ������';
  SCompilerParamNotSpecified = '��������� �������� "%s" �� ������';
  SCompilerParamNoQuotes2 = '�������� "%s" �� ����� ��������� ������� (")';
  SCompilerParamNoBackslash = '�������� "%s" �� ����� ��������� �������� ����� �����  (\)';
  SCompilerParamNoPrecedingBackslash = '�������� "%s" �� ����� ���������� � �������� ����� ����� (\)';
  SCompilerParamInvalid2 = '�������� "%s" �������� ������������ ��������';

  { Flags }
  SCompilerParamUnknownFlag2 = '�������� "%s" �������� ����������� ����';
  SCompilerParamErrorBadCombo2 = '�������� "%s" �� ����� ��������� ��� �����: "%s" � "%s"';
  SCompilerParamUnsupportedFlag = '�������� "%s" �������� ����, ������� �� �������������� � ���� ������';
  SCompilerParamFlagMissing = '���� "%s" ������ �������������� ��������� � ������ "%s"';
  SCompilerParamFlagMissing2 = '���� "%s" ������ �������������� ��������� � ���������� "%s"';

  { Types, components, tasks, check, beforeinstall, afterinstall }
  SCompilerParamUnknownType = '�������� "%s" �������� ����������� ���';
  SCompilerParamUnknownComponent = '�������� "%s" �������� ����������� ���������';
  SCompilerParamUnknownTask = '�������� "%s" �������� ����������� ������';
  SCompilerExpressionError = '������ ��������� � ��������� ��� ��������� "%s": %s';
  SCompilerBadCheckOrInstall = '���������������� �������� "%s" ��� Check, BeforeInstall ��� AfterInstall';

  { Permissions }
  SCompilerPermissionsInvalidValue = '�������� "Permissions" �������� ���������� ��������: "%s"';
  SCompilerPermissionsUnknownSid = '�������� "Permissions" �������� ����������� SID: "%s"';
  SCompilerPermissionsUnknownMask = '�������� "Permissions" �������� ����������� ��� �������: "%s"';
  SCompilerPermissionsValueLimitExceeded = '�������� "Permissions" �� ����� ��������� ����� ��� %d ��������';
  SCompilerPermissionsTooMany = '������� ����� ���������� �������� � ��������� "Permissions"';

  { [Code] }
  SCompilerCodeUnsupportedEventFunction = '������� ����������� ������� "%s" ������ �� ��������������. �������� ������� "%s" ������ ��';
  SCompilerCodeFunctionRenamed = '������� "%s" ���� �������������. ������ �� ����������� "%s".';
  SCompilerCodeFunctionRenamedWithAlternative = '������� "%s" ���� �������������. ������ �� ����������� "%s" ��� ����������� ���������� "%s".';

  { [Types] }
  SCompilerTypesCustomTypeAlreadyDefined = '���������������� ��� ��� ��� ��������';

  { [Components], [Tasks], [Languages] }
  SCompilerComponentsOrTasksBadName = '�������� "Name" �������� ������������ �������.' + SNewLine2 +
    '����������� ������������ ������ ���������-�������� �������, ���� ������������� � ��������� (/) ��� (\), ������ ����� �� ������ ���� �������, � ��������� ������� � ����������. ����� ''not'', ''and'' � ''or'' ��������������� �����������.';
  SCompilerComponentsInvalidLevel = '��������� �� ����� ��������� ����� ������ ��������.';
  SCompilerTasksInvalidLevel = '������ �� ����� ��������� ����� ������ ��������.'; 
  SCompilerLanguagesBadName = '�������� "Name" �������� ������������ �������.' + SNewLine2 + '����������� ������������ ������ ���������-�������� ������� � ���� �������������. ����� ''not'', ''and'' � ''or'' ��������������� �����������.';

  { [Languages] }
  SCompilerParamUnknownLanguage = '�������� "%s" �������� ����������� ����';

  { [Messages] }
  SCompilerMessagesMissingEquals = '����������� ����������� "=" ����� ������ � ������� ���������.';
  SCompilerMessagesNotRecognizedDefault = '��� ��������� "%s" � Default.isl ��� ���� ������ Inno Setup �������� ����������������.';
  SCompilerMessagesNotRecognizedWarning = '��� ��������� "%s" ��� ���� ������ Inno Setup �������� ����������������. ���������.';
  SCompilerMessagesNotRecognizedInFileWarning = '��� ��������� "%s" � "%s" ��� ���� ������ Inno Setup �������� ����������������. ���������.';
  SCompilerMessagesMissingDefaultMessage = '��������� � ������ "%s" � ����� Default.isl �� ���������. ��� ���������� ��� ���� ������ Inno Setup.';
  SCompilerMessagesMissingMessageWarning = '��������� � ������ "%s" ��� ����� "%s" �� ���������. ����� ������������ ��������� �� ���������� ����� �� Default.isl.';

  { [CustomMessages] }
  SCompilerCustomMessageBadName = '��� ����������������� ��������� ����� �������� ������ ���������-�������� �������� � ����� �������������, ������ ����� �� ������ ���� �������.';
  SCompilerCustomMessagesMissingLangWarning = '���������������� ��������� "%s" ��� ����� "%s" �� ���������. ����� ������������ ��������� �� ���������� �����, ��� ��� ���� ���������: "%s".';
  SCompilerCustomMessagesMissingName = '��� ����������������� ��������� "%s" �� ���������.';

  { [Messages] & [LangOptions] }
  SCompilerUnknownLanguage = '����������� ��� ����� "%s".';
  SCompilerCantSpecifyLanguage = '�������� ��� ����� �� ��������� � ����� ���������.';
  SCompilerCantSpecifyLangOption = '�������� "%s" �� ����� ���� ������� �� ���� ������.';

  { [Files] }
  SCompilerFilesTmpBadFlag = '�������� "Flags" �� ����� ����� ���� "%s" ��� ' +
    '����������� ����� � ������� {tmp}, ��� ����� ������������ ���� ' +
    '"deleteafterinstall" ��� "dontcopy".';
  SCompilerFilesWildcardNotMatched = '�����, ��������������� "%s", �� �������.';
  SCompilerFilesDestNameCantBeSpecified = '������ ��������� �������� "DestName", ���� ' +
    '�������� "Source" �������� ����������� �������.';
  SCompilerFilesStrongAssemblyNameMustBeSpecified = '������ ���� ������ �������� "StrongAssemblyName", ���� ' +
    '������������ ���� "gacinstall".';
  SCompilerFilesCantHaveExternalExclude = '����� �� ��������� �������� "Excludes", ���� ' +
    '������������ ���� "external".';
  SCompilerFilesCantHaveNonExternalExternalSize = '�������� "ExternalSize" ����� ������� ������ �����, ����� ' +
    '������������ ���� "external".';
  SCompilerFilesExcludeTooLong = '�������� "Excludes" �������� ������� ������� ��������.';
  SCompilerFilesCantReadVersionInfoOn64BitImage = '����� ����� ����������� �������� ���������� �� 64-��� ������, ' +
    '���������� ������ ���� ������� �� ������� Windows 2000 ��� ����.';
  SCompilerFilesUnsafeFile = '��������� ������������ ����: %s.' + SNewLine2 +
    '������������ � �������� "������������ �����" � ������� Inno Setup.';
  SCompilerFilesSystemDirUsed = '������� ������������� ����� DLL �� ���������� �������� Windows.' + SNewLine2 +
    '�������� ������ "������������ �����" � ������� Inno Setup, ������ ��� ������ � ������� ��������.';
  SCompilerFilesSystemDirNotUsed = '������� ����������� ����� %s � �������� �������� �� {sys}.' + SNewLine2 +
    '�������� ������ "������������ �����" � ������� Inno Setup, ������ ��� ������ � ������� ��������.';
  SCompilerFilesIgnoreVersionUsedUnsafely =
    '������������ ������������� ����� ��� ����� "%s": ���� "ignoreversion" ������ ������������ ' +
    '��� ��������� ������ � ��������� ������� Windows ("{sys}").';
  SCompilerFilesWarningCopyMode = '� ���� ������ Inno Setup "CopyMode: %s" ��� ' +
    '������ �� "Flags: %s". �������� ���, ��� ����� "Flags: %s" ��� ������.';
  SCompilerFilesWarningASISOO = '"CopyMode: alwaysskipifsameorolder" ������� � � ���� ������ ' +
    'Inno Setup �� �����������. ������ ����� ��������� ������������ �� ���������.';
  SCompilerFilesWarningSharedFileSysWow64 = 'DestDir �� ����� ���� ���������� � ' +
    '"{syswow64}", ���� ������������ ���� "sharedfile". �������� ���������� ' +
    '������������ �� ������������� "sharedfile".';

  { [Icons] }
  SCompilerIconsNamePathNotSpecified = '�������� "Name" ������ ��������� ���� � ������, ' +
    '��������, "{group}\My Icon".';
  SCompilerIconsIconIndexInvalid = '�������� "IconIndex" �� �������� �������������� ����� ������.';

  { [Registry] }
  SCompilerRegistryDeleteKeyProhibited = '������������� ������ "uninsdeletekey" � ' +
    '"deletekey" ��� ���������� ����� ���������, �.�. ��������� � ���������� ������������. ' +
    '(�������� �� ������ ������� ������ �������� �����.)';

  { [Run] }
  SCompilerRunCantUseRunOnceId = '�������� "RunOnceId" ����� �������������� ������ ' +
    '� ������ [UninstallRun].';
  SCompilerRunFlagObsolete = '���� "%s" �������� ����������. ������ ���� ����������� ���� "%s".';
  SCompilerRunMultipleWaitFlags = '�������� "Flags" �� ����� ��������� ��������� ������ "wait".';

  { [UninstallRun] }
  SCompilerUninstallRunCantUseDescription = '�������� "Description" ����� �������������� ������ ' +
    '� ������ [Run].';

implementation

end.
