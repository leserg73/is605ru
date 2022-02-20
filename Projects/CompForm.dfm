object CompileForm: TCompileForm
  Left = 206
  Top = 97
  Caption = '*'
  ClientHeight = 265
  ClientWidth = 612
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = True
  Position = poDefault
  OnAfterMonitorDpiChanged = FormAfterMonitorDpiChanged
  OnCloseQuery = FormCloseQuery
  OnKeyDown = FormKeyDown
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 29
    Width = 612
    Height = 1
    Align = alTop
    Shape = bsTopLine
  end
  object BodyPanel: TPanel
    Left = 0
    Top = 30
    Width = 612
    Height = 215
    Align = alClient
    BevelOuter = bvNone
    FullRepaint = False
    TabOrder = 0
    object SplitPanel: TPanel
      Left = 0
      Top = 107
      Width = 612
      Height = 4
      Cursor = crSizeNS
      Align = alBottom
      BevelOuter = bvNone
      FullRepaint = False
      TabOrder = 1
      Visible = False
      OnMouseMove = SplitPanelMouseMove
    end
    object StatusPanel: TPanel
      Left = 0
      Top = 111
      Width = 612
      Height = 104
      Align = alBottom
      BevelOuter = bvNone
      FullRepaint = False
      TabOrder = 0
      Visible = False
      object DebugCallStackList: TListBox
        Left = 0
        Top = 0
        Width = 612
        Height = 83
        Style = lbOwnerDrawFixed
        Align = alClient
        BorderStyle = bsNone
        ItemHeight = 13
        MultiSelect = True
        PopupMenu = ListPopupMenu
        TabOrder = 2
        Visible = False
        OnDrawItem = DebugCallStackListDrawItem
      end
      object DebugOutputList: TListBox
        Left = 0
        Top = 0
        Width = 612
        Height = 83
        Style = lbOwnerDrawFixed
        Align = alClient
        BorderStyle = bsNone
        ItemHeight = 13
        MultiSelect = True
        PopupMenu = ListPopupMenu
        TabOrder = 1
        Visible = False
        OnDrawItem = DebugOutputListDrawItem
      end
      object CompilerOutputList: TListBox
        Left = 0
        Top = 0
        Width = 612
        Height = 83
        Style = lbOwnerDrawFixed
        Align = alClient
        BorderStyle = bsNone
        ItemHeight = 13
        MultiSelect = True
        PopupMenu = ListPopupMenu
        TabOrder = 0
        OnDrawItem = CompilerOutputListDrawItem
      end
      object TabSet: TNewTabSet
        Left = 0
        Top = 83
        Width = 612
        Height = 21
        Align = alBottom
        TabIndex = 0
        Tabs.Strings = (
          'Сообщения компилятора'
          'Сообщения отладки'
          'Стек вызовов')
        OnClick = TabSetClick
      end
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 245
    Width = 612
    Height = 20
    Panels = <
      item
        Alignment = taCenter
        Bevel = pbNone
        Text = '   1:   1'
        Width = 64
      end
      item
        Alignment = taCenter
        Bevel = pbNone
        Width = 64
      end
      item
        Alignment = taCenter
        Bevel = pbNone
        Text = 'Вставка'
        Width = 64
      end
      item
        Bevel = pbNone
        Style = psOwnerDraw
        Width = 23
      end
      item
        Bevel = pbNone
        Style = psOwnerDraw
        Width = 128
      end
      item
        Bevel = pbNone
        Width = 50
      end>
    OnDrawPanel = StatusBarDrawPanel
    OnResize = StatusBarResize
  end
  object ToolBarPanel: TPanel
    Left = 0
    Top = 0
    Width = 612
    Height = 29
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object ToolBar: TToolBar
      AlignWithMargins = True
      Left = 7
      Top = 4
      Width = 602
      Height = 25
      Margins.Left = 7
      Margins.Top = 4
      Margins.Bottom = 0
      Images = ToolBarVirtualImageList
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Transparent = True
      object NewButton: TToolButton
        Left = 0
        Top = 0
        Hint = 'Новый сценарий (Ctrl+N)'
        ImageIndex = 0
        OnClick = FNewClick
      end
      object OpenButton: TToolButton
        Left = 23
        Top = 0
        Hint = 'Открыть сценарий (Ctrl+O)'
        ImageIndex = 1
        OnClick = FOpenClick
      end
      object SaveButton: TToolButton
        Left = 46
        Top = 0
        Hint = 'Сохранить сценарий (Ctrl+S)'
        Enabled = False
        ImageIndex = 2
        OnClick = FSaveClick
      end
      object ToolButton4: TToolButton
        Left = 69
        Top = 0
        Width = 8
        Caption = 'ToolButton4'
        Style = tbsSeparator
      end
      object UndoButton: TToolButton
        Left = 77
        Top = 0
        Hint = 'Отменить (Ctrl+Z)'
        Enabled = False
        ImageIndex = 13
        OnClick = EUndoClick
      end
      object RedoButton: TToolButton
        Left = 100
        Top = 0
        Hint = 'Повторить (Ctrl+Y)'
        Enabled = False
        ImageIndex = 14
        OnClick = ERedoClick
      end
      object ToolButton1: TToolButton
        Left = 123
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 10
        Style = tbsSeparator
      end
      object CutButton: TToolButton
        Left = 131
        Top = 0
        Hint = 'Вырезать (Ctrl+X)'
        ImageIndex = 15
        OnClick = ECutClick
      end
      object CopyButton: TToolButton
        Left = 154
        Top = 0
        Hint = 'Копировать (Ctrl+C)'
        ImageIndex = 16
        OnClick = ECopyClick
      end
      object PasteButton: TToolButton
        Left = 177
        Top = 0
        Hint = 'Вставить (Ctrl+V)'
        ImageIndex = 17
        OnClick = EPasteClick
      end
      object DeleteButton: TToolButton
        Left = 200
        Top = 0
        Hint = 'Удалить (Del)'
        ImageIndex = 18
        OnClick = EDeleteClick
      end
      object ToolButton2: TToolButton
        Left = 223
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 10
        Style = tbsSeparator
      end
      object FindButton: TToolButton
        Left = 231
        Top = 0
        Hint = 'Найти (Ctrl+F)'
        ImageIndex = 20
        OnClick = EFindClick
      end
      object FindNextButton: TToolButton
        Left = 254
        Top = 0
        Hint = 'Искать далее (F3)'
        ImageIndex = 21
        OnClick = EFindNextClick
      end
      object ReplaceButton: TToolButton
        Left = 277
        Top = 0
        Hint = 'Заменить (Ctrl+H)'
        ImageIndex = 22
        OnClick = EReplaceClick
      end
      object GoToLineButton: TToolButton
        Left = 300
        Top = 0
        Hint = 'Перейти к строке (Ctrl+G)'
        ImageIndex = 23
        OnClick = EGotoClick
      end
      object ToolButton5: TToolButton
        Left = 323
        Top = 0
        Width = 8
        Caption = 'ToolButton5'
        ImageIndex = 10
        Style = tbsSeparator
      end
      object WordWrapButton: TToolButton
        Left = 331
        Top = 0
        Hint = 'Перенос по словам'
        ImageIndex = 24
        OnClick = WordWrapButtonClick
      end
      object ToolButton3: TToolButton
        Left = 354
        Top = 0
        Width = 8
        Caption = 'ToolButton3'
        ImageIndex = 10
        Style = tbsSeparator
      end
      object CompileButton: TToolButton
        Left = 362
        Top = 0
        Hint = 'Компилировать (Ctrl+F9)'
        ImageIndex = 3
        OnClick = BCompileClick
      end
      object StopCompileButton: TToolButton
        Left = 385
        Top = 0
        Hint = 'Остановить компиляцию (Esc)'
        Enabled = False
        ImageIndex = 4
        OnClick = BStopCompileClick
      end
      object ToolButton7: TToolButton
        Left = 408
        Top = 0
        Width = 8
        Caption = 'ToolButton7'
        Style = tbsSeparator
      end
      object RunButton: TToolButton
        Left = 416
        Top = 0
        Hint = 'Выполнить (F9)'
        ImageIndex = 5
        OnClick = RRunClick
      end
      object PauseButton: TToolButton
        Left = 439
        Top = 0
        Hint = 'Приостановить'
        Enabled = False
        ImageIndex = 6
        OnClick = RPauseClick
      end
      object TerminateButton: TToolButton
        Left = 462
        Top = 0
        Hint = 'Прервать (Ctrl+F2)'
        Enabled = False
        ImageIndex = 10
        OnClick = RTerminateClick
      end
      object ToolButton10: TToolButton
        Left = 485
        Top = 0
        Width = 8
        Caption = 'ToolButton10'
        Style = tbsSeparator
      end
      object TargetSetupButton: TToolButton
        Left = 493
        Top = 0
        Hint = 'Установка (Ctrl+Q)'
        Grouped = True
        ImageIndex = 7
        Style = tbsCheck
        OnClick = RTargetClick
      end
      object TargetUninstallButton: TToolButton
        Left = 516
        Top = 0
        Hint = 'Деинсталляция (Ctrl+W)'
        Grouped = True
        ImageIndex = 8
        Style = tbsCheck
        OnClick = RTargetClick
      end
      object ToolButton13: TToolButton
        Left = 539
        Top = 0
        Width = 8
        Caption = 'ToolButton13'
        Style = tbsSeparator
      end
      object HelpButton: TToolButton
        Left = 547
        Top = 0
        Hint = 'Справка (F1)'
        ImageIndex = 9
        OnClick = HDocClick
      end
    end
  end
  object MainMenu1: TMainMenu
    Images = ToolBarVirtualImageList
    Left = 24
    Top = 40
    object FMenu: TMenuItem
      Caption = 'Файл'
      OnClick = FMenuClick
      object FNew: TMenuItem
        Caption = 'Новый'
        ImageIndex = 0
        ShortCut = 16462
        OnClick = FNewClick
      end
      object FOpen: TMenuItem
        Caption = 'Открыть...'
        ImageIndex = 1
        ShortCut = 16463
        OnClick = FOpenClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object FSave: TMenuItem
        Caption = 'Сохранить'
        Enabled = False
        ImageIndex = 2
        ShortCut = 16467
        OnClick = FSaveClick
      end
      object FSaveAs: TMenuItem
        Caption = 'Сохранить как...'
        ImageIndex = 11
        OnClick = FSaveAsClick
      end
      object FSaveEncoding: TMenuItem
        Caption = 'Сохранить в кодировке'
        ImageIndex = 52
        object FSaveEncodingAuto: TMenuItem
          Caption = 'Авто (ANSI или UTF-8)'
          RadioItem = True
          OnClick = FSaveEncodingItemClick
        end
        object FSaveEncodingUTF8: TMenuItem
          Caption = 'UTF-8'
          RadioItem = True
          OnClick = FSaveEncodingItemClick
        end
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object FRecent: TMenuItem
        Caption = 'Последние файлы'
        ImageIndex = 45
        object FClear: TMenuItem
          Caption = 'Очистить список последних файлов'
          ImageIndex = 46
          OnClick = FClearClick
        end
        object FMRUMainFilesSep: TMenuItem
          Caption = '-'
          Visible = False
        end
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object FExit: TMenuItem
        Caption = 'Выход'
        ImageIndex = 12
        OnClick = FExitClick
      end
    end
    object EMenu: TMenuItem
      Caption = 'Правка'
      OnClick = EMenuClick
      object EUndo: TMenuItem
        Caption = 'Отменить'
        ImageIndex = 13
        OnClick = EUndoClick
      end
      object ERedo: TMenuItem
        Caption = 'Повторить'
        ImageIndex = 14
        OnClick = ERedoClick
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object ECut: TMenuItem
        Caption = 'Вырезать'
        ImageIndex = 15
        OnClick = ECutClick
      end
      object ECopy: TMenuItem
        Caption = 'Копировать'
        ImageIndex = 16
        OnClick = ECopyClick
      end
      object EPaste: TMenuItem
        Caption = 'Вставить'
        ImageIndex = 17
        OnClick = EPasteClick
      end
      object EDelete: TMenuItem
        Caption = 'Удалить    '
        ImageIndex = 18
        OnClick = EDeleteClick
      end
      object ESelectAll: TMenuItem
        Caption = 'Выделить все'
        ImageIndex = 19
        OnClick = ESelectAllClick
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object EFind: TMenuItem
        Caption = 'Найти...'
        ImageIndex = 20
        ShortCut = 16454
        OnClick = EFindClick
      end
      object EFindNext: TMenuItem
        Caption = 'Искать далее'
        ImageIndex = 21
        ShortCut = 114
        OnClick = EFindNextClick
      end
      object EReplace: TMenuItem
        Caption = 'Заменить...'
        ImageIndex = 22
        ShortCut = 16456
        OnClick = EReplaceClick
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object EGoto: TMenuItem
        Caption = 'Перейти к строке...'
        ImageIndex = 23
        ShortCut = 16455
        OnClick = EGotoClick
      end
      object ECaseModed: TMenuItem
        Caption = 'Изменить регистр'
        ImageIndex = 47
        object EUpperCase: TMenuItem
          Caption = 'ПРОПИСНЫЕ'
          ImageIndex = 49
          ShortCut = 24661
          OnClick = EUpperCaseClick
        end
        object ELowerCase: TMenuItem
          Caption = 'строчные'
          ImageIndex = 48
          ShortCut = 16469
          OnClick = ELowerCaseClick
        end
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object ECompleteWord: TMenuItem
        Caption = 'Автозавершение'
        ImageIndex = 38
        OnClick = ECompleteWordClick
      end
    end
    object VMenu: TMenuItem
      Caption = 'Вид'
      OnClick = VMenuClick
      object VZoom: TMenuItem
        Caption = 'Масштаб'
        ImageIndex = 54
        object VZoomIn: TMenuItem
          Caption = 'Увеличить'
          ImageIndex = 55
          OnClick = VZoomInClick
        end
        object VZoomOut: TMenuItem
          Caption = 'Уменьшить'
          ImageIndex = 56
          OnClick = VZoomOutClick
        end
        object N8: TMenuItem
          Caption = '-'
        end
        object VZoomReset: TMenuItem
          Caption = 'Сброс        '
          ImageIndex = 53
          OnClick = VZoomResetClick
        end
      end
      object N9: TMenuItem
        Caption = '-'
      end
      object VToolbar: TMenuItem
        Caption = 'Панель инструментов'
        OnClick = VToolbarClick
      end
      object VStatusBar: TMenuItem
        Caption = 'Строка состояния'
        OnClick = VStatusBarClick
      end
      object N10: TMenuItem
        Caption = '-'
      end
      object VCaretLine: TMenuItem
        Caption = 'Подсвечивать текущую строку'
        OnClick = VCaretLineClick
      end
      object VEOLString: TMenuItem
        Caption = 'Показывать конец строк (CRLF)'
        OnClick = VEOLStringClick
      end
      object VWCCString: TMenuItem
        Caption = 'Показывать пробелы и табуляцию'
        OnClick = VWCCStringClick
      end
      object VWordWrapString: TMenuItem
        Caption = 'Показывать перенос строки'
        OnClick = VWordWrapStringClick
      end
      object N11: TMenuItem
        Caption = '-'
      end
      object VCompilerOutput: TMenuItem
        Caption = 'Панель компиляции'
        RadioItem = True
        OnClick = VCompilerOutputClick
      end
      object VDebugOutput: TMenuItem
        Caption = 'Панель отладки'
        RadioItem = True
        OnClick = VDebugOutputClick
      end
      object VDebugCallStack: TMenuItem
        Caption = 'Панель стека вызовов'
        RadioItem = True
        OnClick = VDebugCallStackClick
      end
      object VHide: TMenuItem
        Caption = 'Не показывать панели'
        RadioItem = True
        OnClick = VHideClick
      end
    end
    object BMenu: TMenuItem
      Caption = 'Сборка'
      OnClick = BMenuClick
      object BCompile: TMenuItem
        Caption = 'Компилировать'
        ImageIndex = 3
        ShortCut = 16504
        OnClick = BCompileClick
      end
      object BStopCompile: TMenuItem
        Caption = 'Остановить компиляцию'
        Enabled = False
        ImageIndex = 4
        OnClick = BStopCompileClick
      end
      object N12: TMenuItem
        Caption = '-'
      end
      object BLowPriority: TMenuItem
        Caption = 'Низкий приоритет при компиляции'
        OnClick = BLowPriorityClick
      end
      object N13: TMenuItem
        Caption = '-'
      end
      object BOpenScriptFolder: TMenuItem
        Caption = 'Открыть папку сценария'
        Enabled = False
        ImageIndex = 43
        OnClick = BOpenScriptFolderClick
      end
      object BOpenOutputFolder: TMenuItem
        Caption = 'Открыть папку вывода'
        Enabled = False
        ImageIndex = 34
        OnClick = BOpenOutputFolderClick
      end
    end
    object RMenu: TMenuItem
      Caption = 'Отладка'
      object RRun: TMenuItem
        Caption = 'Выполнить'
        ImageIndex = 5
        ShortCut = 120
        OnClick = RRunClick
      end
      object RParameters: TMenuItem
        Caption = 'Параметры запуска...'
        ImageIndex = 25
        OnClick = RParametersClick
      end
      object N14: TMenuItem
        Caption = '-'
      end
      object RRunToCursor: TMenuItem
        Caption = 'Выполнить до курсора'
        ImageIndex = 26
        ShortCut = 115
        OnClick = RRunToCursorClick
      end
      object RStepInto: TMenuItem
        Caption = 'Шаг с заходом'
        ImageIndex = 27
        ShortCut = 118
        OnClick = RStepIntoClick
      end
      object RStepOver: TMenuItem
        Caption = 'Шаг с обходом'
        ImageIndex = 28
        ShortCut = 119
        OnClick = RStepOverClick
      end
      object RToggleBreakPoint: TMenuItem
        Caption = 'Переключить точку останова'
        ImageIndex = 29
        ShortCut = 116
        OnClick = RToggleBreakPointClick
      end
      object RPause: TMenuItem
        Caption = 'Приостановить'
        Enabled = False
        ImageIndex = 6
        OnClick = RPauseClick
      end
      object RTerminate: TMenuItem
        Caption = 'Прервать'
        Enabled = False
        ImageIndex = 10
        ShortCut = 16497
        OnClick = RTerminateClick
      end
      object N15: TMenuItem
        Caption = '-'
      end
      object REvaluate: TMenuItem
        Caption = 'Значения констант...'
        Enabled = False
        ImageIndex = 57
        ShortCut = 16499
        OnClick = REvaluateClick
      end
      object N16: TMenuItem
        Caption = '-'
      end
      object RTargetSetup: TMenuItem
        Caption = 'Установка'
        GroupIndex = 1
        RadioItem = True
        ShortCut = 16465
        OnClick = RTargetClick
      end
      object RTargetUninstall: TMenuItem
        Caption = 'Деинсталляция'
        GroupIndex = 1
        RadioItem = True
        ShortCut = 16471
        OnClick = RTargetClick
      end
    end
    object TMenu: TMenuItem
      Caption = 'Инструменты'
      object TAddRemovePrograms: TMenuItem
        Caption = 'Добавление/Удаление программ'
        ImageIndex = 32
        OnClick = TAddRemoveProgramsClick
      end
      object TGenerateGUID: TMenuItem
        Caption = 'Создать GUID'
        ImageIndex = 31
        ShortCut = 24647
        OnClick = TGenerateGUIDClick
      end
      object TInsertColor: TMenuItem
        Caption = 'Вставить цвет...'
        ImageIndex = 44
        ShortCut = 24643
        OnClick = TInsertColorClick
      end
      object TInsertMsgBox: TMenuItem
        Caption = 'Вставить MsgBox'
        ImageIndex = 50
        ShortCut = 24653
        OnClick = TInsertMsgBoxClick
      end
      object N17: TMenuItem
        Caption = '-'
      end
      object TSignTools: TMenuItem
        Caption = 'Настройка цифровой подписи...'
        ImageIndex = 33
        OnClick = TSignToolsClick
      end
      object N18: TMenuItem
        Caption = '-'
      end
      object TOptions: TMenuItem
        Caption = 'Настройки...'
        ImageIndex = 30
        OnClick = TOptionsClick
      end
    end
    object HMenu: TMenuItem
      Caption = 'Справка'
      OnClick = HMenuClick
      object HDoc: TMenuItem
        Caption = 'Документация Inno Setup'
        ImageIndex = 9
        OnClick = HDocClick
      end
      object HExamples: TMenuItem
        Caption = 'Примеры сценариев Inno Setup'
        ImageIndex = 42
        OnClick = HExamplesClick
      end
      object HFaq: TMenuItem
        Caption = 'Inno Setup в вопросах и ответах'
        ImageIndex = 41
        OnClick = HFaqClick
      end
      object HMailingList: TMenuItem
        Caption = 'Список рассылки Inno Setup'
        ImageIndex = 51
        OnClick = HMailingListClick
      end
      object HWhatsNew: TMenuItem
        Caption = 'История версий Inno Setup'
        ImageIndex = 40
        OnClick = HWhatsNewClick
      end
      object HWebsite: TMenuItem
        Caption = 'Домашняя страница Inno Setup'
        ImageIndex = 39
        OnClick = HWebsiteClick
      end
      object N19: TMenuItem
        Caption = '-'
      end
      object HISPPDoc: TMenuItem
        Caption = 'Документация Inno Setup Preprocessor'
        ImageIndex = 9
        OnClick = HISPPDocClick
      end
      object HISPPSep: TMenuItem
        Caption = '-'
      end
      object HPSWebsite: TMenuItem
        Caption = 'Сайт RemObjects Pascal Script'
        ImageIndex = 35
        OnClick = HPSWebsiteClick
      end
      object N20: TMenuItem
        Caption = '-'
      end
      object HDonate: TMenuItem
        Caption = 'Поддержка Inno Setup'
        ImageIndex = 36
        OnClick = HDonateClick
      end
      object N21: TMenuItem
        Caption = '-'
      end
      object HAbout: TMenuItem
        Caption = 'О программе Inno Setup'
        ImageIndex = 37
        OnClick = HAboutClick
      end
    end
  end
  object FindDialog: TFindDialog
    OnFind = FindDialogFind
    Left = 80
    Top = 40
  end
  object ReplaceDialog: TReplaceDialog
    OnFind = FindDialogFind
    OnReplace = ReplaceDialogReplace
    Left = 144
    Top = 40
  end
  object CheckIfRunningTimer: TTimer
    Enabled = False
    Interval = 100
    OnTimer = CheckIfRunningTimerTimer
    Left = 232
    Top = 40
  end
  object ListPopupMenu: TPopupMenu
    Left = 48
    Top = 168
    object PListCopy: TMenuItem
      Bitmap.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        20000000000000040000C40E0000C40E00000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00787878BD787878FF787878FF787878FF7878
        78FF787878FF787878FF787878FF787878FF787878BDFFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF007A7A7AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7A7A7AFFFFFFFF00FFFFFF007878
        7886787878B5787878B5787878B57A7A7AFFFFFFFFFFB3783EFFB3783EFFB378
        3EFFB3783EFFB3783EFFB3783EFFFFFFFFFF7A7A7AFFFFFFFF00FFFFFF007A7A
        7AB5FFFFFFB5FFFFFFB5FFFFFFB57A7A7AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7A7A7AFFFFFFFF00FFFFFF007A7A
        7AB5FFFFFFB5B3783EB5B3783EB57A7A7AFFFFFFFFFFB3783EFFB3783EFFB378
        3EFFB3783EFFB3783EFFB3783EFFFFFFFFFF7A7A7AFFFFFFFF00FFFFFF007A7A
        7AB5FFFFFFB5FFFFFFB5FFFFFFB57A7A7AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7A7A7AFFFFFFFF00FFFFFF007A7A
        7AB5FFFFFFB5B3783EB5B3783EB57A7A7AFFFFFFFFFFB3783EFFB3783EFFFFFF
        FFFFFFFFFFFFFEFEFEFFFEFEFEFFFEFEFEFF7A7A7AFFFFFFFF00FFFFFF007A7A
        7AB5FFFFFFB5FFFFFFB5FFFFFFB57A7A7AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF9E9E9EFF787878FF787878FF787878FF787878FFFFFFFF00FFFFFF007A7A
        7AB5FFFFFFB5B3783EB5B3783EB57A7A7AFFFFFFFFFFB3783EFFB3783EFFFFFF
        FFFF797979FFFDFDFDFFFFFFFFFFBBBBBBFF787878CCFFFFFF00FFFFFF007A7A
        7AB5FFFFFFB5FFFFFFB5FFFFFFB57A7A7AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF797979FFFDFDFDFFBBBBBBFF787878D779797917FFFFFF00FFFFFF007A7A
        7AB5FFFFFFB5B3783EB5B3783EB57A7A7AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF7A7A7AFFBABABAFF787878DA7979791AFFFFFF00FFFFFF00FFFFFF007A7A
        7AB5FFFFFFB5FFFFFFB5FFFFFFB5787878FF787878FF787878FF787878FF7878
        78FF787878FF787878CF7979791CFFFFFF00FFFFFF00FFFFFF00FFFFFF007A7A
        7AB5FFFFFFB5FFFFFFB5FFFFFFB5FFFFFFB57A7A7AB5BABABAB57878789A7979
        7912FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007878
        7886787878B5787878B5787878B5787878B5787878B57878789279797913FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
      Caption = 'Копировать'
      ShortCut = 16451
      OnClick = PListCopyClick
    end
    object PListSelectAll: TMenuItem
      Bitmap.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        20000000000000040000C40E0000C40E00000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
        00FF000000FF000000FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
        00FF000000FF000000FF000000FFFFFFFF00000000FF000000FFFFFFFF000000
        00FF000000FFFFFFFF00000000FF000000FFFFFFFF00FFFFFF00FFFFFF000000
        00FF000000FF000000FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00000000FFFFFFFF00FFFFFF00FFFFFF00FFFF
        FF00000000FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00000000FFFFFFFF00FFFFFF00FFFFFF00FFFF
        FF00000000FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00000000FFFFFFFF00FFFFFF00FFFFFF00FFFF
        FF00000000FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00000000FFFFFFFF00FFFFFF00FFFFFF00FFFF
        FF00000000FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00000000FFFFFFFF00FFFFFF00FFFFFF00FFFF
        FF00000000FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00000000FFFFFFFF00FFFFFF00FFFFFF00FFFF
        FF00000000FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00000000FFFFFFFF00FFFFFF00FFFFFF00FFFF
        FF00000000FF000000FFFFFFFF00000000FF000000FFFFFFFF00000000FF0000
        00FFFFFFFF00000000FF000000FF000000FFFFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
      Caption = 'Выделить все'
      ShortCut = 16449
      OnClick = PListSelectAllClick
    end
  end
  object BuildImageList: TImageList
    ColorDepth = cd32Bit
    Height = 17
    Left = 296
    Top = 96
    Bitmap = {
      494C010104002400040010001100FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002200000001002000000000000022
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000595959EA585858FF585858FF5858
      58FF585858FF585858FF585858FF585858FF585858FF585858FF585858FF5858
      58FF585858FF585858FF585858FF383838BB595959EA585858FF585858FF5858
      58FF585858FF585858FF585858FF585858FF585858FF585858FF585858FF5858
      58FF585858FF585858FF585858FF383838BB595959EA585858FF585858FF5858
      58FF585858FF585858FF585858FF585858FF585858FF585858FF585858FF5858
      58FF585858FF585858FF585858FF383838BB595959EA585858FF585858FF5858
      58FF585858FF585858FF585858FF585858FF585858FF585858FF585858FF5858
      58FF585858FF585858FF585858FF383838BB585858FFFDFDFDFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF585858FF585858FFFDFDFDFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF585858FF585858FFFDFDFDFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF585858FF585858FFFDFDFDFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF585858FF585858FFFDFDFDFFFFFFFFFFFFFF
      FFFFFFFFFFFF626262FF626262FFFFFFFFFFFFFFFFFF626262FF626262FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF585858FF585858FFFDFDFDFFFFFFFFFFFFFF
      FFFFFFFFFFFF626262FF626262FFFFFFFFFFFFFFFFFF626262FF626262FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF585858FF585858FFFDFDFDFFFFFFFFFFFFFF
      FFFFFFFFFFFF626262FF626262FFFFFFFFFFFFFFFFFF626262FF626262FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF585858FF585858FFFDFDFDFFFFFFFFFFFFFF
      FFFFFFFFFFFF626262FF626262FFFFFFFFFFFFFFFFFF626262FF626262FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF585858FF585858FFFDFDFDFFFFFFFFFFFFFF
      FFFFFFFFFFFF626262FF626262FFFFFFFFFFFFFFFFFF626262FF626262FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF585858FF585858FFFDFDFDFFFFFFFFFFFFFF
      FFFFFFFFFFFF626262FF626262FFFFFFFFFFFFFFFFFF626262FF626262FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF585858FF585858FFFDFDFDFFFFFFFFFFFFFF
      FFFFFFFFFFFF626262FF626262FFFFFFFFFFFFFFFFFF626262FF626262FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF585858FF585858FFFDFDFDFFFFFFFFFFFFFF
      FFFFFFFFFFFF626262FF626262FFFFFFFFFFFFFFFFFF626262FF626262FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF585858FF585858FFFDFDFDFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF585858FF585858FFFDFDFDFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF585858FF585858FFFDFDFDFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF585858FF585858FFFDFDFDFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF585858FF585858FFFDFDFDFFFFFFFFFF6262
      62FF626262FFFFFFFFFFFFFFFFFF626262FF626262FFFFFFFFFFFFFFFFFF6262
      62FF626262FFFFFFFFFFFFFFFFFF585858FF585858FFFDFDFDFFFFFFFFFF6262
      62FF626262FFFFFFFFFFFFFFFFFF626262FF626262FFFFFFFFFFFFFFFFFF6262
      62FF626262FFFFFFFFFFFFFFFFFF585858FF585858FFFDFDFDFFFFFFFFFF6262
      62FF626262FFFFFFFFFFFFFFFFFF626262FF626262FFFFFFFFFFFFFFFFFF6262
      62FF626262FFFFFFFFFFFFFFFFFF585858FF585858FFFDFDFDFFFFFFFFFF6262
      62FF626262FFFFFFFFFFFFFFFFFF626262FF626262FFFFFFFFFFFFFFFFFF6262
      62FF626262FFFFFFFFFFFFFFFFFF585858FF585858FFFDFDFDFFFFFFFFFF6262
      62FF626262FFFFFFFFFFFFFFFFFF626262FF626262FFFFFFFFFFFFFFFFFF6262
      62FF626262FFFFFFFFFFFFFFFFFF585858FF585858FFFDFDFDFFFFFFFFFF6262
      62FF626262FFFFFFFFFFFFFFFFFF626262FF626262FFFFFFFFFFFFFFFFFF6262
      62FF626262FFFFFFFFFFFFFFFFFF585858FF585858FFFDFDFDFFFFFFFFFF6262
      62FF626262FFFFFFFFFFFFFFFFFF626262FF626262FFFFFFFFFFFFFFFFFF6262
      62FF626262FFFFFFFFFFFFFFFFFF585858FF585858FFFDFDFDFFFFFFFFFF6262
      62FF626262FFFFFFFFFFFFFFFFFF626262FF626262FFFFFFFFFFFFFFFFFF6262
      62FF626262FFFFFFFFFFFFFFFFFF585858FF585858FFFDFDFDFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF585858FF585858FFFDFDFDFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF585858FF585858FFFDFDFDFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF585858FF585858FFFDFDFDFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF585858FF585858FFFDFDFDFFFFFFFFFFFFFF
      FFFFFDFDFDFFFFFFFFFFFFFFFFFFAC6C2DFFAC6C2DFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF585858FF585858FFFDFDFDFFFFFFFFFFFFFF
      FFFFD7B99CFFAC6C2DFFAC6C2DFFAC6C2DFFAC6C2DFFAC6C2DFFAC6C2DFFD8BA
      9DFFFFFFFFFFFFFFFFFFFFFFFFFF585858FF585858FFFDFDFDFFFFFFFFFFFFFF
      FFFFD7B99CFFFFFFFFFFFFFFFFFFAC6C2DFFAC6C2DFFFFFFFFFFFFFFFFFFD8BA
      9DFFFFFFFFFFFFFFFFFFFFFFFFFF585858FF585858FFFDFDFDFFFFFFFFFFFFFF
      FFFFFDFDFDFFFFFFFFFFFFFFFFFFAC6C2DFFAC6C2DFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF585858FF585858FFFDFDFDFFFFFFFFFFFFFF
      FFFFFDFDFDFFFFFFFFFFAC6C2DFFAC6C2DFFAC6C2DFFAC6C2DFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF585858FF585858FFFDFDFDFFFFFFFFFFFFFF
      FFFFD7B99CFFAC6C2DFFFFFFFFFFAC6C2DFFAC6C2DFFFFFFFFFFAC6C2DFFD8BA
      9DFFFFFFFFFFFFFFFFFFFFFFFFFF585858FF585858FFFDFDFDFFFFFFFFFFFFFF
      FFFFFDFDFDFFFFFFFFFFFFFFFFFFAC6C2DFFAC6C2DFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF585858FF585858FFFDFDFDFFFFFFFFFFFFFF
      FFFFFDFDFDFFFFFFFFFFFFFFFFFFAC6C2DFFAC6C2DFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF585858FF0000000000000000000000000000
      000000000000AC6C2DFFAC6C2DFFAC6C2DFFAC6C2DFFAC6C2DFFAC6C2DFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000251709770000000000000000AC6C2DFFAC6C2DFF00000000000000002517
      0977000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000AC6C2DFFAC6C2DFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000025170977AC6C2DFFAC6C2DFFAC6C2DFFAC6C2DFFAC6C2DFFAC6C2DFF2517
      0977000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000AC6C2DFFAC6C2DFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000AC6C2DFFAC6C2DFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000025170977AC6C2DFF00000000AC6C2DFFAC6C2DFF00000001AC6C2DFF2517
      0977000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000AC6C2DFFAC6C2DFF00000001000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000AC6C2DFFAC6C2DFF00000001000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000AC6C2DFFAC6C2DFFAC6C2DFFAC6C2DFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000251709770000000000000000AC6C2DFFAC6C2DFF00000005000000002517
      0977000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000005000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000AC6C2DFFAC6C2DFFAC6C2DFFAC6C2DFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AC6C2DFFAC6C2DFFAC6C2DFFAC6C2DFFAC6C2DFFAC6C2DFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000AC6C2DFFAC6C2DFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000AC6C2DFFAC6C2DFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AC6C2DFFAC6C2DFFAC6C2DFFAC6C2DFFAC6C2DFFAC6C2DFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000025170977AC6C2DFFAC6C2DFFAC6C2DFFAC6C2DFFAC6C2DFFAC6C2DFF2517
      0977000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000AC6C2DFFAC6C2DFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000AC6C2DFFAC6C2DFFAC6C2DFFAC6C2DFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000025170977AC6C2DFFAC6C2DFFAC6C2DFFAC6C2DFFAC6C2DFFAC6C2DFF2517
      0977000000000000000000000000000000000000000000000000000000000000
      000025170977AC6C2DFF00000000AC6C2DFFAC6C2DFF00000000AC6C2DFF2517
      097700000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000220000000100010000000000100100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000}
  end
  object ToolBarImageCollection: TImageCollection
    Images = <
      item
        Name = 'NewFile'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              61000000097048597300000EC400000EC401952B0E1B0000019E49444154388D
              CD923F68144114C67F2FB9842B622103D9C2560C62210812C259245C11446451
              08BBDCDE2A9C9D4820811436B6A9379058A885E48AE5AA9DB330A25C1B6C6CA3
              A295167BB5B6BBCF227366B9FCC1747EF09837DFBCEF9B993783AA9267C194AA
              E2F222CF821B2EAF8FF8D342F22C98013E010F3D3FDD1FDAB0006E02D34017B8
              BEDE9BFC025C0230C61C88C87292243F00445519DAF03EF00AD8019E02CF8115
              E081E7A7B3C06B80288AE8743A586BBF8BC86292243F45550118DA701B78CC11
              B6800D00CF4F1781775114D1ED76190C06586BBF89C8526D6843AD88F0FC541C
              B7EAA204EAD59A66B389AA5EEEF7FB7B35E082E337812715C397C09ACB6F0134
              1A0DDAED76D5EBDAA807F3C07BE00DD072FD088115CF4F0DB03B528CAEACAAC4
              718CE4595007BE02CF5CB34A6002B803BC00AE7A7EFA11B852DD5A550F4FE3DE
              7BD68D926781FE3AE84DA8EAA33C0B2EAAEA3D552D740C65596AABD53AFE31F2
              2C982E8A62C1D57D3E495C35A83186F5DEE4EFDDBB4CB9E9DCF8FA388E19C05F
              F1991091530DCE85FFD0C018F3368EE3DBFF2236C67CF80365D4027B1B630643
              0000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000097048597300000EC400000EC401952B0E1B0000021B494441544889
              ED953F6853511487BF9B3CAC597CB154782A2E82A8A0E822016B45038A4E92FB
              4279345DC4A16432A08B0A5D8A38EA2264105468227990AB222E0E71897F7012
              1C2C0E2242C9430729482B36CD71485EA9352F344507D11FDCE11E2EBFEF9E7B
              CEE12222AC5E8D6AE65AB7F87A96121102A3B7013B1D6DEA81D103C0023058F0
              371CBF31FA7D7E6E81B757EEC78AC06922645916B66D7F554A9D2A168BCFC278
              08D0C06DE00CF00E980576037B806920EB687312B81005F03C8F7C3E4FB95C46
              2975248428110120307A1CB809BC01868117C03E60CCD1C606EE02F12840369B
              C5F77DEAF53AA5526919126630006C061E035B813BC0B94E367AE3F6C373C9D4
              C541E00190EA0588C562D46A352A958A28A546ACC0E8EB4061C5D949479BA9C0
              68012E039FBECD3E97C0E84B8E364FA3002B954EA71111E5FB7E5D35AA993830
              046CA15D0707B8054C001F81B3C017FB50613EB1E3E843E0585406AB6559D64F
              3518011E011F8003C02B602F30EE68B308548144D4AD439F50AD568B5C2EB7DC
              45C3B4DFFF3CF01298A1DD45BB807B80E768930226FB0488D5D9378009479B4A
              60F45027F6D9D1667F60F4A8B212EF81B1287300A5D42FFB66B3A9BA4D71BC51
              CD5C755D7793882C8AC894884C4B9F5A5A5A12D775A347DC75DD27FD9A760358
              1119039CE8F5246B552FC06FD11F038445FF7B01A1FE03FE65403C1EF93BAEDD
              DCB2A201C964F2B5E779079BCDE6BACD6DDB9EF90195309A9877DFD134000000
              0049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F4000000097048597300000EC400000EC401952B0E1B000002DE494441545885
              ED964B48554118C77F472E690B215AC4F410825A4456BA0912CDA26D747A3839
              CA2D5A183D212AB3C820A8888A905E54046546840E1CEECD91B2450F891E1645
              51D42E08821A09427251A0668B33D76ED72B5CE9468BEE1F86816F66CEFFF77D
              E763186F68688874B2815F006C015A84345FD26ECA8222CE2C02CC15D2BC485A
              9B0A3401DDC0A324B04AE0B190A63F6B004019D069037FAD9026EE629312B352
              AA0178706AF5B762E02450A994DA07AC1A8397059669AD9F2507BDC42FB081BF
              1E38076C12D234DBC05F0E5C0736D6C70BAF36ADECDB061C029490A6106801BC
              4C9C6B6B6B514AD1DADAFA1558A4B57E3902C041EC068E0267810AA014780D3C
              07D60175429A1E200E8CCB3475A5146D6D6DC4E371B4D6BD4085D6FACD080007
              D1E2CC52755248731CB8064C07A6640A9100F03C0FAD35B158CC02655AEBF711
              1BF8F9EE63C28D5277EE841B7B81CD40B90DFC2EA011E899B0604F6FC1B4F287
              C0AC4C2B01505D5D4D7F7FBFE8E8E8B8AF94AA88005B09BB3D55A784341F6CE0
              9F7600F3097B0280DEEE63B5429A576305F03C8F6834CAC0C040516767E78D08
              701EB8495885C9C02EC22A34DAC03F0334B8B34F1C680FD0535852F719D89F89
              69494909353535BFC5F2F2F2008AD3F5C0710791AACB429AEDC055C2AC8B80F1
              990000A4FA0C0E0E128D4687EF81847914D8095C01661396FD29700F68B081FF
              4E487318B83B1673084B9F2C57815F0036F09702CDC00121CD411BF86B08B33D
              5B1F2FBCD5B4B2EF2D70D106FE17214D15D00EE48F05229D1257F13CA00DD821
              A439976072F347A0594873C1067E15D06A03DF17D2341336E79F03006F816542
              9AAEA4B54F49003380989066830DFC8513171FB1C0923F351F0610D20C005D29
              6BEF802A374F777B2F0969DA8139C0CCAC01A49390E63B10534A15442214B8B0
              07ACC88671A229470548D260360C47D18F4C00FEAA720039801C400EE09F01B8
              AB38EFFFAD400E20A111AFE274524ADD214B2FA014DDFE092CB1F877926059A0
              0000000049454E44AE426082}
          end>
      end
      item
        Name = 'OpenFolder'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              61000000097048597300000EC400000EC401952B0E1B0000020D49444154388D
              A5924D48545114C77FF7BD3BCEF428A92408B30FA36811644248256D8A540CA2
              AD90E0A65C358810442EB22470764D3069651921AEA530C8A416B9882241CC59
              05414DEA426CFA9871C6E7BBA7C5F8E2314D5F7476F79CFFC7F95F8E1211FEA7
              F49F00C7EF5EB4C3EBD776006DC00E6016187633B9D8E3D62B39D57BF97C5B7A
              C91E0C92363A2B17CAC3E6DAF3BDDBDC743EF3D0D165CD39CFC5AC6E6B298511
              79E1667347757AC9BE5DECBA98D5BD9EF1A6D2F9CC2E47879BAF1E69616621C5
              BD9967AC188F73B5CDC427470F869C489706AC52AB7FCED99F80D379CF656621
              C5A9DD75000C4C8F736CFB3EE293A300ADBF14003E005B3D310CBE790AF043C4
              52CAC754F99FB81CD6A6B3BB2796F027237D1D6A9A7529A0D213C3C0F4F84F22
              4624A501B42573DD3DB1C4DCA3F6765B499F524AD557736920CB9082BAF69A06
              1AAB6B01708D87022C140619D20046585A356E08448896E3D57CC13ED13F35D6
              D83F35561CF1550413F705E6C7EE44ADFD951C0A002AE24E6A249AAD3AF915BB
              95C21D54031F81E108267163CDFBFBBA90876485E3ED04D95CE472E0BA939A05
              6E894853A0DF05CC038B5A4424A425591E31F5FE540AF7AD0284B3C099C0DB9F
              BDD4800A6B493A21D35202F0BB1260422BC5B213326F433687FF82545C13DAB6
              7857BB25BF0CECF947721E78ADCB2C79B0C1F12A94C205A54544942A99A0B8F9
              6453D3CD6FDF01628EC91311EC82A40000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000097048597300000EC400000EC401952B0E1B000002EB494441544889
              B596496814411486BF57DD3D9399246E100F8AC68B0B22A207158D880B6204A3
              12F0A09E1424825E5C88ED7AF0E0405CF0682EC9C90595A018F51037143571C5
              0822881215040F82B84CCC64BA9E87F48C43938946635DFA51555DFFFBBFAAD7
              D5A2AAFCCFE6FECBCB4B9BF79AF8F0D285C00C4080CE32AFE4C6999AED416E8E
              FCAD83152D87E602CDC0E4C8D06B60636BED9EDB00E2FBFE49555D9B13141134
              54151109FB4FA552A9F591C5AFBBC64958B5D830C9F25882AF996E801EA0BAB5
              76CF2DF17D5FF5978D7E0554151139954AA5D6AF6B3D6EBE64D22F5CE34CCEDA
              80DD736A39FCE00259B551935DA55E7CA2F8BEFFA78C1438F67C56F915E0BA23
              86FAD9ABA91A3B85A71FDF70F0FE397A6D40CBAA7A6A2F36E4CDBA6186F98CFB
              8925826B2640A096860717F22207E6AE61FFDD3378C6294C6AE69F9C22CD8985
              1A26371015B9B8DA474490D02E206E24BBDFC553813680A41B279DED21504BAA
              A385732B77927063B9B984209E471071A22C66778D48D86C89AB88E4F2105005
              117D19D8A0D7315DE96CCF0480B3353BF09C3E10BD3640008360D10F258E77B5
              F0147D1B5D168C5A36E5DBB48AD2E0B18898E87E84CF868DDD13DA802B805704
              6B00AC6A4A74CD2A40A4EDDBF71DCEBEBBB47981889862B844646773F26DC786
              74650DD0048C892CFE11D8D49C7CAB20DBF2881CC37D8098A35505D9F6E74080
              B34D89AED4E6EEF1D333984584270BE88C61AF3526DF6F55D5BDC0CD7C1D94B8
              76F99289DFDB2655F4BE11617C11EB836DBB730E32C9987D343C612B41C7A932
              90837C6116A99BC2F866B807BC1A16B79FCA6276F910650EF01978D627001D75
              F547F5C3E5BA79BFAB89C2BE6273C2F8614575E30F17C073B41DC035540D6479
              9088EE40DF85A3094F3B1E9DDE32A272245387F082CB0B7C2E8FDB97C3E27631
              E01412F8074469117902E00AFA648B7F24F3FE52DD7C18F8CB3A08449D15D58D
              5F015CC7D00EE039CC1B0A2E61BB970B5CD7E8310023035A1E0CA21FC0F97CDF
              FFFE6DF909BCED90A7037EC1040000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F4000000097048597300000EC400000EC401952B0E1B0000033A494441545885
              DD975968134118C77FB3D93476CD5A7BA496E2053656144F14A90551442D988A
              1695627D50C12A788182347D10146940F0C217231EA0F820D50AA6A028946A6D
              B52ADE3E68CD8345C50BA16A45D36EC687B03189490F1B23F87F9A99FD66FFBF
              9D99EF1B564829F99752FFA9FB7F0B505A57932F612BE0029C8004DA009F8043
              BEB2EAB766AC48F61970D5D5540047007B8290CF40657D59F5D9A403B8EA6A56
              02A70125DE734168298020505E5F565D9B348045E7F6E40945790EE800FBE7AC
              A6F1D5532EBEB8138E593F7901DE8757CC6E878270AA6EB7FB385001D87A78BF
              045E03733C1E8F3F5E8050942DA6F981B9AB7166E6933B38038B50B8D0D60A40
              E998E90026444610B95905560169BD7CA000860367DC6E77B1C7E331E2C42C36
              1B0DED4FC81AA4939DAEB3A27016AAB050FBBC250C11B10A2E9504FB95403381
              EDC0DE38CF0ACC86CF7F178065638BC84ED7595E58C49BCE4FF1DEE714555555
              5D0C3C1DD31ECFD0BF10B38DA563A6872122E5AAAB319B5F9355071CC00B6042
              E4A0CF7F974FDFBFE29E5996685E5BB200C6013E13A072D27C1617CCE8CBBCFA
              64011423E56184D808E8471F5D4508113EF509D4A1200EFF7606D22CC14A674E
              E0B8C36E08AB050BA10C09F4026000727F465E393D14A208FD2A44D100B2635C
              6E207B416167ADAAB08450FAF5553F80296BBE8D9A0678E9B914AF3BA9BD7C00
              F8A3B64011DC189DD995AF2A2CED87B1291BF0E0A4F672E1DA6F234748849BD0
              6564A6671B705120F79ED0DAA701E71D25DE89510036555E73D8BB67FF817924
              44E309AD7D27701938087C20B4C259840EEB166017700062F27F88CDB8AEDBE4
              9A010098DADD8798ABB1009D39838D7B69AA3C960480DE1400AE470108E4ADBC
              21DD7645303E0500B71D25DECE2800AB4536E5DA8D22FA7737FCA91ACD4618C0
              6E0B36650C0ACE4B8139C0B55880AE6CCD68B5A972670ACCBB809B3100F27E9E
              DE1DB028F4A9800F50F7CCFD0F03A80ACDC374632AA0A500A029B2A30268D6E0
              8DA1E946710ACCE302C84CCD68D6ACB22205E61268890190FE0D3BF6BD7B7F69
              7D2A56E099A3C4FB310A401134B49CDE54E074302C0500CDB103AA5591DBB234
              6304F011C8F98BE6DF8153B18349FF35EBAF7E02D5E8F198BC7E545900000000
              49454E44AE426082}
          end>
      end
      item
        Name = 'Save'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              61000000097048597300000EC400000EC401952B0E1B000000C849444154388D
              A591BD0EC16014869F533F5720C1D6582DA49B1BE828522EC36073010653DD85
              45456CBA8B95CDDA918BD063A089F0B5A5DEF97B9FF3E47B4555F9276500DF0B
              6E80551890A43FEDD1729A8825A90555253A5DD9CCF69F00BBDBC82C03880876
              A76E369067370CC35480EBBA880808A06F80D747DFC608C8334805248BE619A8
              2AA801101D2FF92BC48F158C06DBF921F3B229C63F280C104B98ACBCCC82C6CA
              62B4CE37F08701956A89F172F0BD4191248033D02E021055C5F7821AB0039C5F
              0177AF19386C0A317F7A0000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000097048597300000EC400000EC401952B0E1B0000019A494441544889
              B5563D4F0241149C39884A90604242616D4FA82C09DD5516023D099D95C1DF21
              F10F9860AB9C359DA1A432F4D41426241A428885F72C6497E77DC12530CDBDB7
              CBCE30B3BB0714111C125900E835060751E97A4D660F41AC91050059E7449217
              97E7A877AAC89F1D830EEDB8888879EA3100105FB8FCFCC6DBE33BA6E399E5B3
              021AB576058552CEB4B40549FDFC3796210AA51C6AED0AA6E359D881262A9472
              101190C470380449DBC71D08D77521222896F32001910D9F11302BA97ABAAE1B
              49180309ACDF0868DBBA4FE3202A3A2BA037CEF4245339306B349F1588431A07
              71481448B9070054F85A4067B698AF502CE7E9FFF8A9889D8CC3AF8F25205BF6
              60D49FA0DEA9EABBB01316F31546FD09345FA483E97816BA2C6991E820A9DE36
              1FACAD40F00B6CA9B7CD9B5AAC40E092C0C910B7CF8DF80C22D06B0C36ECEB57
              941508DBFBFB80197F6879F47D9193D323DE3C5DC5C50200B24B447B45544489
              75C23C60AC074F51D76BF2FEFAC58F8B48D5492707488AE8EEB5E598DF66F1ED
              7C9A5314094AE005B6CF3F005DAFC990C0BEF10BE36BFC120EF2D2BC00000000
              49454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F4000000097048597300000EC400000EC401952B0E1B00000168494441545885
              ED97B14AC3501486FF73DBDA36562A76109CDDAD93A334534731717013BB8BE4
              4122F8040E220809BE4040C5AD9B089DBA74E9DC2E81B449AE83564A7B353149
              13917C53B819FE8F9C9B73EE25CE39B2A4A82B0601F033CA978A19057F2114D8
              3DD841ABB38FDA560544142B80730E7BECE0E5F60DBDC7413881C3B33D6C34AA
              B182671011D6372B689D37D17B1A000B5B4E2820D5CB8984CF53964A28AD1530
              75BC6081792CCB82EBBA9183DBEDF68FEF030564598E1C1E864001C658B60279
              09F212FCAB1288E6AE50C01E39A86F273BA71C7B0A77E22DAD0B539E6F5ED1EA
              34516B54931946A38F6124FA0442817E77887E77182B382C7FF33C0000AC98EC
              FFEFBBE243D7B70217774760856424DC8987EBD387DF09A445A000F739AE4ECC
              A575CD54D3115835B940F6029AA97200A42B860F205EDF8D22307BD04C95E98A
              21BC2826DD9484029F12B428418C70797FBC320112DD8E75C5E029B562492890
              26EF66E1734CB5B33CA60000000049454E44AE426082}
          end>
      end
      item
        Name = 'BuildSolution'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              61000000097048597300000EC400000EC401952B0E1B000000BF49444154388D
              CD50B10D8330103C5BC90296B2060C43F5889216DA640E6A4A4AD8204B648EAC
              107C69E288C05B71A872D24B6FFDDFF9EE0D49C490B71301E0D61526B67388B2
              5341F2A3B2663C2F7A66CD4800C7F52C94EA206F27AE6C3F5E712EC911427E00
              C89AD1C7F68C76C4257909ED984644380C03ACB50000EF3DACB5C8DB694DDE08
              9665198F70EB8AB788460ED8080427DF88AA405DD70080BEEF93DEAA839F2122
              9CE7997B2022541DA458FFA308CEB97B5555A73D9F3BE7AE4FCCA8DEC12AA973
              2D0000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000097048597300000EC400000EC401952B0E1B00000115494441544889
              E555416E84300C1C4BF49437B1F74AED2B82F802FB83F611BC823DECB97D5685
              3D3D6C032985C502DA4B47420227F6C49E891092F0E274BE1000DE5F9FC59B53
              B8AB6FC43F20389D2F5C9AF9BD3537C15C211179289BEEC3932B6B2E4ACE59C2
              211DECC16A07C072179EFBE0229823715FB6182355D55495E931339A19F398AA
              B26C3A964DB7BA4F55D9F73D638C2C004064FE30D3F8DBCB936B5F8E24F26ABB
              F928EF155C22A088485555C342DBB60080ADB174883422FF919C30B39180247F
              8304C0CD457603CD8C7B91EA98D9E8223844DE8A41E429C91EC181D1757FF63F
              387C448367E644B6AF17CB54CFF7E466C872BE89ACAAA3C85397A6EF3CBED5C9
              4508E15AD7F5E30153F98110C2F513A6276F8DE3EFA71F0000000049454E44AE
              426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F4000000097048597300000EC400000EC401952B0E1B000001C2494441545885
              ED96BF4EC25014C6BF73F9E302C6C5D127E81B28D6C984A441C792B8F20646EC
              E4E06030C62780D50780A609898B62E2EBE8C064EC3D2EF47229B7D012A021F1
              9B687B7ABEDF3DFDE82D3133F2543157F79D07B03D5F3DBF51A7415B075887FE
              01760BC0F67C4E13B6B475990100E0F476C01F8F1789CDF57FC6460024338E6F
              FAFCF974390771D2EE7341884CFDB20348A05414A8B5072CC494A1D61E643607
              008AF602C7713808024829138B8510B03D1F3FBF21CAC54262DDDB83B3B0C7C4
              0F411050E609BC5C9F0DAF9EDFEB49D7479DC6C245C4A500AAD52A00802839BC
              CC8CA3C3FDFAA8D380EDF9467360BA4A000A4608310316F9659E0033830878BD
              AFE3FC6E3863CECCD0B7779122132BBD889881BD7209D1242273607682524A75
              ACFF5E0AA0179A1AEBAB8CC66EAA2122758E8860FAF899032022B45A2D75DCEB
              F50060EDE71201B6ADDC0154725DD765666629256F4A7AEF899F7902A6E0AD63
              A1262D7D04EB0A5FB7DB5D0D60D3CA1D4085B0D96CAAA04829390CC3CCC1D2EF
              8F2B0CC3C5218C360AFDCD9546F1BAA4FBE2FB42E4A7002CCBFA765DF7205E18
              4F6FA552C1783C4E0567828A8C2DCBFA02B40F92BC947B087307F8032310A2EB
              59D8A06A0000000049454E44AE426082}
          end>
      end
      item
        Name = 'BuildSolution_Cancel'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              61000000097048597300000EC400000EC401952B0E1B0000012D49444154388D
              A593BD4A03411485BF59F60916CC4F23E6012C940521B6FA0AE2A48E558A3C40
              366C407D83ADC25616FB0676828D069445AC6D8480BA24902A60E3E45AB88B41
              B26E7E0E0CDCB933E770EE614689089B40B55AADD16432D95A95E838CE4D1004
              C768AD651DA43CEC8DFCC3AF40B3D904200CC37FF7FD7E7FB1C0DA583503638C
              1863F23358607D04B4C330AC01E7E9350F182E33C208383A7BBE3E01BAC01B80
              655957ED97DB1E80D25A4B14457902A70F6E75D7201D807A9C2880815B110099
              E11539A81DC41FDEC0AD7452E22B606587874FC9A5ED38CEB8D168E4BDC40BE0
              3D8A1335702B436027ED8FEB715202B083202815B8C860E6EA6956A8653E5336
              3330063E816DF8C9A450E0D1ADF6BE103F23CC0BCA0C1F11295CF7FBE5EEDFDE
              DD5ED91711BE019DB70478631437100000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000097048597300000EC400000EC401952B0E1B00000237494441544889
              B595416B13511485BF17423771D58D22A285696AA92B17765CB493A650B47563
              51F0074C9265828B58EB22D682825690581742B22E084A575A1781C2E826A5E8
              C62E521C6BA350FD01595499B92E928963524A32A6071E8F7B8677CF7DF71EDE
              2811E128113ED2EC804AA7D36F6AB5DA742F93462291B57C3E3F0380699AE238
              8EB8AEDB93E5388E98A629228288D45BA4941240F5F2161EBC191C9ADC6F04A5
              BAABC313906432D93C592C160148241204E5FE1150DD9675085CD76D17907A0F
              7A22D256AB699AE2D621FF0BCF496D2EEA55F507A139644FA4C321EE24128927
              C05560D237D877C02B20D32AD00DBE00F15CF5FDEFC5D36305E0257005780BCC
              7E9E1AEE67607CB555A0D316ED00F1CDD8E03147642BB9BDFEA83014BF0E6481
              A58DD8600E984F6EAF9F07AA00CA344D29140ACD1629A51091A61B5A5EDB9B7B
              33E756BED5F67FFAB887BA65DF2E1BDA7DE08E47F6F78507A2A5CAAE6753A594
              422985EBBA8442A1E6EE710DC16B275E7F7AFE7D22BA28906BE49A2B1B5A0CB8
              E8137D162D5576FD2DEA1463C0EAA865CF960D4D80BB0DDE9F7CB93014CFEA8D
              201C8944D652A95437CFF56560AE68D90B65439B04C67DDF3EE8969D5EC9646E
              002F0054D03F5A6BCF7D58D22DFB96170412281BDA0360DE4F01BA2F7EAC5B76
              3690C0DEF4C8F16A6DFF878F7AAA5B76A66C680BFC9D09FD7DE133D152A51AE8
              061F2706477EB9B2052CEB969DF6F80D43BB2790537061D4B23781BACF83ACEA
              A5E15307F15FA7CE9EF4C78187DC29FE00E0D8BE07CCB323600000000049454E
              44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F4000000097048597300000EC400000EC401952B0E1B0000025D494441545885
              ED96CF4A1B5114C67F77269080C1FE2F2D6665A48B04DA8D665148B420D417D0
              6465B5E41DBA0C64D16D5F2045525F424A3706B46AA542253B035D74D12A256D
              8D60843BA70B33D3C964A246274D17FD6060E67CF7DEF39D7BBF33334A441824
              4203CDFE5FC03F21A0582CD6ABD5EA75C330DA08AF39A3D1288D46A3A7C59552
              CEBD6559002412897AA150B8E910737373F237313B3B2B22827D85ECCAED8A45
              04EF6EF84144DA2AB4E7BB6376E54A2927EE5D7BF01E709FB55BA95F45EEAADD
              E3CE9A671846879FDA04B893E7F3798728954A0081C7BA0A1814062E806C362B
              22229665F5B5FDECF55BF9FEB4A15B8CB7B582C05906842E47D06FE39D2BE00A
              D805DE020BC02D0FF71D58029EF64BC01630532A95EAF97C7E197807DC6E7107
              C034F00978D9362B97CB3926B9A8117DC66E8AC88DB58991F2467A5436D3A343
              22F248440EB4D6FB5AEB871F32F1E18DF4A8AC4D8C94BB9AF092D80566D653B1
              5766243C0F20D0D8CAC4A3A94A6D1A908F4F1E7CD6223F01CC48787E3D1593C7
              5B5F160042F667B217F77BC6AE007533127EE60E0A3436337153812970E2E65A
              634F052493C91FD96CF62AFF038BC0F20B43DD3DB164DFC369BF263495BAE714
              735E9FF6829DA9B13B3E223A928FAFEE7DEB8B0080EDC9F890167CB74AC1B554
              A5F6CB1D0BFC5B6009CD6E9CC06187A82077607B726CD8767B372888A62AB5A3
              C0055C24B99F88C08EC02FB9826143A1B570E48E0B344EE9000558C7CD252312
              5EB49F5B6E3F04D8991A6B6B517DDC7CE3880CD203EF53B1D74624FCDC54EAFE
              F8EADE573767B7A83E6E96EDB760E0022E8381FF92FD06387B4CEF6723AFFC00
              00000049454E44AE426082}
          end>
      end
      item
        Name = 'Run'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              61000000097048597300000EC300000EC301C76FA8640000009B49444154785E
              B5933D0A836010443D428E6291C2328587B048918B046BB5CA05CC09428A54E2
              1D12106B8B3412086CF3FD949B548BDD30820BD33EE6EDB2C97242082FE75C9A
              F06300FD47628CA7D580635BE8F499D47B7F15911D0DC8EABDE69783F663A7A6
              44022C4D57991209B000250C004A1800944840F9381B8056B83F6FA6402F7178
              0FF412ADF2FC9DA93382CA18002A6FFF4CFC3BFF00BB7C2896F8E7156B000000
              0049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000097048597300000EC400000EC401952B0E1B0000018E49444154785E
              AD95314BC34018865F45288456323804BA54E9DE76E92242C1AD4E228A74D0F4
              0F28751111512B569C2C8A8B83B1AE22EAA2088285E2E2D27673D22E858C454B
              8B53CD0B37046FE8F0E581E3B6EFF92EDF7BB991C160003FFD7EDF01B06F1846
              0B42587B143A36807AAFD7DBF396091914E8E4AE97CCE78FA75D005F9EC40E5C
              E07EBB387E39C2C6DDBAD96C371C4F42514628D069B4EB28DCAD61E7713BE6FE
              B8AF9E842B2614E8BC7DD690AB2CE1BC7696E9FE76791A9ECA140A746E9B379C
              0F2AEF8ECDF96841900A8877020AFC4160E26C91604810622A0814650482A141
              48FA8320100C0F829A8FA304C1120E85B975003C042A884FC471B17C89D574FE
              1EC0A46118DC3106392CCAC5AEF32C1CD890AD710B27F3A7145401A4FE17179D
              6021B18895B4DD898422FCB597A1100B38C4836C098968B2A13E097722174C4F
              CD6073768B1276BD078554C0822C4C81D6B558908CA650CC1E5252564F690744
              286041A683C36CA9AEAB508805BC34C5B912AC887505A0A0752D14F0466A9726
              C837D977D5E5FC01EEE0BF72725AE3C50000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F4000000097048597300000EC300000EC301C76FA864000000D849444154785E
              E5D72B0EC2401446E12E81A5201048048BA840B091060D2836D0AEA041A01AF6
              004983AEC0B5E69A79C80BA619853AC91D4193F15FFE331553FCFA42084FE7DC
              B230FF1240BF47628CFB6C80F978EF1B11596400A4039230C0AE2E7518070549
              18607D5AE9F6B2D1FBAB034920603EE7EE089210403A300907C0241C00937000
              4CC201300907C0241C009370004CC201288939E070AB000026B83E5A90005EC2
              FEDD5B5FC234F92493C16F08260700303900C0C939004ECE0170720E80937300
              9C9C03C0E4060F13F3A7D97F3D4EAD26FF0044182C5A7358048C000000004945
              4E44AE426082}
          end>
      end
      item
        Name = 'Pause'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              61000000097048597300000EC300000EC301C76FA8640000003549444154785E
              ED92210A00500843BDA3D7F39CABFF63311844B0886CB0B0175E9AEC0A80D769
              2910B5A8EFC428A020D8FC89B7F20182EB417C2A7BDDD00000000049454E44AE
              426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F4000000097048597300000EC300000EC301C76FA8640000003E49444154785E
              EDD6A10D00200C454176643DE6FC16148E048328C9BDA4AA1527DBCA2625992F
              E75F40EBE3387B7FB92B040000000000000000F013564D5ADD2A05FC1FEB62D1
              0000000049454E44AE426082}
          end>
      end
      item
        Name = 'CD'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              61000000097048597300000EC400000EC401952B0E1B0000024549444154388D
              6D93DF4B536118C73F67E7CC6635D9BC498A68F6E32A350BCD1F9BAE22926096
              8657A27F408151B26ABB0D6258969146D0455D7459566CF3C21069D866897431
              540283A0C07EE286D6E6DC39E7ED46D769DB73F7BCEFF7F3BCCFFBFC90841018
              CDED0F1F05BC401B5006A06AFACABAAA8F5BCCF2E0D440FB8C512F1903B8FDE1
              29C06514A89A4EF51E3BBDC70F30301AE75B32F566E676474B4100B73F9C006C
              E4597A5DE5527B15DDC7F603301C9EE3F1C462F2FDDD4E3B80B201478BC10059
              55A7E56045CEEFF354F13591B6355F094663B7CE38A5565FA81198CE07851064
              359DACAA313B742E773E129EE3D1C422D652334093B251B00238B5A672BA6E37
              9A26A8E97BC653DF498643F34C7FF8B1090378A5565F6805B01AE13F6B2AAF03
              1E16BE249025138E8AEDB8BC41CACB2C981593F1AD55C5080364359DCE2607F1
              4FBFB8F93CBE33AB0AED7ACF91EF5DAEBD4CC697F293B52AC50A27019A0E258A
              2C6449084D05492AA684822FA89A4EE27786D9A14E66177F22CB26AA1D764EF8
              C7D86A5190FE8FB4AA00E34017403AA3525961E5C105172DBE20671B1C80E0E2
              C318DB0A618071A9D5176A00DEA6322AA70EEFE2466F7DEEB6B66F94528B8259
              361583011A252104CEABC1686D6579F3FDF3FFA678E1F3323D7722C696E55B2C
              12F03873A35C77F945A2DBBDCFD6DF5103C0C8D83C4F263F6229918BC1C948C0
              6387BC65AAEF7F19DD61B334FBBA0E712FB4C0D2720AD954907A2C12F038371D
              297F9D5DD7420D99ACE6DD6296DB6493B4D99D15E01530180978DE19F57F01D7
              C9E506B22E09240000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000097048597300000EC400000EC401952B0E1B0000043A494441544889
              85565D6C545510FE66F6EE6E770B05AB095142BB3455D096C696F6456C2BD1D8
              D6AE2B6D82296A2262C56814638CB68DE80344B62B105F3411834434465EB0A5
              2C6D3148B769A269E98FACC45005FB2B7D90A82DFDDB9F3BC707EEB665B997CE
              D3DC7332DF3773CE37672E29A56065C5752DF9005E66E60A11C9626688882222
              12A5FE64A276263A1AF27B07AC30C88CA0B8AE258F999B45643D0018C0C2CC2C
              22A2005A9162A7D9481CD3F331B89DF62187C6DBCE7F54195E96A0B421D808A0
              CEB22C00F3311DBB9E7800AF963F88B303E33878328CA9B928529DF640C781CA
              7A4B82D286E0F722520540313389881815F0D20AA6E763F8E6EDADC8F5A43300
              0180FD27FAF9E44FC358BDC2D1143AE0ADBE8DA0B8AEC5CFCCF5C9A06604D1B8
              A0FBF03600601111220211F1F1F3BFCBA7C1DF38D5A905427E6FFD02416943F0
              61009617B5D4E2BA6093E72E7CFE7AB1E9BE775F3B26676260A6FC4EBFF7170D
              0044E494912996AB201AD3A52C7F5D022FB18E7FA7A3BCE3E31F6572360A87DD
              C606662695D49FDE2C22BD00C40C34E147E3BAE8A2381E17D9B07615DEF4E5E2
              918D6B18800C5CBD8EDD9F75B1DDC662634AC40240A106A09699018013600BE9
              19FE8DB9180AB2EEE6270BD64217C5C19E513C7FA803EF56E761CD6A17EF3BD1
              8F34B7034CB43416006A3500E5069B690533111DEF556FE29A926C89C4746606
              769464AB2FCF5D569F345F6297C326692E3B9828391600CA35001E00A6ED1C17
              85C2FBEF414D49360E3685F94CCFC8710552DBB764ED7CC3FB1042E1095C9D98
              B2D283109147333E4C09627181AF2803933311B45E18FD2AE47FFA2500787CEF
              99F82B651B6ABD851938D41C868D6DA60C4A29D1ACCE1D0098888908BA004449
              E929056280881642CC70123235558E8D495A7B47515994C18FE5DCB773EBFB41
              02A03FB5396397CBA1A9B6BE71D28C86B750206B008699D963560108DCF1EB04
              4E750FE3C3E70AB0673AE745626095DB89EF3AAFD0C5A17FB0D26537AFFEA63F
              AC01681391D790A4A21B7371DEFEA847EE4D77E3AD233F737BDF98541466B052
              4A5A7BC770E18FEB58E9B25BF68DE19EA592FAD3F922D29F20D07591A9B918F6
              D6E4F3B35BB20400FAAEFCCD879B2EC9E05FFF3111C4AE31B4C586BA134141E2
              2D1A069029A2108DEB38B6A7043999E9B75CEAB1739771A46D10290E73C598D8
              48A7DFEB495CB24F0117351BA3BBF1193124734B46ADBDE362D716B3B4C85A00
              90F1D4FB1654D415F0854B1B8281D948BCEE8B1F06B1BB6C2316410873511D57
              AE4D222DD50925D623D6300210E80AF8C280C9C0999A8D56798BD661FF0B450B
              EBED7D63F8E0DB3EB89DDA6D6826D6D4E93719384B481AE723B13A778A03EF54
              E58AB72813F55FF770287C4D9C76CDEA88D878EA035D019FF5C85C429227A25A
              6623B14C975383CDC6105D96CA9870F3AC61F08D30B3AFD3EF5D7EE82711E52B
              A56A015410D1FAA4ED21006D008E76DEE1B7E57F1CB863D610CD735F00000000
              49454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F4000000097048597300000EC400000EC401952B0E1B0000051B494441545885
              C5977D4CD55518C73FE7F7BBF77205F1852029C5DE0CF16556A24D917125415C
              82B3179D2B9DAFB8B2ADB4667151DB4A10CACDB2B21A1530DB9C4B5721600508
              5E944C6BAE74E22559E63091A189CADBE5DEDFEFF40770E5E55EEE456B7DFFFA
              FDCEF39CE7FB3DCF39E7D973849492FF1386C138C76F2949D035D753487D3610
              05285D261DB04BA11C5615F59B8A8CA4327F630A7F3260B1166780DC34908F94
              12A3A270B5D941805125C0A8665666276FBE2301166B710AC8033E15022DED4E
              3E5917CB630FDE456E690DB9A5354821301BD505B6ACE4C2410BB0588BF28015
              FE904B094D2D0E4E7DF84CAFF18CBD27F9AAEA3C23824CBB2BB35396FB2DC062
              2D2A03E6F8430EE0D274EE0B0B62CFC6FE538ED91B78F1E3A304079A0E1DC94E
              49F02960302BEF467B87C6F2390FB3EEC9891EEDE72FDF64F1BB650C3119F22B
              B353567A1560492F4E41FAB7E73D71B3CD49FE7A0B53EE0FF1EA935B52434E89
              9D803E67A2F735BC0DF2EE050C44FE79899D8F8AAA191E64023800887E022CE9
              C51983250770E992B849A3BCDA5FF9EC478E9C69E826EFE4B21665D8B23AAFA8
              7B0B2CD6A24195444D97689A8E0454456099148E75D1A304077612B577B878F6
              9D321A9B1C984D6ABFF9B6AC64E11610BFA5345177394AFC219652D2DCEE624C
              68103322C39012AAEC0DD435B6A00AC1DE379EC0645058B2BD1CA3AA6050158F
              71846A9C7B3823A9D40020756D91BFE42D6D4EDE4F9D49DCE47B7AD97E3859C7
              EBF92758BDB3920E5DC76C545184F012C9CDD92540EAB3FC1170B3CDC9AE1762
              889910CED9BA6BE4979F4315B026318AA4A91148207DF72F0C351B1003907729
              8805F7219451BEC8355D67DCBDC3889910CEE93FAFB2647BC55F2383CD8912A1
              151CBF5056B8392962DED4083E283CC38D5627AA0F7E607C0F0178DEA81E7069
              92D8A8700072BEAF2124D89C78243BF92CC0ACB4E2F89C127B6DF6F2C78989BA
              9BE29FEB5095FE07AF0F949E02FC42775635A9F74AB140BAEB81CFD4F741B700
              1D1F595015C14F358DBC0CAC4E8C62D98E8AD2386B71829442FFFB467BC9AA39
              91001CFFBD11D5CBC9EF03BD87006107E9B990772B5515AA2F5EE364ED15A2C7
              85F2E56BF1A3F34B6BCE2AAAC2DAA4198C8F1889ED743D17AFB4103CC4E88F80
              1AB700A1285552D3BD0A90B2B3B0181585B5BB2AC979298EE871A1443F14EAF6
              A9AABECC862F8E31D4EC173908E5680F01EA3EA9B9523DF9E952D2D4ECE0ADE7
              A2991E19C682AD252CDD51C1230F843063FC28A494545537507BF906C1438C7E
              9F014551F7818F52ECD2749C9A4EFEFAD94C8C180140BBC345E6FE5F29FFED12
              2E4D2204185481AAF8B5EF6E7497E25BB740289948DDDDF7B57768840D0F607F
              5A0266D32D37738081ADCF4FE38FFA722E34360F9AB88B2CD3FDD5AB1FE8CA42
              ABC345EC8451BC973AD3E3F40EA78BE8570B08191A701BE4B7560F7DEB805016
              3A9DAE6FE74D1DC3D6A5D3BC06283F558FD9E8B3D0788158D8EBAF6F4B169756
              94D7E6E85891B7219EC963477A0C91967F02DB997A4C86418BD86DCB4AEED59C
              7A6C4AE3D20A4B9B5A1D093BD7CC247ECAE87EF6988D05185465B055AFCC9695
              9CD877D06B5B1E9756947BBDD5B13279FA5832974D778F9FBB749DC5EF1C6258
              A0C9E33C2FC8B36525AFF26418F861927E30C5D1E13CE0D474562644923A378A
              3DB65A3EFDCEEEB1CBF1082116DAB6CD2FF06AF6EB69967E30A3DDE1DCD4E1D2
              080C30A02AC277FA85C8B46D9B7F674FB3BE887FB32C416AAEA7A5D42D5D3D44
              8FC7A9B00BA1D884AA7E5DF176E2BFFB38FD2FF10F2CCC1A76BDDBD1C6000000
              0049454E44AE426082}
          end>
      end
      item
        Name = 'CD_Cancel'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              61000000097048597300000EC400000EC401952B0E1B0000028A49444154388D
              85936B48936114C77FAFBE5E264146E9A69821695AF35239432D542C02CBF443
              12A150E4FA68562094B7565E582012288116144848C4BE4492A081CECBA81C92
              46D807CB90CAA57431754E7DB7A70FBA35ADE8C003CF732EFFE79C1F1C490881
              B76596775C068A8178002184987728432A3FDF96C186BCFB6C30C92D9059F134
              11E11AF10E0A21B02F2974D7E470BB730CD3C0C47CC8665574776DCE9775027F
              2B06509C2EF6440473B7340380B71F7FA06FEAC3DF4FDEDA537FEC1B80BCFAD5
              9FC5002B4E17D949E19E775C4430D989E13C1BF93C06A801E4B599D7991002C7
              B213FBB2C2E4CC82C7AF6F3233FAE13B41017268566567416F7D8E4906F41B8B
              179714AE172673605728A681F7E4D77521044CCF2E1214E06EDA5902986440EB
              2DE0587652774687DDA12C94B60E36969D4CBAB6A4B868EF1B47E52F7BA7A6FF
              66E00DCE25488F55A36FEEBFF5E8CA61C3C53B16CDD923313D0F7AC7A380DAB5
              B42A60D22D2000C92D2049D03134C985E3DAAAD2568BFA527E7CF34C6EEC29AB
              75AA3AB3BCE31380D998DBF64217761DE31452C6D5272F811400FB9242C28E2D
              FC742C93A50D23333EFCB4BD409BE0445402A45B6D128045A711AB1CA8928116
              20656E7185132991DC284A06A0E6E130458D3D51A3D6A92A8B4E53B9563801F8
              B8BB3D386CAB978410A4963D9E2BCCD8B9A9342FDEC3A2ECDE732C63D34E3FD9
              A7D86CCC6DB3E83493C0F6B5F04CBAD516EA8118181818DDDEFFCE96B65B4D4A
              4C0800E6D7365401BEDE7C9D5EF7790F33F72E6457776DFB3A3BF7E6E8DE88D0
              B43835374DAF5005C8156663AED13D3330032C02916E26D2C66D3C54DE59B0A2
              2825817E3EA9C0B986AEF3B10AC2F00F88068410FF3D83FBD5D51B7D03FBD406
              2104BF00FA0E3C3E9354FC680000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000097048597300000EC400000EC401952B0E1B000004DD494441544889
              A5955B6C54551486BFB3E6743AA52D942284546E5A3010C44222948B9D291711
              4B355624A28918093E98B4200874A69AAA2406C1566E352102893C8082624C3B
              21B5214287000E0242028291B15C15821884DE67666D1F3A4787B6C407D7CB59
              6B9F7DD6BFD6BFFEBD8F658CA137F305827D55B50C281191F1AA2A2262A92A6A
              B8645956BDDB962DDF7D30F754AF091266F50650505EBB434416AA2A00228226
              106271D5C15969622CF8F5FA5DFA7AEC739E54BBA86175D1C5FF04F005823940
              13E0BE5F456D9D31963F378E0505B99C6EBA45E5CE135CBBD54A76A6FBB586D5
              459FDD17A0A0BC364744AE25AA5611114D048E2F22F2576BA706DF99CD908119
              0002E8BABDA7AD5D8D116B50966769C3EAA24DC9007692DF9478EAFDAA5763E8
              D727852103333046B12CC118C3AA79796640A6C7DA52FFD3465F20186E5C531C
              BE07C01708EE1011B753ADF3B2BBDF198B337D5C8E005856D72B2BE15CF9A319
              DBE5020801A9FF0024D4B210300995DC438BE3C7E3AAF1B891A10FA4277728D1
              585C5FAA3AC0E59BCD926A8BAAAADB17089636AE29AE713A284B6C3680D59D16
              03DC6D8B32202395FE992E36D69EA1367C89DDE533B9DDD2C1CBD50789C7E2A4
              B96D1CD50101A006C0F2FAEB4E0213EEC7B951656B998F3143B3802E152DAC3E
              C8CDBBEDB477C449B105911E75010C685C53FCA70D8C575593A0E81E5A9ADBA2
              BAA77C2639D97DE4958F0FB4DD69895E0FCCCF7BE8CBC02CF5FAEB48B145C0A8
              AAE941A9AA4E03EAEC042D3D94A36A1832A00FA372FAC98B6BF7B7EF2E9FD507
              C0EB0FEE097D583CFF9949C374EF918BA4B87AAD1E609833835ECD00E99EAEF3
              76F36EC775673DDD639FBEDDD2F178BF74F7C7064A80C2A4CF0E015F036F3AB9
              6DA7256787E31B63B8F0FB1D015855326E842F10DC9B999672E2D161598BB2D2
              530BE7549744778C5FB74D44BE02E602F52252B2ED87B7B2174FACFE46441E83
              AE215F55D507E9767A0D96DC69E9D089A306B17DA957A2B138B75B3A9B06F64B
              F31DF78DCC8C1B731658B762CAFA4A60A58854AD3BBCB4922E054D583165FD99
              436B9F8D595E7FDDA7C0EBC9F47444E3F4CF4865C3EB9359BCF910C6181614E4
              92E1B197CDAE2ED975A5A5E346D2F6B5F9A1883FECCDFD00A87016B3DDF68851
              FB7FBE6479FD7579AA7ACAE9A0B9AD53278E1CC496D22784C4F0B77E7B5E6A82
              67D5E3B68FB884591BC2CB2B0C5426817C0F4C4E8A6BF2439132485C7605E5B5
              E780D1EDD138AFCE78444B8BC70238171CC77EB9296F7C724833D2DCA2AAFB80
              E7AB8E2E0B00EFF6A28FCDF9A1C812277086FC742CAE4D53C70CA6B4786C8F81
              D79FBC82DB764962AD08F0E78722EF85BDB9338082A4E4279393FFD301406120
              B8A8B93DBA7DDEB4874DE0853C93DCC1F4B783128DAABA5C92DC416532E749F6
              517E28B2AA0700C0F48AE0923BAD9D1BC70ECF66C3E2C964677AF4C6ED569EAA
              AC97CC345B45E4B0AA3E597574D9BB74A9C5B130909F1457E587222B7B000014
              56042777C6B4B1B523E69E336108E91E9B7D27AEE0B65D00CBBE38B5EAF3CB2D
              FF1E3C60537E28B234ECCD7D8FA49964BBEDE1A3F6FF7CB9D77F3280D75F5716
              8B1BBF1ACD494DE9BA2945A449550B3785976774AA394BB7811EF3E6BE6FA0D2
              8289934291E3BD76D0DD7C15FBFA5B963555558789488AAA5E001A76FEB862F0
              D0FA7357BBEFBF347B74CEF086F3BF39F17F02FC5FFB1B458446F52D078B5800
              00000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F4000000097048597300000EC400000EC401952B0E1B000005E0494441545885
              B5977B5054551CC73FE7DE85DD14DFA254D24B524CC74AB1146DAFE4228E034E
              2FABE9E5236DB426652A8BA5A6994614CC21B1321B6A9474A669AA3F52163340
              723131A9ACA41412D3D21422F205B8AF7B4F7FC0AEEBB20B6B4DBFBFEE3DBFDF
              F97D3FF777CFF9DD73859492684CB33BACC06CE02E200918D2E56A051AA5947B
              84103B9CF999D55125EC32D11B80662FCB03F9724F31524A621485D63637E618
              15738CBAAABA20F395FF04A0D9CBB2406E8F2649BBCBCBC6A7A771FB4D43D854
              D1C0A68A06A4105862D439CEFCCCD22B06D0EC8ECDC0FC68C4A584B3ED6E0EBE
              75FF65E3791F1DE0E3BDC718D837764B7541D6BCA80134BBA31298118D38804F
              37B83EBE2F1FAEE83E655F7D334BDFF98A7E7D6277ED29C8B2F50A70254FEE37
              974767DE8C9B797AF62D61FDC79A2EF0E0EB955C156B2AA92EC85A101140CB2D
              CB4246F7CE83EDC2452F25D91AE36F181C3166537903C5E5F598C3AC0953E0EA
              5F88FBE17B127FBFBC9EB71D8718D03716603B20BA0168B96579572A0EE03324
              D6B1C323FA97BF57C39E9F9BFDE2006876479E33FFD21615524A34BB23BA6ED4
              65BA21D1750309A88A401B9B807DEE6DF4EBD329E4F2F878604D252D67DD5862
              D56EF39DF999812A086B4EA906EC8E46584A499BCBC788A17D993C2A1E29616F
              7D33275ADA5185E0A397EE26D6A4F0F0DA2A62540593AA84CD23D49899BBF332
              2AA0F315CC8956BCFDA297A2C553B08EBBFA32DF17074EF062492D4FAEAFC663
              18586254142122640269E8738100C09DD1005CB8E865C3925452C72470F8C419
              4AAA8EA00A58949E4CC684442490BBE55BE22C26440FE25D04D3FC9726E0E6DE
              C475C320E99AFEA48E49A0EE782B0FAFFDF28F41FD2CE912A16FDBFF5B65E92B
              1989B32624F266E9CF9CEFF0A2F6A20F8C0E0618D24320003E5D322D390180E2
              9D0D0CEE6749DF53907918606A4E595A71797D63C1BC3B484D1E46D937275095
              EE0B2FC4028BC3D45354B0F9ABAA4BE3B2120B64A01FF45AFA3066A2F37B3EAC
              A72055117CDDD0C232E0C9F4641E7FE3CB0AABBDCC26A530FE3EEF2A5F386314
              00FB7F69A95355A59CCE761E5AD956603390018C0D0638D21B8049553874F20C
              071AFF6262D250B63E9F766D4945C3614555782A6332A31307E1AC3B5D7BF2AF
              F659078AEE3DA3D91D5B814A6068578A16C0E6CCCF3CA8D91DAB818DFEDCC29A
              535A083C17495CCACEC62225480C8A9FB1322169E865317B0F35D53E5B5C33EB
              ED9A6545AAC5FC8480B81553D727754148C05658937D5C97F29CEE726FB1DB8A
              973A57CFEEF003446C4486949C6D73F3DA231399342A9E392BCB717B756EBD71
              3093470F474AC9DE43CD758D4DE7B50DFB96AD532DE6C0773F0842FAC5FD3EDD
              E5FE20B5F6E47CE8A115FB7403AF6E50923D9D5B120702E072FB58F5E90F54FD
              780A9F2E11024CAA58FBD59A392FEEB78E0CD7CE5501AA044FA8E3CEEAA302FC
              BB4028AB9046E0DCE7F2E8C40F30F3698E0D4BECA58D62319B58F9680ABF9EAE
              E2B7963654450158A0D91D5B8B1431CC63C83F4374F4F054222150A9C079A0AB
              0A1D6E1FD3C60C67DDE22961A682C7EB63E273DB181C670E1EFE13B015EDCB6E
              0A03D14D3CC5D9D8ECBFBFF47842B9C7EBF57D366BC208563E96123141D5C1D3
              5862BA359A614065F694225B61CDF2385DD2166EAE800129CEC6F3C1630100E7
              EAD9DBAC398E929DDFFD3EFF21EB48C65D37282CC0EEBAD398C2F75A012886C4
              1D095EC2856E93420FA5D69CD28AB31D6EDBFA4553481B7F6DB724A92BB66152
              95D0AED702A417D6641F0B5EED1128E3EEA83EDA1E11A013C2B1E95C877B41E6
              A4EB58F5F8A4C0F89153E77870CD2EFAF7890D0E6F056644231E0E22F28F49EE
              8E2CB7C7BBDDAB1B2CB08D62F1CC643E7436F2EEE7F5A1A79C42677EE60BE1B6
              A180FE8A40D725EDA13EFF36ECFDD72C77479ECBED7DD9E3D3E96336A12A22B4
              FC3F01D6825D4B0A158B3970EC0E5EEDDF4F4F8A0FDE1DBACBBD25B5F6E4BCA8
              00FC96F66AA54DEABEFBA4343490C95CFAA41A203E114259985FB1E82DC5625E
              A80A71758AB3B12978BE1F22B80B5E11C0FF65519F07FE2FFB0769B093703E60
              E4B60000000049454E44AE426082}
          end>
      end
      item
        Name = 'StatusHelp'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              61000000097048597300000EC400000EC401952B0E1B000001F649444154388D
              75933F6813511CC73F977B6974B088E260A52901A914A527A8E9E020B1B8A874
              B8E8A20862C5416904752858A47F965414E55C8A48A60E2E3D50840E4654441D
              44C20D450B92133154C5684B2C1EF9E3395C5EB85CAF9FF17EBFDFE7BDF77DEF
              14D775F1A365CC3DC0056010E8015CE033F014B86F19FA477FBF22055AC6EC00
              6E03178108E13480BBC0A865E8F596A039FC0438D2666F2E1FC263206D197A5D
              343F64FDC37B135B1839BE1B2DB11500CB2E3333FF81779F7ECA9621601C1853
              FA47E676010B800AD0DBD5C9ECD514B1A8CA62690535A2B0737B27F5C63F4EDD
              7ACE6269454AAA40AF00CECB6180130713C4A22AE61B9B89870500A64EEF6368
              A08763FBBBFD820E60580029FFE1E6DF7FC5FE56E1E5C2929783029B36460170
              AA8D6016298177552D0AC53285621980A81A61FAEC0152FD5DFCAE38CCBDB583
              82B860DDA0E1FA498D416D075F7EFCE1D2CC6BBE2F3BC116570036B02D5811AA
              C2D1641CA7D6E0CC9D172CAF56C3D6B0059007926BD42E24AF3C5A6F7392BC00
              1E00D7F0526D11131172970FB1EAD418BEF72A6CF82F901396A1DB5AC6BC098C
              F9AB1B622A7DDD9B716A6B92974C5986BE245FE238D007A465F557A54A3A9BA7
              162E98C57BBD6D3F930ADC004683C7F1E1009340D63274B74D20D132661C3807
              1C061278D75C049E0139CBD04BFEFEFFB0A9A85EC7FDFC190000000049454E44
              AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000097048597300000EC400000EC401952B0E1B0000038F494441544889
              95954D685C5514C77FF7CCCB74D4A6366932A5D05863AC96D0C9548B146D114C
              360644DA71906A20820B69611A10142B2206B4A288A2E3B8521424A26866C076
              21712C5D74536C497C9974614C4C4C29369FAD24D3264D73AE8BCE8B93F9C8E0
              D9DCF3EE3B1FFF73FEF7DE63ACB5949350ACB701888A489BAAEE16915A55B5C0
              2C901191B4AA263389E8DFE56298520942B1DEED22F28EAA1E06FC226254D57A
              AB6797FBBE017C2D226FB9F1C864C504E1AED421E073604BD9D24ACB15E00537
              1EF9B96C827057EAA8AA7E7A1BDC7F682B54906F7313783193887E53942014EB
              7D5A4452AA2A85CE5BAA0366DFAEA06D0C561B6BAD1D9B5CE0FCC81473F3378B
              4000CB22F2A41B8F9C594D10EE4A6D0532407D7E7962E0687B339D6D3B0954F9
              D6F463717985EFCF8E123F7591E595221E2F012D6E3C72CD0150D56EA04E44C8
              47F46AA4C53EF77813C61863ADB5DE0AB0C1113A5B1F30D5812ADBFDDD00407E
              350DAA7A1C386E5A8E2583AA3A06DC91DF96A66D779BE4EB6D568C01305F9D1E
              B627CF4D982A47EC538F34D0D9BA13638C5951B5074FA49998CE16B6EB2AD0E8
              000745E4CE7CE2000E3407F1E5F4FE91193E3979D178BC7DF4E33FEC7B30C8AE
              ED9BF18998DD3B6A9998CEAEFAE6E2D400ED0ED05A822806C7AF9A53BF4E580C
              FC746162CD29F23B3EFC8E781CDAA5E595C21679FA130ED05CC810803B36C7C0
              E88C876675FFAE40156F77ECA5716B3500D9C55BF48FCC940A01D0EC0075E5FE
              16CAC680C367470E106EAC0140D5F27ED265767E710D883CA973005BD0BB92BA
              E3F399F84B8FB2E7BE5A0370636985377B2E90762F1B2F78095FEB0053AABACD
              DB2CC5878898FDCD41FB70539DB1D6DAD9F9255EFEE21C83E37365ED73FA9403
              0C89C89E4A15ECBDBFDE98DC91FDF297DF191C9F5BD73EA70F39405A553B2A55
              7079266B2F4D2F985B6AEDC0E82CAABAAE7D4E4F9B9663C9CDAA3A0E6CAAE050
              92C875ECAF004DDE5BF401F04A91779E741F7E88438F3502F0DE0FBFF1EDD93F
              D7330778C38D47DEF5DEA213C0B322724F3944810D8E2577B1027EA7528B8655
              F56300072093885E0BC57A3B813EC05F0ACEF93FA6D951BF11B530F4D7DC7AC8
              B340472611BD0EC503E719A0070854AABF8C2C0051371EE9F3368A466628D6BB
              1FE811917BFFE7441B56D5E73389687F7EBC72437F9388BCA6AA47809A0A09A6
              8084887CE8C623D70B63954CE049B82B550DB4036DDC7E14838005268121E034
              D0E7C623D97231FE05EBE122871120766E0000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F4000000097048597300000EC400000EC401952B0E1B000003BB494441545885
              C5975B68145718C77F93DD4D6C92B54D6AD0B6B868144C8297E4A5033E080513
              B55A4FA1F54151F182E29BD051AB168A44B1173AD2527AF1D2A7229A3E48878A
              05438397481D699B56315EF11293AA8946D3D864376B76FA307132999DD93D49
              857C4FF3CD39DFF7FF71E69CEF7CA35896C5685A7854D58703A06A4614781B98
              0B5401938142A017B8035C001A8023A62EEEC9E655B27D0255338A81ADC00620
              2A9133091C046A4D5DDCFC5F00AA66BC057C079448087BAD07D86EEAE28B1101
              A89AF101B013504620EEB6EF8135A62E9E4A03A89AB10DD8ED17501CCDA3BAF2
              552A62C5BC941FA1A7AF9F5BF7BB696CBECFC596474110078115A62ED2C4D200
              54CD58001C0572BC9357BC319575F3CAC88B847C55CE5E6E6767DD1F3CF827E1
              37BCD9D4C567190154CD7811B80C4CF04E5C3F6F1A6B6BCA1CDFB22C12C97E72
              23217294C1AFD4D2F184559F9FE4DF78DA8AF70195A62E2EB95F7A8FE1163FF1
              584901ABE64E73FC63BFDDE1CBA317E9EC4E5030264C75D56BBC276690170911
              2B2964E99C520E1CBFEA4D930B7C0C08DF155035E305A00D28F2466E5850C6EA
              0180EB77BB58BEE704566AE81CF70A5D697BCCCA3D27BD69005240B9A90B87CE
              BD028BFCC4014AC78F759EEB9BDAD2C401CEDF1EDC802F47C7F8A5017B5F2D03
              76F8015407457D78E8770A8FD8533B9FF86E30A64E18AC511D5DBD41A9006A82
              00AA8222E2897EE289FEC08CB3CBC7B37E7EB9E3D7FFD996096096AA19CAB323
              E9069898292AC816BD3E91ED4BAA08E5D827E1C2ED4E7E68CC5881F3B12B6BBB
              17A060B8E28BD518DB96543AC7F0AF5B0FD10E9C25F9D46793A443E0058863DF
              6E5256112B62EBBBB31CF1E34DADD4D635914C66157FA69506F037304E1660D9
              9C298472EC62F9D3B91676D535C986F6011D7E00E78199B259664C2A769EBFF9
              B959360CA0D9D485B3A3DD000DC072D92C4585B900A42C8B87FEB53FC81ADC8E
              1BE047E06B20B08AB8ADEEF40DA2F911BA7B92C3110738EC76BC97D13E609D4C
              160518413BFBABA98BD9EE17DECBA816584A96D3100E2B9CF964B1E3BFF3513D
              AD0F7AB2895BD8ADDDD05C6EC7D445ABAA199B806F33655294A14D9222D7347D
              65EAE25446800188BDAA66A8C0EAA04CA99445FBE35E7223215296453C195CA6
              07AC11D8E43710D49285B19BD195D9324BD81960A1A98B2E6980010805FB9BED
              C06E26866B16B01FD868EA221E3449E6BFA002F8147813F90EF91CF0BEA98B13
              D926660570814CC72E5435C07420E21A4E01D7805F80C3A62E4E4B82CA037860
              22C02BD837681CB89B69999F3BC0F3B451FF3BFE0F45AC4348FE8DCB38000000
              0049454E44AE426082}
          end>
      end
      item
        Name = 'Stop'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              61000000097048597300000EC300000EC301C76FA8640000002C49444154785E
              EDCC310D00000803C11AC006BE31D9151C34CC854F7E3D9845B2374BA032D447
              800736C3AB01CBA20074CC59EB6C0000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000097048597300000EC400000EC401952B0E1B0000005049444154785E
              EDD5BB0D002008455130364CE01A2EE3942EE31A4E4089A58D89F157F94E4973
              0B126033A3971C4D21F098A7015535DA20223C097439065A914AC59211B80A01
              1CBB7E5BCE7DF0321168783C0F3D710E021A0000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F40000005A49444154785EEDD7B10D80400846E11F43C304AEE1324EE932AEE1
              04945C7995D5999C9AF726F842480856559AD9A2C90100E0BA29334B0F1611F6
              A509F48E6DD548FB79BD7B0700000000000000003E70CFFF31013E2300001AD6
              EE0F4DA1ECDBEF0000000049454E44AE426082}
          end>
      end
      item
        Name = 'save_as'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              61000000097048597300000EC400000EC401952B0E1B0000017649444154388D
              9D913128C4511CC73FBF7344C2A2B84149360BFD75571603398312EE7A9B72BB
              018BC12294D4592CA61B247AFDEFBA9441314A51179BF532B99541C9DF335CEF
              EF7FDC9DCE6F79EFF77BEFFBE9FBBE4FD2F3AE0784F847ADE61212B6CDECFA18
              034E0409494D813186E24389FCF6B53FF301FD23BD75C5002242FF704FC52CFC
              7D585E0B334E4D80735E40444000F30310BCD448FD04B885192709B0D73EB808
              9CA652290FD80036E3F1F8AF37FA0053B634ED9C17BA945253800B1C65329956
              ADF51650020E8D3162ED57008AF7CF0C38910E09C9127000A0B51600A594D15A
              8BF934141F4A879453A8049CEDDED8ED5A8CE4F16DD86DB162E0CD42F23BD700
              3EE45788401F7011FB484E28A5DE8157A0C387E4B4EC2F642D24F08D2161C55D
              B0ED287009894EA5D44B1D485507EC27B234B73445974FE6AEB4D63521350181
              8A025521C1101F81A146205AEB4E28072CE979B71B7802DAFE7073074CAEE612
              AF560C20C698BAAA6A65C59EE78D7F011D169428F00905130000000049454E44
              AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000097048597300000EC400000EC401952B0E1B0000028A494441544889
              B595CD4B945114C67F67949AC1C4409068204ADAEB3490B8887116DA2C227466
              2C785F9C041781B488E95FA8E558B46A51608B77168DE358489B08BF561253B9
              77518B312A8222445BF89E16CE1DDFF952293D9B7BEEB9F79EE73CCFFD924C3C
              A71CB1A5F349317EEB5127AFB55655550011918B7D67894E84683B7D12F14925
              AEAA5ADB02A8ABB2F9F30F0BCF3EB0BEBA81895701783B91F11EDA3B03A65BA1
              2922D2B06D11DA3B0344C67B585FDD68CCC09BA8BD3380AA222214AF850FA41F
              9E2FA2AA7474B52102AA7BB9BC008696195440C2F3C50301BCF33D7E3580A16B
              CCF40FCBC0BBBE3617D46C3280D9C832834FC00500DBB63754F555369B9D046E
              000F813366BE595B07D0ACBA3283F3DFEF3C188CC5626F8015E0B66559B7808F
              A954AA2F168B2D98029A599544BF7F6CD1D1D526EE8E4BE8E53B13BEEFEEB86F
              1DC7B96959D6A888F81DC7E9B72C6B786870E88AAFC5B7F2EBDB66B7EA21245A
              9A5E233A11F21E5580CBC030300BAC9AE42252184B8DF1E4F1D3E0D2F4DA0AD0
              DD482239E453F119E84FE7935F4C72EF60787B24C8AE84DD50F3547819ECE39F
              1391D799782E929DCDCED9B65D855EF4174AE1ED91A0AA2E1B900A402DA37DFC
              5E60692A3133E0E41DB16DBB8A79D15F285DDA1A0E02CB550035E7185F8B70F7
              45A2A14E65904560C071EA41DE07E64A65B9F600EA65D97D664CFCD1685E5C57
              D57FEA844C3EBFAE22D2ABAA0BCD408AFE4209FEFFB9364CA28D406CDB56C771
              04EA25DAD7AF6943C062B33DA93048E7939289E7DC661279FCBAFFA02CD76226
              9E8B38B37B20A67ADBB6B515E0DEECA86F2A31633E914AE19E42A4495B916B2A
              311375F24E256EC0C47BF90CC83FDA1A70359D4F7EF5329106B7FB48EDF83FFD
              E306F80B785F48815CB3686F0000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F4000000097048597300000EC400000EC401952B0E1B0000029C494441545885
              EDD74F48146118C7F1EFBBAEFF154383C05BD0A54B29469DC284883D4484BB4B
              06B3A22B9D8C8885A25B1074748DAE45863C05E94E81D54D28932E8A500842E0
              C5437608C292B6761C673AE4D4BA3BB38CB3E95EFA9D86DD99793EFB3EF0BCEF
              AA91DE499BBD4F434A8FFD000857A0F8B614010E9D68A767A893A6D63A945281
              5F6CDB36D9AF39666591A5572BFE01DD0347696EAB0F5CD889528AC67D75F424
              3B587ABD021E8D2E0234B4D4965D3C3FB50DD554D754B191DBF407C8CFC2D9AE
              C085BB5E2CF8BAAF24A0736A3E30C06F4A0242A1506501FF5BE0D28283C96472
              D8308C9722F206E8056E0187770550D882CF976F9F514A8D009F344D5B0F87C3
              C7FAFAFA8E0003C028D0E4DC1B8944CA07B8F4F1662412114DD366806ED3343F
              880822A28025E039D05AF890CB0CAA0702ED05EDC0B0889CD234CD79EF2580C1
              C1C18F636363A78169374441EA9C8B2240762D47CB8192AEEBC0BDADEB6111B9
              EF60FAFBFB6BC7C7C7B72172D90D4CA3680AFEF404CC3C7C4FCF50074D6DF55E
              9BD17EE0DAD6B293B7125896957310B66D4F67D772ADB3B2E8B90FB80296E756
              599E5BF57EE2776E004B293DF6A8F00B07D1F1FD9CAF76043D0F848007E96866
              5D7451F9ABE020DE354EF942B80242615F23B80698BC73E1695C9E0447B802AE
              3C3E4FA8CA3F02888B0443FC8B235959889200DBB2198DEB459FA7F458B908EF
              3950467682B07603B013C49FC9B41BC7723F8836887D0108A7F4984A47331610
              FC0CEE81308D4D2FC45BB6B6F030404A8F85D2D18CEBC0F439133C11E968265E
              30ACE645E4B8A669B652AA5AD9F6DFBA0EE2EA44AFDF395032A6B1C9DD8BCF0C
              209ED263539AA6CD8AC8C93C8CB90DE020CAF8D545B14C0BC00012293D3651D8
              8E22C05E2491487CB36DBB5944544500F9A9F8BFE35F1248521F846293200000
              000049454E44AE426082}
          end>
      end
      item
        Name = 'close_window'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              61000000097048597300000EC400000EC401952B0E1B0000012D49444154388D
              A5935B4EC24018853F2C1B982DB00020C117057900E4CD55E81600C302005983
              BA0943BC452E563112496403ED0EDA796FF1F78152C5729170DEE6CF39DFCC99
              CCC444845D1407189FEC67804B20FDCFDC277096B9F918C783C13590DC62E374
              9049CD01DB84E74A4250E1AF54AE847EEB23537F36300CD44101F7E531E28D00
              54BE4CA2D2C01D76B1DB7504215169A0B2456CC3C019DCAD07E8610FFDFE8C3A
              2C40B50122A86C113D32715F9F369F407C0FAB5523717E3183007A646235AB88
              EF6D0600887C2D98C5F760C57B89020C23ECAC47E6AC4250C76ED77F2E761540
              E54A61D86A5601C23AFAE818A77FBB1EE00EEEB1F7E2B8E64358C36AD550F972
              24BCBC02E0F43A0B6BF13D9C6E679935044C80D452C76A4D7E034E81AB2D2093
              20436CD7EFFC0DAC4D7C070294CEFF0000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000097048597300000EC400000EC401952B0E1B00000256494441544889
              D556BF4F535114FECECBBBD53259176BA2699F98E802C194C14EDAC945E24434
              7130A9FC018DF131D8A525795D60E96A0C898BC6C1A90938D14EB0B4032CD6F0
              A36D24D19014586C4BE8BBC781F74ADBF71E051113EF7473EF77BFEF9EEF9D73
              CF2366C6450EF542D9BB054A13E31100EF008C9D93730D403C922B967A0400CC
              031865CB3322A2FE79F7DA099851EBA2F77A0498798488CE7979C012E9B8D011
              208B9DBA54DCE6D4770B2FBC43A0DF020BCC976F84D1DAAEBA5AE4BFA9516BBB
              CACCECB0CB21E036AE3F9B4270328ECA5C127BCB4B3D7B81680C9A6EE0E7E7F7
              F8F1E1AD2787A745FED030824F5F92A20A68BA01CC26697F250F22A22BF71F42
              D30D28BE4B084EC6697F258F6665DDD522B2232E3E8EC8FE30AF3E78C4A1440A
              8A2A481E1E72652E499092B5E90C481560D3A45A36CDF5FC82C3A248AE48032D
              AA17BE0000C289344855A1BD3600304815803451CBA651CF2F9C4431B8928F44
              08E1440A8A106066409AA86667B05B581C74FC74692A0F5A609644D69A940C79
              D08217DE55C02D4D999903D118B4E90C912A98CD3681C1B65D95D937B4B7BCE4
              5AF9A78A20108D91A61B50840F6CB6A99A9D01A424DBAEEEEC3A7304FED06DD2
              F40C931090ED36D5B269DE2D2C5AFB8C50220545F848D30D2EBF7A816675FD6C
              85D6FABE859DDC475C7BF2BC932DF6B9E3EC4A6127F709CDDA8617CD711D9426
              C69D9D870843B7EEA0B159763D3C347C178DAD6F804BD372D481EB4796927F6D
              7CF57CAE1B9B654752D8731BF3EF3A1A11AD0218FB4BCFF59A4300C014807966
              1EB1C17FD8D1562DAE23CC7FFF57F11BF7B45CB4311BA3B30000000049454E44
              AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F4000000097048597300000EC400000EC401952B0E1B000001D3494441545885
              ED973D4BC3401C879FB48AF64537E9D2B574F005B58A5F4010074547C1A993E2
              D2DDE250829B5BC5C14F210E82F811D44510B40E2A8E1DDB34459373A9D25E12
              BDA48D15F4BFDD3FC73D0FDC2FB98B2684A09F35D057FABF8097C0D5CADC22A0
              03B3C060978C57E01A28E64E2F2FE4879A1CC216FCCC4BAE8B7A039665093788
              1E02FC83A503DF0AE442807FD4ACDC70130833988E3CF982458686B19B66D773
              020944E34932A532B5BB1B5E8E0F5CE7A4F30592E33354F676B0EAB5DE094486
              63644A6512D90912D9090087443A5F20B5BE0940A674C8FDEE36B669F446C06E
              9A188F954F786A75A343A21D0ED0787CC06E36549656DC0221783EDC07606C69
              BD4302CBEA8057CF4F782AEBA078C8A987F02B8980707F021E12DDC0FD0BB424
              EC46DDD1B64CC3373C90403A5F20B5B6E9E8CBC10C45404E7BF5FC04216C4726
              FC48280BB8C19FCAFAE738A884E28728CEC8F48213DEDA733998A353F3446209
              D7AC0412B04D834A719B8C7E8451B975A6BDEDED486627B9DFDD528283FB85C4
              33CAD17812AB51F74EBBA6118D25B00CEF7320777AA9B58F7D85F0AB850110E2
              FB3952B909BC79F47B51AF2A0257C0824BBF1775AD225024BC4B69516E3A4208
              7DBE96FF74FDCE3FA33F25F00E5C1DD788FADBD0A10000000049454E44AE4260
              82}
          end>
      end
      item
        Name = 'undo_green'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              61000000097048597300000EC400000EC401952B0E1B0000012F49444154388D
              CD93BD4A03411485BFD9AC5651417BF1012C32283616626B61D84AC122A5950E
              0484A8B5248D982522D616968E45041B11C126164E632BBE825A8892EC8ECD2C
              4CC2060B0B3DCD70CEBDE7FE701961ADE537087FE5FE5F0516766F471EEACB5D
              3F38576D8FA549AF01760D9872F293080AB5C7A3D5ABBE02DD8FD74FA09071A9
              741538CC693A6BD3A42D953E3771B421ACB548A52D808923E1CCA7C066BF4FDC
              819D004A9E5809A5D25F7E9A54FA64C07C66E2A8E2C517817B47F74569FB2205
              84131A40CD33EF9938AA0FEE20957E0166802404526FF71FCD0ED3EE7D1B76C6
              2D1347C77981F99DEB221038FA1C7ADD33BC032DA9742B13468B9341E760C902
              A44977C5CBEDE44D30EE93EC32196CD28B3C7A13220286C134CB22475E070142
              609AE54BF1E7BFF11B302D5FC3B1B38C610000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000097048597300000EC400000EC401952B0E1B0000022C494441544889
              ED95BF8B134114C73FDF642322F6C1C2EA403B31D146042D0E410B8B0D36365E
              71889597C0791C9EA7088A1667B10978DE5FE08FC2A4B2B311BB03378D627960
              27588892E069C8B3993D2763122F683A1F2C3B3B6FDEF77DDF77DECCCACC98A6
              455345FF9F605766667FF594AA4D8DF36B922E2A559B7949A7CCECA2A4936636
              03EC91F4C5CC3681C7929EA449BC9DC50C2428559B4BC0C376BDD21D027E1A78
              20E9B8999924990B0EC6EFCDEC52BB5E793390A05C6BDD00AE03C534893B1970
              B9D61270DBF90ABB2CF62B703E4DE257723AAE48BA6B665DA0D8AE573A9E241B
              6636BF53B263EBDE7DA027A99011F5AAF928E94854AA3697813B8042BD817560
              9EDF6D0B68002F80CFC061600538E7AD2902351D5D78FE03C8BBCC1DA028A96B
              661BC0655F5FC770DDCC96B32A03424F255DF0F743A56AB307E4DDBA0E700058
              03AE04ACFBC06A9AC4F747E84EB9D69A055E7A53DF22972CD3544043D25CD021
              7D60B55DAF8C040730B348125E6C2F92044E7F49FB803987BB1328E9E638E6DE
              BA43192937F529AC20CB9CB13049B7D224BEF7277057C1B1A082AD08C88D8959
              031AA56A73BFC71233B3219B9C034E04F16F235F8B600CB0005CF5E572552D01
              8FFC49490781990067331A71DCB313BE37685393B49826F100B8936716C87912
              F525BD9EE4BAEE03D7D2244E46F8CF06DFEF800FE324F2C7062CA6495C1F865C
              AEB5224967F8D58DDBC0B334896DA2EB7A94956B2D9959A15DAF7C0F7DFF24C1
              389BFA2FF32702B65A7E49C15A360000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F4000000097048597300000EC400000EC401952B0E1B0000021C494441545885
              ED963D6B154114869F351A11ECFD20B15108012108C208A24830828D53280A16
              8A9F8DE574FE00BB29FD4A107F80224C4004318988CD588A28A45630205AC57B
              F5C65C8BD91B97F1CC6E764908CA7DABE1CCCC3EEF9C397B76B36EB7CB466AF3
              86D2FB06FA06D6CA80326E04380E1C008681EDC022300FBC009E79AB7F487B33
              E93554C6ED013E79AB7F954033E01C608083151E3F03B780DBDEEAE55203CAB8
              61E02530EAADFE99808F020F0155018EF50A38EDADFE221A50C60D0173C03E60
              D05BDD11E0678107843437D13BE0A8B7FA1B146A4019B71B98CDE1A29471D780
              7BC0A6867080FDC0147006F20C28E376114E3E5258B8C55BBD54805F05EE97C0
              DBC093FC390B84623C0F1C4EAC1FF756CFF532F03C8203ACDC8D32EE4A09BC4B
              A8879BDEEA8568EE4E9EB5BBC04034771D58315096F6CBC06402DE022E78AB1F
              A7F67BABA7947163C08D68EA08FCA9812C01BF44B82F09BE089CF256CFA6E005
              3D150CECA8327091F4C9BFD780036C15629DA2014993FC7D6F4DE0007B85D8D7
              2A0365F0991A70803121F6B1CA40AC16A01BC0010E09B1F93A065A8006669471
              8389354B719F0750C6ED447ECBDED631B08DD02B52FA008C133E3AB18E2117F9
              9B3A06CAF49ED0D5E226D4D384106BC7069AF6F62A38C00921F6DA5BDD2E1A58
              1778DE018784A9E9DEA0A981D59C1CE06461DC01960905FDA81714FF88D64ACA
              B801202B7E5563ADAB81D5E8FFF82BEE1BF8A70DFC0693BDB2128D1AFE460000
              000049454E44AE426082}
          end>
      end
      item
        Name = 'redo_green'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              61000000097048597300000EC400000EC401952B0E1B0000015749444154388D
              CD933148C3401486BFB329E2A083A382D059573769EC625107D1C5E0D055916E
              82564C2A1AD0EAE0E2E4D8419AAAB84A05950C0E3A39BAD5C551A4D641689273
              30912314972C1E37DC7BF7FFDFBBC7DD092925498696C8FDBF0093E7DBB3D20F
              2AC058987A4350EF49A74B770BE5B66A9ABA3A485F4F6F7400849412DDB14E81
              A53F0AADB9867D1405BA63F90846DD45FB59646B6601A82AE227042D247A0C72
              E21AF64A0888AE6E5803B614D1846BD8F74AA52A5008C365DDB102D7B057157D
              53646BA607A48017D7B033F1B3EB8EB509EC29A90A500AD752035AC02030D2AD
              79D7B0F775C742819494ED40646BE623300E90EAEBEDBF9D333FBB8174C72A02
              C7B1B4AF010F1120E8F833C01940BE7128BEDEDB41CCF0010C28714A036E8022
              80F4BCF908D0C8AFCBDCC54E26F0BCA66250CD40F40EEA65093FD3356CA10A72
              97BB4341C77BEDD6D62F20C948FC17BE01A20A75D9D241163F0000000049454E
              44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000097048597300000EC400000EC401952B0E1B0000024A494441544889
              ED953F68144114C67FDFB118C9A9D8042B112208165601C14AC15D10AC6F510B
              2D8410A2A8855A8872B39AE490A8888D82686123ECD95988DC362A366225A6B0
              1051B00858D8D8985C9E4576C3DC989C8798CE07C30E6FE6BDEF7DEFCFACCC8C
              F594685DBDFF071848CC6CCD15E74EFDCE0759F2BB28696743667614382669AF
              996D017E4AFA6866AF253D36B39745EABA8312580188733726E99199ED069024
              2B0FAB7DF97D0B9C2F52F7227416E76E183855A46EB607206967FB81A7C0E601
              035B005A80EB349A2B2948DA591D98075A9D46731A4071EE46CCEC1DB02D881A
              335B002249358FC18A43490FCC6CA24A599CBB3A302F69D8CC2E17A99B898073
              C0B620C267C00CF001D80A1C06CE00A3C1BD93C0529CBBC9A02E02AEC5B9EB2A
              CEDD5C90F727C091B09071EEEA92AE9BD9A4C7A062745FD284990D970CEAA5BE
              1B01A392E419DDEB349ABF754991BA1FC0E9A49D7D05A6805A05028C0326E982
              0F0E280216836EE93B7C9D46B315E70E60AAAA4D693B6E664395EF4A1F01DF24
              6DF2907701CFFB8114A96B25ED4CC074C0FE04CBF9AF1810019FCC6C87C760AC
              9F738FC94CD2CE6466574BD36AA67ABA2D02DE03073CDB7D71EE6A45EA967C87
              65917B265FD21D9667E7E21A71D422E04D407327B01DF8ECDF94741C98F5EFFA
              A9586B1F01AFCCAC0BD4CA086BC041E0619092BBE55B75132FCFC1605AA88F80
              2FC01CB0C7F377280428416E971D7483B24DFF24D55B7409B8026C2CF5DF8191
              4EA3B9B89A51D2CECE02B70601E9295A2571EE36485AF01FB2BF955501FEA5AC
              FB2FF317FF2A60FA1C84AA6F0000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F4000000097048597300000EC400000EC401952B0E1B00000257494441545885
              EDD6BB6B14411CC0F1EF5D72C6472588170856064551B4D346C98953A431A0CC
              1F10023E10FF019B612CEC6CAC340F0B0B5127164644704C0AC14211449B10B5
              3287264DAA146212D7627775989DDD7B448DE0FDCAFDCDE3B3BB33BF99521445
              6C64746FE8EC1D400750041046F70083C049600FB00D5806E68137C0332BD5DC
              7A01257F1B0AA3CBC045E032D0DBA0FF6BE01A70CF4A95BB9F85D15D409F95EA
              53214018BD0378001C6FF205D278090C5BA96673009B805960C04A351F0408A3
              B703CF81032D4E9EC6323062A5BA1F0054806FC047A066A5AA870093C0993627
              4FE33B70DE4A35960300F840FC253EFF0408A36BC04CCEA02F803BC48BAF0AD4
              80D3C0E602C4392BD5B803E806569C3673C45FE24BBA0BCE06065A032EF86F03
              8C0BA3ABC05560182879F9327053181D59A9269267FE02DD0B3C050EA6806301
              C08DC0E40058A916811161F413E036B02580184D10B7426300FDF0AB0E54030D
              1EE774742193C2E825608AB84EF8883161749420FD28B98015B245A9A7112041
              CC08A34F018F80AD2104D9DF94012C017D5E83DDCD003CC45400D1058CE6F54D
              01F500E050B3800431DD005108780F1CF172475B013888A104E12FCC42C0BB40
              AE5F18DD6BA55AF013C9799177904D0343C0C36610E920AF02B9123000DC0DE4
              761217AE7D8D266805F0956C75132180956AC1A99EFBD70370CF024B7CF6BB51
              B752EDCAEB9C54C47611AB56AA8A0BB8045C0F343C6CA57AFB0710AB56AA8ABB
              900C708578E194814AF27C10C80558A91685D127DA44646F446E24A75864A55A
              6B75E0DF02F81BF1EFDE8A3B80FF06F0034A89D584FDA30D780000000049454E
              44AE426082}
          end>
      end
      item
        Name = 'clipboard_cut'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              61000000097048597300000EC400000EC401952B0E1B000001BE49444154388D
              7DD33F48D5511407F08FFAA0C230C121683022A1A0E515445844536EAFC59606
              A35C2A1BE48E2D811954149E211A42B05A2A28247A538360340406F5C688A245
              09230729F01FF61ABC4F1EAF87072E97DF39DFEFF97DCFF7DEDB52AD56414AE9
              11EE47C4475B444AA9032F508A88D5425D6D275EA5940E47C4C2163D26703C22
              56A1BEC1079CC5C3BC37FBFB20FA3155CBD537788DDBE84F299D8B88670DE46E
              8CE5CFC95ABEA5E641064DE31416702822E6EB6A6FD08745EC8D88C546057023
              CBEBC238CE64F2954C86B11AF93F0519FC32CF09C3788BF7D8812F2846C45233
              0F6A31845EECC13DFCCCE4650CD4939B2A800B69E4C82E8B53ADAA9D39B5FE47
              FBF9F1B8F9B411BBD9A098CA9D18A0BABF6075B64DF5F49A421FB4FA3B57B03E
              BA6CDB415AE7F1A412A51F9B0D8AA9BC3BCFB9AFC948CDE2177A2B51FA5AF360
              24933FE12E4EE06A036932AF611CC51DF4D714CC65D38E55A234534CE536ACA0
              CDC69DE8424F254ADF8AA97C009FB184F69A8295BC7763069732F93BA6711183
              C554BE8562C6AED57B308407A8E2373A326808EF6CBC93ED0D238D56A274BDFE
              144AB89CBD98C544254ACF73ED24AEA10773364EE131FC032849AB93EB6D47F9
              0000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000097048597300000EC400000EC401952B0E1B0000036B494441544889
              9D964D689C5514869F3733896255226A2D59881A0531DD68BE08561083134169
              EA0F458AB41BF107E92A5D786F30889582F7225D3452174215A916ACDA8D16A1
              330BE9C2629D8815B3D00141538BD2B8A98DA6C9648E8BB913BF4E32FD3BF0C1
              77CF7DCFFBCEF9B9F71B99192DF3DE8F9B5921C6B88B2B30E7DCDDC0A4A48D21
              840580621BE676E039E7DC4C8CF183CB21F7DEDF087C01DC01145AFE76815F24
              1580BDDEFB6A0861FA12C905BC2FA91F381542F8B793C0716BD6EC1A49FB9D73
              1B628CF3171330B397258DA6D863F9BD76816F8033C0F5C0BDC0447A3A9A73AE
              1F7833E7FA32BFAF7C9301BCF71F01CFA6E539E0A110C2F1D5C8BDF705A00C0C
              27D71C705B0861B6530698D9BBC016495D66D603BCE7BD1F0C219C5B4563BB99
              3D0C982499D9C118E36C1EB04200384AB38E0FA6F53DC0EBC0781EE49CBB5352
              7E9C1780B7DAC9569408C07BFF0850C9B916815208E168DAEF06BE0236E430FB
              4208CF5F9240223968669B0152FABF4A1A0A219C76CE05E095E4376056D24008
              E1F4E508F499D9F7C04D2D22496533DB071C00BA92BF016C89317EB21A4F4701
              00E7DC26E090A4421290992D015DB9CCDE89316EEFC4714101801D7E62AC87FA
              6E40ED7B75BA8E2CD03D3A19762E5CB100C036BF6777C30A6348220514A8FF34
              A735D967E185B90BC59E2790F94A11D8063C03F483FD231A3F807A8DAED1B6D8
              DF8BD43FAE53B81F5807FA13F81CD85B0DA5B32B04065DF92A4987CCEC3158AE
              AFE5DFF3BE4E18E04749C3D550FA0BCE3F6813C0E3408B60015802AEBE48051B
              09D793D6EB813DC0D6E50C325FE9057E03AE4BA0B7699EDE45E055C075203F0C
              BC48F30E1ACFE11681816A28D58A00E93EB936F5B0068C4DC591A554BAD724ED
              30B3622AC359604D2ACBCE6A289D02C87C65DCCC86812149DD66F628506B9568
              5DEE57CDB4C893ADE5FF2FD43C7004782AAD6F6881AAA16483AE3C0D0C25571F
              A41E48AA91E65C5296F9CA403594A6335FB945D27E9AA716E06B499F024F2792
              C9CC57B6023F030F48DA98E3A92DF760D0958BC03149599A8486A43FCC6C2DD0
              2A4D43D2936656064E0077759822249D34B3F55371E44C7E4C6F4D637ADF2A01
              75337B632A8EEC4AD821E0B0A49B57119891B4B91A4ADF2E67D0B2CC57BA8127
              804D34FF61CC03DF0107AAA17422D717325FE9035EA27965F70227537F3EAC86
              D2DF2DDC7FB49EAD81F90A1EF10000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F4000000097048597300000EC400000EC401952B0E1B00000385494441545885
              BDD75B8895551407F0DF518B2E8C05F6D68D324228CA7A29E972BA52D1019508
              A268CA07C9A2A45E62B6E9448DB1A7C04A7A51A8D0CA080A99EA4404659E0CA4
              A8B07C3072C8A0427CE8A2586A3A4E0F7B9FE6F330DF397366A43F1CCEDEEB5B
              DF5AFFBDF6DA6BEDAF323A3AAA0C218493301A633C54AAD4062184193821C678
              A04C6746071BF7E22ADC3F1902780EBFE0F9C9123880DE10C2BA18E3E66E3C87
              102EC7523CDA4EAF13813DA8607508E1B218E3D12E38ACC674EC9E0A811FF3FF
              25E8C5BA89780E21CCC7D52D3626456017FEC2A9581142D810633CDCC179054F
              E5E961EC98348118E3D110C2D7B816E7E33EBCDC81F41DB8348FB7C7180F4E9A
              40C66799002CCB0979643CC5BCFA1505D1E64EC62742E0632CCFE3F3A45C78B5
              4477A1942F4D7C743C087C8EDF302BCF9785105E6B8D425E7D7F41F4A7E31181
              18E34808E11D3C9045B38D1F8585C6F61E86628CFF4C9940C6FA0201E80F21BC
              D17410429886A75BDE29DBA6EE09C418B78610B6616E169D8B87F0629EF7E2A2
              C22BDB638C5B8E1B818C5578BD305F1E42588F431818477742E886C05BD211BB
              30CF676125F6E1AC82DE30364CD468A55D3B6E452EB14305D148FE9D58902D8C
              310E9920BA2290490C617EC9E377638C0BBAB1D73501E8EBEBBB0537606616ED
              C3A6C1C1C18E85A715DDE4C07FF8B2326FC988E9C7AC74BA23734CA0F2B5A263
              04AAA15EC1CDB85EEA8AC3D82F35A54A4175314EC10552443E68C4DAD62911A8
              86FA4C6CC48D9D0C95602D1E6CC45AA9934E5BF0CA149C93AAE72E3C5BA6501A
              816AA85F23B562D2C5A21F9F4A57AD2BB2FC6F9C6C6C2B36E2252C92AA23693B
              CE69C4DADEF1FCB48BC0E2C2786923D6D664622BF17E96FF80338C15A2871BB1
              B61B9BABA1DE2335A899B853C945A61D81DB0A4ED616E47F14C6DFA327131895
              2EB14D3C810552746EED8A4035D4CF9456061FB624D1C585F1B7D9C6EDD9D16C
              EC8446ACEDA886FA4EA97417DB74670238BD30FEBD40AC822585675B70C45833
              EA75EC956C4F26D0D32D815F7114D3705D35D40772149E34D6927FC25629F4C3
              D2F97FAC1AEA6F3762EDBB7C849B2DFAE73202ED4EC12752B9856D38882B0B2A
              F73462EDCDACBBC8D80564AF741AE6614E962D6FC4DA33E3F96997848FA021E5
              C2DC827C14034DE719EB7013EEC669D2316CE21BBC50E6A453253C1B8F4B5F39
              33F015D63462ED8B71742BB84BCA833952EEBC87558D58DB3F2902FF07FE05A1
              B621FEADEEE9BB0000000049454E44AE426082}
          end>
      end
      item
        Name = 'clipboard_copy'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              61000000097048597300000EC400000EC401952B0E1B0000010F49444154388D
              9592314EC5300C86EDD05B3057620389FD51D18E8F43F41689D385A1CE811E19
              13891BC001DE066C204E50B395A66D68B19421BFA34F5F9CA0D69A01E01A9675
              46C44766FE5CE98D8544E4FBBE4F426B2D54550531C67744D4CCFC9503146BA1
              88405DD780889721042622CDCCDFAB0422F222E20FFAE40FFAE445C48B08EC5D
              A3C1B33B2660638C64AC5F10F18199DF922BDC99A704A49482CC6C6E628C9188
              2A66FEC81A6CCCA60C210422AA160673D8DC0C00A0691A0080AB1082DF3498E6
              655982B576DABEFD9741DBB620F23BDBAEEBF2AF90CB1131D917C330BC1A6392
              AFEC9C5B18E4C085738E564F6C988D066BA131E64229B5CFE04FFC0E039C4E75
              661100E07E831F7F007D6DA349B3968F740000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000097048597300000EC400000EC401952B0E1B00000131494441544889
              C595314EC4301045FF4439074D4A24AAED9188BB459C228788ED0251185FC2A7
              5841472CE8A9A8714349C7019069D8951339611CB1F0ABC899F19B3F1ED91463
              C431553BE77621044EEC6B555537C6988F1200F57DBFB3D6CE06C418A19442DB
              B6F0DEBF11912E81D4DC402104009C78EF8DD69A0D6103D6424680737937FAF9
              642F414457690B85107B104B3580CF74C39C9C73913908CF55556D8D31EF29E0
              A09C030008218039081BEFBDD75A5FEC2123C09C03AEBE5B779A42161DAC814E
              21C50EE6DA98830CC3705FEC60AE88A66920A59C2E6F7EC50111A1EB3A4CEF35
              A5D4F214E5A0DC332122002BA62857C4548FB7DBC3F7511CA4ADFA5B071C2D15
              917BBC6A002F52CAB3B9A4E91551ECC05A7BFD6346A2350E8AF4AF67905331A0
              545CC0839492FF8C25795FB28BAC0DEACA3D860000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F4000000097048597300000EC400000EC401952B0E1B00000160494441545885
              ED97314EC4301045FF587B0E9AD06D43B1D448241D8853E40474134B20902C5F
              22A740D06D2CD1537000DC50D271025340D02A389BD84E7685B4BF1A39B6E7C5
              5F33B2C939877D6AD106CC7C0FE02460ED9B10E24E29F5990240ED0930F383D6
              7A7081730E555521CF731863DE8948A6402C86A7F8551405001C19639494321A
              221A602A082FC0193F7A273FEBCB5E88A6696E015C4F02E04BD48A8890651998
              B9FBE93834792FC090CAB2FC33E6018A0708B12055C11600B8F20D8E29E1D100
              43AAEBDA596B4396BC08212E94521FA300FA2C00BE4FC75A3BEA8F379AD6CA18
              63A494E75D88180B82F553AA4B1F4452239A0222CA823173B734AD65D3344F00
              4E7B01422C886C5AAB3698DD82B22CD1BD735455F51BEFC40222EADD6F560BC6
              686755301BC036BBBAF29DD626C02B330FDE09BB1D70320BB4D637493BA502C4
              6A4A0BA274A8828305A9FAB7006B662E12F2AEDB80F6FD3CFF025E24A5CDEBF5
              320A0000000049454E44AE426082}
          end>
      end
      item
        Name = 'clipboard_paste'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              61000000097048597300000EC400000EC401952B0E1B0000010349444154388D
              9D93314EC3301486BF176560AB1064E000919810121788488648C0013A66EAC6
              6E276B9C913907412A837306C419100C05093626CCD25669441B39FFE4F7ECF7
              D9FEFD2CCE39FA524AFD02B20EDDC5D9CFF1FCFEE19B3D0A57CBC5077012E5AD
              28A5DC605E5EDE8FBEE620ABE5C2019F51DE9EEE0080D926689A4638ACD93011
              6E06EB1DBC158E2F990888F276EC3AE327F8C754806711B933C6BC8E028220A0
              AEEB6D5C962549925C765DD769AD1363CC9B9707CE39D2344544626BADD55A27
              934CCCB20CE0DC5AFBE80588E398B22CFBA92B2F405114F45BBFAA2AFF3E10D9
              7DDD1078026E7C415B4094B7B7538B0164F89DFB524A59E0FA407DF7072ABB4B
              FB447A34870000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000097048597300000EC400000EC401952B0E1B000001CF494441544889
              AD94416B134114C77F334D11143C88C917C8D16BEF8209983505BF4430875E0B
              CD6E14AA92EE06F12A24E4A29FA1922226B477BFC27E80365E7AA84459335EB2
              617632BBD98DF99F66DFCCBCDFFBBFB78C504A61D3E9EB9387F348CC803D4002
              6A4FF0A8E707B7D60B292ACD2EDAC7C08738506E0C04C09FBFE233B01F048104
              E8743A8B057C015E02CC2EDAABCA9452C71567F8D1061037E35777C0FD38F9DB
              3727E7F3483ACBAA6D5ADC2B2DBE9DBEEF3B1AE457B931786075009494D6A779
              245F0022C3B5FC1DC9E75AF56A99C7AAC4C6F5B83DF3FD415AE5095D8FDB3F65
              56193A40082100043CD67B9BA538797C371310B7480821F4751ED026A5F62E1E
              CBFF72122D32D706EC53C5191E6D05B0B588E59F14F32ACEF068341AA9300CB3
              F2FD9052367BBDDE4D0290576118E2FBFE5A5C2985E779D46AB583E9743AED76
              BBCF624821C026D5EB7580273A24D70CCCD053F73CF17D79D64C85E49A81F920
              5EF987896F733F864C2693AF3B7170E51F52AD56715DD7BC7AB0130700AD566B
              ED9CE779DB0DD97460EAF2ACB972BD558B6C0E607D162B40D116E571A0032260
              3FF386A1A20EDE018116DBF8BA1572506E0CFA407F53525D690E6CDAE953B10B
              C077D775EB45CEFF03CD6CDD9C735E3E6C0000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F4000000097048597300000EC400000EC401952B0E1B000001E7494441545885
              ED97BF4FDB4018869F73808191CA6AF78C5D00818404125293C152DB19A12E0C
              91C28A5409CE1143A44627D41F6C552D656887B63BB4550612C1C0C6BFE00121
              154416DA091587EBE2548965071B9350AABED377FE7CDF3DBEF7CE3E0BAD3571
              25A57C0A8CF9CD33604B2915BF408886120CBE087C0A5C5E023E0C0400980050
              4A091F480393690144DB8266ADB801AC00C3005AF3E3FBCFCCE6F8C2DBB22DD7
              DE6BC4331FB8095C02F78116E8CFF7465B1F9FAFBFAC9D7C2B1E670C1EF8B52F
              804DD37256E3025CD03123A6E588F2FAEAEEB967CCC7799291CCE57EF9C5C65C
              B356EC5C139E6939C3BDFA0D45C4009C7BC66C9CC1017EB58C992BEA5F09D0A5
              A3ED65A5D4BB9EF4411D6E2DBF1A1D49D2A3DB8254DB294AA6E5885EF924BBA0
              2FFA0F70A701D680D7A6E5786900AEBD0B4CCB11D56A55BBAE1BE7F603C3301E
              572A95D360229505AEEBA2948ACC6BADB16D9B5C2E37D568341AA552E9511062
              206B209FCF033C0C8318D8228C82B8318079F9A5ABBDA79E4442D4EBF5AFC0F4
              8D02840D2884209BCD22A50CA6A6DA41DF2D28140A048F7DB66DFF8907628110
              D1DFA3BE5A104777FA55DCA5A005610A9BA5BFCA028F5BB0A473C037741CCB93
              2AB505FEF9BDE7193E69F138FA7776C16D01EC4829F3D7E9D70E4492DFF37EE8
              3727E4B2FEEF53C8470000000049454E44AE426082}
          end>
      end
      item
        Name = 'delete'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              61000000097048597300000EC400000EC401952B0E1B000000F249444154388D
              A593316E023110451F81F4694042C92DBCC7D815428AE8104D4E90220D29D350
              E508544041E96B784F11898A06890E8129B2BB1AECF12A0A23B918CBFFCDDF99
              9D8EF79EBBC27BDF1C979BB1CCB5E372339179A7765016D92BB0060EC6BABE56
              AC2CB21D300066C6BA15F00B288B6C046C81C7EAED3E8454E261959E81A9B16E
              231DFC002F42D340023195CBA7C681A8124180534A1C01121019376215D00289
              C400BD44A5AE7277D21E6A9F10364C46349DB08951B78123F09C82C8312647D5
              36E2FA47FA00169A58B80B21DFC6BA77E9E00B986B6205B204DE8C759770513E
              FFB04C0B979B876899FE1B57016FDBBD5E9F1C810000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000097048597300000EC400000EC401952B0E1B000001B9494441544889
              B595BD8E13311485CFC9922CDA0E7A68D8ADE862D7FB02899158C13322D872A6
              E1AF803676C313D051D020AD4024527268262B677C3D131671A5D18CEED83EBE
              DFCCB9A624FCD790545CABC57C62E587AEB874E69C7B7DC114FC29C95700AEFE
              72AF4D0AFEA56BE2AF3CC91C510AFEBEA4D70002C99D6B62B1012BE2D26D484E
              25BD0370E5DBF4B310884B774AF28DA40000242969EBDB342812976E0D60DA8D
              1780F7249FEF2BB91548C15F037861ACB1AD559282DF00981AAFDE0278E69AB8
              E9235A4B9A6615A87B2E706558D41FEFDB34291065137F0398F5040E701958F6
              6376BE4D27F97A85C0BE120033A3F42D805D058B5C1327FDA429B017E9E3CA77
              9CE781432C47090025AE8A4081E568814E644D7256118085258F512391A475EF
              62373A7F04D1C1DF52413468C6A18F5C33911555339A0235139184A42D80933C
              DF3D9BBDCB32DAA8898E31A3293080A530D19019F34AD81D166700BE907C32D6
              5BFA2295DEF543D253DFA66F79BB3E27F951D2230B4B2D0C5C3724836BE2670B
              D105800F001E5B586A91E1BA01105C133FDDBE34CEE3F3D562FEF50E67F2F7D5
              627ED9CFD70EFD8777107860E5477BD1BFC61F6EEA2C375B4489600000000049
              454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F4000000097048597300000EC400000EC401952B0E1B0000016B494441545885
              ED972D4FC4401040DF5D48F024040CE143A12A982A1402D9FE0224FC30FEC33A
              8227E1B60104964B1A04068D4014D5A41CBBDB993D929A9B644D3BDDF7DADD9D
              DDCEBAAE63CAD89A94BE1100E8BA2ED97C25B3B19C755AF20B34757906DC0245
              CECB3575B9006EC4F99758CE2CB60A9ABA14E00ED801DEC5F90323FC0D38063E
              814B71FE592DB002EF432D3180F71195F823D0D4E51C78054E037D8F4A04E07D
              3C0122CEFF02A686E003D8B34824E0AD387F187A262A6095C8818F0A682572E1
              2A813109E03B17AE16189108850A6E123048A8E166018584090E799BD157E2DE
              DCDA99750862B37D18A6B26D99844BE048D9AF5A42BB0C63F016D8C658314D02
              29783FE172CAB64A40031FE46649A43623357C1D89D87960019416B842E2419C
              3F5FBD18AB03D7C03DB06B810388F3FB018916B80AE5A786A01848982BDC40A2
              052EC4F9653071E4445CF84A7CEE89D757F2E82B3949E598F782FF8EC97F4C36
              02930BFC00AC699E3F4DF6A2BF0000000049454E44AE426082}
          end>
      end
      item
        Name = 'select_document'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              61000000097048597300000EC400000EC401952B0E1B000000DF49444154388D
              AD51B18DC3300C3C199EE111CAD5A74C95364B6809D384C7F01E1AC280964895
              3299203090D20B98A91428F61B72823F4000C1C39D7824541544A444A4DFD488
              0D55C5272F6A8CAA228299AF000E58E26E8C3979EFEF0B267513119D4344B4EF
              7BADEBFAC1CC763E41F9C76F6F98A609CE391445F11342B8344D73F4DE3F225F
              02C0300C2667E49C03805D08E10C601F352500586B75CDA4AA2A8848DAFA4D35
              D9085DD7215D74DBB66FFCA608C62CE9CD11D6B039420E9BAF30C7FF4688E271
              1CC1CC39ED2DD518227ADDE89329569768ADD56896AB01E009675DDEB3157A7B
              8A0000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000097048597300000EC400000EC401952B0E1B000000D4494441544889
              ED96510A84201445AF10B3B74057E283682DB513A9BD0D0477BE5E38A8E5945F
              337320D08CE7BB87C80C490080738E001042302DC63A07499084B5963A6E7169
              3DA3096244E409E0912C1498E7D9141773098661600DDE7BAEEB4AEF7D925EEB
              75B55D96E8FB1E242122CC26C9F9FB2481B22C4B36C99EC039C71042D9650111
              C9DED77AB7144DD3F4361FC7317966DFE04AF74768BDDB8A4A345164CC793F3F
              AEA886BFA253BE4851EB044A179FA1BAD1B66DC5AF642D89A298C323B092C3B7
              A8D55F0500186B6DA2E86EF7312F65E279F7FAC579810000000049454E44AE42
              6082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F4000000097048597300000EC400000EC401952B0E1B0000010A494441545885
              ED973D6AC4301085DF983D43D22595AB0DDBE51006EB2A23FB24C6673118DF21
              5D482E902AE4107E69928D2C2CBC3F9609AC1E4C2146F63CDE7C8D84247E658C
              2100745D275B9C0100248F559625DD738CF267889B802B6BED1B80FD6C73591F
              59963D374DF3B57833E4545579AEC671A4AAB2EF7BAAEA675555774B8904E3B9
              C600C9A0097F05BB0B235E54511400703F0CC36B5DD787D03A26062674AE6BE2
              05C0E3DC8C55131011E4790E6BADDF7A087EB426032E0B6EFDFC6B3B06444EDF
              645406E61495814B3431608C61EC14FC19FF2B81C4406220319018480CDC2403
              B1DE05BEDEDBB67D9A6BEC80BF2793AB2D803C1AD852673110EB71EA4A48DED6
              0A7C7D03374F343A2A2A27640000000049454E44AE426082}
          end>
      end
      item
        Name = 'search'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              61000000097048597300000EC400000EC401952B0E1B0000009C49444154388D
              BD53410A0321108B65FB4A7D804F9A070C88AF107FE4DDA2BDD4D69511DD169A
              DB8449480655B5563418630E00B9CDCCAC5EFC6709B833F3A30D07CEC8582303
              503303000011C15ABBC5ABA1421D45125AB593C1AE783499560821C07BBFE445
              832B100D524AE2B2C42BADF5A5EECB04448418239C7353517F0BB14229E5FB04
              3D264F79DFE0E7047F33E82F76933ED1086BED5BF3049E3E4D3B0F2753F30000
              000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000097048597300000EC400000EC401952B0E1B00000165494441544889
              DD564B4EC3400C7D8FA6A5A2EA06169C2EBE40739CE402EEE958B0AA2A2194C6
              2C18A7D364A60CA84808AF2CFF9EFD9C9909CD0C39A9EB7A0000925455C63E11
              310BC9FBFDFE2E57A3CA56BF91703A81886C00BC00D84C837D0A11498D7D04F0
              ACAAC7D8389BC001C94F46DAB6C576BBBD281AA8A1AAE27038A0691AE4A8BE00
              109127000F00988CBE2E04F028226B557D1D8D31B288BC0575E52024B1582CD0
              F73D00BCBBDFCCB05C2E713A9DBC7B73BFAAAE931300B8B708912486618099C1
              CC8CE40A3853D4F73DCC0C241D6445E736033093AEEB7C07335F0065D81353CB
              9F014C3B48D9493274CE5C4C1620A2E822DEBB8D6218DBA63159805BCBEF9FE4
              BAAEF397D10DA402CEBC87E58DFA770AE56A54D362AE4757044AB02679F4CF3A
              394169F72579C54B4EBD072579598A4AA424EFEF50F453F9A7149999ED76BBF1
              C1B93641782BC6BCA669C6830680158021BE1063FD8B01FC9766D65F5CE303E0
              EBEF4B953EED810000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F4000000097048597300000EC400000EC401952B0E1B00000114494441545885
              ED973B0E83300C86FF5416B070470F8889898B700106DFB10B048974E0215A05
              125E4548FC4B204E9C0FDB518232C6C047CCDC025093AE5044746F0B00D4139B
              1191978F5FF25ABD935A785FB22D3B7545C0F2E553857D5BCFD89D91F089400D
              200280B22C414448D3145A6B4CC1822080D67A1CC3CC4B60AB004ED5E500D61A
              70E47DABACF530178131EF07CA5A0FAB526029C2DD632FAF8107E001B81C4019
              63C0CC7E67F2C112113544A0ED5BAF33FC000DEBF9A7A0280A1011F23C47D334
              AB579C9BEF0D10C73188084A6D3B22E6E66F2E4211F9F2B4B58E2EDF050FC003
              705F00668E45E43D3CFF1DE028DD0720CB3200705E46A3A8BB4C5755F5D59F24
              C93E805F877BC70D72FE9C9EAD0FC5ED6A2129CC77720000000049454E44AE42
              6082}
          end>
      end
      item
        Name = 'search_right'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              61000000097048597300000EC400000EC401952B0E1B0000011149444154388D
              95534B4E8440107D6D9CD18D2EF0041EC0B0D2CD2CBD416FABCEC0013C06AB3E
              4027840D0730318464E6008403CC0934286CC448B9192608F4C0BCA417EF5557
              75FD5A89083A30F391586B954BFB0711818880888488A4AA2A212299D3BBA3BA
              0CFA2F9DC2300B25228B9DA7825C0E8DC618A4698A388E17E9A300E76214A02C
              CBC98B2E5D11D15CFD57D6DAA623CCBC06B0B5D63E8D3230C620CB324451D497
              B7CCFC5C78FA0B00E069DC57BB3B67096DDB0EA547006F0F1FC96DE1E94F006A
              7FB379F783649D87FAC7D9C4A9ADABEBFA7AF3F2FA7DA08D1F24AB9353F08364
              AE3FEE0C16A25144F47B20177DCB5409CCBC2A3C7D9C481E6AA5FABF710EFD92
              F2502BE08C4D9C7206803FBA8A9C088253E48C0000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000097048597300000EC400000EC401952B0E1B0000021C494441544889
              B555316FDA5010FEAE60821A39950A2853F666AF874A9D9AFE00042BEFC64E28
              03BF20BF80A182A5E3632E62EC50BA551DF801C9DEA92A0C2D8A9412C365C0E7
              3C1B9BD0A67C937D77BEEFEE3BDF7B2422C882316605004444D65A727DCC2C12
              7D38180C9E64268850DCE6FC1F20B703663E04F003C0613A50BB60E6AC96AF01
              1C5B6BAFD38E44074A46B456A4D7EBC1F7FD44D2481AB2D6623E9FA3DD6E234F
              E604013357003C0540B9D1F92000CF99B96CAD9D251CCACECC3791ADA4244484
              42A180300C0160A17E1181E779582E975ABDA8DF5A5BCEEC00C08138BD121156
              AB1544042222445402EE250AC310220222529212A9B639041BE8F7FB3A830D5F
              444AD19C2867F84982AC0AD27622A2A872CA8BC92570244AC46BB54E0CB9B674
              4C2EC13E40C698FC9FF811D0C52CAA2C91B6F1F303DF9F00B8B1D64ED5608CF1
              88E8AB88BC74038BE90102890D460ED710C059D019DD775F6B627CF1E6C8F7FD
              3133073141BA831DAA078040443EBFF8F9D1BFAA35E76A3CBBF8F2FBFDBB5715
              009F62821D9221EBB8061000189F4E874797D5C62F44DB7FFEE1DBECA4745C89
              09B224FA07C2F265B5F147DFBF3F7B3D0B3A236FD2AD877F2D51427745B59115
              7A1B7446DEBEF7E0769F048B49B77E40AD562BBE7BDDA322B201D8D43C0D638C
              77556B2E5CDBA45B5F2F1A116952718F966D099979A97900BC757F5500389D0E
              7DA0BEAE74DB75B70BD243D7CA158F9AC143C901E00E2AF806EC970892860000
              000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F4000000097048597300000EC400000EC401952B0E1B000001D0494441545885
              C5972173C23018869FEC720553D4CCC4C47E041A8199E06E669E1850281C626A
              02C91F40E407ECA6101343A026F623262777B7DDEEA0BDA313E3B8908534A565
              BCA634F99A3C7CEFD724155996E193526A0D08A3A9A6B54E367D11B032FA32AD
              F59977404B32204678EE7D7D4112FB32E0F8E7A66A9BEB6A4F7F70267C195801
              7580E9748A94927EBF4F9224986051149124C9364629E5032B04F02F3A39C09F
              1AC8F1BEA8726BC19581ADF71528B716822C70146125B1C100C7940BA0AAF407
              8DE502585608B13C04E05F757200D1ED76FDDB61C5D25AEFAC3112586F7E17DA
              460FD0DAD5986BC16432414AC97038244DD3BCF04BE0436BFD6D36F67A3D91A6
              E90BD02C0C10C731524A84085A9D1F81766B34DBB5F5FC86ABF78718782E0C60
              CBF65029654ED604E657EF0F8DB78BDB4F33EEEDE2F66B03510E20405E08AC8D
              EE58AF611398CFEFAF1BEDBBA71D88D668962DC69D2D446900DB125B8B71A7D6
              1ACD76764513A214C09F622BF8EC62DC11275D095BA35956184029156BADBFAA
              823869064A5B6056B347915D84E6B3B90083C100C079BC524AC5C02740BDFE7B
              84582EB7478057A06DAF0536782E80316091B8A0C9C1F3695656AE57D465D951
              8A30747238620642F50384EAB9A69732DBFF0000000049454E44AE426082}
          end>
      end
      item
        Name = 'replace'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              61000000097048597300000EC400000EC401952B0E1B0000021A49444154388D
              75924D48545114C77F777CCE73624C8422EC730A5CB89A36151475A322867885
              54D24A0821F2BA9922A27904418B78829BA0E846B52A88888AC2B78920788505
              BACBC8459011E6660271462BB579B785EFC1646FCEE67EF03FBF73FEE75E618C
              4129B50EF806DCD65A1701A4EB2F0069A00A5C093CE73A092122403F700B98AE
              616DBAA36F18E9FA26F01C215DFF22700D680D3C676125C08AD693C023E094A0
              B61B18A9D3740253C062520796526A0D2081B3405E2CC346221B65A01D781E78
              8E490400DD80006E022930C781F30081E7AC95AEBF031895AEBF33F09CD124C0
              09E0BED6BA4F29D525E053CFB9A1D364BA624DBCF9D5A883FD1104ADF58452EA
              4373F8F32060A4EB1B6086E557184F02086312AD71E0D253BB96B2D3C05C23FF
              00625F69D800D9C073E61B899242BA7E736C01A0205DFF191046E7A6C0734200
              A5D465E00290D35A57A4EB7700F780C331600078021C0172C057A0264BC34DC1
              E0D110E801DA0D1480C7917611D80508618C41BA7E11F8EFAB6EADBCC965C2EA
              17E09541FC985AB57DB09A5E3F0E6C0B3C6712EA861879CA0363002D7F66DA36
              CF8DF55A2C1581BB064AD399FC99597BE3C3C0735AE222565DC1304EC698B697
              43BD957EF5EE18B005B82AC0B6C36A27604BD7DF1078CEF77F3A5819FD4AAD16
              50060E69ADDF2AA55EFF4E653F4EB6EE2918617D8E069BB212B301017B8159E0
              7D74F5221DCEF76597CADDD574C7036002A8FD059AB2C7FC7DCC6D1700000000
              49454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000097048597300000EC400000EC401952B0E1B00000462494441544889
              B5955D6C545510C77FE7B4DB2EBB7B6FB745511B8AB4F19152E4231A4D20F291
              5024202982ED6E212D84B6A49B185103C6471125BE95042BDA8AD9168C5DA4A5
              90283131A811F123141E780004BB494D09D0B277B7F6839EF181DD66BBD12E2F
              4C7293393393FFEFCC9C49AE121152D6D4D424C618E2F1F8B28E8E8EDF52F18A
              50446C8F0BAD35C6189452BD43F1B14D970F6DBE4F16CB4D398140608B6DDBA9
              6308D89E517B7B383ED66B7B5C2B45643D7015287D6880526A1780D61ADBB6B7
              A50304888D4C5CE96BA9AA0358B1AF77B4C872CF9F577F4CF5B7554BA6E87F02
              BC5EEF2AE06F63CC45A032180C3E1F0E87CF0328C0A4CDF2AE339AEFF7E6914D
              7C0A10080436F97C3E8030F0235009EC04CEA70AFDDEBC172B42913B46A4C8EF
              CD633831BE369BF8144029B5536B0D704D6B1D4BE6B6272108A0B59E14305A29
              B4D61459EE37806FB2019488D0D0D0203C10C1180380568A6BB7FE5972F6C4D1
              3F2A42113122E72E1FDABC02A0BCB92BEAF7E6CD8D8D4CACE86BA93A3763074D
              4D4DAB93FEEF8EE37C2A22393E9FEF251455855ED74E60777AB7493B0534010B
              80990140ADD61AC771DE0B87C32701366EDCD8595CFC54954BC6EA81DD021459
              EE9C85A18856B0B2C87237000C25C6BFCB3AA2C6C64631C6D0DADAAAD213C160
              70D0F2BAE75C35656F8F3DF6EC41CCC4B411DEBC153F146DAF096503E43A8EF3
              6E2C168B6626E28EB3C588AA54EEF153B1586CB65139855A293122FDC389F1AF
              A2ED3557B38943F2911FA995377749495DE76211E1517CB985BE7C44E4236025
              40495DA72BDA5E3331D3A50281C01EC771EEF6F4F4B467E64AEA3A9F29F2E5D7
              189162E0A65ABEF7D40560D98D41C7DDDF563D36AFFE5845E913D6C5A1F81897
              5AAA54A6403018DC60595637C0C0C080DDDDDDEDA47215A1C8177E5F7E6D7A7D
              EE707CEC75DBE3FAE9E9C7BDD781B9FD6DD57DE5CD5DF38B2CF7CD79F5C7A4BF
              AD7A1A44446A539B64595610389C14FFC0F6B86A8D31B7632313DB8CC81560A9
              1211CA9BBB0EF8BD797BB5D6DC7546DBFDDEBC5FB4D6AB81CD37061DD2218D0D
              0D223002781289C4857038FC1CC0F27DA745CC243F7CB861DA85A6B6A8221459
              2F10565000E0F7E54F15FD792B41F4B3ADAAA1B171A956FC0AEA7DE035C4941D
              FEB855AD7EEBF8BAF15CEBF4BDF8685B5F4BD58E69234A397D2D55BD803F755E
              188A9C29F4E557DE187488263B70E22341DB3B0B413E01125AA9FDF5BBF7ACC5
              BBB40CC0885CCA7CB3DCCC0040495DE73B654FDA9599E3B12D4F508C00448002
              14B864B45661CE264B3C5901F6D6A3EB4AE7F8F6678A07828162DBB2672BAD70
              1C6709806559E4C8D8ABEEC97B0747730BD14AAD050ECC08887DB9FD0C0F7E62
              D34DD806108BC5767574741C01080683DF5ADE596B0AC607C6EFE6974EDA9EBC
              E525759DAF44DB6B4ECE38A2FFB10080E33827D2621D825EE399BCB7C30CFDB5
              4AF9E77E3F7F8EEFEB8A50E462724D173F34C0B6ED058EE35CEFE9E9B9930E50
              5A7F9E70865FFE39DCF8E6A2E6E32F1458BE237E5FFE22601170FF5FE626172A
              A2F6BDC90000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F4000000097048597300000EC400000EC401952B0E1B00000474494441545885
              C5977F68565518C73FF7DD5EB777F6A6598688532415D3507757242223D91F95
              A87593CD427C9F04032368170C8CC8C2A084E88F430BB2C2E81425C9DAFD23C3
              02B5869169EC58094123FAA1A9693417366D9BDBE98F7BEEB8DEE69257720F1C
              CE7B9EE7FBDCE7FB3EF79CF33CD7B3D632965239A6D101ACB5C3A3542A55974A
              A529A552697C5A6FADA5AEA53D9F594FC862CA19D90CBC0EAC030C509FB11DF0
              C3E8CED47AD00FA38F800D4605BF979B80610222520DAC72CB3A1199A3B5EE4A
              61ABDCFC38701178C0E1DF04565E3501E05E6002F01330137810786E049F778C
              0A7AFC30DA017403CBCA0D9E25B0C6CD211001CD972190C874E2AC748D82F94F
              F1ACB588480D701A38ADB59E25221D4003B0406B7D14C00FA323C022E03DA01A
              68042A80FB8D0AF6954B20C9C00AE03AA0D5AD773902CDC0D18C4FA3C38E077A
              8169E5064F1348D2BF5144D603F9947E4BC667AEDB03CB8036E00D3F8C0E1815
              FC581601112902F70067814F52B60660B688D46BAD3BB38E46059FFA61D40E6C
              009600E511203E4A35C0DB5AEB471383883C096C23CE4227D682E70D3BFA6194
              03E6B9E51FE5044F0824E96FCBD8DA801780A6951BB66C667C5DA2DFE4879125
              CEDA1DC077C0DEAB21D0089C023E4B1BB4D63F88C821607185ED9B0FB60F3C80
              A71DA41B780B78CAA860A05C02DE9556C3FA96B69CF52A2639D2FD4605DDE506
              2D8BC0FF255E5D4BFBF3EEF76B4605C7AE35814A6013F1956A80B20888480EB8
              19E8D35A9FBD523F3F8C72954027F1395E057C90188A85FC6002ECD8B6C21BF9
              11C3F230B003E81791A95AEB4B8EA51F463381975C8C74FDF9BE1278D71178C8
              0FA3978D0A3A8D0A8600CF0FA313C0543F8C7A8C0A268E422039CAE380D5C47D
              45127C3EF109BB09F81CD803FC09CC063CAFAEA5BD1AF8D6294E012B8D0A3A53
              0F384D9CDE1EA3821BB2914564327012384E5CC6F76BAD1B9DAF071C0116029B
              8D0A5ECCFA7BD65AFC305A087410F70303C04EE043E0A451C1177E180D02B991
              4888C846E055E009E011E016A0566BFD9BAB17FB818346054B464A5D258051C1
              377E18DD05BC0FCC014A6EE087511A3FD10FA36EA38249295D3330447C735E0F
              3C03341157D6A50EB37BA4E0C3041C89AFFD305A00AC07D612F78485AC43B190
              1FCE80884C212E5A5F6AAD7F11915D8E4033D08AB5935CFDB86CCF7849536A54
              D0076C07B6BBF7576354D09BBC826221CFB90B0333522E4DC44DC9421139E574
              1658B266FD63B5B962C35F43DE3880C957442043C602BD7E180DA4824F372A38
              9E8235BBF963E2BD03301758941FFABBB97AE8DCE1F3B91B01EE232E6CFF9251
              AF6217BCD205AF352AF835B189482DF033D0A5B5BE35A55F0C1CB4F0D599AAD9
              4BCF14E675E1793380ADC056F7C746CF801F46E38A857C5FB1103746E72E0C4C
              332A38918135119F8C6C193F041CF3E0F6090327A77557CD5C77B1A2660FF02C
              B0DA0FA3BDC4ADDC2CC01B918051413FAEF68E22CB8977FFAEB4526B6D456427
              B0B96AA877F9E1D6B5AFB80F9A6DC0DDC06D0E3A08ECBBA6D5D00FA302504BBC
              514F18159C1FF3723CE65FC7FF0073DBD4BA9C9566690000000049454E44AE42
              6082}
          end>
      end
      item
        Name = 'column_one-import'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              61000000097048597300000EC400000EC401952B0E1B0000012249444154388D
              A593BD4EC34010843F3B4672D24177A51B4AAAD408A5022934886645ED9F324E
              C903A474ED9EE2242402054FC153A4CB23040A7B29C88F73F92330DDAD76E666
              47BB9EAAF21F04CD47922433203C82FF193885B02C4B7CDF3FC8ACEB9A2CCB42
              572000A2A2282CD00530C62022586B994EA7CBC6C1600080B7C8A03F1E2DC378
              BF7B3C03DE80CB030E5602AE486F1276801763CCCD2E071B025B9CB48127E0BE
              D9A3AAA82A59961134092EFAE3D1ECE12B3A11910B6BED79D3419EE700045EEB
              2771ADEAAD2222E2012D1159AB2F9CEF1DA13709DBC6986711B97533C8F39C34
              4DD717C999BF03BC02D77327FB1D383F9FCEC957BBF660381C9224C92A515525
              8EE356555591AA7EE82F10C7B1AE65F0975BD808F158B8B77034BE01979BC15B
              9AD26F070000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000097048597300000EC400000EC401952B0E1B0000014C494441544889
              D594B14AC4301CC6BF9696E220788A5DDC5CFB082278B3770E828F90582A2E19
              14DC3D9C328AF40904B943C5D1CD597C009F40415FA0B47F17AFE4CE9426D7DC
              E0078110C2F7CB97F0C523222C53816E9173FE012076E0FFA9050088F33CEFEC
              CE398F9B00CED40A90525A9B0A21CC01EAE645D4047801B00560BB6B021051D3
              F089E8863A88314633090693515D8AA7C30B0F40F69BE078D104DE7CD134101F
              C0B50D8488509625B22CFB0BD041A49456102104AAAA429AA6F0F6C797AD7F85
              92E416C09109640A302ADA6032A2A8B71AEFBC15AF2600AB1E00801F06D1B87F
              9AA08F7393FDAA5ADFC00F8368EF3D48003C0358373155DF6026C1F0FEAA4755
              F5AD9A3F0ECFACCCEB937B1E80B92B52CD5736D736EE76B3444A696D2E84A801
              DA1633C60E88E88488BE9C3659D1C374F26F7F53676A02149CF3D0817FA1ED81
              4B2DFD8A7E0040A220D1D912D75E0000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F4000000097048597300000EC400000EC401952B0E1B00000222494441545885
              D5974B6BD4501CC57F79CCD45AA17465FD005DBBB42EDC689DDA56C15D85324B
              EF0CB850022E0411E741D185D989122914BAA803B5BE1676447021884B5DF815
              84D29560CDCC649AB87032C42493993493D69E4D726F72EF393939F9E75EC971
              1C0E136AD4452184091C4B91BF21F572400891015A8661A4C62E84887420931A
              B30751022C7F87AEEB8909354D1B5840DFC1C3402C0147DA0137ECEED1B6EDF8
              0286E98024497D05D8C0A7CEF914309946067AD6011FC6804D5DD7734909DD87
              B06D9B62B118EEC0CCCA1D277B62B4DBDE6B59B7EAF9CA554DD35E0317938AF0
              A2A70373EBF7BF2A23D9D36EBB6D366FE6B6C79F016F8099FD12FA1D887C050B
              1BD51F922C9FF288B8B1B5545AED88B8B05F11F0F76B28140AFD33707973D900
              AE7B441473DBE36BC05BE07C5C62D70157803A5F2B0714488A8C24CBA113A8A3
              234FDF9FFC696D2D95AE001F80B37145FC339FA42AB10729D9CCCAE217E3FB99
              CFBF9EC41510A88472C62F40425664DA8D56B758F8D1369B0F6BD3E21BD354E3
              908761900CAC03D7DCB6B56B2ECFEE4C548017C07C5CC24006A26E5ED8A83ADE
              2C58BB66A99EAF3C005E0297E29287A1771D785E76BCAFA7FDBB71777667E251
              52F2811C98AB951DF578B6DBDE6B5AB7EBF9CAE3A4E4610815F06EF19E3F7D63
              C0AB61FE0B5C442D4A15E06367513A054C26250FE1880CA10C9CF3761CE91551
              2FFCD76BC2C0BEE0A01D08EC0BD24064293ED4BDE141215608D3C01FF2BEDE07
              034ABEFB0000000049454E44AE426082}
          end>
      end
      item
        Name = 'word_wrap'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              61000000017352474200AECE1CE90000000467414D410000B18F0BFC61050000
              00097048597300000EC300000EC301C76FA8640000001874455874536F667477
              617265007061696E742E6E657420342E312E338D24FD670000007B4944415438
              4FBD92D10980300C44FBE3224EE1B73FDDC3191C4C70C0D8A31C2DF50AA98A85
              47489ABBE423C1CC5E218BF3BA998313BDD2C0034C10E5A787EF0C628CE68142
              F2CF066C560C6FB0EC470A25776F90DE04310D9023BA37A0184054910F494D26
              AD09F39A5BA147D7404D266DB3421647787C89190B17489A9E655572E5170000
              000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000017352474200AECE1CE90000000467414D410000B18F0BFC61050000
              00097048597300000EC300000EC301C76FA8640000001874455874536F667477
              617265007061696E742E6E657420342E312E338D24FD67000000B94944415448
              4BC5D4D10AC2300C85E1DDE85B09BBDB23F95EBE606CC053BAF04B9799A1F041
              394BD394311733BB1486E4F17C59D2EAFBB019810653BE0F9BFDA2355E2F3DC0
              FDE7806DDBEC0CED1F95DDA0FDEE949FBE816A67CA6EE0C66694F590268E542B
              D43CE6BB07196AE2DABBB8B94FCEDF014D1CA9560D66BCB61F9041CDC0FEBF88
              268E54EBC666631E617854EA009A3852ED6876088695FA82268E549B8161A5BE
              A08923D5666058A92F68E223B4FF1B0CEBD8F2060F1E14A5E6F9376900000000
              49454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F4000000017352474200AECE1CE90000000467414D410000B18F0BFC61050000
              00097048597300000EC300000EC301C76FA8640000001874455874536F667477
              617265007061696E742E6E657420342E312E338D24FD67000001584944415458
              47CD96314EC430104523243802B7812A52100780868A03D0C211A0A4A4A5D98A
              065A28A0E010D4B0C516080AE8C0CC5A3B68B0FFCF06C736146F363BF1CC9FF8
              4B4E1AE7DC9F0293358149C6E6D1951BC164F7E4662FECF9E3CF32360E2F5D2A
              32C0ABFCDEED1C5F6F3F3CBDAC68CF48A48FE0895279145AED198994E0E0ECFE
              4244DF65073EE7C8F544EF458B4B307D7E5BDF3FBD3D37767CE8BD687149CC0E
              CC34172D2A091DA06DDBAD1C6853061DA0EB3A97036DCAA003D4E2FF0E80FC64
              68A12F6E9A35BD96C6DFA79EE642E800C84F86165A96899B7320BF05565C7664
              55B16B8A9C8473112BDE8708F6BF0B90D70C2D44427D88287F1B22AF19BE68B1
              CDA10863F1E4E3BF07105628BC370498FC2D6386F00179CD081B28A943F880BC
              66D8E21CC0644D60B2263E20AF196183B1F880BC66D8E21CC0644D60B2263E20
              AF53089B0FC107E4750AB6F15060B21EAEF9020BB98857304E1D430000000049
              454E44AE426082}
          end>
      end
      item
        Name = 'application-gear'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              61000000097048597300000EC400000EC401952B0E1B0000014549444154388D
              9D8FCF2B446114869FCB1D1B572959C9863FC082A488868564B636B3388DE5C8
              5AD7C27A8AB5DB94DD29293BF999DDD45850FE03A5506A7677FA94509F856F34
              66CC5CE3ADAF4E6FDFFB9CF778B3E17115E8A373BD940A99C04F0A970A1900E6
              364F7ECC402F800F16F05A02DCE7A6F95BF97CDEFE472E87DFD9D9CDEA04F004
              DC0343C0C85F01163807AAC02AF00A7401FB0E940858038A0022D2E38013AA9A
              8DA2C826016E80A28858A00C3C3B7F4744CAC096AA7AED00B5C036B051E7A7DD
              BB6DD7E00158C9E572A3C0B8F3AE8179E01298062A22D2ED0318631A018F4110
              BC0377354355A78C31A9200866DC594BC047AB06C3C6981430001C020B2272AA
              AACB227254D728EB85617811C7F1E22F9083288AB22272E6B6356A5755D73D6B
              6D8B125F7275F780316012B802DE80B4AA7A89803AD0205001FA5535AEF99FF4
              40A5AB668FB5320000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000097048597300000EC400000EC401952B0E1B000001C7494441544889
              ED96316B145110C77FB3AC0AFA10450982DFC01804D15641126C42C04FB0EFF6
              C0DDCAFAFC0469AE3FAED97BA2859D45B41321A5450A0D78A05805AEB0399117
              F1CE75C7E6563667D45BEF62E51F1EBC37333BBF79C3635851558E5272A3B5B5
              035C5D70DE37DB9BEBCB00E1112407B8546EC2BFCDB0BDB90EC0CDFB4F0F3DCF
              0D985521A88248DD0FA72B9D3EFF509AA6BA682549A2AA8AAAFE9316FD07B00F
              BC020A601938BB28C047E00C701DE84F6C4BC03BE0F43C806F40037804DC06FA
              D65A0570CE09700FD89A0770177818C7F1872CCB96AA0E6BED49E7DC83F178FC
              1C580590344DB5D3E9D4019C4F92E4F168345AFD43DCD8397722AC39AEBF001B
              DD6E77AD6CCBAF140481817A2DFA045C06F6ACB5C7AA0E11B923221445F1A4B4
              6559F6B52EA00FECC5717CA0721159EBF57A0340E238BE5514C50B80F2862180
              F77E1640608C39CCEEBDF70610E0A744922489B6DBED5900FBC01563CCFB6A85
              935BAC4C5AB45B89BFE89C1BD469D129E0ADF77EC318F3ACEA50D5DDE9C7E29C
              1B0048ABD57A3D1C0E5766847C064C9EE7833CCF2FFC2E3008829D2CCBAE51CE
              EDBAABD96CBE5455A2283A1745914ED67155A5D168F8324E16F1DB32352A0EE8
              3B535031D0621820210000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F4000000097048597300000EC400000EC401952B0E1B0000029A494441545885
              ED97C14B14511CC73FB33B136DD82910F2E049CA4375F00F3050E8D21649D421
              6D72121D1C168310DADD439DC483881031ECE68030586420618A11642074333A
              78AA4375892C82A25C5BB7997DAFC3EEEAB679301D7621FCC1C07BEFFB7DEFF7
              99F9CD7BC328524A6A194A6B7C7619385EE5BC6F1687A3CD006A0D92031C2935
              D4A0565C1C8E02703231B79DBE1238C0BFC5E67BA7B4C61FCB32A0AA012C0E9F
              29244D2412B2DA118FC7A594122965AD4AB0197B007B00B50210B506D888FF1A
              4000AF802CA0012DC0BEA216AA06C0203056D63F073CAA340509F013E807BE02
              A3C0939E9E9E59CFF3A2C047D7759B80356004F81E34C01A70B6AFAF6F4908D1
              E6384E0B90F33CAFB9A8375028C509D334DF03878306B86959D6F2FAFAFA0F00
              5DD7EF50B8CBA69241D7F511600E780BD0DBDB5B3F3E3EFE25288083C0B7B27E
              6C0BCF60F102404AD90A4C070570C3B6EDC9EEEEEE7621C4C236FC29C771A661
              F725F0812E601E581542242BF4194DD3EE7A9ED70F44CBC633A586AA280A994C
              861DC6725D5DDD946118AFF3F9FCD10AED816DDB5781D3C005CBB2EE031D456D
              50D7F58BA1506861B74FE0178094B23239AAAA8E01970007B8A269DAA8E7791D
              6596462184B15B800880A669F3B95CEE18D058127CDFEF046E01FB8119CFF346
              2A2787C3E1174A329994894462A70012B84E617BBDB32CCB053ACBF4DBAAAAA6
              7DDF378181B2F149D7752F03A84288E74343436D3B0450281CB7310A67FD4A85
              3EE0FBFEC05FB3E0E1C60241FD1B9AA6792A9BCD3EDDAE3F12891C48A7D3D9C0
              BE05A15068A9D45614E5BC94D2E0CFAD37057C02AE153D87800F813D0180582C
              562F8458B56D3B0BA0EB7A69F115D7751B004CD33CAD28CACB542AF519022CC1
              566118C6B37C3EDF1E0E87EF4D4C4C746DE5F90DDE81602A708961CD00000000
              49454E44AE426082}
          end>
      end
      item
        Name = 'debug_step_cursor'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              61000000017352474200AECE1CE90000000467414D410000B18F0BFC61050000
              00097048597300000EC300000EC301C76FA8640000001874455874536F667477
              617265007061696E742E6E657420342E312E338D24FD67000000724944415438
              4FDD8E410E803008047BF123DEBDFB032EBEA22FF487E89AD060D844D09B4D26
              255B3AD054F51334AC100211D12CE80F822A3434D8540F7AE8C70AA3D8D7EDBC
              EE8F6CAA073D38130A0898E489D6E74581098049D954CF253093DFC004194661
              9FB3840DDE42C30CBFD940DB015B72BE6DA1314ACA0000000049454E44AE4260
              82}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000017352474200AECE1CE90000000467414D410000B18F0BFC61050000
              00097048597300000EC300000EC301C76FA8640000001874455874536F667477
              617265007061696E742E6E657420342E312E338D24FD67000000984944415448
              4BEDCF410A80300C04C05EF4579E7BF5AD7E3036C2A2260BB56D3C080A23BAA4
              499A44E455348C44C3483454396719813EAE71341AD6B08D2DD4BAC3D16858C3
              36B650EB0E6FCB2A0AFFE599F1DD83867688C536B6507B3B589E496100866876
              AD6B71BCAE0D193B806D6CA1F6D10014F7A061AD39DBD842AD3BAC2236071744
              34AFDE20120D47FD376842C351DFBFC149D20E459548F9622FE4260000000049
              454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F4000000017352474200AECE1CE90000000467414D410000B18F0BFC61050000
              00097048597300000EC300000EC301C76FA8640000001874455874536F667477
              617265007061696E742E6E657420342E312E338D24FD67000000C94944415458
              47EDD2C10A83400C84612FED5BF526D8639FB52FB875859165F3B744D4E945E1
              131949B2901D4A297F85A113864E18F6C6717C1E4DBDC330324D53399A7A8761
              6E183A61B805ED3743F5A1E156B4DF0CD587866E183A61F87EBC8A289B9FBBBE
              5BB4DF0CD58786428720B4DF0CD58786F37393EC21F6585EEDA05FEAA1FA067B
              2D2F1AF64D5B5CD17E3354BFE9005A8D8A2BDA6F86EAD746A41DDEFF3B0A8695
              637885E1D9C3C31D704BDF01070C9D303CDB75075A183A6178B6EB0EB43074C2
              D0A70C1FACB1F09D7EF497B10000000049454E44AE426082}
          end>
      end
      item
        Name = 'debug_step_into1'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              61000000017352474200AECE1CE90000000467414D410000B18F0BFC61050000
              00097048597300000EC300000EC301C76FA8640000001874455874536F667477
              617265007061696E742E6E657420342E312E338D24FD670000007F4944415438
              4FCD92B10D80300C046958849E9E0DDC3005132231A0892DBD449C8718D18074
              8E62E2FB141954F5135EB6693E0ADAE33A0820284BFB3383977F0A444433DC0A
              B278E9095832F00351B02F6BB57FC20B04E51B6D3581813D4B0610540F0982CC
              4D68330EB364D00C1B9964409B11960CE8C01B68D360692DA22762B79B2FDC3A
              C2160000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000017352474200AECE1CE90000000467414D410000B18F0BFC61050000
              00097048597300000EC300000EC301C76FA8640000001874455874536F667477
              617265007061696E742E6E657420342E312E338D24FD67000000C24944415448
              4BC594C10EC2300C437781BF42DAAD57BE951F0C5D244F2175D3861551E9F910
              C58E2FDB26223F45E5F578EE15C96043225458C0081B12A1628CBB5FB88A4AB6
              550695BF1E28A5C837C0AF121DA8EFCEE6B3A8440718ACB107BB2AEC40F6680F
              955E586FCE1A7BB0FB1154D1EFA0BEDB81999F862C2A36280226D6D8835D1C98
              FA17C194810E412F9C35F660F73431AE340774781085B3C61EEC36E6D5D0E108
              D6D883DDC6BC1A3A1CC11A7BB0DB9857438716D66E06F89BC0B5C8F606A17508
              75C6D40D650000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F4000000017352474200AECE1CE90000000467414D410000B18F0BFC61050000
              00097048597300000EC300000EC301C76FA8640000001874455874536F667477
              617265007061696E742E6E657420342E312E338D24FD67000001624944415458
              47ED96B14EC3400C862B247804DE06A648414CB0C0C2C4001B52F73E0D4B2716
              586180A10FC1C08490608201B672B5916C59CDEFCB25971C4222D2A75A8EFDFB
              6F5C5D3A0921FC2A30599246E2EEF8FCE466F7704E84BEAC6BC6D0E0FDF169E3
              F6E86CFF7AE7E081443EE833F4453453D0808656C4B37C8B1C4433050DA8714E
              EEBF198ABF1617B32B5B38161AD0D0A53CC2FBD3E9E5E7CBEBB62D1C0B0DC8C0
              9B3C015B30361AFC29035555ED0D016BA9681703755D8721602D15FDFF0DA418
              A07B8DD38EAE2D8919B46B8F9F7E69B40662E700326141BBF6E07A6D2403D193
              90AE4DA1CD441734A0A18D77811D14834D59D12E6890FB36141DB46B0FAE5703
              82FD3F8006216435DC8F76EDC1F50D0329D8E1EBF7BA029331861CCEC0A447CA
              70B46B0FAE872239A05D7B703D1429094C9604267340BBF6E07A289203DAB507
              D7439192C0644960B20DB4CF3EB0161CD006DA671F580B0E284798AC002FAA70
              FF31A492F50000000049454E44AE426082}
          end>
      end
      item
        Name = 'debug_step_over1'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              61000000017352474200AECE1CE90000000467414D410000B18F0BFC61050000
              00097048597300000EC300000EC301C76FA8640000001874455874536F667477
              617265007061696E742E6E657420342E312E338D24FD67000000754944415438
              4FDD93BB0D80300C44D3B0083D3D1BA4618A4C88C480477C928B203B5C4343A4
              7791F3794E9302A0B475BB3A88B0FD190CE56006E31341AD150AA94085F12688
              3A3B3CF0D31744DD2252810AE32938F763A867305CD0C762B3090CAF6730BA60
              F84C2E505E122EAA978D7051BD0CA0DC3A6CAA20AF26E6EF0000000049454E44
              AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000017352474200AECE1CE90000000467414D410000B18F0BFC61050000
              00097048597300000EC300000EC301C76FA8640000001874455874536F667477
              617265007061696E742E6E657420342E312E338D24FD67000000A64944415448
              4BED95310AC3300C45BDA4B72A64F3DAB3E682AAF44120C28F6CC72E5D62786F
              10D2973DB9884839DE9F5D9116D63B0AC4C21871B0172884ECE78659A0991BB6
              80B205B556B983CF43D9023D2F56EF05CA1630D88DCF782F34BA6004E87901C3
              7BA1E7051950B680DDAE079F87FEF282554BA1ABB0154B200F52F01FE8D98C50
              D7320F6801C5A08C38D80BA4C3BFFD93AF980D3768D1990D3768D158112E22E5
              0B10B02052440A26210000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F4000000017352474200AECE1CE90000000467414D410000B18F0BFC61050000
              00097048597300000EC300000EC301C76FA8640000001874455874536F667477
              617265007061696E742E6E657420342E312E338D24FD67000001504944415458
              47ED97B14E0241108689893C826FA3D52567A8B4D1C68A023A127B9F8686CA46
              5B2CB4E0212CA80809565A48A7E30CC9FC99C0ECE19C8B170D977CB93FCBEE3F
              FFDE6E8EBD161135CA46C3C365FFEAFEE47CC45084759FEF02F1FA3C3D185FF4
              3A77C7674F6CF8C6778AA03E5120B868C1CC744651D4270A049B8C78269F02EB
              E56470736B3BEE0A0899853ECEC7EEF5F07DBE38B21D7705840DA06DBF014424
              405114A739102F987280172EBEDA03DA96A22C4BCA8178C13412202710FF2680
              B7D629A43F06E60AE0AD750AE98F81FB3DF0E7F7005F8772F7D63AC56A9C1AEC
              F7402480B79E75102F98460278EB5907F1822907F8E0E28DFE1D371E60EB1268
              401B92AFB6EA3A40D8005547322FC44F80E00095875279D12839434070D18D63
              B92D548584B2A611201AFF3051ECA79957C823CB1388608BAFFF16C56DAC2267
              71C16D4C91BB3811B5BE0022A5A20F844A680F0000000049454E44AE426082}
          end>
      end
      item
        Name = 'debug_breakpoint1'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              61000000017352474200AECE1CE90000000467414D410000B18F0BFC61050000
              00097048597300000EC300000EC301C76FA8640000001874455874536F667477
              617265007061696E742E6E657420342E312E338D24FD67000000704944415438
              4F63187CC0DDDDFD3FB118AA8586009BADC818AA8C42B0C9364003880F03F17F
              28AD019522CE05489A61F83058825880A6198C81C2AC20396CB62263901A9001
              C7D10C380E14061B4014006A008501CC10104D5A18D01460B315194395511960
              B30917866AA10430300000981FA44527D51F0D0000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000017352474200AECE1CE90000000467414D410000B18F0BFC61050000
              00097048597300000EC300000EC301C76FA8640000001874455874536F667477
              617265007061696E742E6E657420342E312E338D24FD67000000AF4944415448
              4BED923D0E83301843731846AED0396B6F8A548EC6C048FD2986226306C8D054
              EA939E84C032E627FDB94DCE79A991358DE216AB8C368A5BAC32FAE1F5787670
              80338DE38E97EB882238C1458C73879BB8C52AA30594C45A2D5F1D18BB0F4AE2
              95B8F270666CC32D56192D448994EE3DDCE0322819A574EFC8D8865BAC325A40
              490FCF3E72CF581D5104E349D6DF348E6DB95BAC32DA286EB1CA68A3B8C52AA3
              5FC4ADBA226B7E9E94DEB6843B205CC08E6A0000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F4000000017352474200AECE1CE90000000467414D410000B18F0BFC61050000
              00097048597300000EC300000EC301C76FA8640000001874455874536F667477
              617265007061696E742E6E657420342E312E338D24FD67000000E64944415458
              47ED94C10983501044BD043CD8526E8239A6246FF6931652420AB014B31B4794
              EF1806570981FFE021CAEE1FE3408ACC5F50D7F5ED6871B446D334C3D1E2E84C
              1CD6AF22D6E3B07E15B19E89C3FA55C4FACCE37A2FCDD6ECCD0157BF2F314261
              FD2A627DC443CCA7E9C1A9FEFCEB4B84B100FFA52C7CB2C5E83958C0F4D9B7EC
              31BA82F5AB88F51112B812A3CE05D70FAC5F45AC8F58C0EE2F700816D02581A9
              1D46CFC1022AF3B5085CEACF2B8CAE60FD2A627DC6434CFF12CBFF01BFDF0C77
              58BF8A58CFC461FD2A623D0EEB5711EB190DD661541CADC13A8C8AA333BFA628
              DEDA0CE4E7D10145C20000000049454E44AE426082}
          end>
      end
      item
        Name = 'tools'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              61000000097048597300000EC400000EC401952B0E1B0000018149444154388D
              95D0B16A1B411006E07F061506553179002B8DA3B83029248453E405F2026E5C
              A64FB5BB42272204B73B4D5E20854B3F81FB084220369840085202B148AD42ED
              995B6E5CE48E1CCAC94AFE6A1976BF991D52550080883C5EAFD72B2202802580
              73EFFD143B4215000049923CC9F3FC67894055C1CC7B699ADE6D05C6E3717732
              99CC6B4827CFF3DB3A1242A0AD80314655F550447E54C5E170D8298AE29688A0
              AA68B7DB8324493E37012D2202117D37C67445640100699A2E9D737FBA10F500
              3403D58199E7D6DA6E0861E19CD3FAA518E3D76D5F6801B800705A769AD73B97
              356459F614C0AC7107AA0A6BAD564BDB96A2282622F2B611188D46CF638C379B
              9D1B90F722F2FA2FA0CA743A4D88E828C638CBB2EC8C88069B88AA5E86105E35
              029B31C67C63E6670DC87508A1BF1328912FCC7CDC80FC0A211CEC044AE48A99
              7B00E0BD270070CEA9AA7E6A3DFCF47744A46F8CF9C8CC2F6AE515119DFCD304
              B5493E30F34B00050006F0E8BF0000B0D6BE23A23700F6BDF7EB7BAF8EB8E91E
              526F3A0000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000097048597300000EC400000EC401952B0E1B0000021E494441544889
              AD94BF6B544110C73F7B130C91888D8A8556828A1810B1B05210FC072CEDED6D
              B2BC2D826033B8FF42B0B6B2492D8A550A3B358501AB08165A4842B8E831FB2C
              6EF7B29147EEDDC56FB5CCCC7B9F9D5FEBDAB6A596F7FE1770564430B35D6053
              44D655F53573C8FD0B585D5D3DED9CDBCF0000CA59441EAAEA9B13018A4208DD
              0E78AEAACF4E0C00F0DEB730C9C04444725697638CDFFA00164208AD992DC718
              F73BFC032075D83780DB7D00AE699A92C2A2AAFEE90AEA2A97AABA3E8005A034
              F377086149550FBA027393B171B0F4F9F90400948F86DEFBA5186327641E2D00
              7B2272A6184464586752CA2322C5DFFBF605F0D2CC9E02F5940C4308C0D1D254
              FEDE726DDB96714C2232C8351E8888CB3F9BD833C0068381A49488314E6D74E9
              C13AF0A4B227C63DE9BC6E4AC9000921B4D3A669B26821842DE0C6B41B75E938
              C8914D6E9AC6A7945EC0E1FB539DEB1216BB5431A75475742CA0686D6D6D05B8
              E59CDB1B8D461B6DDBDE77CEBDED91CC0555FD3115D025EFFD3D11796F660928
              A32B25A32A9B9518E3E79901002184BB66B69901A90390184FE003557D373320
              43EE001F7A843E56D557330300BCF72BC0C7EA6D2A19EC00FB22723D9B1FCD05
              C890AB22F2A59AA29FAA7A1E2084F0C9CC6EC2E1A2CDAC18E376D3345744E46B
              362D56EEE5FC64EDCE9D4191F7FE12B093CB35645CA27366468CD19D18902117
              45E47BBD9865BBFF0B00A0699A65E7DC1670A0AAD78AFD2F79BA46B7C3FA44EB
              0000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F4000000097048597300000EC400000EC401952B0E1B00000388494441545885
              B597CF6F1B5510C7BFB36BE2B654A62028A8A180CA89034248543DE11370A8C0
              F90750291C0B124228F65B4724B22D7B67C107841471ABE89F50975E7AF4851F
              E554096E804AA990A88A4442A36076DF9743EC64BDD9DDD84E32D21EFCE6BDF9
              7EDECC7BB36B2189B819638E89C883D16FDFF7058768120768B7DB67D6D7D77F
              16D9D124F98F881CCF02595959B91486E1EB00CE4651342F222039705DF7A6E3
              38CD56AB75636280911963988000803F54F5547CDEF2F2F2776118CE5B6BE701
              20650D00FCA2AACF4F059006310C7A4F554FA6CDAFD56A8B8EE37C9AE6237947
              559F4905A856AB378220786312089228168B2F351A8D5B1910A71CC7B93B0D84
              18634812AA9A5AE33804498848EEC134C61C15918D349FB5F64E100463100560
              AB76C618A641B8AEFB4E144557461022F25B96F8D05233305C7B3A3956883953
              21ACB5CFC5CB2022E98766C71ECD018031E6DDB9B9B9D3CD66B339069003D188
              FBADB55F6709789E5700B008E063004F65405C1E0C0630C63454550A242F8AC8
              57490800AB22F27E3200C9D7B20048FE37CCD605005D92274731931B1D025348
              A65EB93C23F940558FC7C7526ECC07AEEB76DBEDF65163CC1511B9901267AB04
              8542E1D9300C6F4F0A21220F1B633654F5588638547515C02A00B8AE7B3B8AA2
              5D8D4A5565BB112D2D2DBD1045D14F296279998854B5006CA5331E383EAFD3E9
              94D6D6D6FE8E5FE7D19C5D9DB0D56ABD1D86E19B227202407F7373F388887C92
              9791515FC8BACA231B9EAD31C0CC569CB4D10EF782C8B36EB75BB2D66E54ABD5
              706A80BD20F2BA699E4D057018101303D4EBDED39D8EFFFB41434C0E60164929
              6CD7FAA0207201CAB5ABDF86F2D0B9C7F057E745F9B14E10023950884C80B2E9
              51C40140FC8B224EE0FE7B2FE3D6653084AF9F6D07DE2F442A40D95C4BB46662
              1347F024EF7ED4D38B9F27E7EF076217C0CECE7785C2802EBED1F3A9C1668518
              0328D77A57C5712A99816C74A91F2C7C99E59F05621B606F71FB7D3FA89CCBF2
              CF0A21245136BD3F459C27B217DAB5BE561ED94B7C160879B5D6CBFD16A0B5F7
              FB41E5F149C5B3207CDF17CFF36E027865EC6D58AEF5EE4124558036F2FBC142
              7D5AF12444FC45E5791E49A2542A9DADD7EB3F0C4B90BC76006DF4453F58F870
              56F13408CFF3AE03386FAD6510040E103F843108D2FEDAD7CA99FD8A2721B662
              33FB7BA06CAE1100FAFAD681FF231EA67E5D554B630E92634FD9BB5E4C8E1DE6
              F33F04409E21C92E70440000000049454E44AE426082}
          end>
      end
      item
        Name = 'using_namespace-add'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              61000000097048597300000EC400000EC401952B0E1B000001AE49444154388D
              8D93BD6E13411485BFB1771F80A080108EF829200822041285430BA5AB64672C
              D93C006504AD2BD796255E00C9F2143B946E5320A1C80DD021910251D88A0822
              202AC8DAF2A5C8EC6AECC4C06D76EEB9F79C73E767958800608CB92A221DE01E
              702D8EE3CBD6DA038066B37929CBB203E033F04E29F5344DD36F00113E44E435
              70053806DE97CBE52CAF954AA563A5D45B11B90D6C8BC83AB03127E0C9008F9D
              736F029C5EAFF71D78608CD914913DE04E5E0B054E8028FABD8805B55F93C964
              1E3BA34F2D13504A65C04760FD6F024BA3DFEF7FD05ADF056ECD0968AD2B81CB
              3824D5D27605D801AA006C6D0C816ED19F24C927E0BACF9D73CE04E404E8006B
              0BC38C806703D37A15015F02819505E7823C302DF68FC63CDF7D89C73AB5B43D
              8C9C730FB5D6178043E051A3D1B868AD3DF4632F3A87B106EC447EEEAF5A6B00
              4464D58B5573E73C6E9EAF14792D6D0354FF798DFB47E3829CAFC3384B40FC77
              0854FD9E0BE73CCF7B4E094CA7D3737ED90512969FC308E8AAFC6FD45A8F800A
              F0131838E79EFCCF351602F57AFDC66C367B01DC0756E3385EB1D6FE38F5904E
              B6D61D98D618E00F6BF6A212A6E5DB760000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000097048597300000EC400000EC401952B0E1B000002C4494441544889
              C5964D884D6118C77FEF9C734F12DD22C9573E76A36CC64A2336B2B1BBCDDCF7
              98EB16C94AA4E42A852189292559C8661673EEED9E13372B1B3B0C2242695850
              220B917C2C8C7BCEFB58CCBDE375E6DC9921E55FA7CEF3BEFFE7FF3FEFF37E1D
              2522D828168BFD403FB00E5802E43DCFCB054110DBBC72B9EC8E8F8F3781CFC0
              3BE031301C45D10D9BE7DA81D6FA307086A9980B7CC96803C8B79E6E60BBD6BA
              2F0CC3AB990622B2D70A1F29A5065DD7FD1E04415A9C9191912FA552696B9224
              738C3183404F4BE338906D00AC68BF28A5768561F834633493A856AB37007CDF
              7F6D8C79D26A5E6773D206BF3A5CF7C374E2361CC7F9688CC9D699262F3B2303
              4A29E9D4379DC13FC17F3598758980C40E0606069C5AAD9600A8F646D35AAF16
              91576D521445EA0F0C28168B93F3A0945A1B86E118805B2A9596C771BC484486
              2DFEAC5790858FC0420011B9AAB5DEE138CE07B7D96CBE4911AF2BA576FDA9BA
              526A95881C022A40B7883C8CE338730E5688481E783F93A86E0C79C03E60137A
              BD52302AB75FAEE1EDA7C3C07E402911C1F7FDF9C69806B0A595FB2D8AA2F933
              88EF012E025EAAAB091C54D1A34BF57ABDE902D4EBF5AFBEEFEF36C6BC6E91E6
              CD42FC723BEEEBEEC588A1F1FC2E400EB820C51E0738AFECE3DA5E09B95C6E71
              B55A9D52A65659BEDA5F1E162AC426A174ED9C4D8D81FC74FBA0AB43FB3EA696
              250B2E50F99B9DBC1926CAD2DFDDFB4BADCB212C5400089FDDA2F1E22EC0C6BF
              31E834B22CA88E0622D249E80EB0EDCAD82857C646818E730070BFA34192240B
              98B86BD3380F9C60E6833201CEA657D11B60792BBCA7943AE638CE78AD56BB69
              67EAC6500538DB8E53CBB48D1361A132F89B81D6FAA8889C4C7F8AE779F9F4BD
              AC1B434780938093A21BE07458A81C05EB34B546B19389DF96B5C03220E7799E
              170441D3E695CBE5AE1F3D4B97B272E1016043ABF901702A2C54260FCB9FD054
              13FB986FD6370000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F4000000097048597300000EC400000EC401952B0E1B0000032A494441545885
              CD974F8C14451487BFEA9EB00872412EC6441238B142028A7F0E48A2100E7861
              27D9EAEDDE0B110EBA7B41E34EE2C178F00498A86477E100D799EE72594834F1
              6034247021C0B291B0C4039E3D104D4C4CC074D7F3400FA999E9D9EE8141FC9D
              BA5ED7ABDFD7D555AFBA9588F02C552B0A465154CBB26C46440E003B8017003C
              CFFB368E63BDDA801313138BD6DAB1BC790F58564A7D9724C9A94A005114AD4B
              D3F4EF3EE3DBD5CC73B953BA09D82F22FBB5D6C78D31CF9502586BBF2818F4AE
              52EA9EEFFBD7CADC7DDFBF0ABC64ADDD046C756EAD0D82603A499239B7BFEA5E
              034110DC1291ED4E689F31E6E732E32269ADDF057E7242978D317BDD3E3D3320
              222E358F6BDECED5BA63C9ECEAEE53B4087BDED310F57C150057E95302A90CF0
              D4F5BF0750CF1A201B824706F89500A228EA7EE23F8600F0270F2B22006118AE
              69B55AFF1402A4697AB82BF9972775574ADD129177DAED2CCB8E00A71F018461
              F8B688BC69ADDD06BCEF267B9E373B048039170098D75ABFEE79DE6DA5D40D35
              3E3EDE04C2AEBC1F80CF8C31379E1400406BFD06F03970B0EBD6C51AC50B641B
              300A0C0500F81530C0CB807BCEF82A8AA2CD22B225CBB25111E99872A5D4D124
              49CE0DE2142C9E780D980376022379F8017093D44ECBC2D21E20ADD56A779452
              BF759C864110BC2722DF3BE35D32C6B8EFAFCC7C1EF880FEF543805349BD71AC
              1DE8398EB5D66EE07763CC8B15CD67816937D63CF409BEE7115E3889EDF4F92A
              A9373E86F242B4B1A2F94E60AA4ADF5CC782C51367937A63A50CA06F05EBD23C
              83956D059C01F6960154FD647E7500F3B676C3F04EC31180D6D80C9EEA9D88D6
              D8CCA3EBCC5AA28B5F02AC1D26C063AB0CA02AE0036024BC70B223B8CA2E00B8
              DFCFE03EF9F40CA09BC05B03E65C2F04504ADD159157DA6DADF51E63CC9592C1
              3E0496A8BE13848705AB10E0471700B8ACB55EC97F4CCE379BCD9E5FACA4DE58
              CEAB6047214A6D862DDE485F27F5C60A1454C2288A36A469FA575196E779268E
              E3A0DF63E5D5708AD54BF13749BDF1513BD00300303939B93ECBB24F45E48088
              8C02EB738085388EC7FB0100040BC777E3A9597A0FA325602AA93796DDFE8500
              FFA5FE05EEEE2A46662C84940000000049454E44AE426082}
          end>
      end
      item
        Name = 'window-add'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              61000000097048597300000EC400000EC401952B0E1B0000012B49444154388D
              9D92B14BC34014C67F8108823A3929ED6C9D9DB2E83F6026091945703932953A
              B86490804E257F828B4BE878AB8B5316C1351D9CECDA451041385E974B88D1B3
              B6DF74EF3BBEEF7BEFDE79C7D7FA1DD861357C3CDD9D6E03F86B8801B6EA830F
              02786B785828A5C41823AB402925228288E0FF33A7EAD483D608E079CE112AE0
              027801BE2CB7011C7E3370E001380F8B6C1FB80502CB979CECE5CB0C5EADF80C
              1803FDD65D004461918D749C4E5C069736B911EB38653A9F71F5788FE5C66191
              95BF1954C03370D349EEA20F0C5D1D7CDA56D171DA9007BBBDA60E8B0C2058BA
              C6E97CD688EB731B2E834DA004023B73935CD716A56F8C2149923639008EECAA
              22DCEFF006E49E8838DB0F8B2CE2E71A6BF148C7E9E44F036BD20386B43F12E4
              3A4E67000B1C9D8CAC43BF51780000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000097048597300000EC400000EC401952B0E1B0000018F494441544889
              EDD23D68936114C5F15FD25874D4D1B1839076D241944875AA830A125A22B828
              D22493500A512A1DD4A034D2C5AD75750996507072F2A3968A220E7E443B3876
              92EA5A68DEC72149D52CED1B8D8378C6730FE77F799E9B18BEFAF0350EF9F3FA
              F0F4F6E9A1548FCA6110523D2ADFD2DF00844022D133423E9F0FBD50A1500821
              847FE30FFE037A0BD8C012DE226008C7B1FB77010173ABEB6BE5E927F7CF6118
              093C9E3C72F6E2E1FD07AEE072B78080F15CAD92C467F4FF343B33FB62F12626
              F772A15BC05CAB7CBE6D8CA633A210A97D5C815DB8FB756460A21BC0C6EAFA5A
              B9B5F996C6D2199B51A30D68EB4EAE56998F0B78D67AF3FE6D93CDE54B7101EF
              34AFC4683A632C9DF9D196EC53CD9640F5FD92DAA715381617102119239F880B
              18C4739C5AA82F5BA82F836AB664336A38BF38DB997F19177062FCE0C94BF7DE
              3CBA6EFB0369602605C56271A7803D983032700D336DF3417D5914A2CE6CB99A
              2D7D4B8410765AFE8B72B5CA146EA0AF6314E156355B9A86AE012DC83E4CE168
              CB7AA5B9F99776E63B5960CEA79B7D45DB0000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F4000000097048597300000EC400000EC401952B0E1B000001BE494441545885
              ED973D2F435118C77FB72597CD77682206120943256260B0085A4391781968BD
              0C081ADF40722BDE89A18B85746935268BC464D0784D2406DFC1E8AA7B8EE116
              5794681CBD89F43F9D739E73F2FCF29CE7392F9A94123755E6AA77406B5938BC
              06EA8AECF7EE64B1A306EC0814DB3940F56BC3AD2DD05C06784FFC32BBA37D3D
              F7AF150E876531258490399F4829DD2FC3124009A004F02F01AE8038700CDC63
              1FB33EA00D18056AFF0AE011981D482F9F3D59CF1BC012A0E76C2670A17BCB87
              763BA79B0143358009748492460FB0C9E7CB4507FCA695CDF4A662EB55D0A51A
              6036943402C0B87370AF7B0EAFC7435F2A86B09F7E1A30F5D0EE13C0912A809B
              C1F4CA29B051C09AE950D2882782D15B150071D3CAE60BFB77D2801DA04505C0
              318EA42A408DA0660BEEC965FB7E601E8FF63910FB81F9B7B62504FD074B0015
              AA007E2515003EEC32D4FB52B10F863C55E0D4A32A8056E002F017B82EA30A60
              44F7960F9B5636C3CF2B4102636F009148E437007595D064B6FBB68149A7E159
              5808F2FE3D5713C1E82D80A6F2731A4A1A9BC0045F4742026B896074E6754029
              400EA201D802EAF978199D03138960F4D2395F3940A17A01DE50F662A557E27B
              0000000049454E44AE426082}
          end>
      end
      item
        Name = 'certificate-add'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              61000000097048597300000EC400000EC401952B0E1B000001D949444154388D
              8D92CF6B135110C73F8BD9E08F88DA1052CA063C457B508B9EF654A117411657
              252CE8A128FE03A5F622AC208B15849A9B78112F5E96223DAC0721B908C25EA4
              82084D08C692049B4BB60449BA8D0BEBA1BB8F989ADA39CDCC7BDFCFBC9937D2
              F5774FCBC01C87B78FEF6F3DBA1A070909E69E5FBE7968F5D2FADAEC709C889D
              E9B3D3FF156F6C6EECCB0940A954A256AB21CB32FD7E9F7C3E4FBBDD2693C9E0
              791EB22C33A3CE8C07F47A3DBADD2E8AA210040183C100CFF348A552F8BE5F19
              F72A01D0751D5DD747CF2BC03DE00B30885A90FF09087E75D9B25F1306BF992C
              DC2799CEBC05E635DB9A02960115400257B3ADA26398ADBF008D97CFD8FE5406
              C06FFCF89E5F7E35AFD9D66D6005C80D15558182665B8B8E61AE0A80FFB3296E
              F85BCD07516521760C936AA7C5C3F21BA2DC8A665BAE0064F5BB6CBE780C50C9
              DEB8F399DDFA9391CAA396031604403E9326999924716A8223274EEEB0BBD7B3
              639842712EAD8858B32D005500761A752666AF91CC4ED1AF57E1F45EBEDA6909
              71EC0F9B00742E5C22DCEE201D3B0EB9DC51BE7D700135EA59548EE3C8DC4408
              5F97D6D72E0E25CF03572428028503E6D0048A521886E38684665B05F67F632C
              5E740C73F5404004518005A245025C402CD21F9D1EA9419BB676210000000049
              454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000097048597300000EC400000EC401952B0E1B000003C9494441544889
              AD955F4C5B6518C67FDF39C02C942EA28810524210908D0B97C0FCC3A05C9ACD
              9950A925F142A3C16597B2A48B3333D1FD3163D190ED42E506351AA842594C0C
              F1C630A05BACBBD8C5089BC38505DA6D9481D22048E879BD28A73B2DA54EE393
              9C9CEF7BCF77DEE7799FF37DEF5122C2CB818F460DA4454400504A29D99C9863
              6B6C9B352BBAD2AE7CEF7EB7150B72000CA4B9B7F90D452A548671B635059D63
              7D2FA43D4F10FC5F504AE56624D050492565C565FF3A71241A01C06A610A019B
              A546E7A35CBA7889D9D9594A4B4B89C562C4E371344DA3BCBC1CC330585E5EC6
              E170108BC5D0759D582C46C3730D143F518C522ADDC22481006A2238C1A1370F
              D1D5D5C5EAEA2A15151528A5181919C1EBF5D2D7D7477F7F3F3D3D3D28A5686C
              6C646E6E8E89E0046D6D6D592B00A0A6BA86E1E1611C0E07B5B5B51414142022
              389D4E5C2E17D3D3D30C0C0C505252422412C16EB7A394A2A6BA667BFF448483
              43A7253C1F96F07C5844440CC3485E2222F1783C63DC1C9BEF1E183A252282F5
              4AB1C8241C1C1CCCFE552D686F6FB78ACD6E91098FC783E5D02122C9BB89F4F9
              7648D9452696AF8658F975129BB3929D8DCD285D4F26B522C33CFB2E02087F79
              5EEE0D7D956C0345AE1755E59113A2342D53AB5803C6816B241CDA95B5026331
              CABD0BDF28AB9AA5B11F29DEDFAE0A77EFB12A14E0B39B4B774E1E1FFDBA0368
              01945DE58E7A03DD8FF8DDBEB58C15AC47EF8A6C6C6C6964EB77C3C2EE3D664C
              80CE8EE1B33A700BC8B3083E089CF006BA8FF8DDBEF35602006CCE2AF47C3BC6
              EACA83A0AE935F93A87C727292858585CF3F5D0CE940AFB9A4BDAE09430C02D7
              2F03E402E7BC816EDDEFF6F5A45824B67CE53C7C94994FDE4FDA51D6D189ADBC
              5201D4D7D7AF07AF5F3DC522B7ACC23C754D6C187193C0C4596FA0BB77CB47D6
              6DF902A89D7B5BE48FD018689A1210052A140A5D3C3737DA9166CB76C8017C5B
              CEC1FDD111546E1ECEC347B9717B9AFB3FFDC093AFBCCE6F3333D86CB66B80CB
              B4C553D7F4209BA6E377FB00F04F8E13B87119605F8A45DAFA5FEC2829538E67
              F692F778897AAC753FEBD13BFC797B5AD96C85545555093747B487506F42A558
              64E4ED407BC9C3DA950922D1084B4FD7094F55ABBCC2420022D1C82E60023830
              381564702A9850ECF6B161C479EDC2C7E904A19C44F6D4235FD4B00F80472BAA
              D34F66EBABD5CFBEF5EDCD9F3FE09FFF8671E04C0E80428DBD3DFE852BBDFF58
              C79B771BF08E5DE5BE079C31337D3715C410239DE0A4DFEDFB5D3D4CC3CA046F
              A0FB18F021A0A73D3280D37EB7EF38C07F26D82429028E01CF6F867E21A17CC1
              5CF337AA60DB67BCDABDF50000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F4000000097048597300000EC400000EC401952B0E1B0000042A494441545885
              C5965D689B6514C77FEF9BBC49FA41B14DA11D63A56596A1AD24A96D75653AB0
              4E8A545C23D876501876146905EB4703F64210C18B746C6A6B915145142C4148
              5476B1A10E6B4B86ACF483D2622EFAE54A968B38535762D2BC795F2FD27649F3
              B164ABFABF7A73CEC3737EE7E439E7790455550168757E7005780E103878A9C0
              95CBD6C1E7F73BB471DFA72E3D75561045F1C0A32B8A22F44C7E712A952F1E00
              5114D1881AA24AF4C0826B444D46BF76BF21AA442937961F1880EF0F5F6E00FF
              A2529EAD8C00914884F9F9F99C23994C2624497A70004992A8AFAFCF192017A5
              05989A9A22140AB1BEBE4E6D6D2D6EB79BEAEA6A3C1E0F3535352C2C2C505959
              494949093A9D0E5996F1FBFDACADAD515A5A8AC964A2AEAEEEFE01E6E6E6E8EA
              EAC2ED76535555C5D2D2126D6D6DF8FD7E7C3E1F3E9F8FC2C242BC5E2FDDDDDD
              8C8C8C2008026565650483416459CEAA0242DC208A8E9D7C4504283796130C06
              595C5C4492240C0603C5C5C54892C4F6F676C206797979ACAEAE52565686A228
              68341A42A110814000B3D9BCD705E7263E572E5B07937A326D05F2F3F3696868
              C82A0BB3D99CD5BA54FA2FDB3077804824C2ECEC6CCE9B5A2C96546D983B8024
              49343636E60C9046292F997B566057D9542297CCB30288DFEC002B9116E0A0EE
              E179600CB8062C131BC14781E67B01280F081102DEEAFAEEC28DEDA83C0C9C07
              F43BBE7001DAD976A7FD1787D536970E20499B33D7D9F8EC2261EFEF143E6AA1
              A2F71D0C872B522D0D03ADED4EFB4BC008C9178F1E7812986977DA3F76586DFD
              BB8EB493307C6B83C5BE97512377279FFED0116A46BF41D02671BFD6EEB43F02
              F4C51BBF3EFD361A51A4D33584B2136747171D56DB9B192B10F87522213840F8
              D64D82CBBF5170AC36F63B1CC6E5722D7CAFBB791D184EB7570AF5B73BED630E
              AB6D292D80A8D3A7B40B7176BD5E4F4747C798CB694F55F64C12804F81A7D302
              149F7816EFF825E4C0ED3D5B616D1D79950F27AC5355F51A60CF21F8AEEA21C3
              5FA02D7A88C35D7DAC0FBF8FA837A084431CE9194010EE26BAB2B282C7E35966
              E7B48FB70D200AC985186F1BD8FB8E2A0A67BE3D0F60C80800B0796312440D15
              7D83AC5D789780FB27F2ABAA01505595E5E5658C46236C649D7572A2E91CF29D
              4DEE2C4C5364798292932D78BF1AE5F6E40F1CEAEC0141E0EAD5AB3435355154
              5474948D9FC380BED33594B047862E80D8DCC800B0F51795FDEFA184FF461045
              8CCD2F50F4F871E4CD3F918A8DB4B4B4EC2E7D069825D6E7B9683A258046D4C4
              5E313A09AA8F01B1B7BDD8F2225BC0961281C4B7FE399D467B763B2A4F937D27
              A8C0AB49008AA2E49804008F0D9D3873FCF5892F47D9378864258A4252E9013E
              74586D4B9038097FD40A6233294E71160A03AD7A45380DF492BE122AF091C36A
              7B63D7B007B003A1BB9FE8719B470BD05A804F00337197113003F4EEBF8C1200
              FE0FFD035F917A3C6D6F87E60000000049454E44AE426082}
          end>
      end
      item
        Name = 'folder_open-export'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              61000000097048597300000EC400000EC401952B0E1B0000018949444154388D
              A593318813411885BFD99DCD9155D45C4840EC14446C2C6C54AEB2309143F088
              D8A4916B62234240DD25F6537957598413ACAEDB3BB8E24EB1B946482AAB2B2C
              95E304152B7345CCEE8C859B651D6222E4C114FFCFFBDFFFDE30238C31CC0311
              04C117E0ACD537C023A5D4CBFF11F897850110CC12992630C6017007384C6B0F
              6802AF95525ACEB208EC2BA53EAD35A26C517BEB9E08C3500064020557DF3F5F
              1EED9C5AD008910D9BF4E03AD24D749C00AC3522A3B694C847F875A13C2C2D5F
              3EDE940E77D3E1F54ABDDBB6EDD84E5207E6C3B9D3712C1D6A39EEFB3C390703
              88B19804900EBDEAC9E42A50CC135DE102A0D1E4DE8BC8732480EFE9DE9962B2
              646DBAFE385A1156CF8EE04880929FF48B9E695ADC27DFDFB66E019F81D5CD57
              B5A136FA673E3F800473F4F0E98BC36F6F5A3726E4BD02EC56EADD1F7AE3EFCB
              CBF274C267D1ED4B83CEC5EAE8E30401803ED000BEA6B507DCACD4BB7B00D22F
              E8FEA29F4CDA3EC635E0C8EA3D07FE089C28E86DBF601E4C11B01103EFB208F3
              7EE7DFADEB8CDC5D65F41C0000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000097048597300000EC400000EC401952B0E1B00000279494441544889
              D5964F48147114C73F6F6676757357B760F716DEC4A2A0C2436878A843DAA570
              2FFD31E820B9608728A815828EBB6059D125A528C2B4C37608A98E41452A98D8
              A97F1729E820285266B9EABC0ECD8CA3ECEA6EE1A17779BFDF7BC3FBBEF7FDCE
              EF3723AACA469AB5A1D50149A5520F54F5188088883A23B96B1111A03F9D4E9F
              F85B005D5D743580E307FE064452A954B122D8C0C352414A99C0CBB9790055FD
              202233AABA005822B2535593994CA60FFE5DE49E4C2693F4073A3B3B77894812
              580670BB29B45EED7D3675EFE40B737A6E72D10DC4A9AB9CAC19BDE1EE2D674C
              87166E8583F6C568C85E2CB714110511509FFFA385BA50A7D28D4B807427B20A
              A0E8B7F8C7BAB0D7A44F83D9787869CBC1DAD91DB18AA5372262E4D16002A88D
              37F7CEE7E3AB3B919D07820086181567B32D733E8A74F8DCA5AEC5CF83C94611
              310A5034116BEA9977BB5DCB6CB57F5C4B3CAAF228320D860082A636E47B7B1C
              BFB05E61BF29FACE9B2068DA43AFEE9F316B62EC2D24AE88444B0110649B3B41
              6E53D01EAD0AD9D5A05B552934C19EC967A7CFB7B671C0770EC6E3CDBD53B0A6
              067CAA2CB3A7C241BB799DA60CA0CB6B101E0309A7B8A74BA87C2192687D9E83
              16E71CC048FB85ABFAF5497B7D89E7E0EED3FE56A66F2F178F447E458F1C7DD9
              166BEABD0ECE3908983A0C6019349478555C3E74BC2F2422879D544044EEA8EA
              B8FB9C056828A023A3031DD1EACD6C2FF1FBB31B18C813BFE907988994D9EF2B
              CBECFD80E967A1088A7043BED44F1119F300041DEB485DC97D196CDF07FE6BA3
              E8DB1411C14D89C8DB5853CF770FC03418060898D4174DCCDAF6DABFB12C43BB
              010C59D9997F5D02453920BB22FFDFFF55FC067E5E5A4C65E9539B0000000049
              454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F4000000097048597300000EC400000EC401952B0E1B00000291494441545885
              ED974B6813411CC67FB38F446352ADEDB641F0667DD493A08814A42AD65CA442
              7B910A5204A3105AA82039795D10CD411009B697962298142F8A3D89DA07F6A2
              074F5A0B5210D456AD6231A6D91D0F7DB0499334291B7AB01F2CCBCEFC67BEDF
              CE7EFB12524A3652DA86BA6F0200221A8DF6011D80778D5A097C029A4DD39C72
              13E02FE02963CC04D0649AA6E506800628658E390A5C036EBA0120A2D1E80295
              CDC273D3344F14EAACA4F15B600E508B15550AE0AE699A91520A2B05F0BDFFE2
              A83EFBFB73DAD9D833D42E720B5765C0A3DA971B6AD37D86DF12BA5A7CF98A48
              0299939D7764AC2D99F5ACCF85C801903FF7D7A56B5AF6CD27348573C02AE23C
              FA084CE6694F011123149F2E069105A008F9A465EFFCD5C6607ABA04E365F303
              46289E5AABB010445606BC9A7C61F833C74B3407983442F154EEE4A528D69694
              3D43ED220BA0CA6BBD0C786567B993AD57B1B6A47402CCD76EB35E7B34D95BEE
              44AAC89F551B9B62DF1B8A50D41500817C15ACCAF815416319DE076786C381EE
              647CCDB0E65E264DD13D5D89567B054057E5489DDF3A4679EF865DC0FB99E170
              BEBBE0077069B0F7CC375BDA768EB9DE9568CD8023847EAF3DB27D8B7DAA0CF3
              65059736A7E680D346283E6BDF5F75E66A57A27505681960A1C6674D78357963
              1D00F9D4FD78F0FCDCAFDE47D2990F55D194C8C3B3D9408B3BF92618C8A45585
              232E0154770E347FA084079906A0298CD507AC4380CF2580D8CC70F802F067E9
              F881118ADF2B08E0D3EDD11D5BAD2697CC6131C8871DC7B70A156A80ACF65963
              3E5D76B808E09404C68B00C8A92BD76F7FF9FA34ECE60A38F5CE08C5670B0228
              8267E303913D0D06F51502182BD6A9E98AECD9E9B37603B340ADCBE629A0BF58
              81D8FC37FCAF018410FC03F1DED21EC88207260000000049454E44AE426082}
          end>
      end
      item
        Name = 'ro16'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000010000000100803000000282D0F
              5300000090504C54450000000C0C0C2828283A3A3A0505050808080909095353
              532A2A2A6868686A6A6A4B4B4B5050505555556262625E5E5E07070742424243
              43433D3D3D2A2A2A6666665858587373738080804343431717175F5F5F989898
              A2A2A20D0D0D4C4C4CBCBCBCCACACAD3D3D31F1F1FB1B1B1868686E8E8E8F6F6
              F63030303535358B8B8BC3C3C3DFDFDF3434346B6B6B7A7A7A4E42E285000000
              1374524E5300CF47CF2FCF5F14B3947F2F8FBFBFEFEF9FAFF4008560000000C8
              4944415478DA2D8F5972C230104407486213B62433DA37DBB2BC02B9FFED905C
              F4DFABAE7E550D25D5F17AE397F309DEF9662C592782FAAD363E32378CC3BD5B
              251EAAAD5FC7C26DD32F739DF7CC8EF7B5E99DB38BE4B4CF83A135C23083A894
              996AB8A6D1B65D6A7A9C8D142AC2CD0E4DD7CADECD13170C3570577CC6D98902
              E30F0D1751FCDC2E448A07F270E6EB53A4E722296240BD83932AFE2405459AC9
              7F01FC21F27F2958A0A8FD6779764096990724FFF3B17DAD6952F8A0DC172ED9
              D7516BBFCB7B801703C81622F1F7B8B50000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180803000000D7A9CD
              CA00000090504C54456767673838380B0B0B1E1E1E2626264646465B5B5B5D5D
              5D6767676969694E4E4E6565654747473838384141415353531919192D2D2D13
              1313000000F2F2F2E6E6E6DFDFDFD9D9D9D2D2D2CACACAC3C3C3BCBCBCB3B3B3
              ABABABA2A2A29595958989898282827979797171716262625D5D5D5757574F4F
              4F4949494545453F3F3F3939392D2D2D2222221818180C0C0CE4A5BBD4000000
              1474524E53FEF8E2CAE9CDC7ADB4DB8D7744260D1C548399007EC64E54000001
              704944415478DA458FDD4E1B311085CF99B1BD3429659B55A5F60E916CD5346A
              DEFF3D82225522B42A854ABD0441F6C73FC40E8219CD8CF59D63CBC306257C48
              3E812AA42DC0943E86D02D889CD736B98C7492EDC3FE7C16BDF7013AABFF6777
              A93E74F3B10B0449B5AEC53F01D864FFC57E04780C3DB1DB338560ECF7174F6F
              9CA91F570F3DD8748FF3A7914A12C7825672E7D58DE7BE93E9DFCFCE96CC2DE8
              AD4AE8D0E19DC31525418C0A819F585A4EBFC47B331D0656A6E7CD0ADC47D299
              AD78064A1A8FCF2F4080DC257E978488D081C48EB91FC66E015090BD91E4EF79
              E16877AD0820AF0B7C2D16906D9E144353B86844E6C867722302A37672AB3625
              BE5C9103AC85D7ACFEB8D549E54100A04AD6A3A1A5FB469814482610855F4E8C
              4D57ED01C421FFBF8D19139B0FAA13C5DD27F43EF3EC4022310415A0AAB774BF
              0E7C410A21C44DB060038CF2B00442A414655307832200BDBB5F8240AECBD368
              336B4A9CBDFFA83FD6EBB5CCEAD3237906212F855E9E9DDE330000000049454E
              44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D494844520000002000000020080300000044A48A
              C60000008D504C54454949493E3E3E1212120707070E0E0E2C2C2C4747475959
              595F5F5F6565655757575959596767673F3F3F3030300F0F0F202020000000F8
              F8F8EBEBEBDFDFDFD7D7D7CFCFCFC6C6C6BEBEBEB3B3B3A9A9A99F9F9F989898
              9191918787877B7B7B7070706969696464645E5E5E5757575050504444443A3A
              3A3636363030302929292222221A1A1A1111110A0A0A4A8B341F000000127452
              4E53FEFEE3CFBFC2CBAFBFA4755A3F142F6392009CA39C85000001D749444154
              78DA6DD0D16ED3301886E1F7B3DDA54D5BA48A83D169DA01AC29DAEEFF4E8636
              C8102B1C7001546D9AC40ED86A0C08AC5FB2E5E793FDDBAC7E8FE5A29C4DA745
              395FFEB1E91847E7D70852ED9C1D619C7DBB5676DA96B2F82B70BA44A8EF072F
              59BB83AAEE0B470E346F10ED7110885E97932974C3CC026E74BF1F482E41BF2F
              A8F8B470A015E9FCD391ECB1987CDBF279EA62C0BFFE8F4BB614DF858116F97F
              9D7082AB1E47B7167B70539133206A2A8745AB664D7BA09823A8A18A82103433
              F4D5F46B744425A1EB3CEFDEFA90FCC9FBA7E0857101F583266A0F92A3F172D1
              75D3E8461FEF399841F4C20E8D04D12037738BBC192080BA21F79F5D83B83303
              0AA83926AF2367970087D0580E2F943DAD0C90236623040892D70863903D3B5F
              860864AF0446C29EDD6CFBD1496EE1D11898A0C97C6674213F3AD16B8316CEED
              5AAE4359B3695E36E9ADD9B746048383E9A4A652B96D2386E83CFF722B1EACC3
              52B153FAFF1B84E4ADE03EDC49B0442B4ED735D143935CE6C280527D788583E2
              858AE04320B9E89EDF0B2C3007031420935DAA374F012BD859D00AF03FB6C2B7
              C3D9637F26BAE11CC01F6F11F196E8D6448E9E03F4F60A0422F737B79003E990
              0AB23F2C0DE4C018D1C1DF21785C049B777F02AB15ABB14409D3660000000049
              454E44AE426082}
          end>
      end
      item
        Name = 'money'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              61000000097048597300000EC400000EC401952B0E1B0000026049444154388D
              A5914D48945114869FFB7D77E69B1C7F46136D34D3CCB155E2A8442D2C42C9D0
              4A5A448B9228DB482ECA100A5AEA420A2517D90F910A112D5C0829C428861061
              511849541068A6468C8E363639E337735B0C638E0B379ED5E570DEE79EF3BE42
              29C5564A0238BBEADF3A0C7B59286C12308371039AD00088A8C85A2FC5B023A2
              CF5109E030EC6556DDC249D77EDACACFC501026610A514768B6DAD57D2D38C55
              4A34210E49003312E680B390AB253571E2E697BDF47F7B834050955B4C67653D
              0097DDC7681DEB23332105A194C2D955AFE61A1EC58987A73ED238FC90545B22
              008BC13FDC3A5C474D7ED9DA4C517753D48375B5047C007CCFBF7FB6AEEA092E
              BF290A92A422411A0C4D4DC401845251803FA2011CC173224729AD422873B543
              5AAD1D59FA3B6F767A977B2C7D205352BC3101154BE1FDDE40C5F4DD5D239184
              6CD0A24B0940083027DEDD9C3E55DB90E5E15265EEBED2F500110304BD4BAE9D
              471FB038D11309076611C2A2940AE9423AC8AC6D01FFC8F5AABC9C1735F9A5A5
              000B2B7E6E8C3EC1222D51C06430FCC3E169C45674414B4E3B0D9A40488360C0
              C7AFE16BE4651B9D8FAB5F9D89FD7C7FDCC3EBD9AF245A6DD114E607ABEBB627
              670C11F2964FCD2D3FD3354958ADE24CD3DBE749EE2B982EB89D6CFA0EC600DB
              A481A14B805131D9B55B69B61D44341D20A8696210F086E66752F6541F1FC075
              A777A379713EFCFED2AFFC9F9EC66E47A99026A483D4B226EC4B9E79DCADE99B
              01A4D773057BF1C5FFB7EB062B7F17F839D4447E86BA27DCAD9BE9A31E307EF6
              FCF28CAF5B43105126894E7B3B49AE160ADB7C9BAAD7005BA87FA19BDBB60B6E
              7CC50000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000097048597300000EC400000EC401952B0E1B000003FD494441544889
              DD945D4C1C5514C7FFE7DC99FD2E1F2D160445AD2174A5048889AD4AA129D59A
              E883FA606AA205636982C6F0666A4C3446A3894D343E5413033646AB3EA93192
              A8B4D896345ADB2622A1225064F95AEC82C0D2FD6276EEF16177A094A092D817
              CFCBCCBD3339FFFF39BF732F8908AE6718D735FBFF47A0A1E3F5A9C568AC1000
              04403495C8BEAD3708396E2F6879A3DF00805CB7BF30696A0120C9B4C5BF34BD
              A5013000E7F96F43EFFEEC65F618A60640CCBC75A9455A04497B119505B766D6
              5A2FFB220211E1D8C553F8E6F71E08047B4AB7A1A9B261C5BFCC8C8A8252F44E
              8FC0A35C60204D2282873BDF166F4A507F53050E56DD07A6D5A69F3BDE8EDEE9
              10BC860B0090B42DDC9E5788B6BDCFAC2C4134DEEFE9C4A9F13ECCA5E2198186
              8E37E4C4832FC06989CE5862009A99F9EB4B1770F8DC97F01B6E30F392E39895
              424BF55EEC0BD63A7B9A99975ABBF3D317D32BA6486B8DCC773011019429E5D8
              C05928E55EE19488E0355CF862E82CF6056B4144700EED5579568D29034812F3
              8F049CD60347CF1173F2A067CC33699AC177667DBB3D1A7705A0378A08980891
              F83CFEEE32C80A8803E930060EBD4A13A19742E1995AC3E57B8A80409038B10D
              32F490E9E9CB2DCA6FA919DFF240BE2CBEE75502B11944028040D98AD9B1BF2C
              4000F0ACEEA82B9F8817449532E1F66FBADA48BE0D2A4E88AE8B4D465ACEE8E1
              93BF95DD7377EB00FD50ECCB01402B1868AD1D16190132BD909FDEEC8A96341E
              51835F4112735ABB0204560256806D13D229889D84983E49DFB17F57A535BC10
              B317F168D976A77AA7C5AB2B50A4307279C8BDC117415EDD6BA2C4A278A8CBB6
              AEFCA144A740CA6FBBF26F81BBA41ECA97A7162EBC8BA43D89E0C61D786CEBBD
              101164996801F868EF09DD35D64701D39B11F093C6FDB1B29CF3B1D313916F5B
              4A4CDF66F8838F1881CDD55A4C1FC88A2B6B214C73675E81351F02B317D69D3B
              E31F573467083A9489D07ABC1D3D9111780D170CA53202E369E383C19AF03050
              B52537F2E78189A9CB07A23D9FD410A71910D86902B3020CCF5069595527CA77
              B4A2A029BC347ACB1DE1DEE95104DC1EA60C57834404F8F9C9B6F1C1F8D3CC0A
              60EE06A4BDB0B8B48F99E320A54142DAB2BCB64AF9BAA520D2DC97ECF7210126
              82CEBAE7EC39C8F5F821DA994AEAA7EEB627B87AFB1E3BFAEBE790C505A10C5C
              081862A781740AB01310D38F40F071E473F836543E3FB2F6E45F730EA627873D
              8B33171DB88887BAD26BC18D9E3F425ACD9AEBB95E494430FA61FDAC909D9785
              0BD377A30397AC8530C52F75C09A0F01E44169E3F7F4CF69AF1100009CDC7F68
              6C32DC2442E5CC3600C04E67012A73F4E6A24DDF61D747CDEB49BE52C089A976
              2FACC40D20CD1016981B6650D47865BD89D716F88FE32F5926CEBE57C3E1BC00
              00000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F4000000097048597300000EC400000EC401952B0E1B0000060D494441545885
              ED977D6C56D51DC73FE79CFBDCE7795AFA067D45FA28449059466C71558853D6
              B044C06DC6351B8B4EB684A1C90433B5DB14B24CB784B8B899252E46651B9448
              C220D9A681E8AC24103B2288F24E33287450FAC2530BB47DFABCDC7BEE6F7F40
              DF5B606419FFF8FDEF9E7BCEF97ECFEFF73DDFDCAB44849B09E7A6B27F21E00B
              01C305C4DE78E2D3FC7076E5C073C67AA4ADFF3F23D24A911D8A8C1E6E181490
              1FCEAE2C88640390B61E3FB87321DF9FF30069EB8DBBA142113206A334005602
              3C6B11C65E6BAD14BE1FF0F03B2F93E34687BF5A346E0B527E863B8B631465E5
              5DF5543BCF1CE668FC2C001545E5D4C4BE3CE15C6B2D19DF475C41A106874708
              487869D27E869AD85C1EBCEDAE0937FBA4FD244FED5C4FC24B931FCE4229CD9B
              873F203B14E6B59A15DC5D76FB9835C61896CDBE8F6D27F690E346D1EAB20835
              9084B7AFFFB1D42F5E452CB7906939851392EF6B3FC1A3DB7F4F9E1BE5DEA977
              B0667E2D11EDB0A671331FB53691B63E9B96ACE22B6533C75DFFD6A10FA83FBA
              8BDE4C92BC7096454410116E7BE34969EBFD5CAE85AA8DCFC9A3EFBE2A2222ED
              7DDD124F5C928EC445E949F58B88C8D7B7BE28F3EAEBAEB9CFA5549F546E7CD6
              1F6C41BF283C3DE8D283C0312009085008546E6CDA1FEBCC78BC754F2D207CE9
              8FAB69F8CE2F51C0F2F75F63DD7D8F51965D40577F0FDB9AF6503B7BFE8495EC
              C9248161D7707D796665EC685D13A9CEFBC9F85F45A41A28003CA00BA5F62C8F
              467EB1646641FB91739BCB29FAE92B1B973E953F259A436F26493293E1F9DD9B
              C80D671136213EEE3C71550103700032EF7D6BC33DFDC1E3ADCDA20405EAF2B9
              4DC8603D0B8A12A04249E2BBC6F433A7E37457DFF9BDB5EDB1175E7A7052C102
              D71473F2477F60FBA94FF855E336B45674A77AAF497E59C0E15FAFEEE838B7DC
              71F351CA04CA4494369A0002AD949190B21A3436205036109B32C9FE7861A8E4
              1B0D7775BCBD687FFED30D213C5EFCE716DE7DE405B4689EFFE86D264772AE4F
              40EF99FDE5C54BFF8CD77990746FABA45B3E14DB7F0144E36B05816075100426
              1737EF16C2A5F370A7DD6FE5628B09376F0D7AC412D1862357F2201272F0029F
              F925E3DF823102943369D7F91D2B9F8B9455E3165598AC85EBD0D129180CD626
              312662408104788933A4E3C7E8D9F7AA49B51F66EEB7D7A89EC2E9E8004E3FF1
              3AC7BACEB2B6710B594E9847AED1FF8104BD9C03C7572FEE3B7CE4CDDE943FCD
              0F92886F11A340454105E0A5AEC875D0A16C5CD7F95B4955751DA7FFB59608BB
              243CE3DC5F7CA7FC99E3DE2BB992CADFB46415774F900300DDA904672E75B2E2
              1FAFDBC1202AFED3CF76BE3733F393994EA62C849E11217D2B8A29F822181347
              D10C1C6A6BED2896407E17583B0BAD40406B212241D7E4E2FC65BB2A7EFBD2C2
              E2B2051391AFDDBD99BF367F4CD471C90E4586A2B8547B5F5B7936E740B7CF85
              535591BA96BDDBBEE7B8F9EDA28CC644F2B4D12502B98E3158253846CB803155
              903689FE786120950D0B7BB72FA27845C378E48DADC779E7D43E0AA3B9431E18
              3E215B0B9ED171E207AA4A1EDA58EE9F3F589EEE6D25DDF22192B82088B6BE56
              8640ACD501A38DE95F3865FCF83EDB56D687B6A911E4AE7138DEDD4AD4098FB0
              C2A0808BE9C46740658FCA9A95D0392F77ED5849746A356E5105578CA90CC65C
              CD98B6E3087BE73E107BACBE8E2C3DB602AE71089B10493F3330D430E88111F8
              ACAE9074F79CB633ADF57E2A552E41127C1FC633A671407C428E6A9C5AF3780D
              D39ECE8CDD70628C68C1B94D0B36889BB75CC4805228DCADA5D363DF0C857491
              12351BFC1928958B4F8071E2284E2289BF33BFFEF3FF867438862A7070EDCF5B
              3EDDB1CE0D4F469409B89C88CA4A80466145DA355CC2069702AC5641A6C0F69F
              2F8D4E7F685271792C8F594FF6DC8880A10A741DBBB578E906ECF943631231D0
              CAA8404A450765A38C27FE8566E4E201475D85E4FA2AB07B796D4B73D3D6AC5B
              EEC52DAAC02DAD1A9D888C365EEA6C23A9B6034C7FF89910A53FBCA12FD89126
              DCBD6C71EBBF4F6FB1D6E42019B076C87804E05F319E364070C3C69B58C070EC
              7F761E5EB29A207907E217E2298B1B69C3091F25147D9FCADFC46F94F4FA04FC
              9F70D3FF8CFE0386BD1254D78BE3D20000000049454E44AE426082}
          end>
      end
      item
        Name = 'is16'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000010000000100803000000282D0F
              530000008A504C544564BAEA0060A2004C860F3F5F002A46001A3009263C031D
              2D032338081D2C00070D0000000042820F69BC3998D8177FD51E8FD5A4BBC56C
              8FA03C6375FDFEFFF6FCFFF0F8FCE8F2F6D8EFFADAE7EDC6E8F9B3E0F7A5DAF5
              8BD0F37AC1E96CC2EF54B8ED31ACEB1FA0E40998E00486D60182C70C79B11788
              DE4B9CC269A7C591B2C2B2CBD7337DA243687BE3F83E030000001474524E53FD
              F8FEFCFBB6926C581E0B0050648CAEF1F9FCB2CF05021F000000B24944415478
              DA5DC8C14AC3501445D17DCF7D89851449B458C58903FBFF9F238A0307CE4A11
              510C24B9EFD98476D2754667D35C48CC726590C30071E47DDB76B7DBFE1CBC7D
              9CA6C8F9F92F96A09B1C5394D998E7E01F25B3D895C06B7B58871687EBA88704
              110EC858EDA522183E93BB4B75E714C4D5B0931FA7ACE2A07C6FEF9A4BFADE6F
              3793798A78AA12E9EB37DDBD8CBDD9AA1B9969F36AB84C1ADCB02A1FDE966FD6
              9458F343010933AC81C28901FFBD1F429F3CA8676A0000000049454E44AE4260
              82}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180803000000D7A9CD
              CA00000090504C5445000000298DD974909E0E3F60062035010D17001C330007
              0C02101C03131F17314141687C4F6C7A097BD556849E1A5E9755B0E21B609502
              1626003E7F00468D003B72FCFEFFCDE5F0EDF6FB0B97E0DFEFF755B8ED036EAD
              038ACF20A3E6002D49AADCF668BFEE9BD5F378C7F036AEEB8BD0F2B9E0F3057D
              BE045C954F91B29FC8DC94AEBB3AA3E53382A96EABC96EA7C21906F55F000000
              1674524E5300D3E6FD3D4FDC091B2CB0FDD4FBEA4CF99E6B88D7E6A193393C00
              0001334944415478DA8D90DB7283201445A36204D4F1D216100D2A788F26FFFF
              77E5186BDBE94BD7E35AC33E335CFE012608E1BF3AC91C204B825F1A3969DBB6
              E55AC4D53BFA9192D4F45A6B537650F2E0F48ED103E7832DAA18A70FFF28C429
              F52085E44DDF76C5AD9A3CF22A6F6BDB70C1843C03DD4310DB20C5F9629CBC2B
              8292C4ABE196E3C66DDBC29012588A573D34166DDA4E292D2DAEBF87B431A6EF
              7BD3964AF582595E611ED2AE043A55A4CB228F1064C35228D57576C65EAEE6AF
              805CF9188B1DF00F29B88010645CCED57803C671E64CDC43CE2374219160F7A9
              02B6E722ACF7C221CAB15D624C2CF3363F173BC1A4EBD561E8E3E0425CC14EE4
              DDABEBFA9A5B7FC1941F16D65F7EFFC300455C80E5A0C1FBE0A1604AA328A2F4
              0AD09C60F0472288604C7CDF471807D69FE5E4DB7E021814263B6EFB4AE50000
              000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D494844520000002000000020080300000044A48A
              C600000090504C54450000000319290023450251840020382D99E30576D50513
              1F06141D01101A053D69011B30082B3D375A6C13364B207EC9004F9E0F70C703
              25393595D8001422368ABA005CBFFEFFFFF7FDFF7BC8EF01304C0795E13CAFEB
              62BEEE03639CB6E1F70280C2028CD31CA4E9EDFAFFA0D8F551B4EBC5DEE9D7ED
              F7C9EAF9E3F5FD90D1F3006FB355839987ABBBAFCDDA6496ADF089B519000000
              1774524E5300503AFDFDFDFE061120FE85CAFCE761B487AFC363D7EC13567034
              000001C74944415478DA9593E90E9B30100603398C9300B95496CB84000673E5
              FDDFAEDF020D4AD556EAFC416846EBC5129BFF4608F10FE9F8FEF5EADB7F491C
              FFBE07F1E1F0E3F28746F8FB2A4DD3AA4A9074EA22C56FFE5EA561DBB66198CE
              C5F67B8873AFC2B6CCB2AC6C51BCB8385A62F502BECC9ABA6EB8A892387FAAED
              D15E8BEB3E6DB3C61406C53CE289119E144B22F70906D40591C18829C83B8C38
              39E2D7009CD0185A83F98C48CE81384C0119F3390241876019E17390417E969C
              7640E09D3810570465D3644CB9EC18369A393B1C5C0E718AD16D09E031200F8B
              009039CB0DB81CF2AC4CD330C43D2EDE50C0144BD0954D92542953B1AF32ADEB
              351097C184F12B015592BCF005BCA15E03D91BF3CCE317031DE71C685A83DB58
              688562015EBD6BA27A5C02E91634AAEE9933B04FD58F4540B53B10690E4E0305
              7A8B62A2634DECA3C168CF921B71C3BE341CB74A754AA9B7860E683C46D130C2
              E3A2CE7C27A487BE7F0FB0FC520C11E8D90B0426600804806397FD6E3779EC30
              42AC50DD47B37FCC5E48B7A68F2D34F4974761B9D81BC00EEE6ED1377BF140D8
              370F1BF6AEE7ED166E965C3D0A47DAD6C3B2A5B41F27000B0DBF16C2F90007A0
              BF1068C0667A7CFFDF3F011337496129F026F90000000049454E44AE426082}
          end>
      end
      item
        Name = 'window_word_processing'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              61000000097048597300000EC400000EC401952B0E1B000000E749444154388D
              A593314AC5501045CF488C848F2BC80A5CC243B0B01757609F973E202EC04648
              9B3660915A7E6F27A479458AE03E84DFBC248CD58F06E38724B71A86B977CE14
              23AACA16C9CDE3FE0BB85CE93F041BCC00BB001490F511D65A1D8641D7C85AAB
              C1067C000200919F13D2344555298A0280DBA7FD1FD3FBF3DD34E028EF3D7DDF
              D3751DDE7BC2309C0CFF4B7094738E388E11119C7318639611D4754DDBB68808
              5114618C5946D0340D799E039065D9D87FFD3C4C4C0F57BBF980B22CC7BAAAAA
              939B6703AEB337002ECECFC6DEA2133E5EEE67877E239F0C5823499264D33F7F
              0353C77DF91406E6EA0000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000097048597300000EC400000EC401952B0E1B0000015F494441544889
              ED94316BC24018869F044BC12C06C5FFD04297E05628E228912E828314B21910
              078740F107B86415C1399363C914916E25831484429BC57F90C1A52E0ED72DB5
              68AD21BD4E7DA7E3B8EF7D788EE314210432A3DCDCFBCF8021A9FF3527B11CE0
              3227B11C80BF0008018A228D60DBB690954EA7230E5E911082CD66433E9F47C9
              287710301E8F715D17C771E876BBC97E6DE09F54FA386C7C0FD86EB7044140B3
              D9C4F77D2CCB42D3B4BDC153B30708C390F57A4DBFDFA7D56AB1582CA856ABBF
              671004018661502E97A9542ACCE7F30490D9208E6366B3198542815EAFC76AB5
              4A6C8AC5627683288A505515CBB228954AC471CC6834220C434CD3CC6E30994C
              A8D7EBB4DBED646FB95C329D4E314D93DAC0E771D8C07B7B3F5A7A77A17D0276
              BF6BCFF3F60EBBAE9BAC331B5C3B0F9C9FA94707D242BE009EDCDB54C3A901FF
              063F024E35D87D86A9003292D375FDC5B6ED2B19E5BAAE471FD468DB5EA5B714
              580000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F4000000097048597300000EC400000EC401952B0E1B000001EF494441545885
              E597318BDA6018C77F0929B516B15074E9284A3B1457A542A18393A65FC07E00
              DD8454483FC015ECE296CDA5E052106A3B89040F898B9345280ECE62380E9742
              8E9EA6C371824D2E888DC941FFE3F3F2E4FFCBFF7DDE9057B06D9B302585EA7E
              6F005EABDF7F002F03F69E9F7F2C3DBF4D206873800C84BB0502805454BF88F0
              2804FF9BD3273D912C71751DB9050A5CD233E992A71763344D0BCCD4B66D6AB5
              1A50468A6ED65881593B25D9D75721DA83E4F5295EAFD7E47239128904A3D168
              6FEDCD876FAE3D57BFB7773ECFF8F4D609E045D76AB5C86432CCE7737ABD1EB2
              2CEFD6F4B3B257EBC1F204D0759D76BB4DA954623299EC01F899806BC762B1C0
              344D52A914CD6613555569341AC462B11BB85327601806E9741A411090651945
              5198CD66E4F379208019180E87AC562BEAF53A9665B1DD6E310C6307E06702E2
              DFC5CD66836118000C060300445144D775144501FC4DC001301E8F8944224CA7
              D35D6DB95C522814304D93643279DA19D0348D62B1B8578BC7E364B359FAFD3E
              954AC591807E56E6F3CF5F9E66EF5E3C3E0CA0D3E9386AD168946EB7BB67E887
              5C01EEDA5F2F1D0BE40AE0D7DB1D0AE0F81178F5FE2B0F1F3866D353FF928003
              C0EDB89C4AF72201878E4DC0ED981D02B039CACD27850E20D8B64DB55A0DE586
              AA699A20FCF7B7E33F3009BA0706D00B700000000049454E44AE426082}
          end>
      end
      item
        Name = 'internet'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              61000000097048597300000EC400000EC401952B0E1B0000026249444154388D
              A593CD4B546114C67FEF3B774687ECD38F225A28B58A946CD146BA93D2424A82
              A0FC039259641FBBE2EAE82E53DB441859919B5AA68BB863504468624112687E
              0461A62ECAFCCC8F1CBD73BDA7C5E830D6CE9ED57B0EE77DCEC3C3799488908A
              5055B402B8011C02F47ADB038681DB9DF5652DA9F36A83A0B8F6A5F6DCF82490
              B96B5B20F6EBB713ACBE701401EA9FF5B23B236D656E69351D9851DAC8E9A82B
              F59204C5B5AF0CCF75E2008FAF9ADEF08F79DDD8D647C7ADB20D5544CA0BC9CD
              C990F0BD2E05A0B4E1EFA82B750D00CF752600DED49D119F56BAA1B597FCDCCC
              A4CCFCDC2C5ABB477874E5847A7DF334A76A5E209E3B016419A1AA6818C86CAE
              2CF27C5A6980919F8B5C3F579024283DB69F3BCFFB01F0FB34F72F1549657377
              66A82A1A56A6650F0287D91A86302D5B6A9EF6ACAD38AE2C2CC7E5E3F0949896
              2DCBAB71995B72646EC991A5585C4CCB96DE911959588ECB8AE34AE4498F9896
              2D0640415EB64EF3FB48F383EB29008201836060F33AD783ED4103802379D974
              0D4D606C517A1206C0A7D169397BFC80725CC1D089BB88392EABF1C4DBEF4BA8
              32342CC65C028662E0DB1400FF65A282CF98961D362D5B06C7E7640327ABA3D2
              DE339EACED0F6352128926EB81B159312D5B4CCB0E232298963D6D5AB6B86B9E
              88885CBCDB29571EBE4B7EB8FCE0BD849BDE8A8888E3AE8969D912B2EC191149
              78A08DC03ECF75E22591765AAE999C2FCAA3B1AD2F29B57F749A4879215FBECF
              136EEA4A34B5B117FE0DD314B0277B47BA37B5B0A253C394B3332893F331A560
              166D646F0A532A4255D10A0516705040AD9B2528BE8AD0F0779CFF00097A5300
              0F8BB4DD0000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000097048597300000EC400000EC401952B0E1B000004B2494441544889
              AD966D4C956518C77FD7731E5E458E286F0A52BEA2C0CAC94C6B7A481BAE1474
              D32D7366DAAA39DD72CE0F78C86673ADCEC966BAD5D6AC35D70B39E76CD3836B
              F9C138275D8A622D2D0C9069A4C0090A3C18209CE7EAC3798103E8FAE0F5E979
              AEEBBEFED7FFFEDFD7FD22AACA585652599DA0AAAB81174464A9AADA45447428
              A15B446A54F50870C2E72EEF1F0B47C62AE0707AD68AC87BAA3A5D0401C166C0
              E4B4716AA9D2D6D52B96650142B860B388ECF2BACA8E3FB04049657502F031B0
              093032ED4914CF4CE7DBBA161C859379FBC5625495DD5FD671AEBE8D950BF238
              7FAD7DB033D06F0216F039B0D5EB2A8BCEC61CC63A41444EAA6AA96913D9B874
              361B9E9EC9B1B3CD002C2EC80A311261496116E7EA5B792423851DAB0ACD2FBE
              6FD2AA9A2682416B3390535259BD2A52C40C830B7008589E146F63EF866216E5
              67A1AAD436F889B319CC9F31090055A578463A36C3A0B6C1CFF38BA7F16A69BE
              CCCD9D207BBEBA343010B44A81430EA7E7659FBB5CCD30AB35C0469B21EC5E37
              9F85B33301F8B77F906BB7BAC9CB48213D35312A65863D91BC8C14EA5BBAE81F
              0892186FF2D49C4CF6AC9F1FF7D6D775962A2F898807386E86BB659F08C6AA85
              D37014664781AEB705E8BB3748D1A3698848542280A2BC34AAFD019ADB03144C
              0DC54B8A26B3A2786AFFA94B2D49AABACFE1F4549BC06A601A808112597411E1
              88B7295A4C5511118637852A54D534F1CEC605517FC5DAC7934E5D6A218CB95A
              1C4ECF7160CDC8F67A48F68D092C0105E4A12287F7C71213C800385AB18CECB4
              E41889361DA8E1A6BF8733EFAE44C2BE48DC5278E6CD53CCC84EE5B3ED8E98BC
              5B9D7759FFFE19807413C0B409E393E247B1E8BD1724DE343046680F603304D3
              66D07B6F70549E3D391E2008D8CC101B411962301CC40A7F8FEC2200CB528C31
              FCE17F031013B02CCB323ABAFB48498C8B996A7282C9C06090FE81D04C864BD4
              3710246829C9096644F3689EBFBBD75255012C71383D0DC0ACA1858E48213149
              A3E3436342E447E78A48A3099C56D599A15333D6E47F34D603C6A8AA9E36812A
              601B80D75516C3BAE2F0052E34F8C9CFB57368DBE218895EFBE8071A6FDFE1C9
              FC2CDC9B9F18DA68876BB5B6F1AF48D92A13382F223EA064C7A73FF2C12B8B30
              8C507CEB8A022E367690654F1AB5C8591392B9DE1A60DBCA82A83F6829ED5DBD
              B7819C30E679D3EB2A5387D3B31338F7537367E227DF5D63CBB3731011A6A68F
              2335398E5FFFF88760D0C266335055829672F5E6DF4C1C9F40CEC46420D45107
              4F5CE9BCE10F4C11913E55DD193D4D7DEEF2CB0EA7E70D60FF115F1396A5B2E5
              B9B9D80C61DEF449F8AEB6D1DC1E60D6143B00D75BEFD075B79FD279B9184688
              F9C19357BA4E5CB839312C4DA5CF5D7E19865D383E77F98192CAEA1C909D47CF
              3653FF6797BE5E5E288BF233A9B9D2CAC5C60E664DB123225C6CEC008485F999
              FC7EAB5B5DC77EEEBCE1EF49171105F67B5D6507A34D3072873A9C9EED805B44
              9240757A76AA36B7058CFC1C3B7B3714A396B2A7AA8EC6D66E7227A5045A3A7A
              52C26BD0A7AABB7CEEF20F63BAEC3E977E9188EC53D5E58011794D8C785510FE
              0F02A745A4C2EB2ABB3A126BCC02112BA9AC7E0C58072C030A80D470E80EF01B
              700638EA7595FD723F8CFF00BD4C26BEB237F13F0000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F4000000097048597300000EC400000EC401952B0E1B000006BE494441545885
              C5977B6CD3D715C73FD7FED98E9D979D77429EE441125ADA8016DA3062E8934D
              DEAB1B125337BA76AD966EED60DA34E24EAAB456CCAA4A69BBAAEBD6546595DA
              AD12D55A154FB04719EE03586081A6AC232424E445425E4E208EF1F3EE0FFBE7
              D8B119D1A4ADE7AFDFEF9E73CFF9DE73BFF79C7B859492E588D5EECC016CC0ED
              C0CD4025901555CF031780D3C0DF80775D0EDBD472FC8AEB01B0DA9D0DC063C0
              56C0B02CB4E007DE067EE172D8BAFF2B0056BBD304EC061E0194A57A834EEB2E
              C9310D0B81189B5928F5FA4396146E424007B0CBE5B05D5E3680E8AADF021AE3
              028EDDDD543A79B06BF8C640302C767EF906BE766B2500CE13433CFD876E14AD
              E02BEB2BFB0EFE633873C1172C8C73D90FDCE372D83E5E1A2B696556BBF373C0
              21200740A31157B66FAE1DD97E5BEDAAD3FDD345EF760E0A8D107CBEB1504A29
              1142880D0D85F2198D10C190A4B936AFFA075F6C60FF4703A31D7FEEC90A86C2
              99C04AE07DABDD6973396C1F5C134074E507D5E0960CC3C04B0FB71414594CF5
              420871F4EC2500EA5664939795169B674ED7D35866E6CCA09B633D1362FDAA02
              B9ADB57AC5E635C5A11D1DC72F8ECD2C941021EC01ABDDB9C9E5B09D4E0260B5
              3B3388102717A024C7D4F7EA8ED62AA35ED1AA36277B23C46EAECB470821D471
              218468AE2BE0CCA09B13BD53315DA1D9A47D6DA7B5F8915F1F1D3B7771AE18C8
              06DEB1DA9D37BB1CB6D9A5197000AB00328DBAD1571EDD5865D42B5A1925897B
              DE2F0627AF00B0B63A0F755C0821A494B269652E80189DF630EE5E9045169390
              524ABDA2E185EFB5146D7FF6C8D4A5596F1E50013C0BDC1F0360B53B1B818723
              0EF13FF7D02D669341D1C46F4FF7E00C5282A215349499592AF5A5D9E8150DFE
              6098EE0B3314594C315D9A5E2BF63CB03EE7BEE75CFE7058EA81FBAC76E78B2E
              87EDA49A8176400BF0857565176B8AB32BE3D30B7076781680AAC22CD2745A80
              842DD02B5A6A4AB2F974C8CDD9913971575369C23695E76768B66D5C79F577AE
              F3FAE8DCC7807B14ABDD69265264D06884AF6D4B7DF9D2F402F48E5D1600B5C5
              91E297CAA6B6384B7C3AE4A66F6C2EA5CDBDD69ACCFD1F0EF802A1B001F892D5
              EE2C12ADED07EE055E4FCAE9FF47DA1460D367141C609302AC51FFDE6ABF43E6
              652D967B357523531EBEB5F7880078E9FB1B64639945A4DA82F3E357C4777FF9
              3E00BFDD69A5B22023C966D6E3175FDDFD1735C44D0A500EA0D588407E769A4E
              A6A8CD9717FCB1EF6C93FE9ACB89D7CDC5CD89174B8601834EEBF705427AA04C
              21DA520D3AED554017CF5C15BD2F188EFD1B745AA18EC7DB44748B27D7E70FA5
              B401301994601440BA42A46321A3C72A3E036AEAA22302201C969248134B4A6F
              5892003E954D14888A542AC00C90E90B848C61B9C443548C865835C6EB0FA6B0
              48D6990C497D2E26F35703BAE8A75B0106808A70586A47A71728CB4B4FDA829C
              8C4562BA3D7E5141EA2D70CFC771255D9FD2E6D2AC974030ACAEA85FB4B61FD8
              03FCF89A70FFB7F21B0578EF3304F09E0A609A481B967B1FBC4594E6A62759EE
              79BB9BCE7393ACABC963D7D76F4AE96DEF3B9F70BC6782B5D579B47F23D966DC
              ED6547C75119A5DA3C705071396C7EABDDB90FF809209C9D43FEC7B735E92091
              BD37945B44E7B94946A63C149A8D29193E32ED1100ABCBCD296DF6FDB587389E
              BFEE72D8E655AA3E03B4011987BB2FEAB6AC2BA5B9363F01FDEAF2C89D7362CE
              CBD4E5ABE466265E90E73C7E46A73D0034949A25241EA853FDD31CEA1A517F7D
              C05310BD0FB81CB671ABDDB99BC8A5443CF9E6A940C7A31B75C516538CBDAB2B
              2C285A413024E9BE30C36D6B4A1218FEC9901B2941A311ACA9CA4D28569766BD
              3CF1E6292965ECFCEF71396C176200A2F2349187C7862BDE80EE872F1F0B3CFF
              D0ADBA628B510218F58AA85F61E6CC909BAEF3536CBEB13821BD5D7D53B1769D
              91A6C48AD5C49C971FBDF277E99EF7A9C1BB8027D4A031002E872D64B53BB702
              C7808A8959AFAEEDC50F838F7FB349BBAE3A0F80E6BA7C7966C82D3ACF4DB254
              4EF44EAA36B1B1D303D3FCFCF7A7E2838F11B99EC70A46D2BBC06A77D6103919
              E5911522B7AC2DE3813BEBC49CC72F1F7CE10301B06F47ABAC2ACC4408218626
              E7E5B7A3DDF2576D2DB2C06CE4B5C3BDE28F2786092FFA1F03EE74396CFF8C8F
              77AD874909B01F6889A54A2B644B7D21C77B26843F18E6FE3BEAF8CEED7500BC
              71A48F97FF7416452BD8D050C447FF1A97C1908C27E14960ABBAEFD7051005A1
              00BB809F01C6A57A9D56232D1986E88DD92702A170AA36E223C2AD27E3D3BE2C
              007140CA809F02DB597C0D5F4F3CC01BC0532E87ADFF3F195E17401C10137017
              8BCFF36A407D90CE1279FF7D0C1C060EB91CB6F9E5F8FD370DECE03480A5AFC0
              0000000049454E44AE426082}
          end>
      end
      item
        Name = 'info'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              61000000097048597300000EC400000EC401952B0E1B0000015D49444154388D
              9DD3318B135114C5F15F26CF650B5BDB152B11AC6D875DB510069BE81750B1B0
              B052D9914582161304C15A652B0B1B1B9942305BCCB7B0323662AB20AE669379
              16D9E8EC9880E694EF9EFBBFBC77EEEBC4183595E6E559DCC4799C44C447BCC3
              B3AAC8DE37FD9D3920CDCB353CC12D2490241D22F59F21533CC576556493DF80
              C3E612179BF40580B9DEA05715D9241C1E0CDACDC7D78357F7B6D491AB833D3F
              0FA6CDF265F4B113D2BC3C8DDBED11DD24B17E2C98D6B5A4D3AE82BB695E3E0F
              B8816EBBFAF5FB58AF18AA63B43F9EFEDDCE1AAE076C2EE4FF9B368359540BF5
              FAFE050793DAA5FEDB65968D6096F3AA8A01239C5811300A18E2DC8A8061C00B
              DC317BD5FFD13E76435564A3342F1F63A7EDF8F26D6C3C5918213CAA8AECF37C
              13FB38835ED37165305CD6FCD26C7B8F7CA62E1E60DBF2EBFCC0430CAA228B47
              0073A579B9816BD8C229B3983F600FBB55917D6AFA7F018068783AAEE561C300
              00000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000097048597300000EC400000EC401952B0E1B000002A3494441544889
              B5954D68547714C57F67F248553460932614FC689182A622150A8A85195B111A
              78B14A45FC5808AED2951BC199555DB4BC800882EED24DC52E1B2133A8691079
              D97453B3A85989A0D4DA9A8818421241658E8BF9603299371322B99B77DE7BF7
              FECFB9E7FFDEFDCB364991CEE6370347251DB0BD53D2872E15BC00EE4B1AB3FD
              FBF860FFFF496BA811413A9BDF24E927DBC7817649B2EDCAB55A5CBA7F055C93
              F4631C85532D0932B9C2116008E8AC4F6E0F521878F3B6D848EC33E0741C857F
              24126472851F6C5F0152B56A25A99EA0BEA3327E0D9C191FECFF6D09413A9B3F
              2469D876AAA6A05AFCDD9EAD9C3DF439365C1CFE9B5BF79E342230F046D2B771
              14DE0508CACA7B24FD02B495C5563DAEE0BDDBBB694BA5B0CD979F7DC4ED897F
              559F53C6EDC0AF995C61571C85330180ED0B4097241A2842921EFE37CBBEED3D
              003C783A936451056FB69D05B24A67F3DDB61F016B9B1448C0D69EF5148BE69F
              E7F3AD0864FB25F069001C96B4AE912DB5D8C0E3A9B925F625E54BDA08F405C0
              374D5454F189F4360FF4ED906D5F1E99E4C69F8F9BE697F1D701D0CB3242B558
              4ACCAB8BDE00E85A6EF60AA22B00DCC4C79A6F96459E575EB5A875004CDBFEB8
              F230C9538C29FD9806B0BD9C3D980E8049495FAC520793013066FBD42A753016
              0023C02CD0B1648BDE2FA680B1208EC2994CAE30049C6BD6F20A2CBA1247E142
              6516FD0C1C93B425A9E562D1558B8A45B7B2E881EDCBB0785C67248DDA6E6F44
              D0B9E1031FDCBD49B67DF3AF27CC2EBC4E229897B43F8EC27B8B080032B9C2F7
              C07560CD0A7D9F038EC651385AB5AAFEC84C67F35F01D7257D52AFAE5671822D
              27C707FB276AD74B3AF43B249DB73D006C6C41300D5C9574298EC285FAB51A12
              5422932B6C00FA800394866237A5C93D054C027780D1380AE793D67807CBDDDA
              9B67E286520000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F4000000097048597300000EC400000EC401952B0E1B00000283494441545885
              C5973D68144118869FCDAF3117E150221135DA095188ADCD54510803FE808A06
              838DD85858083A1082A6195218D0F47612520882D36984298FA489824A0EC4C2
              10E4C490C66892BBB39824AE9BDDBDBDCDDDF9563B333BDFFB30FBEDCC375EB9
              5CE67FAA25ED44A14C2BD00EAC592DD7D2C6F192AE8050A607B8029C05FA811E
              C003CA40019807668069ABE5979A0108658E0263C075A03541CC22F01218B15A
              7EDA158050E616300164121807F51B78088C5B2D234D420184321EF014B893C2
              38A869E086D5723D6C302A09272A999FECCD72ACBB8BC2CA2AB98542DCAB5781
              925066286C25760008658681BB71118F1CE864F2F6199A3C0F807BCF72CCE663
              21AEE192743C1640287308988C8B0490CDB46F9BBB765BA529006342995756CB
              0F9100C028B0AF52A485C515E6F2057ABB332C2DAF329BFF9E04A00DD0C0797F
              E776120A65F6035F813D49A2A554093861B5CC6F75F857E0525AF396668F8D62
              A20DAD09970F63610003D5989AD1737475B87D492853CDD4812880D3D544D985
              FAFD0D3FC0E1060164843259ABE5F2368050A689FA265F507B81BF0056CB9250
              660DF7AB3442BFB61EFC9F601138DE00F39FC08F3080F90601BCF79F097E8019
              E042030066FC0D3FC00BDC2998A4E848AB32EE78DE0960B55C12CA4C01C37504
              786BB57C170AB0A947C065A0A30EE64540053BFF01B05A7E16CA8C008FEB0030
              61B59C0D76469564CF714568ADF41A18B45A6E0407A24AB29B4033AE9CDAADDE
              0017C3CC21A62ADE2C4C1FE0F222CD9F51029E00F7A30AD258001F481FAE961B
              C45D4492C86E1AE72ABD58CDCDA80F18C29DE7A770D7B22DAD031F71CB3D65B5
              9C4B089A1C2000D30C1C043A717BFBB7A86F5C17805A2AF5EDB856FA039433CF
              1D71D7D3D00000000049454E44AE426082}
          end>
      end
      item
        Name = 'light_on'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              61000000097048597300000EC400000EC401952B0E1B0000013E49444154388D
              8D92B14AC3501486BF7B632ABA3A64127C8014C51750144441089225D0C1C9D5
              455044707171EA530866AA6412053BB92888201DECA4830EEDE6606D4D7AAF93
              254D6EDBFCD33D87F37FFC977384D69AB45A515006AAC01A200105DC03878E17
              3E909148035A5170049C6787523A73BCF0D408F8BAAE2C777FFB4F63CC004C59
              627D6EFBB23EA8FF1F71A2AA93CC00495F5781A51C40C34A1100B03894A8A069
              A4060001B7C04601CFA311305DB2F63BDDE47592DBB6E441BA1E5A633B0A2E34
              54C6F86F1C2FDC342600989DB1F7BE7FE29180922D77B33D91BDC47614BC6828
              1BFC1F8E17CE679BB92D946CF9DE8B550E6049F1664A9503F41279A2B4DA9222
              75231ADD89C5B10990FB0280EFFBAE526A613024C467AD567B2E9400A0D96C7A
              C04EAA75071801C60400AEEBAE023E70D56834EAC621E00F30826A3DC07D235A
              0000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000097048597300000EC400000EC401952B0E1B0000021E494441544889
              A595C16B13511087BF37A42ADAA0E8A521E93F205E250745A16211B478900D86
              608F0B82F4E04DAF823D7813A490A352A8AD87D8041411A15E2A089E82282282
              9AA61E4D536C689CE721896EB69B976D9DD3EEBC37EF9BF9CDBE5963AD6590D5
              4BF9D3C04D119954D5432282AA628CF96CAD5D64BB7927E5957F0D3C00305180
              6F8FCE987D87C75755350BD03D584544545501E9F9DB5B3F6FA4739507B101B5
              F9B32691CC348183AECC82A6ADC66CCA2BDF8E05A897F26F806C2FEB6EA612AA
              80A01F10DD5C3B9F2EACBC0C03127D872F4D9D6264340BFC9521AE259299C7C0
              3127009811E9C8DBCB30986DD8177A3F5A5F9A3A9EF2CAEF5D80735D05FAE488
              2151E7D9DA49C009D851E22E6D2CEC0803D645648CBD498418F37518E085AA4E
              B37B898C8818B5F6D930C03D601A30E18D4133C618DBFF7D1BA09ECE55BE3801
              29AF5CAD97F2CF810B2E808DB8FEED8DEF57A2F6862B4037D72E25929936C4EF
              81B61ACBE9C2CA6A14207216D5162FDE4D1C38722B660F686FD492E3D75E3763
              03007E2C17068FD98069ABF124E595BD41EB3B240A04BE62647482C017155981
              B50327A913007C04265CC15DFBB057C0A7A8B9146E723A5759DF13E0B73267AC
              CE5ACBFE881F0EC620DB5BCD79D7E1E0683280EFFB2781138EF86AB1587CEB02
              B82482CEADBE4EF4CDB6C01CF05F8087C03BC77A75487CAC0AAE0ED8D7061618
              5281B30700BEEF0B30035C0EB89F02F78BC5A24647FDB33F8AF7123A47E37BCE
              0000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F4000000097048597300000EC400000EC401952B0E1B0000020C494441545885
              CD97BF6B144118869F99DDF3126C62E3A248C07F412CFD510872015DCF4A6421
              A438B053025A1E88A52016A69213213204AC74CFC66015458484F80F24DAA861
              2DAC226A36BB6391042C6E6FBFD9DBA86F77FBBDFBBD0F3773F3CD296B2D2E4A
              E2A80D5C004E019380023E026F817E109AE72EFD9414E06B3F9AB196C7A2A6D0
              391C9A47B5012471F40A382769F8879682D09C1D192089A365E0A463F89EDE07
              A13951192089A3BBC0AD8AE17B7A1084E6BA33C0E6E2CCA1EF3FD36F238603D0
              6C784727A6E63706D5FCA2977EA5D99D3AC201B6B6B3DBC03527802CCFDB7501
              58CB2567006B395617001014150A01FE96FE5F004FABD7596E4FD794F3CE19C0
              F7F542B695D502E07BFA6951ADEC20729B54050A42A38A6A43F780A7D5F92CB7
              8BA3842BC5E5A175C12C88818B15F35F06A1698D04B00B5169299A073C7FA235
              9F0DF3887E864A71DF5A661DF3E7CAC2C50007C71ADDCD1FA913C078D3EF4A7C
              E21B5112471F80E3C2FCCF41684447B9F8246CF87A3DDDCE45005AAB75695F31
              80D6EA8BD4EB69F5A976004FAB3E302DF12AA5FAD2BEE23D00B0F12CBAA735B3
              EC5CC50729CF73E68EB4CD0D694FA769D87D31FE045829B1ADF51CAE32AEE338
              026E96781E02CBFB0550BB5C010CB05AE259DB4F801630059C29A82F016FF8C7
              4B5038FB079A5DFF1D03743A9DAB839EF77ABD05D75E55BF81317676BBB7FB39
              05AE5469F41B5AA4A5FA2CAAC0690000000049454E44AE426082}
          end>
      end
      item
        Name = 'iss16'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              61000000017352474200AECE1CE90000000467414D410000B18F0BFC61050000
              00097048597300000EC300000EC301C76FA8640000001974455874536F667477
              617265007061696E742E6E657420342E302E3231F1206995000002E649444154
              384F85926B4893611886BF0E421A08E58F48880E10A544091128FD283A50E02F
              25212849FB9781E281CA421DDA36755AE644E7393175785E65A9E5CA894B3332
              75074D9DC7CDC3367776FB9CDBDDBB03A51078C3CDFB7D3CCF7371F3BC2FB555
              9CD71DC8A97A8FECCA7760FFC7AE5A56492398A5CD51DE91ED62570AB0939865
              2D04D2E482DCF68EFD5376799BBB49675AC7E8BC1E4AB5094EC7261C0E27ECC4
              B68D4D6414F1D135284716CF0DD99EE4717E0D18BD1A44B4AE20AC46053FC634
              4EA488D0D62B03BDE9C43A4D00DC06378455D6EA86784729EAC0E5FB11D1AD33
              689FA5D1B74CA362DC82C8AE35ECE528404556A0A0B60B16DA01A3751306AB1D
              B4DD89CCE2460F60F7A1A03DA7D943344F6E83DAE6848514852A1A096203026A
              9641A57C02151A8761A9025AF306D4061B01D9915158EF4D1014157FAE5A0DC1
              9C0D33463BC67576344D5B11F3550FDFB24504B27A70E41E1377929F63496785
              8A586BDA405A41AD177026B6F91A5F855299199C11330A251624898D08695623
              BA53E95EAC4B751F85985D31625EB38E55038DA72F6A3C80804B777B1A26D670
              B04A890B6D1A5C146871AC7E15549E14A7581DE8FFBDE006347C10625265C0D4
              B28924B12135BF1AD42E5F7F9F92D64E477AFB0F50A92250395250B93250E962
              9CCDEBC6D09C1A83F2298846E5E0F2DF42BEA8C7B8D2880592E2496E0549B0CF
              FF96C662C5A2D68070361FA1EC163CA813E1DB94277A93B01F54483862182FC1
              EF1E8064C18031F24666572D7894534E003E7EC15F7EC9DDCD5B35A698C7F5B8
              345027AF803A1A86D2E6CF189933E2E78C0EC3C4D3CB66A4B0789E1DEC3F7C9C
              F9308D69CE2D7F035E4B276EC626810A3C0FDFE0ABB8119D0C419F840CEA3134
              BD86C1490DBE4F6931B1644232B3D87B0B5EC53DE36040A127F1D7C8E234EE73
              506120A78EFC6B219ED078AD8574D184C44CEE764052561164AA755234FFB5C4
              E50513C65C9E377A4CBEA54A0B01146E07B888098C5788CF28D8D1AEBEC44C2E
              FE00139EAB79AABF16A50000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000017352474200AECE1CE90000000467414D410000B18F0BFC61050000
              00097048597300000EC300000EC301C76FA8640000001974455874536F667477
              617265007061696E742E6E657420342E302E3231F1206995000005E949444154
              484BA5957950137714C7173CA876C47A62A920A7583CAA3DECD48ED68E472B5E
              6DA75E1DFFF0ACA8D522563B280AD56A15107502E2CD2547ABE5901810B45C09
              444041E4BE422040209B908B0402FEBEFD2D87D50EDA4EFB663F93EC6F76DE67
              DF7BBFDD65060BFFB03BB3290B0723205C3028BC98B40F57ADDF6CD99FE2D5E1
              1FCA4F17155661508AFE065DBB2F7E82C08864A5C7D1335E7B7FF41DD79FE6E5
              E1773D29DDD4DD83AEEE1EF28F987A885AA323976EA523F66E9E2A382AD99BA6
              30EFCBF49238753531DDD0D50DBDB18BB05A2369603B7A613506A2379A484727
              47773F26A2D11B48245F84DA663562530B101425F0DE73D0E7E595FC72253EBD
              BC458BD822162733E4D89520C3E6182976474B7025AD0E6552169A8E2EE88CA6
              5ED43A23894D11A3D3D4D32B89A1957C7FC4DFCBD975D6E8FE947F85CDB21D43
              D6FA5CCFF44C6DC59E5405DC5359AC496CC347E1CD78D35F82B107F231CF2B19
              B1F78AA1D677424D45EDBA4EC28B4E0527E12AE1DA752642A0749C36737E7FDA
              BE98B8F2074BD7EF2E1FDF142FD55D29D12149624052BD1121A57A780AD5581C
              AFC0E8731230FB3230E40B1E02A3D2205368A1D476F6C2B59343AED492BBA262
              384C9BB9AA3F755F58AD3DB1697958257BE6A11662791724DA6E54A9BB216830
              22A048878DF754B0A195989D780C66FBAF78EB4B5FDC481242DEDE81368D9183
              0C90262E8583CB8CD5FDA91966E8EC7516F647B2CBB7A4B088A8EC40AD860ED9
              F414AD861E643477228856B4255D05872839CC03CBC1ECBF0333B7A358B1FB14
              8AAB1AA9C488967603E19053EEE696BC2830FFF8E0D7537952ECBCAFA46D3140
              4AEFBE86DE7DA9D284DBF4FC74A10E1B680593235A6071B614637D53317E7320
              EC96EF04EF46221A153AC8E84EE36852769014DA22FBA9D3FB0556EF9A310B7C
              02EDCFD7E3904889146907E2EA0CE04B8D48A073082AD1C343A4C6A22405ACAE
              49F14D620DC21ED4223AAB0891A9226C3DE24F774F3B1A147AC2D1C8EA8920FB
              F17382B12E66CC7C9F9819C115082E6EC761B10ADE795A9C2CD4E2389DC71E3A
              E095C94A3847B5602DBF01E5AA2E989E12D083FE023F8544A04AA682A4554738
              EADB74849F59087B67D73E81D944A7E1A39779C6873E96631DBF112ED12D5898
              C862D91D2596F259BC77AB0DD6E14DB00828C4E2CBD9D8169A86278D0A102AE8
              A17082F20616352D5AC2512BD791DB198F603720B0707867CEBE90D827C9D54A
              4CF2CBC1305E0DDEB82AC384D0268CBB2EC3C88BF5303F5B01C6370BEF07A420
              545481569D113532795F0517225052CFA2B2494338AA9A3524E18F02D839BDBD
              9A311F633DD4E593E55E3925D59DB78BA518EA1E01E6681698538FC0F8D1EDE8
              5704E6981063BC6FE3DB981C1437A9A0A24FAF7F441C42E25250A750C3D32F04
              4F242CCA1A3584A342A62171F7F331851330E36DAD36EC3918D7A6D6414A2FDE
              CAFB1D4E07C2607B240E2EC71230FF743CFC05F9A8A60F54176D7A99B4193B4E
              5EC088796BB0D3EF227C2EC52081F6BB58DACE41384A1AD4E4565A1EA6384EEB
              15586FF4F04A6235FADEA1A9F446882BEA915658894775CD50D25701D7068DB1
              0B7C61013E75F7C6B0B95F8199FE19966CD98FA8941C3CAC65512851A148A222
              1C9CE466AA18B6BD02CB0923662E743B9D5751D7CD09B8C10DF0942E745284A5
              D5D8EC13081BB72D6066AF00E3B208D61FACC0B5840C3CA856A0A04E45515291
              92707092D8945C2A70E91B32337C84B5E3DC8521C131F10D77731FB6671596F6
              64149523F8A6009F6F3F80E1AE9F62D88CA51835DB0D8E0BD660C3DE63B42DC5
              1057B354C022AF9A25CF534025D102116C1D0604DC07C27CC828B39196CB5E9F
              64B363C9FA6DD57EE149381B9D8CC3E76FC0DD87875DBE4138742E1291023132
              4A9A20AA5420A7AA8FDC2A05791E4E12C517C2C661EA3301176614EE4B346CDD
              368FCCFC1A16D9156D24BBBC8D6495C929ADBDFF85744D58A178259C2432291B
              36F62F0A9EC5FE9F83D3F36B9510D18BFF0BB9950A129E984905CE830B3C8F07
              A587D2010E465842E6BFE2F4E5DF30D9EE2502C769B3E64CB6735A4959FD7FB0
              786D84FD9F0A958DA07F62CBA10000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F4000000017352474200AECE1CE90000000467414D410000B18F0BFC61050000
              00097048597300000EC300000EC301C76FA8640000001974455874536F667477
              617265007061696E742E6E657420342E302E3231F12069950000080249444154
              5847CD97095454E715C73F406D8D46311A4D6A6B8CF6D8A4361AD3184F8DC6D6
              AD361A8F82BB69ADB57589D6A801B72841161111497001B4A0A0B2884151B48A
              A24608BB8820C83A3033C0ECFB30336CEFDFFB1E8B4FADD6E4E839BDE7FCCE7B
              E7CD3BDFFFFFDD7BBF3B33ECFF3AF6455FC2F320F25CFA7A5ACEB97DD51F1041
              C752F063A3ADAD0D6A8D96EB341191787DCB371131BD3A967EB6D81B7501CD2D
              AD7034B7723F147B530B67309A0503C5359A2E13B4AC4BFBEACF108191E77971
              D868B11F83C9D2281890A9CDC82D570AF7BC8990F0E867CBC49E7F9DE3C561B1
              374367B222AB528DD3790D884E972339AF1E15722D4C563BACF4B9D5D1F230F6
              66CED861800F85C1C6759A083F7D6D332DFFBF33B1E7E83914D4EAB0E38A1CD3
              6264187FAC1EEF1DA9C3F0AFA5E8E75D85EEEB8AF18EE72DEC4DC887426B82D9
              D62C98E5A17BCE60B10B827C3FF0C167A2A8A31CE10957D791C4931B73C8C7AB
              7B2E0E3C83F9494AACBBA6C3D6740336136BD2F4703BAFC1072714782D440AE7
              2DA560CB2E61D8B2285CCC2886C1EA80B1B1996822030EC1C093209997DAD51E
              8941D357F6797747F28D15FFD622E8B61927CB1B9124B121A1CA86B0122B76E6
              98B034558FB1F12AB886CAC0B617908944F498EE8F23676E406BB2436F69EA42
              47467466BB804A6FE1EA94EDA783A4FAB72B8AC275D2DF5C867D1E9BB2847619
              5C60C645A91D7734CDB86F68C16DBA5E9239105EDA08CF2C133EB9A4C39B2794
              70DA5705E6711D6C61047A4CDC88A4D46C68CC0E683BA07BAE13B5C9CEE92D0E
              041D4FE10D0C68571585EBECAFD64E886E80E72D03E22B6DB8A36D86CAD60653
              531B64965664A99A104BCFBDF3CD5878558F91A7D5E87E98B2B02B076C553CD8
              0C6FFC62F26A5448952031C2019591762E823281BD51E71F37D07DCCA2DE83B6
              E7AA6626AAE0936B4272AD1DE5B4737B0B07472B0745632B72D54D88A752F850
              69165FD3E31DDE40B81C2C80CAB0E11CD8BC20B0F7FF8A6D8147A1D0374269B0
              0B27400C6F2C3032F971032E1F6DFDCBE0BD35987D568D5D7966A4D5512DEDAD
              905B5B514FF0666E3438709C7AE2CB5C33DCA90FDE8A57C385CF40C06D30CF0B
              609F86824D5C8DA11F2E40759D16F5BA461E4E8CCA68037FC4495264E0F5B14E
              4E330EC4BE4606A67FABC6E122134AF44DF85EE14086A209D994FAEBF50E9CAE
              B6617F9115EB328C9896A2C560EA0116528EB18732E0169E0AF7A038B8791DC0
              DC4DBE98B26C3D240D06C8B58D9C18A5C186DD47921E3130688C339B7DBCB88F
              BF04EEC97548ADB723B6DC8C83F7AC88A9B0E114D53DAAAC11C177ADF0A0069C
              4FBB7FF78C1ABD226498195F0A8D8303B5099A09FE6A6A019678FAA1A24E07A9
              C6CA8969A0D2F8479C79C480EB3017362B52DAD33B1F09D55604E56BB1FC861E
              1B334DD841E5F88A9A6E5B8E199FA51B318FC4C7256930E8581DA6265442626D
              838344394E983742F026966EF645994C8B1A95851353A7B5C22F2CF11103AFBC
              D98D7DEC5B1B9C598BB3120BDE889408227FBAA883FB153D1690E89CCB7A4CB9
              A0C5E844355E8DAAC34F02B2B0282E1FCB63BEC3FA6397A16D7474C8B71B58E2
              E98B52A906D54A0B2746A6B1C2F770C2C306BA0DF9CD70F7E0048BD406B89DCC
              8773A8047DA314187252855F51A3BD9DA0C62FE354783D46899E47EBC142ABC1
              020BC176A6A1F79A7024E657A28544DB3AB2D069E05EAD06150D664E8C546D81
              CFC1B807065CFA0F76EA3B76C6F1129AD54AAAA5EB8653603EB960FBCBC00E48
              A8CBA5E8162683F3A15AB06F68E8EC2B01F3A773BF311153F79EC19D7ABD5002
              250D9853A9E982095B2BB0980C1449D428AB377162A80CF03E102B32D0EF6703
              977BEF77D0898396ACF7581400F6391D13AF9B607ED974C4F2DB8FD96E32E593
              01B62911A3BC62119757093A9DA01101A5B509935778E0B33D87616C06AE1696
              63DEFA9DF4E5A345A9DCC4899128A9A74269935D251830647EE2CD1CC139DFC5
              9E91243EC70B6C6524ED92BA9576CAD646A3D7EA30CC094942D21D092C349CF8
              F7E982FB0A1DC62E5E4B03682E56061CC2D9BC52CC5AB505DF174B714F6644B1
              CCC889A95298E1F5F509918157876ECAAE900A5DCCC3A733BD4C0ABFB8CB6426
              1981493791525805B5AD45F88C17E6DFA3C188B8B42C0CFCFD02B071F3C146CF
              C284651B30E3EF1E482FAA4561AD9E30E06EAD811353D960C2CE90689181FE3F
              5F72FA66AE90CACEE0057821FE59A760E773DE44915C85B91B7781BD370BEC03
              121F35136CF8448C98321F57F3CA5150A3EFE24E8D9E13535E6FC297FB8F3F30
              E0D4CBF595499FAE55E9A8FE8258BB5657F0A2BC117EC7B76B1AB06257087EFA
              5B127CDF0D6CCC6CB0B7A7810DFD1D464F5D840BF49B20AF5A877C89BE8BDBD5
              3A4ECC7DB911DBF71D136580C2A9CF80691F2D5DA3B952500A3D35829926190F
              7F9F43E5098CF91613FEFC4F38BF35096CE41FDB19319984C7A3F78889F8C796
              40DC28AC454E9516B9553AE455E9B827512237605B10F597C88093408F9786B0
              BE8376BE3C7C54CAB00FA7678F775F8E4F566DC58A1DC158B0CE0B23272FC4C0
              D1D3E1FAEB3FE08D71B330D16D25BEF00F434A662932CB54C8AED48AE19EC43D
              99015BE9DB92341F6480A21BC1FF46EBCE9C9C5E767276E9EFE17700E9F755D4
              906A819B250AA4DD95E35AA10CD78BEAF05DA91219F43CA35CF31899E51AEE49
              1451736ED913F198013EF84C745E5D3C7787F11D4C221AEE7952488DB93920FC
              BF1A78283CFC0F095D7CAB54CD3D4F0A6A74F0A4D291C4D30D7CE14706A88B5F
              04FCDA24F174039B7C0FE24542124F3740C1FF7BE947F02FBE0058BFFF00852F
              B3CBB79F47FB0000000049454E44AE426082}
          end>
      end
      item
        Name = 'issf16'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              61000000017352474200AECE1CE90000000467414D410000B18F0BFC61050000
              00097048597300000EC300000EC301C76FA8640000001974455874536F667477
              617265007061696E742E6E657420342E302E3231F1206995000002A049444154
              384F85905B4893611CC6DF0E421A08E5452404D55546501081D1455D741174A5
              250425656094919289874467EA9C3A0C53CBB3B64C5D3AA7A6A623B434B2A2A0
              833AAD749A6C9FD36DEACEFBDCE1E9FB5EA77321F4C08FEFF47F7EFCBF976C8C
              F8690F0AEABA915FDB05D126F0DF72CA5B20AC9445792BFE11D576E27F1156B5
              7192565E72C95BF325BFBA9D0E2D996DF831BB0C8DCE0C8FDB05B7DB03278763
              C5054199148A4FE3C8A9A012FF4D528A24C81AD423423E8F9312064159533898
              3484F64125589707369613943653495E959C4ABC5542769DB91E112D9F46C70C
              8B775A16351356442A16B15DAC0289AC4171830256D60D93DD05A3DD09D6E941
              F6939655C1D63D61DB0E893EB315E30EE81C1E58B98F030C8B84612342245A90
              A4D720E171F83AA682C1B2029DD1C1899C1094347937088B8A3F5AAF43E71F07
              A64D4E4C2C39D13A65C7B5B7CB08AC522334AF1FFBAE0A71F95E2EE696EC6038
              0CE615641437780547626467A50C2A951688BF5B50326A45E2B009C7643A44F7
              69E8C1F269EC1DC0CCBC09B37A1B168C2CEE3F94AC0A424E5FE96FFEB988DD75
              1A9C68D7E354A701FB9B167041F018A9A9A91469D33334BE54E03763C4A4D6CC
              6DE2405A513DC896C0E08072799F3BB3E30B48DA1048C11848A112247378BDEC
              23C5FF39AF8CDB6047F045BDD50EB5C188F32229C2456DB8D538840F931A3A94
              B65EE2AF6BF8248404041D7EF36DDCFB97BE8CA866E9F0838C64A8BB62B1D07B
              8332FF2AD60F7A063BF71E10DECE105A0AAB9FA3A2AD0FE7621241428F538138
              3B09DA9ECD0573DC7B2A584B5CBA181F55CBDCFA8B78FF4BCF0992F1A234810A
              78F8D2DA3DCF88EC8EBF2031A70C4AC68631B585C20B465B6EAE97FF1574D7F3
              67B02177B34B9190F508F182624A667A3298EED5E1CD04E525B9F80B9D4F93BC
              8BEE441A0000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000017352474200AECE1CE90000000467414D410000B18F0BFC61050000
              00097048597300000EC300000EC301C76FA8640000001974455874536F667477
              617265007061696E742E6E657420342E302E3231F1206995000005A149444154
              484BA5956950535718862FB850ED8875C5524156A154ADB633EDB41D5B3AB54E
              C1AAED4CEBD2F187A8E04A8B5896289B3B82824EA05844D964E95459C38E0DB2
              0882B20926EC84359004B24120E07D7B6E08141DC41FFD26CF24F7CCE47DEE77
              BE935C6AA60A8CCAD848B09D89ABD19933C24EC8FB74C71E077D6DC4EC1518C9
              E19654356246AA5F81AC3D287B86A0982C898BCF35D6AF1E7ECBB431AFAF803B
              E95CF5D83846C7C6E937A21EA7A53205FDE73D2E1273CA0742E3B2BC4884EE44
              D26BCA3F22953B3C3A06A56A9416CB55748778488358364C2B556A7A6884614C
              8B9A962987E9584E095A7AA448CC7D8290B84C2F6777DFD77772F9563297D72B
              4762B518970A843896D2058704018EC7B7E1565E2B9E0BC4900D8D42A1526B90
              2A547462761946D4E31A4902E9E437EF4096A5CD86C5DAC8FFCAC8EEF09C5DBE
              771EBAE6F6C139578423B962FC9CDA8FCFA27BF06E601B96BA55E073561612F3
              6B21558E404A44838A119A1D9F0B46C274C26CD7B5984C89B9F5FACDDAD8895A
              B9FD777D9B13E1E7F7270B14B7EA14486F1B467ABB0A61F54AB8164BB1255984
              C5D7DB409D2CC09C1FD8088ACB4397480E897C4403B39D0C42899CCE29A98599
              F5FA1DDAE88932D87571FFB6A806F1B5A772940947D1261F43A3740C991D2A5C
              AD56605FFE008C48273A176B4039FE85F77EF4C3DDF462080787D02F5331D093
              E495D5C3CC6ADD4E6D3445CDDDB85BCFD4BB8877205B8C988621B4C8C890D52F
              D0373C8E829E1184908E0E7007601627846E100FD4A90CE8D8FBE0FBE3FEA86D
              EC2412157A078769062121A7B4EE6581EE17EE3FAD650B70F481846CCB3004E4
              EE9BC9DDD74BD44823D757AA14D84B3A581DD30BBDE07A2CF5CBC5728720986C
              3B0AF6DD54748A14E822278DA15B324467932D325DFB815660F0910EF5A56F90
              E98D769C2E91205B3084A4D66170042AA4903984D429E15222C537E92218DC16
              E097D466443D6E417C613562734B70D03B909C9E417488943443A758496716D5
              4C132CB5D2A136FB26AC0BE523B4761067CA06E0552EC7A52A39CE9379389301
              6FCF92C032AE17BB381DE00D8C42FD8206799177E06C580C1ABB06D0D6A7A019
              DAFB1534E761154C2D6D26043A2B2DE62FB6734D8EAC116237A71356F1BDB04D
              15C32E4382AD1C313EBED70FC3E86EE85DADC296F0221C8ACCC3B34E11682218
              2730025E8718CDBD729AA145A8A0D30A2A613229D033FB70D3C9B0C467594D12
              AC0A788479EC66BC13D1851591DD5876A70B0B6FB64337980FCAAF103B2E45E1
              C2F53F101119859BE111E0F3EA7036341A75ED623474CB6886C61E199DF2CF13
              9858BCBF93D25D6238D7EAAB6DAC47754D2369B502CC3D1203CAA710947F25A8
              00721C03AA419D2BC612AF3438253C028BC582A7A7E7142C96273C2E06A0B4A6
              198FEB0534C3537E277D3FBF1C6B1801B5DCD860AFB37B52BF540181488A83EC
              FBB0708B82B17712ACCEA560F39564046656A089FCA046C9A64F0F9F8D98A45C
              AC31B7D6080CF7B9B0D2C532A56668034A15CAF8EDC8AB6A40656B0F24E4AF80
              19A44C350A4EF113F2650FB0B4789DF680F73498EBE9186B04FA2B16ACB7B5BF
              52CE6F1D6304CCE0267941164608C5F54D70F00D8291FD018D802127E2048419
              8EE8CF729AA22FD3F1258CCDAD26864CCD5F6068FE896D58684272474EE9D3C1
              C2AAFAF1826A1E42FFCEC4778E6E986FF335E6ADDB8A451BEDA7042DC94E6F16
              984D0A980784EE9C453A0BF5EDDE5E6574F8DB3D879A02A2D3111C9F853337EE
              E2882F1BC7FC4270FA7A2C3C3D3C70D9CF4D13CE303D70FA5A7B860B8CCCD64E
              0998D221304FA279BB0FB93CAC6816A388DF4F17F1FAE9C2E742429FE6B3A787
              3B62825D6615305472FC6164FAB260AA4E5D08E556B44850C217D1AFC2F27447
              FEED89FD9F4D909716490496330B5CCF877023530A30133E67DC511A7B7C5641
              7BAA13C2236F63B5C96B04E6D61B36AD36B1D84ED8F97FD07B6B81E9BF41A861
              92F83A1AD10000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F4000000017352474200AECE1CE90000000467414D410000B18F0BFC61050000
              00097048597300000EC300000EC301C76FA8640000001974455874536F667477
              617265007061696E742E6E657420342E302E3231F12069950000075049444154
              5847CD970B5054E715C7EF823A35368AD184A4B624D1CC34ADCDABAD75262FA7
              49A536268E91A889A6B5D689622589521E0B12441E1A44240115D080420CF250
              14057C4491011A0111230602280BBB2CB0EF65DFCB02F7DFF3DD055C1E46B1CD
              4CCFCC7FEE9D7B77CEFFF79D73BE6F77B9FFEBD89D518CFF85D24E967F44E9DC
              9C59C71171870A71BFD1DFDF0F955AC30F42A4E695047F9E9A396520F5BDC5AE
              F4D370F4F6C1EEE8E3C72B5B4F2FAFEF360A00375AD5431094D6DD99FD1E2236
              ED1433879592DD8F0C268B0020531951DDA410EE1944424AC6BD55E2D32F4E32
              73986C0E680D665CBEA942EE954E6494B7A3E04A079ADB3530986D30D37BB3BD
              77B86C0EBE7B00804597DECA0F42A4E45E08A2F477AFC4A7074FA2B64D8BB073
              ED589829C38B873AF0DB0372CCF94C8AE911B730D1EF069E092CC3AE9C1A7469
              0C305A1D022C13DDF37A934D3064F3C08255A26EA01D29395FFB91C59D07D3EB
              0DDFC9EFC51EC3F27C05FC2E68212ED72388B4F1A20ECB4EA9F1872FBBF06882
              146EC10DE0D61463F69A741455DC80DE6C47B7C541EA2100BB00702791CD034E
              B711E1E9BD7EEAF3610597D69DD120EEAA11479A2CC897589173CB8AE47A333E
              A93260F5791DE6652BE1912803175A4B107998E41D8303C72E4163B04167EA19
              929640B4469B20A5CEC4CB15CEDD4156339C8E2EE1B1E01FEEB33FCE2A5C45AB
              8CAF35A2486AC335B503DFEB7B7195AEC5323B521A2C08BC6CC05BC55A3CF9A5
              02A2DDB7C00594805B998A49AF6C41FEF94AA88D76680644F7FCA054061BAF33
              D91177B89001CC74BABA84C7926D9B5ECEE84460991ED937ADB8A6714069ED87
              A1A71F32531F2E2B7B9045CF236A8C58F9B50E73735598B89FAAB0BD0ADC866C
              708B22F08BD77CD12C5580CC487628BB69E52EA24A6057FAA9D100135F78F7A7
              9EA1D5CAC5794A44561B50D0664313ADDCD6CBC3DEC7A3CBD2876A550FB2A915
              91D49AF72EE8F00C03486907B793DAB0F924B877E2C0FDFEEF08893D882E9D05
              0ABD4DD801AE6260B16905A301DC5F15FF6DD6AE562C39A1C2F62B465C94532F
              6D7D6837F7A183C4602E75DA719866626BB5113E34074F67ABE0CE2AB0F32AB8
              C0D3E0DE4F04F78A2F9E7869055AE41A74682D4CBCAB94DD56B02D4E962E008F
              CD13891625653D4A00DEC755D85F6740BDAE07FFEEB2A3A2AB079554FA920E3B
              725BACD85367865F453716166A308B66804B68C2BC7D155896721E3E7147B12C
              3C096FFB47E1F5351F41D2A947BBC6C2BB4AA1B762C781FC11009E2FB8714B0E
              DF981A23814F811CE73B6CC86A3262EF776664365BF115F53DBDD182F8EB6604
              D0002EA7D53F7F4C8529A9322CCE6E80DACE83C6040E12BB1A7A815581D16896
              6B21559B795775526B62528F8D00F098EDCEBD99269D1C51839C1633E26A3458
              7B49872DDF181046EDD84643175265C43FCBBBF10E99CFCF57C3F3901C7FCAB9
              0989B91F7632E579E1BC118241AC0E8A42A34C8356A58977955C63467472DE08
              80879E9CC0BD11D516FF4D1B4E484C783C4D2298FCA5480B9F733AAC20D3A567
              7578FDB406CFE5A9F070BA1CF3A3B321168B47A9B2A204961E0755200A0D5235
              5A1426DE5532B51951FB7386034CF0FACD1C9FF81C93D40A2C3B5203B74409A6
              A577C1EB8812BFA441FB558E0A4F1D55E2B14C05261FEC0097D8822071C89800
              4C678B0B0480EFDAD468EE34F2AE92AA4C88DC7BF43680FB8C59A269F3161DAE
              A7B35A41BDF4D8FC15B8C86A707B1AC1254968CAA598902C83DBBE36709FD3A1
              B3BB1E5C4C158283C736BF9BB272F3119194E50230FD678FAC8DD863A71D070D
              356FD2BB3BC17D4CDB24BC145C74256DB11AE736DB41509115E0FCF3F06C78D6
              98C9EF55DB126991432D98E9B53CAFB40AFD34446C8A03D3C87C6938B8F569E0
              B6D0B46EA181D9948129BEC9589A908FFC6B1298E8701A4C161A123C2C798838
              7898C4826EBF1FD46D80879FF0AF6C960A53CCC426BABC518AE8A36709A600B1
              F9A528FCF61654D65EE11D03659F6349B60E981FF96C3314451F407566FD2829
              8B3F1853B70166FC7C556E6935E8B41D0A66C08CD8B341C3C1E70CA2AE5D2918
              3B57284659C6A6FB07104DF17868C1FB9B945AEABF60E6F41A0A66CA40E8AB00
              575B3BB16E7B027EF2BBC582B1B3BCC16839B1E1BFA8008568EACC85AFAEDEA8
              3E57DB001D0D82914E3226765F45ED89CD3C8E97FFFA21DC9E5E006EEE9F050D
              56202A3C48301F0F80F494EF300091A0490F7871D33C3F7970CEB385B35FF2AE
              7CD1672DDEDA20C6BAB078ACF00BC7DCD756E291E7BCE1F1EB3FE2F1F96FD236
              0C1606F08BDDFE43004C23CDC67A57951330BC02141348EC37DA444E247A50E4
              E63E23203A09E5DF2B692055824AEBBB70F17A3B2E7C2B43499D5C00D81A1A8C
              73073FBCA339D3480005E978FAB651002C582506AFEE813B9271BD4D8F8A4635
              3F9658EF5905EAF3368E1B2031917E378C01302C0262F6A1B65587B206153F96
              9879F8D6207415AD1F1FC0998D08DDB9F7EE00FF8A260089EE8E0A0B0DC28E88
              4074143A878D198C1CC0B1242D4B00CB4D163F0CE01FB5173FA6C8E2870128D8
              BF97E924F6C11F41DCF4FF00D655520DB0AE6CDF0000000049454E44AE426082}
          end>
      end
      item
        Name = 'colors'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000010000000100802000000909168
              36000000097048597300000EC400000EC401952B0E1B00000051494441542891
              63F4F1F1612005B03030306CDEBC9948D5BEBEBE2C1096E7DA5634B945DC8FD0
              44443D66426D20D949C34443CA155B34896A012E3491591E7475D220D4105C6F
              8726118C430323A9C91B00B60B0D52CB088B9E0000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000097048597300000EC400000EC401952B0E1B00000074494441544889
              63FCFFFF3F032D010B030303437474344D6C59BA7429230B1287AA8647474733
              3030407D00039E6B5B096A5CC4FD88A01A518F9970360B1E755401A3168C5A30
              D42C48B9624B5043B500174135B33C7058400B306AC1A80543CD82E07A3B821A
              82C9B5005687521B30D2BAD90200C7A516B5D57D61C20000000049454E44AE42
              6082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F4000000097048597300000EC400000EC401952B0E1B0000014D494441545885
              ED97BB4EC33014863F5F94969BC48C94770031568C7D071898982D3130F10E48
              45911861436285D740205859107D084A696D864049E2C651079222E59F92F327
              3E5F8E732C5B38E768521AC018D30845922442676EEACC3D34C6C4F05D8126E5
              01F4AE4FE9EA2817B39909BA597B0D0EF876F10C805072AEBF7B770F10970274
              75C44A01609AF95185EE040116D5F24D410BD03880C361B185D8AF44C1F3642B
              FC2A80BAE50198873E3A9ADFC300C79BEBC101FB67E700384AD6812A80B19E60
              B5CA0733EBC0AA1A0701D4E8BF4F410BD002E88944CB7C0B894C178C3E378203
              2AF59E5EB8F2560E02DC6EBFD0517E611C028093AD3D3E4A36709184CBA7C760
              C2839D0A80BAE50148400AE13D685D1A4B3F5E793E80735384586C7FBB7C1568
              015A80ABFDA38A570E83EEA057997348E05C9033FF487136CF0CC018F363D6A1
              591ED1F4F1FC0BFE074CE5C4B978F40000000049454E44AE426082}
          end>
      end
      item
        Name = 'recent16'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              61000000D34944415478DA63F4AE5DF79F8100D8DA1CC4884B8E1164003E0584
              00DC0020BD0DC8F7008961510772E50D464646F72D4D818F7119F06F41B93FE3
              DF7FA83EE260616488E9D8C4501A6ACAD0B5EAD443A0213640439E6033E0FFDC
              523F0CAB410644B76F64585AE9CF70FAD67386096B4F3D001A620B3384680356
              D50630FCFEF39FE1DCED170CBD6B4EDE02EA5127CA0036664686D95BCE301CBA
              F2146BCC10340066081352D0825C449201E820B97BD37035E037D00016FA1B00
              1324D60066607C26746EC46A00BECC840EF6000D70053100F8F3B511FAF52CBE
              0000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000F24944415478DA63640002EFDA75FF19C8005B9B831809A961845940
              8C6272008A053E75EBADFFFFFF7F84644318196DB634051E25680190FEBEA0DC
              9FE3EF3FC221C6C1C2C810DDBE91A121CE86A161D1119C96605830B7D48F8318
              57C32C00AA6778F8EC0D43D3D263FF8196D8A25B42150B40006A09864F28B660
              69A53F5CECEE93970C758B4FBC039A254C350BB0807F40B39829B6808D1992AA
              99D01237D0D23F40B35829B6001748EEDE34B016FC87A50A0A2C402942865F10
              51C30290594CB82CA0791C8C5A306A019916C000D082BF400B98483716029881
              456B42E746BC169C07520614798181E106D0024D180700DD7515280C624F1600
              00000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F40000012E4944415478DA63641860C0086378D7AEFB4F0D03B736073192A21E
              C501A46AA67A08801C00A4F702B94E149AFB02887D81E69D21C901408A8D8599
              F9D7CC226FB26CE560616488E9D8C4501C6CCAD0B3E6D43BA09033D01117E8EA
              80E8F68D0C4B2BFD198E5C7DC6307DD3E937406107A023AED2DD013FFEFC6738
              7EF511C39C6D171E03A5EC808E7840770780C0D14B0F18E6EDBC741F1A128FE8
              E28055B5010CBFFF2072F5DEB37719E6EDBA720EE800639A3A8099899161DED6
              330C87AE3C45B5849191E1FFFFFF7F800E60A5A90360808D99918109AD440186
              0CFD1C800D24776F1A7500510EE0063AE02B8D1C80B5A242778000D0011F06D2
              01031E02A30E1875C0A803461D30EA8011EC00A8235869D11E00B515133A3712
              7600D411D4E89A61037B800E7025E8007A030027521E3088053BAA0000000049
              454E44AE426082}
          end>
      end
      item
        Name = 'recent_d16'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              61000001634944415478DA63F4AE5DF79F010FD8DA1CC4884F9E116400214544
              1900A4B701F91E203134352017DE60646474DFD214F8189F01BF1794FBB3FCFD
              87F011070B23434CC72686D2505386AE55A7EE020D71001AF204A701734BFD58
              9025410644B76F64585AE9CF70FAD67386096B4FDD011AE2886C08B201FF8106
              30603360556D00C3EF3FFF19CEDD7EC1D0BBE6244AC0E235808D999161F69633
              0C87AE3CC5193378BD0005AF80381F881581B839B97BD33FA07A36620D006976
              79E028136671F645ED8B4F7FE2800680D42F3E612CD100146B2064400450B3EE
              5F86FFD5208EF5D99760A71F35160747D5FF7F0C35840CA894E063E980690082
              0740CC04C47230030919F017889380862C021AF208C896858ABF066A1623260C
              900DB80F642B40C5EF030D5062404EB6380CA8026A6E47F2C26B20FE8EE20524
              03B0E585A8BA6D59EA7F18FED7E308C47AA272E15123F15AEB732F9B91C58E18
              8AD7DB9C7FD90800BCFAE1223790F3C70000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000002214944415478DA63F4AE5DF79F8104B0B539889114F58C200B48D544
              96053E75EBADFFFFFF7F84083D201F7F646464F4D9D2147894680B80F4F705E5
              FE1C7FFFE10E310E164686E8F68D0C6D09D60C550B8E32002DB12164098A0573
              4BFD38F0298659B0B4D29FE1F6D3B70C0D8B8E10B4846C0B7EFCF9CFF0F0D91B
              86A6A5C7FE032DB1C5650945168000D4129C3E21CB823575010C3F7F23E2EAEE
              93970C758B4FBC039A238CCF82FF400BF099CFC0C6CCC810DBB111A73CB6E44E
              9205304B98B0E41A90CF0859403088F081E4EE4D7F80E6B052CB82FB40DC0FC4
              0140EC446D0BEE01B1E3CF60EDDFEC6BAFBE07B2D700B137D082AD40737C6E39
              AB49A9EDBDF58C5C0B402E7778ECA3CEF3F7FFFFAB407697C2D65BF540BA1468
              4157ED811210BB12880D2D0EDFBB408E05857FC374973DFEFAF325925827D0B0
              8A13B64AAD4076154C50888D4501E89387A45A002A0C5D1F7AAB550273411D92
              F80920B640E24F015A9A4B6E1CEC00E2C007DE6A1540BA1E8BFC64A0E1799444
              32083448F0B1340283E510906D8B247E0E68B831B2424A7C508B1CE648A01B68
              4919B9161C066237A0E1A0F0AF44123F09C4E648FC1EA025A5600B6022C4A6A2
              7F61BACB1F7DFDF902496C12D0B07C60703520C7093015C90353D123640BCE03
              2903021680F341F3A1529E5FFFC0F96072B3430F28384A80B8ABEE4049352875
              010D35353F7CEF0C8A0F48058FDC3564E476DE78822EFEC0555D4A61F74D444E
              26D702620100E9C6662895F909770000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F4000002654944415478DA63640002EFDA75FF1928005B9B8318C9D5CB087300
              25865002501C00A4F702B94E649AF502887D81E69C21CB01408A8D8599F9D7CC
              226F926CE560616488E9D8C4501C6CCAD0B3E6D43BA09033D01117E8EA80E8F6
              8D0C4B2BFD198E5C7DC6307DD3E937406107A023AED2DD013FFEFC67387EF511
              C39C6D171E03A5EC808E7840770780C0D14B0F18E6EDBC741F1A128FE8E28055
              B5010CBFFF2072F3DEB37719E6EDBA720EE800639A3A8099899161DED6330C87
              AE3C4535989191E1FFFFFF7F800E6025D601DC40077C25D50130C0C6CCC8C084
              569280428650F94235076003C9DD9B487200595140C0012445012D1CF00FE800
              E651078C28075C06E25D409C00C4C2F476C02920F690E06379FFE2D31F7D207B
              0FD00142F47200D8F2BBCEF2139839D8E38086F2C86FBDA50274C02EA003C441
              0A4EDB29F3FDFDFFFFE3DF1F3F17599F7E1A4F4D078082DD1E68793FD0726483
              799A1C7A94810EB804B31C260774C442A02312A8E5806E60B0979DB055C2D6AE
              0416D00CCC40895FE8121687EF3152CB01A00688D3335FF517BFFEFD7F458C06
              66464609D343775F52CB012000B2D8851847205B4E4D07C01DF1D847EDDEDFFF
              0C5FB029005AC66F7EF8DE273431AA39E03510BB3EF456BB0A34EC370E354CC0
              B847492BD47200D8F2C73EEAF791533B8E50E00186C2576A3AE02D103B136339
              3647C01B0B4047B092E9805E60362CC1960D8186F3015B497F8169E22BBA1C4A
              36447204393DA32B406C57BD23B79789833D1126084AED0DF6DDCCC082E8D939
              7B6551E4DC815C1A52B53F78CC547A2ED0114940CB258159ED05B21CCC11C8A5
              20D51D400E1870070000ADC5913036D835EE0000000049454E44AE426082}
          end>
      end
      item
        Name = 'ChangeCase'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              61000000097048597300000EC400000EC401952B0E1B000001E249444154388D
              A5924F6B534114C5CFCCDCBC26C43F206EC43F1BFB0944D46D5E86F792200901
              BB7223EA4277B5DA8D0BBB70E5C67E82F60B48058960DEF39128B8B1D0A574A1
              3B5DE8B26020997933D74D129AA6604B2F9CCDE5CE99737F5CC1CC3849D1895E
              030033CFA9D56A9D3FAC7F98E612C471FCD85AFB0CC0D5A3041007198461F8DD
              7BBF582C164F77BBDDBFFF339849D068342E33F3A2F71EDEFB55006BC73230C6
              AC29A5DE33F3EDF11A53837ABDBEE09CDB72CE5501EC12D1DD244976670CBCF7
              0F88E80A1179634C338EE31B49926C8FCD7F30B324A2B3D6DA3FD6DA6F00E4D4
              A056ABDD01B097A6E9CF288A5E0268E679BE0A60090098F99294F24D9AA6466B
              FDD139B73403310CC31D00E7007C01907BEFEF4929D1EBF5C4E493288A6E39E7
              DE7AEF2F0040BFDF173486778A99AF29A59E064170C67B6FACB599B5566BADEF
              6759B6A9B55E77CE2D170A85EB428847CEB9875388799EBF1042F4B32C7BBD0F
              DA86B5F63733AF00D8CCF37C99889EA469BAA3B55E98CC096646A55261A55425
              CBB24FFBA156ABD55FC6988BE572B93E180C3E0441B0AD947A65ADDD62660441
              F0594451C4D65A4829512A956A9D4E2719AFF56E341A359919524A4829BF0E87
              C39B44B447441BC69815227A7EA47B9FA8DD6ED3C1DEDC291FB7FE01D4FC41BA
              051233D00000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000097048597300000EC400000EC401952B0E1B000002E5494441544889
              ED953F889C4518C69F99F966BF3D90F36F1A51100BC52A16A9C5C6DBFB3EE6F6
              5BB8BD420411B450844B113004F247620C2208868490C2CEF2588EDD1BE7DCC2
              C6421B151B41888216E9F48ABB70B7F3ED3BEF6B737BEC5EA242926BC4812966
              78E6F9CDFBCE3B334A4470942D3B52F7FF3E606565E55900B7D6D6D6E2910076
              76767ED25A7F0AE0CC03075455F5624AA909E0D49100EABA7E1F00524AD639D7
              F2DE0F1F2820A55429A5202248299D07704F0075B78BE69C3B3B1E8F3F68341A
              6747A3D125A514E6E6E61EEEF7FBDB87B55555191139C5CCC7016C6BAD370783
              C1E01F01AD564B8C319F87105E5F5858101181B5F6E310C2E9695DBBDD7E3EC6
              F8330032C65C4D29BDC9CCF3D6DACD104209DC25455555BD2222D05A9F070063
              4C20A29299DF033003188FC75F3233ACB52E843074CE5D8A31FE4944C5F2F272
              A3D7EBD57700628C97B5D637BDF7BF0180B5F6021195292538E7DADEFBC194FC
              196686D67A1B00BCF75B8B8B8B482901C0D3007E9D01743A9D4798F944A3D178
              A32CCB5C6B9D7BEFBF2B8A628B881E4B295D007000C8B2EC0563CC53DEFB6F9D
              7315115DDE3707007DC71938E7AEC41857B5D63351890844044A29349BCD6383
              C1E08FA9352F13D15722A2ADB56F13D18D9412E6E7E79FEBF57A376722188FC7
              ABD6DAEB799E9FC9B26C6E7F9A638C76341ADD121110D139002701A02CCB7331
              C68B799E7F11427000D06AB56E4C7B1E00DAEDF66BFBD5727A7D7DFD36809992
              2C8A6293880A665E0570D239F710115DB4D662627E68B3B380BAAE3FD15A7FDD
              EFF76F1F1603409EE71F125191524259962BC6985F4404CC3C9DE2C7272967E6
              9D4EA7E39488C039F7CEDEDEDEF53CCF3F0A21FCEDBB33B9135AEB381C0E9B93
              B131E677A5D437CCFCEAE4BC8C315B4AA91FD4D2D2D28F755D1F9F3C0BD65A6C
              6C6CA869E36EB7FBEEEEEEEE3566C644A7B58631E6ADBAAE3F9B40ADB54FA694
              D689E8A52CCBBE0F219C38A890FBE9DD6EF78943E3470F2AEFFF4FFFDFDA5F15
              67CBB286EF307F0000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F4000000097048597300000EC400000EC401952B0E1B0000042D494441545885
              ED974D881C5510C7FFFDFABD9E75632498A018100473081EA241620C06720944
              83609CC1E9D7333B3BEC7A5244147230C66C129288412107352789B8B399EEDE
              F801C941D418885E424E891EE24150F4E0411184ACC97655BFF290E930EECE4C
              36B0663DA4E04153EFD5AB5F5575BD7EED89089652F4927ABF0DF07F008088DC
              70341A8D955114B517B2F66687B7902EB0D6BE7DF5EAD59DC3C3C30FB5DBED4B
              8B998005958088767A9E0766DE0BC0DE52805AADF69C730E00C0CCE16203DCB0
              04D56AF51211ADF53C0F228252A9F4529224EF2F16C0C00C8C8C8C3C40446BB5
              D660660080736E02C0AD0120A27D00A0B5DE96E7F917220222BA278AA247E238
              BEB010078D46E3510043007E6DB55ABFDC140033378D317FC671FC65B55A3D4B
              445B0020CFF30900E57E76B55A6D9899CF30F346E05AAB0340A55281D6BA99A6
              E9E40D01ACB52F3AE7A0B5DE03004AA90300B674C09EED67373232A267676767
              9C730882E013ADF5A888DCCBCC5F11D18359967D1445D1CF711C7F3310C039B7
              5F2985344D8F024092245F572A952BCEB93B4404D6DA9D4992BCD3C3EEBDA26B
              B4D6E3C78F1FFF1BC04FB55AAD4C44173B6B5E06D01FA05EAF6F20A25541107C
              D8AD37C6BC393B3B7B0000F23CDF0D601E8088AC0300CFF3E0FB7E50E8DBEDF6
              77E572B928C7FD85BE270011ED0500DFF77775EB932439582E970F8808987945
              14458FC7717CAE7B8D52EA84526A93D6FACCE4E4E41F85DE5A7B57772CC5C3BC
              73A0D168F8333333ACB5FE5129B5492975B7D61A799E23CFF3BF44E4E32CCB36
              7732F2F9F4F4F4F65E41141245D193CCFC569EE70F17BE8220B890A6E9FA9E19
              20A23D9D765B03E0F7419B33F353B55A4DB5DB6D37772E0CC36D2272829997FB
              BE7F310882C7B22C3B3F37E05E006F28A5D8185331C62CEB313F93E7F914332F
              171138E776013834C7F9675996ED504A51A9545A17C7F1F700502ECFEFDC7F01
              D4EBF5EDCE393F0882C349929CEC17B9B5F608334F00409EE7AF77038461782C
              CBB21D9EE7210882A1388EE765A72F0011EDF33C0FC698FD838C8C3107B32C9B
              E8BC8CC3D6DA2D49929CEDEC3106005AEB53FD9C8B88370FA05EAFAF66E60D5A
              EB33535353570601B45A2DAA56ABA789682B0038E70E01D81C45D1DAAE1AAF1A
              B0850280D1D1D115D70198795244A0947A7790F3427CDFFF8088B67A9E07227A
              220CC335699AFE50F43A116DB2D6969324F9D45AFB34119D2AE044647518861B
              44E4BC57AFD74B44B427CBB2DD00608C99F67DFF95388E7FEBE73C8AA265CEB9
              A359968D5E0F49A9CC187397889C2EDA14B8762039E7502A958E38E75E2DBEAA
              2282A1A1A1A667AD9542D96D542A950EB75AADD7E63A1F1F1FDF78F9F2E573BD
              EE114A29F8BE7F27337FCBCCEB3B198531E69924494E86617894885EF03C0F5A
              EBE7D3343DB6E897CC62349BCDE5CD66F3BEB9FAB1B1B195377D29FD2F65C9FF
              0B6E032C39C03F9A99D4781F083A730000000049454E44AE426082}
          end>
      end
      item
        Name = 'LowerCase'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              610000017E4944415478DACD92BF4BC34014C7EF5D6A2CA2254A41A8A08BB8D8
              D6C1FE156E2D4D11670521757011FF000727414815C1415C53174727FF0097FE
              404444671DB4DA34B64DEE9E2FA50D451D44513C38EEFDBACFDDFBDE01FBE180
              FF0B48E4AD2DAE84B64BBB69FBBB801601C60950FB1220B9568C3189D172412F
              F7000C780251B2AAA95FF7EA660D2BA6308C940BB9AB0010CF17A3C0F09E4C14
              42EC5CEE2F6E1000C9F7688600D90A810F29B644FE7197B55031F5B3E0067386
              A5B9888EC2C1A144A8D3028309042111F94337E67289A3B546C3D1348D537B5E
              00A0A4438BEADF8A8A957E0DC86E03F014B5734139F58306F1BCF54CC6F94BDD
              4E4746869B7ED17B0022A600E0730015D46959A70D475278CDA005E0534C085B
              727822F820C1DB24EC18E7DC61AE1B2EEDE56CE82A3BC981DD9129680E9068F3
              08B0499A663AA7205BF5454C1AD632023BF0C5A668A662664FFB9EF164A6D97A
              7D54D5B0A320AAC8648471C543894395827E13686558D3049755337BFBBB5FF9
              CF006F22F6BA11D3E697320000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000002B84944415478DAED944B48546114C7CFF9EE34E2A485BA0B1F3D70E1
              6BDC5404BD68D9D29C915AD4A6229D19194ACADE44101491A4CE88D28B1612DD
              31A455D0262191080A9D51901E668B28A28D39E28CE3FD4EFFA9C96C34DB28B5
              F0C2E57EDF771EBFF39DC7655AE28797018B02707ACCF56228C5AC46C22D7BF4
              A2032ABCA146689E6765E402105F7C802F74191F3F003900C4FE5F80B3FEC11A
              D1D64626FE120EBAFBD20142BC9348E710A9678301D7D86CDB528F59802A9529
              2D9FC26D35FD730065DE50A1621AC55292E75AEBCE787CCAF7E6D6FEB114E078
              4AA620EE65913A043154EEEB5AC1A45D38EBFC698BB72E127077A4035603F011
              1A2E112940CBB489D0EEC1A0FB710AD000FBBDC49C0D373700680F076BEA2B7C
              5D4E9CBF24910BA4B86F6A2A919F61CF1809B756F7CE4D91C7CCC2F5A22575F7
              6D3643C500AB1D0CB86FCED4803897D89A26E164BAAE204A03B228DCBC525A6F
              1D68AB992C3EDCA91C0E070F34575973013E73179C3EC2B1914AC5B148C0D58C
              280110BF326C39308CC1E976C87B50F452D40CF9E6DBD0F32E5864E4B2904946
              2CCB7A886DC4308CB31037CC0F303743D6C742DB84A90729BB1609BACFFC0510
              8A62F33A9198AE1AEED8378A2831507CE20F801D903DD15A8AD1394330BF8B74
              D52E0880C3497CDAA178B4D2DF6D686B1A7B3E0940D30C80551E59565C331F81
              65CBD7F1A83D3B6BE53820EF85D4A6486BF544A5AFCB20ADEDC97AA403C6B1EB
              C7754F31F30674D21D08AFB296735AA98B00A08BE800BA25814EBA87F434A14D
              1B9D5E738B30A363F812749E266D49CB67C8BA7F0360508A0CC5EFB0FCF13363
              6E81331F80C5581F82F1E95937C71C90273907951ED3AE151FC459F0D71C7C6F
              8EEBF34D720989553431197B9E99E99840AFAF452B7D10D1F96433E2882C0FB3
              B10A11BF489FE4726FA814CED641F616B2E1797F154BF12C03FE3DE01BF7294F
              28BAE0FF2D0000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F4000000017352474200AECE1CE90000000467414D410000B18F0BFC61050000
              00097048597300000EC400000EC401952B0E1B0000001974455874536F667477
              617265007061696E742E6E657420342E302E3231F1206995000001FA49444154
              5847ED5421500331107C8944E240320CFF45229195481C48A6FD0C95C83A2412
              59D9E9E73B95C84A24B2125989AC84DBFB4D9AF26D4905C5FCCE6426B95CEE36
              97BD240D1A34D815AD4E71911ADB6F3D4C0E69DA2FD2BCBCCB4CF925044E68DA
              2F1A027F4E00E2CABAC54D96978FADAEBDA2D9C31138CFCB5319D7A9297A9873
              BB86B34E71E4FC20609AD7038124F81C0982313DBE1D1CD0C513484DF91EFAC1
              4E178FCC8CDAB2B758F133F689DB759000820FD16A2E4918DC119031A7CF8BCC
              35497843C65AA4B9FD4452F866B97D93CA3ED3653DC2B2A37C082C495F695A6A
              2048C69B0A293BA12941A29F7EA8249E98CB3848D0192AC1E54611EAEDC4CEA5
              9CC3ED97C477828A506E83004A202F3FB8B591809698760CCC21646EC70389F5
              70306208645D7BAFBE667C8967E4B99A30B702ED5225B513A7FCCC8C07711528
              7A6A9737F79A904A723B0E503F0E427C34ED40A07A02F63DBBC9F6B91D07884D
              12AC08279A80EAA55C608EEAC147C65437635155C0CEB8D45F11C95D60C01308
              DAB52ABBA85EFE049ABC96A0099A345ED89635B8E00884F74345B0D6843CE87D
              820F06F3D0072029F5C39F503D91B6F4902E75E0FD5C303D8C27911BC8DCDF8E
              04E417FCFD2B766457C6AF3F217A58FA174A769D0051B99257371BB5514EFD2F
              A4FDB08FBD7550418A0FC86CF36BD0A0C13F2149BE01899EBFD8EEE4B9660000
              000049454E44AE426082}
          end>
      end
      item
        Name = 'UpperCase'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              61000001B04944415478DACD53CD2B4451143FE7BEE7BD7C2B92859AB2982863
              3616161616A2ECE4CD9492B22065E40FB1C28C940D856406B1B0C01F20A5C6CC
              2464C16E9495AF18EFDDE3DCF11E33B162E3D6EBDCF3BBBFF33B5F3D843F1EFC
              3F026D939B8D80A4A766ADEB0F3F31CEA6018832A96828E1F10291789F236597
              26B4A374D4DAC282870725988E862A5CFF8D8DFA4ADE6C7BF47C6170A935B211
              46C03522CA212230B7AC50E05559064D4F80EF256D91440F01EDF0BD54612844
              4B6A76E0AAA885E0D4B62E1DFB59F9F70F8FE6CDF288546402ACE644D3DCC630
              49F2A1C05B25FA6D068148A29349FBEC09063AB8E7A4DB82F860918F48D420D0
              895761B1C044FC9933599CB11E80624C2AF75AF08FAD36998671C17890E949C6
              8C1F2AC867B35D5F289227E0BE3B02B05602DD31A61709F8C756EA4CC3CC7268
              771E213874249569029F0A2AB854812C9423022B130BEDF29AFB5273D61E72FF
              43447231130B977E6D037B59E9C09D0112705034B4D532BEDEAEEBDA316352A5
              129A5E89C189788D1442A6E706EEF31B619F076A4BC42A8E3640D7B3A733FD2F
              9FEB9EDCAC02729A1D09C9B3F970EE1FFD0BBF3DEF7B45C866AF69FD38000000
              0049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000003564944415478DAED935D48536118C7DFE73DDBD82CBB282824B20F32
              AAB17911147413D44D46412DCFCA3E084225DC2CCDA0AE4219611FF4353743B4
              A252A3B3F521D4555D74613741D436B3EF0F84200ACA5AC8A69CF3F43FAB6C0E
              15BC906E1ABC3B87F73DCFFFF77CFC5F1293FCA3FF8009018AF7DD9478D89879
              301EF418131543BC7D6060805FB56E4F8F0A70F9A33304F12ABC76279AD44F59
              FBC784E0E5BF039EE0FF423C549A1811EBD3B60A29CB0C5D9F2EA512C3D69944
              A8F4752EC005A147A65822E47DF2773F32888782A563F561F50F0E0DED7CD1B2
              EDD9D22A4D51A45001ED44E5E639131112A17548E2DE0880BB4ADBC8926E90C1
              9E78B3F7560EE04822A436B8FCDA7721E457006A5EB494DD74FAB40592288273
              673A3DB880A1EFB0DB253492B1B0DA9F5381760A99D4128B93F1B07A603480DB
              1F9D0791972CA8BC27547A1931658869272917C6839BDF8D3964F7DE1B0A1B7A
              0AAFB7B1D67FFB9EB4F55DDECDD90083C55129A944309B19AF300CEE453B1AD1
              113FE0D6715DE4AABEBE50B0F11CC1E582A82D9D4ACF7DD9B6E34316E001D663
              AC6A44A152D1288C8CC219B47D0B66E6181FE08FEE81781019997D44A95C86A0
              68CE904D4989A84B383FC88C7A843887C4D626C2DEBC3101C5559ACD204AA2D4
              FA78486D04AC15023BA562C98B9DDD649800808FC49B4A1B16557614D8ACD6F7
              7049272C7D0812CD9028418BC606B87DDA6278AB07C32DC170EFBAAA23958245
              58909C9368DAFC311B3077D7457238ECB5568BE538B1817B43A731F06D00D8C7
              04387DD7BC92E4D5DF2DE04C1B3267B40697E57E36E0D7F7DA1E58338C5E3998
              4400FEAF03C0322AA0A8E28A4D914AC06AB5EE8764C5F0098BF320D5C1294145
              52EA0FA0A8A23D4F4A19409BF69ACE017C3DBEEEC2F71E9DF9766FB357775747
              E7A03205B67D4F6EBF361B25BE45BAA7D1FF437F5DA545986903B39885497E06
              E08E2904031442EC30F61B7AC26AA0A8A26326602D18B7F96D0DE6F803D9B540
              BF1E9013E4F2459621F387A954DAF3AA6D47D7F0BDF0693598CB09882DC1792F
              B6B25A40D70CE6834FC36A9F3993FCFC7C27098E65B9129E11AB0529DD54EC8B
              4C85D07CAC3718E8C01F09731FB62DC4EB3B9DA8001E9D9639B058FAE0AC2FB9
              BDC63D9A82CC570AC3B0E82CBAD1AAE4887B3059BFFF807F0FF80933B87EC2DA
              79692E0000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F4000000017352474200AECE1CE90000000467414D410000B18F0BFC61050000
              00097048597300000EC400000EC401952B0E1B0000001974455874536F667477
              617265007061696E742E6E657420342E302E3231F12069950000024849444154
              5847ED552D4F034110AD442271201BC25D91486425120792B4770189E41F5422
              2B9BF6B6A94456229195C84AE4C9326F766699BBDB7E902010F7924D6F666766
              DFCEC7B6D3A2458B187A8F8B632C11FF0414EFECF46E7C24E26E2499BB4FF2D9
              938815A4F97C9CE66EF3B38A559AB967D96E201DCE6E93DC7D189F35E2CB761C
              FE90622162054D027E2579F1222601693EEDD35E59B7450C318923C98A2F2C11
              2B500222F221B0255D69537C3E989D40075BDC58F760DF1B16D76C14436F30BB
              F42CDD06DFA20EA81300547791B9AEA83A28211F1EC9CC4EC0416EB489D5364A
              80ECEA04D2AC78275DF9EB6626A725EA2F8DB31475403C036E4969FE1451D38F
              2C36FC77026CE1C8E9CBDC88BE2B75052C01DC9888BE7A9F9F546B197F9D7E0A
              7803470408DFB5865102761189896C33D477DB286F05826BF7E3E1F041AAB730
              04A8545CAE55FD30743DDBD01B20AAC3803ADAF9F772B58EB11E00497F60F1C0
              B210C02F1B1C82307EA6F3F530DBC93102E8139E1CEA7CC8F20045A7682B746E
              6DCD55879A8A2A4A0090A959E3DB5C66C49B87801C50D34A73856502ED2150E2
              5BA6A9440979731F904276A020FC10D945A9855E4C7796A06A572C60177B761B
              8F93D60C078A2A4003E171F1729300FCA0B3990AA34859505F80FF3B0C51061C
              611C63AB7DA01DAD0468F1184AEA2197F6209F15F7863DC9CE449E67B6C5988B
              291DE2C7ADF1EA01A1A1E860C8864058F04FF2F9153B1820D586A02EFA879CF6
              C5C403378F0550601F44F04DA9EDB2ACCBDE640B109BCB440F93CD528B162DFE
              013A9D6FCDC60D94E6E25BA90000000049454E44AE426082}
          end>
      end
      item
        Name = 'MSGAdd'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              61000001274944415478DA63ECF45BFE9F810C50BE29921144330E0303323333
              FF4F9D3A95819191119FFA1BC89CACAC2C8DE9D3A7E337A0B0B09E81999919A4
              311188CF03F1AFBF7FFF32F4F737B2020DD0041A7011C380929226865FBF7E02
              1535319497B72EE9E9A98BF75DD92C05320F882DA1661F07E2FE2D11754F500C
              0081FFFFFFC3E8BB40C3D4EE58B00403B9BD402C8BE6A5C7405C0C3464352E2F
              38026DBE03A48FC1346F0EAF65B8F9F60943C99EF9C886586133E006D0FFA640
              DB1B81EC229820160340A00F6E407E7E0D5864D2A4D61B40E7EBDC34653C0CF2
              37482336007421383C70B94007E802B0013D2E896041756119B00B6000EA12EC
              0600B109D08626A2BC909191F11F4B22B27F6C2F798FA840C497FC7C56348512
              8C4606020068880CBE84040011EAB1B38F4502D80000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000001DD4944415478DA63ECF45BFE9F8106A07C53242388661CB560E02DC8
              C8C8F83F7DFA74AA1A0E349361E6CC99C3D1827FFFFEC115FDFFFF1F4E837062
              620EC3EFDFBF711ACACACACAB064C94CE27C101E9E04672F5B361B6C4174741A
              C3CA95F3705A00D20393C76901CCB5D87C41150B905D8EEC0310888FCFC21644
              3F81F830105F0606D17F60106903D9F640333970FA00DDF520C0C4C4846E3048
              72E6AD77CF5A6A0F2C8900B2ED406601F1D1628B8045F39AFACA811614802D48
              4F4FFF3F63C60C521209C8F0D4F0755D205BA700311B9A3CC89BC5AB82CB2713
              65414C4C3A7AD0CC6008D73807A467C1044234AD19FEFDFFC7B0EEC671647585
              404B26A058000A9688886486152BE6826950A481E2454B4B1E1EE6DFB99894EF
              2BB3DF4376F9CAA032863FFFFE32446FE845B6E00F10F3A358004B09C82902CD
              82DDD774397702E91E6493705800028DA406513F30785480B42F28584281181B
              5879F530C3BA9BE0E0DA4B6A24F702235703487B1369C13E522DD80EB4E00890
              6E2532883A48B5E0FB9EFB1795679FDFF908C8662160C15F2016016734E44C45
              04E87EEFA6F4064877C2047024D34660326D6024C5646410B6B6B30A48350131
              339A14A8486E031A5E0BE2906D01D412212005B2C8122A741A885B8086BF81A9
              0100AE67410A92CA1B500000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F4000001F94944415478DA63641860C038E00EE8F45BFE9FDE96966F8A847B7C
              D401A30E60CCC8C8F83F7DFA74BA58FCFFFF7F86ACAC2C861933668C3A60103B
              E0DFBF7F281AD00D00E1C4C41C86DFBF7F1365292B2B2BC3922533490F81F0F0
              240CB1A54B6781E9E8E83486952BE711E500903930B5443900E64B6CC10713A7
              A903B0F91C06962D9B0D3684E621808D8DCC8F8FCFA27D1AA0005C04E23940BC
              0F88EF3240AA7C652076063A2015E8001D5A39E0071017C76EEC3BFDEBEF9FC9
              40B60110B343E57E02F1797666D66CEE1DB76C800E98446D07802CF00E5FD715
              0CA433187037744071386955707901B51D9003B45C134867230B2E0B28616066
              6262885CDFCDF00F353DF5031D514492036262D27125BCCB0C216A09409BCEA0
              FB1C8F03401C1DA023AEA13800946556AC98CB1011910CA761590824A7A5258F
              CD01F9D774392380B425BA041E0780C061A003ECB09603204B91F32F0107E802
              1D00F23D3B890EF80E74001735A2808B215CE31B88B13CB0948189117F43FB2F
              B0AE89DAD0038E06A00398A89108B9800970401DA00B7400EDA3000FC8073A20
              12485B90E800EC89900C70396E637FC2CFBFBFC9CF8694D80E0539EF5C15310A
              A2457E850C4C4007C46DECC35D1051C17238085BDB3905486531E02F8A27022D
              2F840950BD730A748431909ACA8059199D03390E68F90564F503DE3B0600840E
              A030B15832A50000000049454E44AE426082}
          end>
      end
      item
        Name = 'Mailing'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              61000000097048597300000EC400000EC401952B0E1B0000030A49444154388D
              A592696C0C6118C7FFEFCCBCB3B39DED6E4FD16D24755582A00475D6D538A3EA
              0845D052949012492555218E9054A4A121713652ADDA20A82F52422925524A49
              6CE9BABA6DD7D563D6ECCEF1FA203622C207BFCFCFFF97E7228C31FC64CFB93A
              AEF052FD4889F28B75938D01431C003F4750AF6A466971CED86B4B27F4F1E317
              8450B8A22E71F7F9C7BBC2AD74BA3F68B8C7F5EF5E25F2DC5B4210D5D61E18E3
              F67E2DCD2CBA55639AE6FA6593129FFFCC11C618F654D4F5DD7DEEF10949E4E3
              260C8CDB7E313FB50C00AA9E7C700A3CC7DF7AE60D165D6E489144BEB0ADFDDB
              1BD7F63933D292A23B430232FB7879842C8E9E3C386EA16B6BEABD921BEE1979
              A76AD394803E8423840A3CD72689FC590051000EF89994F5A5646E0900086B8B
              AB931C61745EEA90F8828ABCC9F786E65ED8D4E8ED2C08B3F0E18490F3362B8D
              013055D58C0F01CDC8972D428E6C155601F82170D578165B45C1F7B2B9BD6CF8
              E64B69EF3FFA77845BE9E7665FD7B427C5F39F8FCDBBB2880A5C6AE694BEAF0A
              33935BA66CABF43D6BD107849668A17C8A66982DAF5B3A5BC32CC2022A70F666
              5F5706AB5CFD000074C3ECC57324181F65F30040ADDB07BB23CA0809829AE11C
              3FA0FBCB7533FBC7CEDD7B7D906EB026CFC98CA700E069EDB013208331D664B3
              F02FD61DB963A71C89D70D561D128894FF5AFDA255AEAA6FB6D8ACA2A6A85A44
              ADBBAD37007FCFACF29DCE585B82AA198FDE7D52785533363110E788C4D8D5A1
              333A97971E05301BC07C00E900B628AAE6D1745311299FC071E4BE44F9645533
              1A75C38CE950822E76253B37D481A26AA76589AE01300FC03100418E90A48066
              741C5899BCADD1DBFEF054953B47D74D79CEA88447FD9C0ED7AF9F481863A0E9
              278E747358B300ECFF16D08FEE5B31A2A3478CAC4C1FD6830180987ED29E91D2
              3B58929BA2E237040038B6615C7EF6A16ABD9BC39A47056E89EBEEEB1A9B449B
              0E5736D815551B24512E32A957740180AB7F14AC9894F83932327A6366D1ED33
              729890FDD4AB4F34CDE02C42B82E42D040E58883922DE2E6EFE1D008FF83F0EF
              92BFF31DE6CE4605AC2DB63E0000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000097048597300000EC400000EC401952B0E1B000005B5494441544889
              AD927950955518C69F73BEF32D7E17102E240A2ACB60E212E00AA2D9A263944B
              A95393A5AD2EA34E2A6A698E4D3A8ED46499D9E448384E8DA86135532A4A9639
              25A8486694808181802C2AEB850BF77ECB39FDD14551B166AAE7AF73BEF3BECF
              EF7B9F7989100277D3B2F43CFDBBC2BA071546A70018C9390F0520534A1B005C
              E8F09A39A933EEFB76F1D4A1CD77F3203D0136679D8FF8F070D142A7BFB64C61
              D4CFB239848017041E0004020A25D02489C26358ED4DEDC6960F1626A5CF9918
              73F56F013B8F96B00DFBCE4D0D74A8699A220DB56CDE6A58BC3421DA795261EC
              6701710D002584F46D69F78E2DAB691DAFC83456A2546D7079BED93A3F29F5A9
              09D1253D02761E2D6169077E79C1E9AFBE0D20D86358A7474487640438E43DE9
              4BEFB77A1A3F35E374EFAAEBEE15A5B52D0B254AC31A5C9EEFB6BC34F6B93913
              63EAEE00F49D9739AD6F90FE2980A04EC3CA1A3ED0F9E697EB269776151EC82D
              8F20844402F007004689DBBF975C9BF37375F5D767AAE6690ADD24517A4FA3CB
              B3B9FA9367D6DF02D89475BEFFDE1397B235458AEB34ACECF8A8E0570EAC9954
              0100BB8E5D8CDF71A464BACB6D241242060308F2F5B601A80570E8F1A4819915
              F5ED1B4A6B5B5E9628F51A548F2CDE967215001800EC385CF45C68901EE731AC
              F28428E7D62C9FF9C4B5879EAE6BEA58D64B65E3FC7AC9B727140220CAEDB13A
              53460EC83CFE4BCD6725579A1F9528C235599A0E601700B01519A795207F75B9
              65738C880939BE7FF5C3DF03C0036B0FCF6D7479373B34792000B4779A678410
              7B2925D71C9A3C0AC06B006058764587D76A6C37AC1F6D5B3480219C52927203
              70ECFC95710A93FA18A65DD72F50CFF6C5925CD3E45EE5E733AF6FEED89CB331
              E5E384E8902A0018B430CBCFA1C9F09A365E987C6FE58CC408CF8CC408CC4CFB
              B6B9ACA6150C18D43526539834C9776E6212CDFDE1421DD971A46496AEB204DF
              9F67E66C7C744B4274702B0034B4766A962D12008073D114EED42BBBCC7AEB4A
              87F8EBBB7A0300600400983677BFF3E2D8C6233F55C6BBDCC6785FE6768BDBD8
              D6650E00BA262B00E27CD77A2E50DDF556507A3D804904001ABA03424D8B63FC
              D0BEAD00E0F6F248DFB6A0ADC338796EDB1337761A00C29FDF171AD1C7EF01DF
              B5064039002CCF38750F17C2490805A5E4D44D80108410C0ED31190050221CF0
              ED3A80B60EAF657615575D6B9383FC940DDD78F512255700A0D36B4DA384F4F3
              A5F1C54D00A5750C1C85154D8100A0ABB21B801B406F49A243CA6A5D3100DA74
              95E9A353BF5A141EEC78A6AB9952D2B9E09158B122E3F49013BFD62F70682CA8
              D36BE5FDBE7DCAD99B00CECF8290E98C9280759F160C9F383CB4C4E6BC0840B2
              AEB298D5BBF3DFB56D9E07607078B063060013C0750061AA2CC50F59FCF9EB84
              60A6436363DC1EAB26F1DE9055DD23651ED3CED614B6895212F6C755D7ECB4E7
              C76C1C33A86C4FE1E5A6584D969CBACA920124038010A2C563D8BB015C912879
              5791A5445596120D8B8BD60E237FCA88FE6FA52F9D90DF1D403ECA2EA6DB0FFE
              96A7292CC96BDABFC6453AE73D3921FAE2E7B9E5CF16945D7F5CA2B43F000310
              95B6CDB3DF98336ABF6973FFD29A9697BEC8AD880521E663A307940D1B18786C
              E9D461C5B84D4408813E733353C29CFA4100B2C7B40FC7473A5766AD99549673
              AEAA5F9BC70E03B8E93544CDDC87621ABB371FCCBF2C9BB6C0ECE428F376E35B
              00FB7FBC24BFBAFBECEA90002D0D00F79AF6A9B828677A686F7DDFF645E3784F
              8D4B76E40D5215C9F9FEFCA4FC9EDE6F0100C081DC72C7CA5D67968404681B01
              F4B26CDE6858FC52EC80C082008D950A429AC1853F2108777BACB8A2EA9638D3
              E29756CFBA6FD5D2A9C30AEF06605D87A72644BB6DCEDF5BFEF199B34E3F65BD
              A6B0C94CA2C1E575AE4401782120404000A80480AE4A68B1789969F11E27BC63
              82DB353CF59B61AA224D03210F418828000A80760095004E1AA6C87E71724CF1
              CAC7A2FE1DE0FF12FBE792FFA63F01A8BC80C11CF11AAF0000000049454E44AE
              426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F4000000097048597300000EC400000EC401952B0E1B00000407494441545885
              EDD75BA816551407F0DFC94FCD4B6A5484DA05F14204A10E8881905A4A9A420E
              592951A14461110E5DCC9E2490EACD898AC0C22E48869423DA0DA432EC214E34
              6A59896861949586A9841A5EBE1EF69C73C669BEA329F9D47AF9F6FEAF356BFD
              F79EB5D6ACAFADD96C3A9D4449D617D37023220CC3209CC401EC423BD661539E
              C6A7775A485B7704A2241B8C4598878167E8F35B3C95A7F1EA73221025D9023C
              8B0125F80872ECC421F4C4608CC1D515176B303F4FE383FF8A409464BDF13AEE
              2CC19F6319D6E7697CA405E1D1780477A147017F899BBA23710A8128C97A612D
              A617D0013C9CA7F1CAEE4E51213209AB7159017D8019ADF2A251D9BF500ABE1B
              D3F234DE7EA6C1214FE38D51924DC126E1F54D177268459D7DE70D4449761BDE
              2EF0DF717D9EC6BBCAC6C50DDD8A191827BCFF06FEC00E7C8677F234DE1625D9
              7D78B978F4670CCBD3F8589540A370DC07CF155813F36A82DF8BA5B8A2E62017
              E12A4CC1A3C5C957E0718CC250CC44564B000F1446B0364FE3774B817BE30DDC
              5113B84EBE833C8D4F4649F61A9E2EF06E093C54C2969682F710CAE99692FEB8
              F0AADEC75E5C2A544D47E6E725DB8F4AEBF1756C1B51928DC38862BF254FE3B2
              832595E03F6076D9264AB211A5E0B0B9B42E27F0B05A02985ADABF5771FC4449
              B70F93F334DE5DF131B6B2EF2490A7F1A128C98E090DAB6F94648D3C8D8F5709
              8C2BEDDB4BEB85E855DA3F5613BC4AE018BEAEB1217C374E54C18690A51DB20B
              A2246BC3ED257C0FDE6CE1382AADB7E7697CB4539164170BA787BD75CDA8A1AB
              63C1FEE277042E2FE11BAA575704E887092528AF985C575A6FAB63DF70EA3577
              5C513561EAAE1EEE47FFD27E6B453FB3B4DED88AC0615D9FDA414269F5ACD85D
              587D304AB2E14295946547493F08F38BED09AC6A45E027A1A5C2F0C2C98F15BB
              5951922DE978BF51928D143E32D519E150A1BF00CB714981AFCAD3F8FB5604B6
              EAAA840985E36F84FEDDD11D47A13D4AB275188239E853E80EA36FB1BE274AB2
              A142679D5460BF08EDB956DAC62E5C3347D7F5ECC035791A37A3247B102FB67A
              B0904F85AEF87C0BFDAFB8394FE3AF5A3968603D0E0AD7390AB3849EFD12AE75
              6A9BEE90A6F07D5820D4F76C4C2CE9FF2A0EB5384FE3DFBA3B415BB3D91425D9
              33585C60BB31264FE3031025D964DC8D91F8135BF0569EC69D195FF48DF1C258
              B61FEDA71BC5AA04060AC3E49002FF0433F3343E7C264ECE45CA03C9446CD055
              825F606E752EF8CF081424E6E255F42EA0A34239BD92A7716D8F8F926C803021
              2D4096A7F1B2B3265038BC012B7165C5768F509EFB84241C2474CC51BAE68A9D
              791A8F3C2702058981785238D5807F18D4CB412CCFD378D139132811E92F94E5
              548C16E6BE7E426BDD2F54CC667C8C0FCF2669BB25703EA4FABFE07F02E75DFE
              06B4375EBCC4BAA4F60000000049454E44AE426082}
          end>
      end
      item
        Name = 'SaveInCode'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              61000000097048597300000EC400000EC401952B0E1B0000016A49444154388D
              9D923D4B034110869F393F3082823649BA60EB158A9D954542EC84E448696993
              345AF9036C4D7501B588A5905CB04E63250841D0E2D04E82365A098922A2B9B1
              D03BA3DC99E034CBCECEFBECBB332BBBB97A0F30F8476C352C19F5376BDBCBCC
              2D2511432205AA4AFBF281E39DD3201700528B893FC50022426A21FE2337FA7D
              F8B9369BCD4840369B45444000FD05E82F1A10574005780D050C70700664AA71
              EF09A05A726E0280EA40072D200B3CBB958298C59AA2DE4900685FDCFF358516
              90368BB50E62745DDB9AF62132C43F6801E96AC2EB20461798025E5CDB9A8490
              1E0C2346BD985FF03D4643D8ACE7236DF78BDD4A41CA796763AB611D843A285B
              CEF9D8F848667FE62D520CEC01A1803B60757FB6F7E2DA05314B8E4688C57FC2
              3530DF07D8AD267844BD1E20AE6D8959ACA95B29887AFA43EC0356805BF53456
              CE3B5DE0902439C4C02CD6143126C26E0E7AA7FE0FEA8B2FE13A70E4DAD67B58
              9FFCF8000EBE9BC183F6468D0000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000097048597300000EC400000EC401952B0E1B00000256494441544889
              AD554D4F1351143DA7256A830D26242C70E5C7BEEDCAB030C002327161B04CDD
              6948D818138B69FF8618DB9D0B135C4ADB71CBCEA0268615D33D2B352C4C8816
              42D045E7B88037BE19A66530DC64F2EE7DF3EE39F7DC37F31E57CB2DE182ADD6
              7169FC918B068FDB8824010049DEBE3389D9E51246AF5D06330CE725293E0280
              02F1F0D71F7C78B38D9DAD5D98F908811D4C2F15901FCF9930944992896396C8
              8FE730BD54C0CED66EB2021B283F9E832490C4C6C6064886714271701C079230
              36310A1290FE61D90426D3BC14003A8E9358518229961B2530728D9938AD023B
              3F8E05C4361900CC46A65560D61BFF14C1A0C4B40A12EC6784C09675B07784B1
              895106FD00F373F367561FF40364B219F67E1C420248FA00E62204768B36D7BA
              985D2ED99FEA9976B07784CDB52E0074253975AFB2575CF104007EA34C5ED051
              E10398A975DC9E9930241105C3FCA43FF9C4DF063053F72AFB76E57EA3CCE28A
              27BE78B01E588B71E223EE276D38495FD24CDDABF40C7828A9512610DB6492C8
              6489E7EB8BA9DB02E014B86D092D3A3E66CCFCAB4A8741205DB97A894FDFDE97
              DD1692FB49E0A67AE0FF8E6B7F18F8A36FFDC9888241BF7A924FB23B0CFCF1F7
              E03AC8CF006E8504B58ECBD5722B18D422CBEF4A9A1E062EE923801B11050050
              F72A99978B6D738984855BEBBE02B84772BF586D2F8099D36D39AE3C026EAA0B
              034392608BB58EEB15ABED2F7ED39D3A21791FB605F804E0A6596CDFC99094FA
              2954DB41A1DA9124149EB516D2E444140CB3D28AF74ED04300BF21F97ED39D4A
              93779ECFF42EA4D77ED37D728E1CFC056EB89B741AEAA3150000000049454E44
              AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F4000000097048597300000EC400000EC401952B0E1B0000027E494441545885
              ED97C16BD3501CC7BF2F6BD7AE6E4CBA83B28B9779901ECC609B070FA3A5872A
              1E244D1161826C7810D1D60CF54F5098ABC4B3C729149B3A77122C58E84D6104
              0643BCE8BC78F1501DD4364DF33CD8D43449639A6CDDC5EFA56D48DFE7F3DE8F
              F77E0959E75E520C3F1141E27F0140E008E03DB108CC9C9B467C6516E3D13008
              219E07A694A2FEA389EAC60E76DFEDB91758BC7E161353639EC17A082138763C
              8CF8328BDDCA1ED0A7D01681C864C837DC98502488E0E8085ACDB63B0163CAE5
              325455F5044EA552AEEE73144824129EE083C451806198A315F85F82432C4177
              530EBB040A809B82C4375C092493494F7073E8DF8F2B82C46FCEDE7DFD936AED
              0959E4C8B07A8102E09A20F19B6CB6D45D7E365BA216817AAD89C91307E7D5AC
              B7145569670489DF62B3A5AA2C72C420A112733B9E5998467C85C5F8D498FF66
              546B2AD58D9D4CEAF6FC9601FA4116B905365BA28461821681038C02409FB999
              F15116B933C0E13D0F38C1C10446CFEBDF6D059880AFFDAF00C8E40A5C3F7868
              E94BA3DB1A6D05EEBCB80C66C49384022003C0091E03F01940ADAF80C7B88597
              019CD6AF3B0A508DE24946B25C1724DE0F3C0A20EC4AC0650685F7C4AF8057B8
              BB5EE017FEFEE185D8D3ABAF6C67DE1510249EE4D3450DC020C79E0660D909BE
              BD7E29A62A6D4738D0590141E2997CBA687B22F639131E01786E7FFF1F38FAD4
              DC56A02341CC128421C81538F37FBE0358EBCCFC96B1B90C0A07004269EFC4F3
              E922FDC749783F57E0D60C4B7F4316B96773F7DE9C5AFA5A8F9AE19AAAD98DD1
              7D37B408B8099B2D55002CEABF6591F3DC360716987FF0F664ABB1FF0DC03E13
              0CCF6D3FBEF8C92B1CF0B20D295D05109745AEE207ACE737FB3117B841D1F548
              0000000049454E44AE426082}
          end>
      end
      item
        Name = 'ResetZoom'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              61000000097048597300000EC400000EC401952B0E1B000001A049444154388D
              8DD33D6854411405E0EF995FD00882BD8D285AD86895D744D1462D444174D0DA
              268A042C324550C4292C0D68250A92A76297CACA8030DA0411B1B39560256294
              8424EBB3D8B7B26ED6E0A92E737FE69CB9678ABAAE95555CCB210D4359C55D98
              C4591CC0367CC23C6673484BBA508CCF4DAFA395431A2DAB781A8FB05B7FFCC0
              D51CD2E3EE011B4D7C01CF308077B88B3768E130A630D1D45ECB21CD7606D4A8
              F1133BF010577248ADEEABCB2A16B88919AC633C87B4D819D0C122CEE017BEE5
              90567A3594557C824B58C8211D1BECC91FC1677C6DD88CF479871B388FA36515
              F70D36F48BAE82158C75B6D28B1CD297B28AAF711C13455DD7FDEAFE1BBD12B6
              4459C5217FB3AD8BF1B9E9883B789A430A5B34AF699B6AA097C142139F2CAB38
              96435AFE47730B439B24E490DE9655FC8043B88DEB7D08ECC476EDADBCC2FE4E
              A268FEC209BC6CCE2673480FFAB018C11CCEE17B33D49F2D94559CC1ADA67E1E
              F7F01EA3DA168E3888555CC60BACFEB5C6B28A5348FA1B089670111FB50D37B8
              C9076515F736EF700A7BB0D1343CC7FD1CD2722367398734FC1B8AFC955C3BEA
              F1350000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000097048597300000EC400000EC401952B0E1B00000309494441544889
              B5964F681D6514C57F273EFA4FC5A445A45590A885528A161517822E2A6F1004
              1175866C6CA1620BA250100A4233D399BA515AA40B75515404419DD9480B0567
              D0EE44C43F0B51CC421453110DA40A566C5ED2D3C59B17C697F79227D8BB99EF
              63EE39E7DEFBDDEFCEC8360041912D9461BC8E86B5F37403F0A8A4C76DDF27E9
              16DB63C06FC057924EDBCEAB28F9932126DB0445D6B17DB18A92F19A5892A66C
              BF044C4A926DF79ECBE0EE7E0E7859D2C9328C175708B4F3B4032C02636518AF
              0F8A6C13F03AB017D0B0C806D83960AA0CE3DFFB05166CB780454937D83E03EC
              69447B51D2BBB6CF489AB1BD044C0281A4FDB66F6C6433033C5045C95C53C035
              D16549A76C1F6C003E029EA9A2647650C841914DD87E0578BA11D039494119C6
              4B00AD1E1930061CA8D700EF4BDA5786F1C2B09A94617C2128B203C079E0688D
              DD031C024EF46740238ACF243D38E8D0865950646FDBDE57F3FC61FB8E2A4AE6
              5B839CAB28B97F54E286BD003C0CDC044C00FB81E36AE7A9578581819BCB30FE
              752D85A0C88E0249BDFDB20CE37B5B00034AD43B17DBBEBD8A9235C96B9E0298
              963466FBCE769E6E1958A206607715253F8E425EDB0C7001D842B781B6AB7131
              AF8AAD9AC1FF221014D993B6730049DF94617CD77F21088AACD3E31A28007CDF
              B85CDB8322DB5C86F1FC88E40B4007D838CCA705CCD8FE05D82669A3EDC780B7
              4624FFCBF638E0FE0E5C5EDBA69DA72781E7EB17DF017757517269942C9AD6CE
              D3CBFD02BD59F41A7010582F6927300D1C19953828B209E08B46A97BF788E536
              6DE7E9AB920ED5CA4B92F69661FCDE08515F077C28E9A1C654BEE65F25EA394A
              FADCF68E3A828EEDE3C0B12A4AFE1912F94EDBEF00F734CAF286A4675708D480
              DB804F805B1B3C3F00A7808F8159BA1DB30B7802980236347CDF048E013FD5FB
              F91537B99DA793C06949BBFABB62C837D974BBE884ED1781AD92666DCF491A1F
              382ADA797AADA469DBCF019BD610F816385C45C9D91ABB55D2D7C0E6328CD7AD
              3A8B8222DB063C053C02EC06AEA73BBE7F063E053E00CE9661DC69605AC0DFBD
              5FA02B5745AA749BC9C8F30000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F4000000097048597300000EC400000EC401952B0E1B0000035E494441545885
              C5D74BA856551407F0DF7D8076F342658F81A4834AD06A10D6A807D131071A81
              11BB209020B2C720A84110542EA3064E22087AD8288CA82352509414BB411654
              54504885946441497129BAD555AFDEDBE09C0F8F9FE7BB7EF733F43F3B6BADBD
              FEFFFD5A7B9DA1D9D959A713A3A795FD640514658CD539FECE296606C931D4DC
              82A28CD99C62A807D910AEC67A5C871538B3761FC64FF8143BF1464E31392F01
              4519B398CA29C65A886FC7A358D9E7C426F102B6E41413271450931FC0C2E60A
              14652CC12BB8BE4FE26EFC8E8D39C59BBD023A676012E34D4751C62ABC83F35B
              C64DE22BFCAC5AFEC5B814CBBAE2CEC38EA28CCD39C513730958D0457E05DEC7
              D95DF11FE019ECCC29A6BB931565ACC4DDB80767D4E6616C2ECA18CE29A27B4C
              670BA63B62728AA1A28C7D58DA88FB03F7E714AFB5CDA245C845785975689B48
              39C5F63905B4E057ACC92976F743DE10B140757E6E6D98FFC48A9C627FC7D021
              6DBD7A98C24DF325879CE26051C61DB800D7D6E6B310B8B713D7598123AABDEA
              C6AA9CE2CBF9923751947121BEC1A2DA74104B738ADF9A0266F45E85268EBBAA
              7D8AD882871BA607728A6739F11634716410F21A2F7609588B6304CC68DF020D
              FFC880E4728ABD45197BB0BC365DD9F10D9DAAE7B828E3693CD8302DC8290E9D
              3201BD300A451923AA92DAC19339C563A74240F335DCAFBAB3F0434E71F1A049
              8B32EEC256BDCFD5614C63BC29E06DAC6B045D92537C3F00F97A6CC7481FE1A3
              CDF2FB6E97808D8EBD3AFD90AFC6AB7D92C34C7305CE553DAF0B6BE73FB82CA7
              F8713E225A44ADC2E73DDCC3DD2DD973B8AF11F0118A9CE2D080E497E3138CB5
              F9738AA1EE1770136EC339F5F735D85694B121A738384FF2E578AB177907C7D5
              81A28C84D7BBE276E1CE9C626F9FE4B7E025472702BFE06647B76326A718692D
              444519A15A8D26A654357D6B4EF16DCB9851DC8887B0BACBFD176EC829BEA8FB
              CFB905D40937E171ED77791FBEC684AA982D51D5F7F196D809ACCD293EABF376
              08A7728AB19E3F2639C5E6A28CDD785ED55C36B1CCF10D681B766143CB4D3AA0
              EE944EF81614652CC623AA4673D19CC147B1074F615B4E710C4151C614D6E714
              3BFB12D01838AEFA2B5A87AB544D6BA7E0FC8BEFF03176E0C36EE2469E3539C5
              7B9DEF815FC3A28C61D58A4CE714530325391901FF17FE03FA0358424AE4CAB4
              0000000049454E44AE426082}
          end>
      end
      item
        Name = 'ZoomT'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              61000000097048597300000EC400000EC401952B0E1B000001EF49444154388D
              95D2B16B137114C0F1EFBBC65668CF34488364B2437070C974526C2B08922905
              411CBD9F3D1515098283FF818383D05441B090DF623717410D75E9548A43261B
              70522A39727589834A85DC73F04E736D45FA96DFEFC7EFBD0FBCC71355250D63
              CC3C700B9801F24008BC0596ACB51F3920445531C68C004F801B801C90F703B8
              6DADB5FF0296813B80160A85CD858585DD52A974220CC39156AB351E45510988
              81CBD6DA1719C0F77D0FD804646E6EEE551004B3AA7A4C4404208E635D5959F9
              BAB1B131097C014E5A6BBFA7400EB80688EBBAED200866817C520B80E338B2B8
              B838D9E9747EF6FBFD2955BD083C1F06CE0054ABD5DD6470FB2297CBE179DE91
              B5B53580B37B0117A0582C1655554544D21320BDBBAE9BBE273338F01998DEDE
              DECE799E270032D4437AEF76BB2440772FF006985F5F5F2FD46A35C6C6C6F6B5
              B0B3B343BBDD2619EAEBE13FF17DBF007C00A6CAE5F2B77ABD3E3E3131F1A785
              300CB5D16848AFD743443E359BCDE90C90ECC105E025707474747450A9549C7C
              3E2F5114B1B5B5C5603018AE7968ADBD9F01008C3133401338B5B7051179AFAA
              A7F9BBA58FACB5F732408238AA7A5E55CFA9EA7155EDC571DC5A5D5D7D678CB9
              C9EF757792F4256BEDDD0CF0BF30C65C079E0E218F0F0524C855E0193002F40F
              0D24C815E00170E91776FCD5EEFB40B0600000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000097048597300000EC400000EC401952B0E1B00000336494441544889
              AD954F685C551487BF33332661FE909A1062C32034929809BAC83682105069A1
              62C5627561BA08867B45CD42C8CA06B35010411194F7642C84096971215D6A9D
              9520641708492889214684809BD6386F52DBD799E322EFC5C7CB7B523167F3B8
              E7DE7BBE777EE7DE7B4455899B31E69488BCA6AAE7808A889C52D53F45644B55
              7F00AEBBAEFBFBB18D09265180B536ABAAEF005744A4478349111155D5F00B78
              C06722F2A1E338F71F0A60ADED02AE0117007998BF037E045E761CE7CEBF028C
              3119E01B11B918FE752693F10706066E8D8D8DF97D7D7D25CFF33AB6B7B7595B
              5B7BCCF7FDAE48663F01CFB9AE7B2F09900BBE6F02AF84CE62B1F8EBCCCCCCED
              72B93C0A7486D24C4C4CD068341ED46AB5FDF5F5F5EE60F933C015E0FDC40C8C
              3179E0676000209FCFFF363F3FFF57A15078224DAA76BBADD56AF5EEEAEA6A21
              70DD05CE388E73ACF039E0BCAA9E065444DAD3D3D3B70B85C2D369C103F96472
              72323F3737F7C0F3BC2CD0252293C0274980E7C3416F6FEF2FC3C3C34F7228AF
              C44F5174633E9F97F1F171EAF57A38F7421A60444404606464E41ED009100D18
              0F1EFA868686B2F57A9D607F2529DB1C500A03F4F4F4149216A559A9543A8289
              48D11893715DB71D07FC110E9ACD66475AB0F0A2457D8D46233AF4E2C143C02D
              E05980CDCDCDCE3440F43687BEADADAD287023695F0EF84E440CC0DEDEDEA33B
              3B3BADC1C1C16C5291A3C10F0E0E647979F9080E7C9F06B8A9AA3BC01920B3B0
              B0707F767636532C168F16C58BDC6AB5585C5CA4D96C86730722B29498B9AA62
              ADBD045C2738FBFDFDFDFED4D454B65C2E1FBB0BFBFBFB2C2D2DB1B1B1117D28
              6F3A8E73361500608C7144C444DE22464747B552A9487777B7789EA7BBBBBBB2
              B2B282EFFB47458FC8F8A9AACEC60B1D05E444E40B559D8EE89A684917504450
              D5CF81F7A290783F10E012F031F0781A00B803DC002E03D9281BF81278D7711C
              3D0608CD18F38888BC1874B4A7828EE6051DAD0E7CEBBA6EC35A7B5955AB402E
              96CD57AAFAB6EBBAAD44C07F3163CC1BC0D722D21193AB0ABCF5BF0100D6DAD7
              811AFFF4173894EBEA890002C8ABAA5A033A2272E98901008C3117814511E90A
              001F9C2800C05AFB12E070789A3EFA1BCCA3B6A7594DDB540000000049454E44
              AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F4000000097048597300000EC400000EC401952B0E1B00000381494441545885
              C5974F6863451CC73F9397D8C6AE687A6A5F4A6994422C2D4DF7D25D853D5858
              0FA2884A438FAD508A27877AF0E0C18B086E61587A5928A2100BB587F50F1E15
              F4A0B82A94B460C5D26ED340FFC0A39E36A9EDBE371EF25E7966F36712EDEE5C
              66DE64DEEFF7F97D7F336F7E115A6B1E658B3E52EFA60052CACBC06BC0552005
              3C0EDC03B6811F81DB4AA98D760044A31448299F073E029E6B624703DF03EF2A
              A57EF9CF0052CA08F021F00E1069C19E0B7C00BCAF9432DA5C0F0048292D6019
              C89E2F1282818101868787E9EDEDD5F1785C944A257D707020F2F9BC5B2C16AD
              2ABB9F006F9A40D4DA0337C2CE7B7A7AF4E4E4A448A552E73C413F3434C4C4C4
              84B5B5B5C5EAEAAAEB384E00320DEC03EF3503F8970252CA17806F0327E9745A
              4F4F4F8B582CA6018410426BAD6BF52727277A6969C9DDD9D9098272816B4AA9
              9F5A516021706EDBB69E999911B1582C1C35420851ABEFECEC14B3B3B3D6C2C2
              C299E33831C0F2ED35DCC0E70A4829AF013FF846999F9FC7B6EDF3289B2910AC
              D9DDDDF5161717AD90B2E38D4E465881D783413A9D26994CD2CE5732954A59FD
              FDFDE542A110F7A7DE008C00AE0683D1D151E041996BCDD55A93C964DC42A110
              3C364C4118E0E960904C263595F4B49C022184E8EBEB0B1FCB674C012E0583AE
              AEAEBAD1992810BCEFB7274C014A400740B95CD68944A26D05CAE5F2FD90DDB2
              29C05D2001707474246CDB6E5B81FDFDFDD390DD5D53809F81CB00EBEBEBF7C7
              C6C6A26D2A403E9F0FDF1F774C01BE00DE02D8D8D8B08E8F8FE9EEEE6E5981C3
              C3C3D2F6F6F69321BB5F9A027C076C02CFBAAE2B565656CEE6E6E6A29148C458
              01CFF3F4F2F2B2A7B50E80FFF0EDD66DD577C1CBC057F89FDEF1F1F1D36C361B
              0B475F0FC0755D2F97CB95F2F9FCA590FDB79552378D017C888F8199E0797070
              F0646A6A2A9A4824EA554FDA719C722E9773F7F6F6AA8FDC5FC08B4AA95F5B01
              E800BE06AE07739665B9232323F732990CB66D47FD7AE0AC582C9EAEADAD89CD
              CDCDA73CCFABAE098C20EA55448F01B7A8DCEBFF47AB0BD1AC267C954A4D3868
              E0E42EB00ACC53BBD0A909D110C08788002F51A98AAF50A98A3B8053DFE91DE0
              36F08D52CA95526681CF4C219A02D4818A29A5CE1AFC6E0CD1168021643388EB
              4AA9DF2E0CC000A2A894EABFD0BF664AA9CFA594D48138A00ED9C380F81D7805
              2E700F54373F1D9F027F52C9FFD14305F021E2C0DF4A292F98FB0754CCF58185
              A326A20000000049454E44AE426082}
          end>
      end
      item
        Name = 'ZoomInT'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              61000000097048597300000EC400000EC401952B0E1B000001E449444154388D
              95934F6813411487BFA90B16B42882DBD882874AB79B1C058B3D15F16844D19B
              202248CC4456F11811951AC9C583A0F189040948F15A3450101182202888881A
              F1DF41252687B407BD04B2EC7848B66CB6ADE2EF34F3E6CDF7E6BD794F196308
              A5B5DE02648043800328E00B500544449689498500ADF57E601E188D3BF5B504
              9C149147AB005AEB7DC022B01108768CEFFC76E962BE05CCDCB8254B9F3FBCDB
              1A04C106C0078E8AC8C31540369BDD0C7C04C62CCBFAE5795EC7711C7B365F05
              A0564CD36AB528954A7EBBDDB68065604A44DA0016700218034C2E97EB388E63
              C7DF9E4824F03CCF2A140AA6DBED6E0372C05C083808B07D34F133994C8EAF93
              3FB66DB37BCF5EF5E2F933800351C02E80B92B97BFCFE6ABAB00612ABD748ED1
              0738A1CD02C27F9C592FFADF64D12BE0E4D56BC5DFB5627E241EB9564CAF38DF
              ABDC0F979FA2800520DD6CFC18A9D7EBA452A93523359B4D5EBF7A196E17A280
              79E0823166A25C2E07994C66C875DD81CB8D460311C1F77DE8F542253C0B1B69
              1A780A6C524A3139E572FEDC59006EDFB9CBFBB76F088220CA5C048E884827DA
              CAD3C0036062AD1494521D63CC70C4F41838AC62C3340C1CA7374C2E30047CA5
              374C15E03A702A02793200F897B4D60A10E0F4400DFE477DC84DE00CC01F1D1F
              B421B4B116AA0000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000097048597300000EC400000EC401952B0E1B00000395494441544889
              B5954D6C545514C77FC7994EE7837666DA4E4D8DDA6009F123B2684965614037
              96685B160891182161F5DEC65919C3A6D526DAC48F85DDBC6BBA61012A1075A1
              063722D5C4264613C22CA446D020D138B4F341AD9DA1331C177DAFBE99BE5621
              F1BF79F7E3DCF33BE7DEF3EE15552548B66DF7AAEA41E00911D9AEAA49115954
              D5CBC057C06963CC8F818B7D926680655919E0351139ACAA110011115555EFEB
              9AD644E48CAABE6C8CB9F69F00B66DEF043E04EEFFB7C87CCA03871CC739B729
              C0B2AC7E11F95255DBFC51B746A3B57BEEED5DEACA74A7CAA552E1DAD52BF1BF
              96965AFD36C04D1179C6719C2F020196657500DF89C8566F0B12894465FFB307
              620303FDB446226B0BEAF55B5C9A9BE3FDF74E96161616529EBD88CCABEA4E63
              CC553F20EC4E8E015BBDA87A7A7A56B2D96C2C994C02B0E7D8A76B0B66268779
              E4E187181F1F4F4D4F4F2FE772B9983B9511913780E71A32B02C2BA3AA3F0371
              119168345A1D1B1B6B4DA7D36B46AB00454438FFFAF0DA78AD56636262A290CF
              E7D3EE76D5801DC6981FFC19EC03E2DEC0F0C86883F3CD140E8779E1F0918EB7
              DF7AF3162040083808BCEA07EC161101088542F5C1C1C150B03B21E897D9D6D7
              474767E79FC542A1DDF5B3BB2108609B7750E98ECE6ADB96447CCFB14FDC803C
              8F5E5B589DFB073A3339CC7DBD0F548B8502AE9FEDCD8084D749265371EE40E9
              CE4CC6D7DDD20CB8E1754AA5E23210E336B5309FBF0E7890C566C09C883C0E50
              2A165ACB371699991C6970B05A4502B06E4E55F9F597CB31582D71A0E17E0A03
              E754F52840BD5EBF6B76F61BF60E0D05C4B95AA6CDBA343747A9588C8B887706
              E79B019F894811E800F8FCECD99B03FDFD914CC3B642501555AB554E9E385116
              91A49B410DF8A001E0384ED9B2AC77805744442A954ACBD4D4542D9BCD86BBBA
              BA36CCA052A9608CA9CCCFCFB703DE4D7BCA18F3534358EE5D14076645648757
              B2B1586C6574745FE4B15DBB88C7A26B0B566A352E5ECC71E6F4A9C572B9DCE6
              BB8B4455BF059E36C62C3400006CDBEE03BE067A1A526C69A975DFDDB3DC99E9
              6E2B150AE5FC1FBF45AB954A04EFD4D7EB7BE029C7710A0D000FA2AA1F018FFA
              1F970D1E1C826CDCF605551D32C65C0F7AD112C04B22F2A2AAA636015444E4B8
              AA6680FD01B00BC0DE75005F3629600478127810680796802BEE567EEC38CEEF
              B66D4780E3C0A10037B90D01B723CBB2426E36CFFB33868047FF4E65DB765855
              A78123FF0BC08300EF0247BDB1BF01D43AC457C3D750CB0000000049454E44AE
              426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F4000000097048597300000EC400000EC401952B0E1B000003AA494441545885
              C5964D68635518869F24AD49935A18C4FE613A357283205A6A1DFF40856A8BD5
              D4AD5494D28D0B41BAF58CEE543E713114DC08EE3A48C1BA516C12942E066D41
              2556C15542A4B5A68E694229344E9ACE242E925B4F33F7DEDC8419E685C0B9EF
              F9CEF73D39E7DE738EA756AB7127D57547ABBB05504A798167809781C780F340
              10F817D8017E06E2C0F722526D07C0E3B4044A290F300FBC073CE0225F06F800
              B82C22AED6D6164029751FF039F0AC9B444DBA02BC2E227F7504A0947A08F816
              18D6FDEEEE6E464747E9EFEF271008502E97C9E7F36C6F6F737272D29CE66F60
              5A447E6F0B402915067E04864C2F140A313939C9C4C4047EBFFFA624954A8554
              2AC5FAFA3AA55249EFBA0A3C29223BAE001A2FDB0FC053A6178944989B9BA3B7
              B7F734EE39F50D00777579F9EEFD974EFD52A9C4CACA0AD96C56AFF113F0B488
              DCB00268FE0ADED48B1B86C1FCFC3C3E9FCFEE0F9C51281462616181E5E565D2
              E9B4693F0EBC057C6235E6740694525DC01F4018A0AFAF8FC5C54582C1E04D83
              EC66C054B95C66696989C3C343D3BA0A9C17914A73AC3E032F9AC501A6A6A62C
              8BBB512010607A7A9AD5D555D31A045E01BE740288998D6030C8F8F87847C54D
              8D8D8D914824383A3AD2F33B025C301BD168D4F5BADBC9E7F36118065B5B5BA6
              F584559C0E306A3606070781FFD7DA4E95EB55DB982B126368684807B8BF1540
              C86CF4F4F4381676AB4020A03FFA9552DD227266C7D201CA801FEA1BCBAD5053
              9EEB8DDF19E9007F020F03ECEFEF03F569B4923EED7631008542417FCC591D50
              3AC02F26402693B14DDA8E9AF26C59C5E80009EA472F0707076432190CC3E8B8
              78369BA5582CEA56B215C0D74011B80720994C1289443AFA1CABD52A894442B7
              4AC0178E0022724D297509F810606F6F8F783CCEECEC6CDB00F1789C5C2EA75B
              9F8AC881234043978037800701363737F17ABDCCCCCCE0F57A5B16AE56AB2493
              493636369ABB8EACE2C1FA3EF008B0019C9EBF232323C46231C2E13076DADDDD
              656D6D8D9D1DCBA3BF06BC2B22D212A001F13CF015DAE6E4F178181E1E261A8D
              32303080DFEFE7F8F8987C3E4F3A9D2697CBD1E28A6F09E174277C145805224E
              59DB540DB828221FB504684084808BC0DBC0DD2E0A1C039F01F702AFBA817004
              D040CE0173C00CF553B31FF034BA8B408AFA3EB22222FF28A57CC0E5C6183B88
              7744E463570016403DD4DF8F6B2252B2896905710338D711805BB5804801176E
              2B8003C46FC00B2252B8ED001AC432F01AF02B3025220570F912DE421003D8D6
              2F25FF014E866C74692AE2C10000000049454E44AE426082}
          end>
      end
      item
        Name = 'ZoomOutT'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              61000000097048597300000EC400000EC401952B0E1B000001D349444154388D
              95934D68134118869F59E21F06AC96A64B4E5AE9BAC955087812F1A862A94711
              1144773418735428D555EC4141A2E0273948A0945E8B160A224241100A222206
              B516058989A0350741D14DD6C37664134DC5F7347FEF33CC37EFA7C230C4486B
              BD0938011C041C40016F8059404464992E2903D05AEF05A680C1EE432BFA0C1C
              13917B7F00B4D67B8039601DD01EB0D38BFEF8D87BA0EFEAF51B836F175FDA61
              18AE0102E09088DCFD0DF03C2F09BC02D296657D29140A3F1DC749C56F69341A
              944AA5AFCD6633092C033B44E4134002380AA481309FCF07DD6600DBB629168B
              49DFF78356ABB5053805F80670006073FFC0BB4C26B3ADC7FB49A552ECCCEDB2
              161E3F02D817076C07B872D95FDA7D6EB62700607EE2B00138662D01987FEC5B
              CDDC4B09A2020E5FB87869EBFCC4D8AA87EF5426CDF0751C3003ECFFD8F8D05F
              AD56C966B37F35D7EB759E3E590889C23513074C01E781A172B9FCC3F3BCB5AE
              EB76986BB51A224210048A280B15B3678294031E021B95520C3B6E583C7B4601
              DCBA5DE6C5F367B4DBED38730E181591EFF128E7806960A84709BE011B62F3FB
              C088EA6AA6F5C011A26672010B58226AA60A700D381E833CE800FC4B5A6B0508
              70B2A306FFA315C84DE034C02F2E84A6E00058BC3B0000000049454E44AE4260
              82}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000097048597300000EC400000EC401952B0E1B00000372494441544889
              B5954D685C5514C77F276F266967269D4CC20CA9C16A4D2D7E60A1A5984D2875
              938A93E2C226B4880A5DBDB7C94E84048A06EC42A2DB77C540BA70A1FDF00B85
              BAB0060503A230108926D06AB4264D5A5BD3742693749AE3666EB8794E4C143C
              9BF7EEBDE79EDFF99F7BDF3BA2AAD4B220081E50D55EE0B088EC55D5B4882CAA
              EA65E02BE0AC3166AAE666C7240AF07D3F0BBC2E222FAA6A3D808888AAAA7D56
              5D2B22724E555F31C65CDD1220088283C00560D7669939360F9C08C3F0D23F02
              7CDF3F20225FAA6AA39BB5178B9572AD6D37D299666F65B9ECCD5E9DDEB1542A
              255C1F604544F261187E5113E0FB7E33F09D88ECB62588C7E3378FF5F4543A3A
              3A72DB1A1AC46EA854EEE9E4D4949C3BFB7E796E6E6E9BF517911BAA7AD018F3
              AB0B8855174F01BB6D568D8D8DBF0F0C0CB4A6D3694F2387E479753CFED8A33C
              DCDFDF303232B25A2814EAAA4B5911790338BE4E81EFFB5955FD19488888789E
              B730383898CA6432756C62954A85A1A121A6A7A76DB92AC03E63CC8FAE826781
              849DC8771F5DC9643275222200F6F6D875F736C5E37139D6D3CB5B6F0EAD0904
              7A81D75CC0211B4044563A3B3BB340ED8FA386ED696FA775E77D5C9B9DA11AE7
              90BB1E03F6D83AA79B328BA964A2F970FFA7026239CEBB006AD50808A3A7F3BA
              EBC187E4DAEC0CD5387BA380A41D249229DC726CC54444B6271BDDA9541470DB
              0ECA4BA5FA6A165B86A8AA96EE2CB8FE8B51C0A48874022CFC792B717BF18E8C
              9EEED6AD1C72F529BF5CB9BCA606988A022EA9EA4980D5D5556F6CEC1B8E7475
              6D55003F4D4E727D7E6E0D0E8C46019F89C82DA019E0F38B17EF1DD8BFBF2E97
              CB6D1A7C7979990BE7CFAF8D45A402BCE7FAD85FC529E0552B3D97CBD1D7D747
              4B4BCB86C1CBE532C3C3C3323131E196ED5D63CC0BB50009604C44F6D92B9B4A
              A5249FEFE6C98E0E4D26B6AF9DC1CADDBB3A3EFE837CF2F147CCCFCFDBB2D82F
              F95BE01963CC1FEB00004110B4035F033BDD0CEA1B1A686BBB9F54BA89A56291
              D999DF28158B6CD4A880EF81AE300C6FAE035888AA7E003CE13697E82D726A2E
              1105F6BDA0AA478C31D76B75B424F0B288F4A96A93BB39D2D1CA22724655B3C0
              73356005E0E9BF011C354DC051E029E01160075004AE544BF9611886B34110D4
              0367801335C28C6F08F837E6FBBE5755F3BCAB186A34FDFF6A4110C454F51DE0
              A5FF056021C0DBC0493BF7174430D13D204D6D800000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F4000000097048597300000EC400000EC401952B0E1B0000038F494441545885
              C5965F685B551CC73F4956729BD4C210FB0FD3D58C1B84A1A5D6F9A7A0836E2D
              2BA6BE4A8752FAB20741FAE283A7FAA8FC44500A3EFAD62105EBCB46BB84411F
              86B63047EC063E2544DAD5B22D4D288546D3D6253E24779C5D6F726FB38D7D21
              70EEEFFECEEFFBC9B9F79EDFF1552A159EA58E3D5377AF004A293FF00EF01EF0
              3A700208017F031BC04DE02AF08B88948F02E06BF40894523E6012F80238E9A1
              5E06F812B824229E9E6D5D00A5D48BC08FC0BB5E0AD9741DF85044FE6A0A4029
              750AB806F4E8F1969616FAFAFAE8E8E8C0300C4AA512B95C8EF5F5750E0F0FED
              65EE02A322F2C79100945211E006D06DC5C2E130C3C3C30C0E0E120C06FF57E4
              E0E080542AC5F2F232C56251BF750F784B44363C01D45EB65F81B7AD58341A65
              626282B6B6B6467F048062B1C8FCFC3CD96C560FFF060C89C803A739F6AFE0A2
              6E6E9A269393930402015773A8AED4D4D414737373A4D3692BFC06F031F0BDD3
              9C872BA0943A06FC094400DADBDB999E9E26140A7932D7552A95989D9D657777
              D70ADD034E88C8813D575F81F39639C0C8C84853E6008661303A3ACAC2C28215
              EA02DE077E6E0410B706A15088818181A6CC2DF5F7F7934824D8DBDBD3EB3704
              386D0D62B198E7E75E4F814000D334595B5BB3426F3AE5E9007DD6A0ABAB0B80
              336AB16980EB12A7BBBB5B0778C90D206C0D5A5B5B9B36D66518867E19544AB5
              88C8233B960E50028250DD589E846C75FEADFD1E910E70077805607B7B1BA82E
              E3E3289FCFEB975B4E0D4A07F8DD02C864328F656CC95667CD29470748506DBD
              ECECEC90C964304DB369F36C364BA150D0434937802B4001781E20994C128D46
              9BFA1CCBE5328944420F15819F9C72EDCD6806F8CABA1E1A1A627C7CFCC8008B
              8B8BACACACE8A16F45E453A75C7B33FA0EF808781960757515BFDFCFD8D8187E
              BFDFD5B85C2E934C26EDE6007B4EF9E07C1E781558011EF6DFDEDE5EE2F13891
              48847ADADCDC646969898D0DC7D65F013E17117105A8419C052EA36D4E3E9F8F
              9E9E1E62B1189D9D9D048341F6F7F7C9E572A4D369B6B6B67039E23B42343A13
              BE062C00D146558FA80A3023225FBB02D420C2C00CF009F09C07837DE007E005
              E0032F100D013490E3C0043046B56B7600BEDAED0290A2BA8FCC8BC87DA55400
              B8549B530FE23311F9C6138003502BD5F7E31F1129D6C9718378001C6F0AC0AB
              5C2052C0E9A70AD000E236704E44F24F1D408398032E00B7801111C983C797F0
              098298C0BA7E28F90F318A5A5CAD6989280000000049454E44AE426082}
          end>
      end
      item
        Name = 'ValCheck'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              61000000097048597300000EC400000EC401952B0E1B000001E549444154388D
              8593CD8A134110C77F3D33CD1209820B113F12FC38C88A2EA241245E3C79F3B0
              01A727427C006F593DF9049E62161F21640E993D44D00750448260BC095E6491
              2C8B115184407667C294874CC224BBD1BA745755D7AFFFDDD5AD440400CFF3CE
              8B481DB80E5CD05A9FF57D7F0FA05AAD9E0EC3700FD8017A4AA947ED76FB2780
              436222F20638071C009F6CDB0EA739CBB20E94521F45E40A705F44D680F53940
              520C7037088277A938CD66F31770D3F3BCDB22F21EB83ACDA5019380E3EC2FC6
              52B9511445F3B123D6A96500A554087C01D6FE05586AAD56EBB331E61A70790E
              608CC9A776D94D17156B9D3CB009940038F3A00B3466EB5DD7FD0A5C4CFC2008
              022F55EC0275A0B020A60F3CE96D95B71DE07B0AB0BAB0733D9BD10580B7CFEE
              0170E7E96B72C7570A3B8361BD58EB749588608C39090C00B4D6A77CDF1F146B
              9D3AF0389BD1006CDC9A74F9E5876F000C4711C07327D1FDC318038088E41258
              69D965A6ACF4DF36C622584AB1B9B13E53706CC59E2A38B28D928C5DA064A9F9
              67615B8AE1FE78EA760F01C6E3F18964DA005C163A108D6312661F68A8E96F34
              C6F4813CF007781504C1C362ADE366333A706C4518C53305020C4791E96D95B7
              67804AA572298EE317C00D20A7B55EF57DFFF7A18734395AA3B755DE05F80B8C
              F1AE4E1734D3520000000049454E44AE426082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000097048597300000EC400000EC401952B0E1B000002F4494441544889
              C5965188155518C77F67CEECCD4CB9706BA3B6DDA81603CDC5C5C7A064418BC2
              C79C33EDB4A110F490F85622B52AC9A2AFD253F420B5F75EEE0CD84B12C48558
              0B421F8AAC878832D21521D90D5251873B73BE1EF6DEBBC7EBEC6557823E1898
              EF3BFFF3FFCFF9BEF39D334A44702D08823DC01E600C781C28974AA5816AB59A
              B9B8A9A9293F4DD316F00F7015F81138952449D3C5F9AE638C39089CE05E5B0F
              5C2F880194DBCF66E07563CC6B711C9F2E141091771CF707A5D451DFF7EF54AB
              D55E72666767AF4751F4529EE7EBACB54781ED6D8E2340B10030D279514AED8B
              E3F8A782D574AD56AB3501C230BC64ADBDD00E8FB9985E81E501DF5FE847EE9A
              D67AD15A5BCCD3675EF18C02534AC94A63FD04FE13FB5F05569D2220779DC9C9
              495DAFD77300D5693463CCD322F247079424895A8300411074EBA094DA12C7F1
              2F007E1445C359960D8AC82907BFEA1DE4D822F03080889C36C6BCA1B55EF05B
              ADD67C0FF04BA5D4BEB5B22BA59E12917781F780CD22F27D9665853518119132
              706D35C43B8F7D3B0EEC62EB7E057C51F9F9A393C061E000A094881086E1466B
              EDE7C0CEF6BC9B49926CEC473CF1C157159BB71601AEFE7D0B10862A0F2DADC6
              D3438F5DFC74A1D168B4BA450EC3F0496BEDA50E41BF224F4C372B364BBBE4BF
              7D1C00B0E9EDD811F146E6665EBDD24D51A3D1B81C044197248AA2476BB55A61
              9A3AE400035A71F9DA0D94E7E16BAF8B116BE701D5AF0FBCA2E0AE99EFB6B9FE
              60F9419EDBBF74786E1F7DE42EEC8E4367C6EFA7935F769DF9859BDC48F602F0
              CC5B0D460637B8C32FDE8F805E0376E5148948618A80AFD720706E45813CCF2B
              2CDDB57759F3FDE7CFEF38746655EC678FEF3EDF2B7005180610914F8C3187B5
              D669BD5EFFC60579030F8CDA567A11407BCB0BD57A79672B4F8F8173D8011863
              A645E4C3DE2F29954AE5DE7B7962BAF9ACCDD25FA1B0D1C6E7665EB9003DC775
              1CC7C782209867E9B7650BF0043000DCEE151DFEF3B3DFD334DDF0D7E89BE343
              95F52FB4C3E7CE1EDF3DE7E2FE0501B418C4343702040000000049454E44AE42
              6082}
          end
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
              F4000000097048597300000EC400000EC401952B0E1B00000360494441545885
              D5974D681D5514C77F7766D46ADB85B6444568FC00A1A95DB8D06EDA243569C1
              B6082E72E7BDC9469AA2A02E8422586B715134BA10546CFDC08AAB64E6FA8168
              3162FD689ABA102988F503113FEACA9662415B2C32F71E177989F74DE6E54DEC
              ABD5B39A7BEEB9E7FF7B77EE3BE78E12112EA44565CE2449226BED8322B21158
              0D2C030882E0B5344DF57C096BB5DA9BCEB93B1BC393C0E74AA977B22C7BB612
              40922497E5797EA6457E379F78C3FC2D5D0E0C8AC8A0D6FA4963CCA56D019C73
              BB4B927EAF943A1986E167EDD4C330FC14B8C639B71CB8C19B5A14C7F17D5996
              EDF1E355F10CC4717C54446EF25C03C6988FDA099799D6FA36E043CF35658CE9
              F563E6EC8088F8D4FC53F199B55A371D999B8B31658770CE7BEAA02DA902E05B
              7E9E402A039C77FBCF03A80B0D603BA06181B012409224C55FFC6B07004E315D
              1101A8D7EB178F8F8FFF590A90E7F95D85C55F9CABBA52EAA888AC9F195B6B47
              80E76701EAF5FA3A1159E39C5B096CF5170741F05C0700F6F800C05EADF52D41
              107CA5943AA2868686C6807A61DD04B0CB1873E45C0100B4D6B7028F029B0A53
              6F45941F9095400FD01100E05BC0002B00BFCF842A49926E11B9DE5ADB23224D
              5BAE94DA9665D9BE85AAF5EF9C78469CBD07B8A4E1FA4305C18B5DDFBDBA1DB8
              1FC8A328FA4629F54353378CE378B388ECF7721D34C6F8EF6F5EEB7BF8DD0D88
              7B7F667CECC46900BABB9A5A40DFE4E89643338339ED586BED3B7E31C65C5D51
              7C00711FF8E23FEDAB0170ED485A80506B2747377F02ED0BD11555C4017CF10A
              C1876954D976002D2B986FEB771D78AAE8EBEE5A82BAE365007A575D35674DFF
              CE89270E3E76FB43ED002A5D99C5E5F7167DC74E9C46DEDE0694BD021067EF06
              DA0254B5454587F3CE962BBFFA5F0EFF83765C15F02C25BBD0C64EB512587032
              155EF48238FBC0C2D6442F41F9B5FC4B1159E5B9D619630EB74BD8B7637F53A2
              1F8FFFCECFAF4CB798155BC7B9EECAA54DF193A35BCAFF864AA903058029ADF5
              D78D0F9337C6C6C64A3FB154180D8ACD676B41A0FEBE5AF8CFD3C1C1DAD9C7E2
              0E2449B234CFF3DFCA44822030699AC6657300FD8FBC37E04394966215F44E3E
              BE69AA2500C0F0F0F0626BED0E11D928223DC0E206C0EB699A0EB50200A8D56A
              EAF88D234F8BCDFD66745605D1DE8F776FD85E8C2F05F837ED2FDBFE44E37F7C
              093D0000000049454E44AE426082}
          end>
      end>
    Left = 48
    Top = 96
  end
  object ToolBarVirtualImageList: TVirtualImageList
    AutoFill = True
    DisabledGrayscale = False
    DisabledSuffix = '_Disabled'
    Images = <
      item
        CollectionIndex = 0
        CollectionName = 'NewFile'
        Disabled = False
        Name = 'NewFile'
      end
      item
        CollectionIndex = 1
        CollectionName = 'OpenFolder'
        Disabled = False
        Name = 'OpenFolder'
      end
      item
        CollectionIndex = 2
        CollectionName = 'Save'
        Disabled = False
        Name = 'Save'
      end
      item
        CollectionIndex = 3
        CollectionName = 'BuildSolution'
        Disabled = False
        Name = 'BuildSolution'
      end
      item
        CollectionIndex = 4
        CollectionName = 'BuildSolution_Cancel'
        Disabled = False
        Name = 'BuildSolution_Cancel'
      end
      item
        CollectionIndex = 5
        CollectionName = 'Run'
        Disabled = False
        Name = 'Run'
      end
      item
        CollectionIndex = 6
        CollectionName = 'Pause'
        Disabled = False
        Name = 'Pause'
      end
      item
        CollectionIndex = 7
        CollectionName = 'CD'
        Disabled = False
        Name = 'CD'
      end
      item
        CollectionIndex = 8
        CollectionName = 'CD_Cancel'
        Disabled = False
        Name = 'CD_Cancel'
      end
      item
        CollectionIndex = 9
        CollectionName = 'StatusHelp'
        Disabled = False
        Name = 'StatusHelp'
      end
      item
        CollectionIndex = 10
        CollectionName = 'Stop'
        Disabled = False
        Name = 'Stop'
      end
      item
        CollectionIndex = 11
        CollectionName = 'save_as'
        Disabled = False
        Name = 'save_as'
      end
      item
        CollectionIndex = 12
        CollectionName = 'close_window'
        Disabled = False
        Name = 'close_window'
      end
      item
        CollectionIndex = 13
        CollectionName = 'undo_green'
        Disabled = False
        Name = 'undo_green'
      end
      item
        CollectionIndex = 14
        CollectionName = 'redo_green'
        Disabled = False
        Name = 'redo_green'
      end
      item
        CollectionIndex = 15
        CollectionName = 'clipboard_cut'
        Disabled = False
        Name = 'clipboard_cut'
      end
      item
        CollectionIndex = 16
        CollectionName = 'clipboard_copy'
        Disabled = False
        Name = 'clipboard_copy'
      end
      item
        CollectionIndex = 17
        CollectionName = 'clipboard_paste'
        Disabled = False
        Name = 'clipboard_paste'
      end
      item
        CollectionIndex = 18
        CollectionName = 'delete'
        Disabled = False
        Name = 'delete'
      end
      item
        CollectionIndex = 19
        CollectionName = 'select_document'
        Disabled = False
        Name = 'select_document'
      end
      item
        CollectionIndex = 20
        CollectionName = 'search'
        Disabled = False
        Name = 'search'
      end
      item
        CollectionIndex = 21
        CollectionName = 'search_right'
        Disabled = False
        Name = 'search_right'
      end
      item
        CollectionIndex = 22
        CollectionName = 'replace'
        Disabled = False
        Name = 'replace'
      end
      item
        CollectionIndex = 23
        CollectionName = 'column_one-import'
        Disabled = False
        Name = 'column_one-import'
      end
      item
        CollectionIndex = 24
        CollectionName = 'word_wrap'
        Disabled = False
        Name = 'word_wrap'
      end
      item
        CollectionIndex = 25
        CollectionName = 'application-gear'
        Disabled = False
        Name = 'application-gear'
      end
      item
        CollectionIndex = 26
        CollectionName = 'debug_step_cursor'
        Disabled = False
        Name = 'debug_step_cursor'
      end
      item
        CollectionIndex = 27
        CollectionName = 'debug_step_into1'
        Disabled = False
        Name = 'debug_step_into1'
      end
      item
        CollectionIndex = 28
        CollectionName = 'debug_step_over1'
        Disabled = False
        Name = 'debug_step_over1'
      end
      item
        CollectionIndex = 29
        CollectionName = 'debug_breakpoint1'
        Disabled = False
        Name = 'debug_breakpoint1'
      end
      item
        CollectionIndex = 30
        CollectionName = 'tools'
        Disabled = False
        Name = 'tools'
      end
      item
        CollectionIndex = 31
        CollectionName = 'using_namespace-add'
        Disabled = False
        Name = 'using_namespace-add'
      end
      item
        CollectionIndex = 32
        CollectionName = 'window-add'
        Disabled = False
        Name = 'window-add'
      end
      item
        CollectionIndex = 33
        CollectionName = 'certificate-add'
        Disabled = False
        Name = 'certificate-add'
      end
      item
        CollectionIndex = 34
        CollectionName = 'folder_open-export'
        Disabled = False
        Name = 'folder_open-export'
      end
      item
        CollectionIndex = 35
        CollectionName = 'ro16'
        Disabled = False
        Name = 'ro16'
      end
      item
        CollectionIndex = 36
        CollectionName = 'money'
        Disabled = False
        Name = 'money'
      end
      item
        CollectionIndex = 37
        CollectionName = 'is16'
        Disabled = False
        Name = 'is16'
      end
      item
        CollectionIndex = 38
        CollectionName = 'window_word_processing'
        Disabled = False
        Name = 'window_word_processing'
      end
      item
        CollectionIndex = 39
        CollectionName = 'internet'
        Disabled = False
        Name = 'internet'
      end
      item
        CollectionIndex = 40
        CollectionName = 'info'
        Disabled = False
        Name = 'info'
      end
      item
        CollectionIndex = 41
        CollectionName = 'light_on'
        Disabled = False
        Name = 'light_on'
      end
      item
        CollectionIndex = 42
        CollectionName = 'iss16'
        Disabled = False
        Name = 'iss16'
      end
      item
        CollectionIndex = 43
        CollectionName = 'issf16'
        Disabled = False
        Name = 'issf16'
      end
      item
        CollectionIndex = 44
        CollectionName = 'colors'
        Disabled = False
        Name = 'colors'
      end
      item
        CollectionIndex = 45
        CollectionName = 'recent16'
        Disabled = False
        Name = 'recent16'
      end
      item
        CollectionIndex = 46
        CollectionName = 'recent_d16'
        Disabled = False
        Name = 'recent_d16'
      end
      item
        CollectionIndex = 47
        CollectionName = 'ChangeCase'
        Disabled = False
        Name = 'ChangeCase'
      end
      item
        CollectionIndex = 48
        CollectionName = 'LowerCase'
        Disabled = False
        Name = 'LowerCase'
      end
      item
        CollectionIndex = 49
        CollectionName = 'UpperCase'
        Disabled = False
        Name = 'UpperCase'
      end
      item
        CollectionIndex = 50
        CollectionName = 'MSGAdd'
        Disabled = False
        Name = 'MSGAdd'
      end
      item
        CollectionIndex = 51
        CollectionName = 'Mailing'
        Disabled = False
        Name = 'Mailing'
      end
      item
        CollectionIndex = 52
        CollectionName = 'SaveInCode'
        Disabled = False
        Name = 'SaveInCode'
      end
      item
        CollectionIndex = 53
        CollectionName = 'ResetZoom'
        Disabled = False
        Name = 'ResetZoom'
      end
      item
        CollectionIndex = 54
        CollectionName = 'ZoomT'
        Disabled = False
        Name = 'ZoomT'
      end
      item
        CollectionIndex = 55
        CollectionName = 'ZoomInT'
        Disabled = False
        Name = 'ZoomInT'
      end
      item
        CollectionIndex = 56
        CollectionName = 'ZoomOutT'
        Disabled = False
        Name = 'ZoomOutT'
      end
      item
        CollectionIndex = 57
        CollectionName = 'ValCheck'
        Disabled = False
        Name = 'ValCheck'
      end>
    ImageCollection = ToolBarImageCollection
    Left = 176
    Top = 96
  end
  object ColorDialog1: TColorDialog
    Left = 320
    Top = 39
  end
end
