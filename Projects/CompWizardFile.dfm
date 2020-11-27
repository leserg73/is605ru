object WizardFileForm: TWizardFileForm
  Left = 284
  Top = 219
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Мастер сценария'
  ClientHeight = 297
  ClientWidth = 350
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object RequiredLabel1: TNewStaticText
    Left = 8
    Top = 271
    Width = 9
    Height = 15
    Caption = '*'
    Enabled = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
  end
  object RequiredLabel2: TNewStaticText
    Left = 18
    Top = 271
    Width = 135
    Height = 14
    Caption = '= требуется ввод данных'
    Enabled = False
    TabOrder = 5
  end
  object OKButton: TButton
    Left = 188
    Top = 265
    Width = 73
    Height = 23
    Caption = 'ОК'
    Default = True
    ModalResult = 1
    TabOrder = 1
    OnClick = OKButtonClick
  end
  object CancelButton: TButton
    Left = 268
    Top = 265
    Width = 73
    Height = 23
    Cancel = True
    Caption = 'Отмена'
    ModalResult = 2
    TabOrder = 2
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 108
    Width = 333
    Height = 149
    Caption = ' Вывод данных '
    TabOrder = 0
    object DestRootDirLabel: TNewStaticText
      Left = 12
      Top = 20
      Width = 122
      Height = 14
      Caption = 'Главная папка вывода:'
      FocusControl = DestRootDirComboBox
      TabOrder = 0
    end
    object DestRootDirComboBox: TComboBox
      Left = 12
      Top = 40
      Width = 309
      Height = 21
      Style = csDropDownList
      DropDownCount = 12
      ItemHeight = 13
      TabOrder = 1
      OnChange = DestRootDirComboBoxChange
    end
    object DestRootDirEdit: TEdit
      Left = 12
      Top = 68
      Width = 309
      Height = 21
      TabOrder = 2
    end
    object SubDirLabel: TNewStaticText
      Left = 12
      Top = 96
      Width = 91
      Height = 14
      Caption = 'Путь к подпапке:'
      FocusControl = DestSubDirEdit
      TabOrder = 3
    end
    object DestSubDirEdit: TEdit
      Left = 12
      Top = 116
      Width = 309
      Height = 21
      TabOrder = 4
    end
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 333
    Height = 93
    Caption = ' Исходные данные '
    TabOrder = 3
    object SourceLabel: TNewStaticText
      Left = 12
      Top = 20
      Width = 145
      Height = 14
      Caption = '*Исходный файл или папка:'
      Enabled = False
      TabOrder = 0
    end
    object SourceEdit: TEdit
      Left = 12
      Top = 40
      Width = 309
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
    end
    object RecurseSubDirsCheck: TCheckBox
      Left = 12
      Top = 68
      Width = 141
      Height = 17
      Caption = 'Добавить подпапки'
      TabOrder = 2
      OnClick = RecurseSubDirsCheckClick
    end
    object CreateAllSubDirsCheck: TCheckBox
      Left = 156
      Top = 68
      Width = 165
      Height = 17
      Caption = 'Добавить пустые подпапки'
      TabOrder = 3
    end
  end
end
