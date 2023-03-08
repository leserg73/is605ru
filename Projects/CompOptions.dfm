object OptionsForm: TOptionsForm
  Left = 207
  Top = 173
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Настройки'
  ClientHeight = 359
  ClientWidth = 595
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 286
    Height = 243
    Anchors = [akLeft, akTop, akBottom]
    Caption = ' Разное '
    TabOrder = 0
    object StartupCheck: TCheckBox
      Left = 8
      Top = 16
      Width = 265
      Height = 17
      Caption = 'Показывать окно приветствия при запуске'
      TabOrder = 0
    end
    object WizardCheck: TCheckBox
      Left = 8
      Top = 36
      Width = 265
      Height = 17
      Caption = 'Использовать Мастер сценариев Inno Setup'
      TabOrder = 1
    end
    object AutosaveCheck: TCheckBox
      Left = 8
      Top = 56
      Width = 272
      Height = 17
      Caption = 'Автосохранение сценария перед компиляцией'
      TabOrder = 2
    end
    object BackupCheck: TCheckBox
      Left = 8
      Top = 76
      Width = 265
      Height = 17
      Caption = 'Создавать резервные копии при сохранении'
      TabOrder = 3
    end
    object UndoAfterSaveCheck: TCheckBox
      Left = 8
      Top = 96
      Width = 272
      Height = 17
      Caption = 'Разрешить операцию "Отменить" после записи'
      TabOrder = 4
    end
    object FullPathCheck: TCheckBox
      Left = 8
      Top = 116
      Width = 265
      Height = 17
      Caption = 'Показывать полный путь в заголовке'
      TabOrder = 5
    end
    object PauseOnDebuggerExceptionsCheck: TCheckBox
      Left = 8
      Top = 136
      Width = 265
      Height = 17
      Caption = 'Приостанавливать отладку на исключениях'
      TabOrder = 6
    end
    object RunAsDifferentUserCheck: TCheckBox
      Left = 8
      Top = 156
      Width = 265
      Height = 17
      Caption = '*'
      TabOrder = 7
    end
    object ColorizeCompilerOutputCheck: TCheckBox
      Left = 8
      Top = 176
      Width = 265
      Height = 17
      Caption = 'Использовать подсветку строк компилятора'
      TabOrder = 8
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 258
    Width = 286
    Height = 57
    Anchors = [akLeft, akBottom]
    Caption = ' Ассоциации файлов '
    TabOrder = 1
    object AssocButton: TButton
      Left = 18
      Top = 20
      Width = 252
      Height = 23
      Anchors = [akLeft, akBottom]
      Caption = 'Связать файлы *.iss с этим компилятором'
      TabOrder = 0
      OnClick = AssocButtonClick
    end
  end
  object GroupBox3: TGroupBox
    Left = 300
    Top = 8
    Width = 286
    Height = 307
    Anchors = [akLeft, akTop, akBottom]
    Caption = ' Редактор '
    TabOrder = 2
    object AutoCompleteCheck: TCheckBox
      Left = 8
      Top = 16
      Width = 265
      Height = 17
      Caption = 'Использовать функцию автозавершения'
      TabOrder = 0
    end
    object UseSynHighCheck: TCheckBox
      Left = 8
      Top = 36
      Width = 265
      Height = 17
      Caption = 'Использовать синтаксическую подсветку'
      TabOrder = 1
    end
    object UnderlineErrorsCheck: TCheckBox
      Left = 8
      Top = 56
      Width = 265
      Height = 17
      Caption = 'Подчеркивать ошибки в сценарии'
      TabOrder = 2
    end
    object CursorPastEOLCheck: TCheckBox
      Left = 8
      Top = 76
      Width = 265
      Height = 17
      Caption = 'Перемещать каретку за пределы конца строк'
      TabOrder = 3
    end
    object WordWrapCheck: TCheckBox
      Left = 8
      Top = 96
      Width = 265
      Height = 17
      Caption = 'Перенос длинных строк'
      TabOrder = 4
    end
    object UseTabCharacterCheck: TCheckBox
      Left = 8
      Top = 116
      Width = 265
      Height = 17
      Caption = 'Использовать символ табуляции'
      TabOrder = 5
    end
    object AutoIndentCheck: TCheckBox
      Left = 8
      Top = 136
      Width = 265
      Height = 17
      Caption = 'Режим автоматического отступа'
      TabOrder = 6
    end
    object IndentationGuidesCheck: TCheckBox
      Left = 8
      Top = 156
      Width = 265
      Height = 17
      Caption = 'Показывать границы табуляции'
      TabOrder = 7
    end
    object Label1: TNewStaticText
      Left = 8
      Top = 253
      Width = 41
      Height = 14
      Caption = 'Шрифт:'
      TabOrder = 13
    end
    object FontPanel: TPanel
      Left = 72
      Top = 248
      Width = 121
      Height = 25
      BevelKind = bkFlat
      BevelOuter = bvNone
      Caption = 'AaBbXxZz'
      TabOrder = 14
    end
    object ChangeFontButton: TButton
      Left = 200
      Top = 249
      Width = 73
      Height = 23
      Caption = 'Изменить...'
      TabOrder = 15
      OnClick = ChangeFontButtonClick
    end
    object Label2: TNewStaticText
      Left = 8
      Top = 282
      Width = 97
      Height = 14
      Caption = 'Размер табуляции:'
      FocusControl = TabWidthEdit
      TabOrder = 16
    end
    object TabWidthEdit: TEdit
      Left = 114
      Top = 279
      Width = 41
      Height = 21
      TabOrder = 17
      OnChange = TabWidthEditChange
    end
    object GutterLineNumbersCheck: TCheckBox
      Left = 8
      Top = 176
      Width = 265
      Height = 17
      Caption = 'Показывать нумерацию строк'
      TabOrder = 8
    end
    object Label3: TNewStaticText
      Left = 8
      Top = 224
      Width = 29
      Height = 18
      Caption = 'Тема:'
      FocusControl = ThemeComboBox
      TabOrder = 11
    end
    object ThemeComboBox: TComboBox
      Left = 72
      Top = 221
      Width = 201
      Height = 21
      Style = csDropDownList
      TabOrder = 12
    end
    object BorderLineEndCheck: TCheckBox
      Left = 8
      Top = 196
      Width = 217
      Height = 17
      Caption = 'Показывать границу справа, столбец:'
      TabOrder = 9
      OnClick = BorderLineEndCheckClick
    end
    object LineColonEdit: TEdit
      Left = 231
      Top = 194
      Width = 42
      Height = 21
      TabOrder = 10
      OnChange = LineColonEditChange
    end
  end
  object OKButton: TButton
    Left = 433
    Top = 327
    Width = 73
    Height = 23
    Anchors = [akLeft, akBottom]
    Caption = 'ОК'
    Default = True
    ModalResult = 1
    TabOrder = 3
  end
  object CancelButton: TButton
    Left = 513
    Top = 327
    Width = 73
    Height = 23
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Отмена'
    ModalResult = 2
    TabOrder = 4
  end
  object FontDialog: TFontDialog
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [fdForceFontExist]
    Left = 24
    Top = 316
  end
end
