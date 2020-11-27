unit CompOptions;

{
  Inno Setup
  Copyright (C) 1997-2018 Jordan Russell
  Portions by Martijn Laan
  For conditions of distribution and use, see LICENSE.TXT.

  Compiler Options form
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UIStateForm, StdCtrls, ExtCtrls, NewStaticText;

type
  TOptionsForm = class(TUIStateForm)
    OKButton: TButton;
    CancelButton: TButton;
    GroupBox1: TGroupBox;
    BackupCheck: TCheckBox;
    GroupBox2: TGroupBox;
    AssocButton: TButton;
    StartupCheck: TCheckBox;
    WizardCheck: TCheckBox;
    GroupBox3: TGroupBox;
    ChangeFontButton: TButton;
    FontPanel: TPanel;
    Label1: TNewStaticText;
    FontDialog: TFontDialog;
    UseSynHighCheck: TCheckBox;
    FullPathCheck: TCheckBox;
    CursorPastEOLCheck: TCheckBox;
    UndoAfterSaveCheck: TCheckBox;
    TabWidthEdit: TEdit;
    Label2: TNewStaticText;
    PauseOnDebuggerExceptionsCheck: TCheckBox;
    RunAsDifferentUserCheck: TCheckBox;
    AutosaveCheck: TCheckBox;
    WordWrapCheck: TCheckBox;
    AutoIndentCheck: TCheckBox;
    IndentationGuidesCheck: TCheckBox;
    UseTabCharacterCheck: TCheckBox;
    AutoCompleteCheck: TCheckBox;
    UnderlineErrorsCheck: TCheckBox;
    GutterLineNumbersCheck: TCheckBox;
    ColorizeCompilerOutputCheck: TCheckBox;
    Label3: TNewStaticText;
    ThemeComboBox: TComboBox;
    BorderLineEndCheck: TCheckBox;
    LineColonEdit: TEdit;
    procedure AssocButtonClick(Sender: TObject);
    procedure ChangeFontButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TabWidthEditChange(Sender: TObject);
    procedure LineColonEditChange(Sender: TObject);
    procedure BorderLineEndCheckClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  CmnFunc, CmnFunc2, CompForm, CompFileAssoc;

{$R *.DFM}

procedure TOptionsForm.FormCreate(Sender: TObject);
begin
  InitFormFont(Self);

  { On Windows Vista, you can only select administrator accounts in a "Run as"
    dialog. On Windows 2000/XP/2003, you can select any account. Earlier
    versions of Windows don't support "Run as" at all, so disable the check
    box there. }
  if Win32MajorVersion >= 6 then
    RunAsDifferentUserCheck.Caption := 'Выполнять запуск от имени администратора'
  else
    RunAsDifferentUserCheck.Caption := 'Выполнять запуск от имени пользователя';
  RunAsDifferentUserCheck.Enabled := (Win32MajorVersion >= 5);

  { Order must match TThemeType. }
  ThemeComboBox.Items.Add('Light');
  ThemeComboBox.Items.Add('Dark');
  ThemeComboBox.Items.Add('Classic');
end;

procedure TOptionsForm.LineColonEditChange(Sender: TObject);
begin
  OKButton.Enabled := StrToIntDef(LineColonEdit.Text, 0) > 0;
end;

procedure TOptionsForm.AssocButtonClick(Sender: TObject);
const
  UserStrings: array [Boolean] of String = ('текущего пользователя', 'всех пользователей');
var
  AllUsers: Boolean;
begin
  if RegisterISSFileAssociation(True, AllUsers) then
    MsgBox('Расширение .iss было успешно связано для ' + UserStrings[AllUsers] + ' с программой:'#13#10 + NewParamStr(0),
      'Ассоциация', mbInformation, MB_OK);
end;

procedure TOptionsForm.BorderLineEndCheckClick(Sender: TObject);
begin
  if BorderLineEndCheck.Checked then
     LineColonEdit.Enabled := True
  else
     LineColonEdit.Enabled := False;
end;

procedure TOptionsForm.ChangeFontButtonClick(Sender: TObject);
begin
  FontDialog.Font.Assign(FontPanel.Font);
  if FontDialog.Execute then
    FontPanel.Font.Assign(FontDialog.Font);
end;

procedure TOptionsForm.TabWidthEditChange(Sender: TObject);
begin
  OKButton.Enabled := StrToIntDef(TabWidthEdit.Text, 0) > 0;
end;

end.
