object StartupForm: TStartupForm
  Left = 328
  Top = 174
  BorderIcons = [biSystemMenu]
  Caption = 'Добро пожаловать!'
  ClientHeight = 419
  ClientWidth = 579
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnAfterMonitorDpiChanged = FormAfterMonitorDpiChanged
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object OKButton: TButton
    Left = 418
    Top = 387
    Width = 73
    Height = 23
    Anchors = [akRight, akBottom]
    Caption = 'ОК'
    Default = True
    ModalResult = 1
    TabOrder = 2
    OnClick = OKButtonClick
  end
  object CancelButton: TButton
    Left = 498
    Top = 387
    Width = 73
    Height = 23
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Отмена'
    ModalResult = 2
    TabOrder = 3
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 563
    Height = 61
    Anchors = [akLeft, akTop, akRight]
    Caption = ' Новый файл '
    TabOrder = 0
    object NewImage: TImage
      Left = 12
      Top = 16
      Width = 16
      Height = 16
      AutoSize = True
    end
    object EmptyRadioButton: TRadioButton
      Left = 40
      Top = 16
      Width = 511
      Height = 17
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Создать пустой файл сценария'
      TabOrder = 0
      OnClick = RadioButtonClick
      OnDblClick = DblClick_
    end
    object WizardRadioButton: TRadioButton
      Left = 40
      Top = 36
      Width = 511
      Height = 17
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Создать новый файл сценария с помощью Мастера'
      TabOrder = 1
      OnClick = RadioButtonClick
      OnDblClick = DblClick_
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 76
    Width = 563
    Height = 303
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = ' Открыть файл '
    TabOrder = 1
    object OpenImage: TImage
      Left = 12
      Top = 19
      Width = 16
      Height = 16
      AutoSize = True
    end
    object OpenRadioButton: TRadioButton
      Left = 40
      Top = 20
      Width = 511
      Height = 17
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Открыть существующий файл сценария'
      TabOrder = 0
      OnClick = RadioButtonClick
      OnDblClick = DblClick_
    end
    object OpenListBox: TListBox
      Left = 44
      Top = 44
      Width = 507
      Height = 247
      Anchors = [akLeft, akTop, akRight, akBottom]
      ItemHeight = 13
      TabOrder = 1
      OnClick = OpenListBoxClick
      OnDblClick = DblClick_
    end
  end
  object StartupCheck: TCheckBox
    Left = 8
    Top = 394
    Width = 379
    Height = 17
    TabStop = False
    Anchors = [akLeft, akRight, akBottom]
    Caption = 'Больше не показывать этот диалог'
    TabOrder = 4
  end
end
