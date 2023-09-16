unit SelLangForm;

{
  Inno Setup
  Copyright (C) 1997-2019 Jordan Russell
  Portions by Martijn Laan
  For conditions of distribution and use, see LICENSE.TXT.

  "Select Language" form
}

interface

{$I VERSION.INC}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  SetupForm, StdCtrls, ExtCtrls, NewStaticText, BitmapImage, BidiCtrls, Themes, Styles;

type
  TSelectLanguageForm = class(TSetupForm)
    FSelectLabel: TNewStaticText;
    FLangCombo: TNewComboBox;
    FOKButton: TNewButton;
    FCancelButton: TNewButton;
    FIconBitmapImage: TBitmapImage;
    FMainPanel: TPanel;
    FBevel: TBevel;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    //destructor Destroy; override;
  published
    { Published declarations }
    property SelectLabel: TNewStaticText read FSelectLabel;
    property LangCombo: TNewComboBox read FLangCombo;
    property OKButton: TNewButton read FOKButton;
    property CancelButton: TNewButton read FCancelButton;
    property IconBitmapImage: TBitmapImage read FIconBitmapImage;
    property MainPanel: TPanel read FMainPanel;
    property Bevel: TBevel read FBevel;
  end;

function AskForLanguage: Boolean;

var
  SelectLanguageForm: TSelectLanguageForm;

implementation

uses
  Struct, Msgs, MsgIDs, Main, Logging, ScriptRunner;

{$R *.DFM}

var
  DefComboWndProcW, PrevComboWndProc: Pointer;

function NewComboWndProc(Wnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT;
stdcall;
begin
  case Msg of
    { CB_ADDSTRING must pass to the default Unicode combo box window procedure
      since PrevWndProc is an ANSI window procedure and calling it would result
      in Unicode->ANSI conversion. Do the same for CB_GETLBTEXT(LEN) so that
      MSAA sees Unicode strings. }
    CB_ADDSTRING, CB_GETLBTEXT, CB_GETLBTEXTLEN:
      Result := CallWindowProcW(DefComboWndProcW, Wnd, Msg, wParam, lParam)
  else
    Result := CallWindowProcW(PrevComboWndProc, Wnd, Msg, wParam, lParam);
  end;
end;

function AskForLanguage: Boolean;
{ Creates and shows the "Select Language" dialog. Returns True and activates
  the selected language if the user clicks OK, or False otherwise. }
var
//  SelectLanguageForm: TSelectLanguageForm;
  I, J: Integer;
  LangEntry: PSetupLanguageEntry;
{$IFNDEF UNICODE}
  ClassInfo: TWndClassW;
  N: String;
{$ENDIF}
begin
  SelectLanguageForm := TSelectLanguageForm.Create(Application);
  try
{$IFNDEF UNICODE}
    { On NT, make it possible to add Unicode strings to our ANSI combo box by
      installing a window procedure with special CB_ADDSTRING handling.
      Yeah, this is a hack; it's too hard to create a native Unicode control
      in Delphi. }
    if Win32Platform = VER_PLATFORM_WIN32_NT then begin
      if GetClassInfoW(0, 'COMBOBOX', ClassInfo) then begin
        DefComboWndProcW := ClassInfo.lpfnWndProc;
        Longint(PrevComboWndProc) := SetWindowLongW(SelectLanguageForm.LangCombo.Handle,
          GWL_WNDPROC, Longint(@NewComboWndProc));
      end;
    end;
{$ENDIF}

    for I := 0 to Entries[seLanguage].Count-1 do begin
      LangEntry := Entries[seLanguage][I];
{$IFDEF UNICODE}
      J := SelectLanguageForm.LangCombo.Items.Add(LangEntry.LanguageName);
      SelectLanguageForm.LangCombo.Items.Objects[J] := TObject(I);
{$ELSE}
      if (I = ActiveLanguage) or (LangEntry.LanguageCodePage = 0) or
         (LangEntry.LanguageCodePage = GetACP) or
         (shShowUndisplayableLanguages in SetupHeader.Options) then begin
        { Note: LanguageName is Unicode }
        N := LangEntry.LanguageName + #0#0;  { need wide null! }
        if Win32Platform = VER_PLATFORM_WIN32_NT then
          J := SendMessageW(SelectLanguageForm.LangCombo.Handle, CB_ADDSTRING, 0,
            Longint(PWideChar(Pointer(N))))
        else
          J := SelectLanguageForm.LangCombo.Items.Add(WideCharToString(PWideChar(Pointer(N))));
        if J >= 0 then
          SelectLanguageForm.LangCombo.Items.Objects[J] := TObject(I);
      end;
{$ENDIF}
    end;

   { If there's multiple languages, select the previous language, if available }
    if (shUsePreviousLanguage in SetupHeader.Options) and
       (SelectLanguageForm.LangCombo.Items.Count > 1) then begin
      { Note: if UsePreviousLanguage is set to "yes" then the compiler does not
        allow AppId to include constants but we should still call ExpandConst
        to handle any '{{'. }
      I := GetPreviousLanguage(ExpandConst(SetupHeader.AppId));
      if I <> -1 then
        SelectLanguageForm.LangCombo.ItemIndex := SelectLanguageForm.LangCombo.Items.IndexOfObject(TObject(I));
    end;

    { Select the active language if no previous language was selected }
    if SelectLanguageForm.LangCombo.ItemIndex = -1 then
      SelectLanguageForm.LangCombo.ItemIndex := SelectLanguageForm.LangCombo.Items.IndexOfObject(TObject(ActiveLanguage));

    if SelectLanguageForm.LangCombo.Items.Count > 1 then begin

      { Run Code Lang Dialog }
      if CodeRunner <> nil then begin
        try
          Result := CodeRunner.RunBooleanFunctions('InitializeLanguageDialog', [''], bcFalse, False, True);
        except
          Log('InitializeLanguageDialog raised an exception (fatal).');
          raise;
        end;
        if not Result then begin
          Log('InitializeLanguageDialog returned False; aborting.');
          Abort;
        end;
      end;

      Result := (SelectLanguageForm.ShowModal = mrOK);
      if Result then begin
        I := SelectLanguageForm.LangCombo.ItemIndex;
        if I >= 0 then
          SetActiveLanguage(Integer(SelectLanguageForm.LangCombo.Items.Objects[I]));
      end;
    end
    else begin
      { Don't show language dialog if there aren't multiple languages to choose
        from, which can happen if only one language matches the user's code
        page. }
      Result := True;
    end;
  finally
    SelectLanguageForm.Free;
  end;
end;

{ TSelectLanguageForm }

constructor TSelectLanguageForm.Create(AOwner: TComponent);
begin
  inherited;

{$IFDEF IS_D7}
  MainPanel.ParentBackground := False;
{$ENDIF}

  InitializeFont;

  Caption := SetupMessages[msgSelectLanguageTitle];
  SelectLabel.Caption := SetupMessages[msgSelectLanguageLabel];
  OKButton.Caption := SetupMessages[msgButtonOK];
  CancelButton.Caption := SetupMessages[msgButtonCancel];

  if SetupHeader.SetupStyle then
  begin
    IconBitmapImage.Bitmap.Canvas.Brush.Color := StyleServices.GetStyleColor(scPanel){clBtnFace};
    IconBitmapImage.BackColor := StyleServices.GetStyleColor(scPanel){clBtnFace};
  end
  else
    IconBitmapImage.Bitmap.Canvas.Brush.Color := MainPanel.Color;

  IconBitmapImage.Bitmap.Width := Application.Icon.Width;
  IconBitmapImage.Bitmap.Height := Application.Icon.Height;
  IconBitmapImage.Bitmap.Canvas.Draw(0, 0, Application.Icon);
  IconBitmapImage.Width := IconBitmapImage.Bitmap.Width;
  IconBitmapImage.Height := IconBitmapImage.Bitmap.Height;
  { restoring the original value of the ClientWidth when resizing the WizardForm }
  ClientWidth := MulDiv(ClientWidth, 100, SetupHeader.WizardSizePercentX);

  { Aligning buttons to the right edge of the combo box }
  OKButton.Left := LangCombo.Left + LangCombo.Width + OKButton.Left - CancelButton.Left - OKButton.Width;
  CancelButton.Left := LangCombo.Left + LangCombo.Width - CancelButton.Width;
  KeepSizeY := True;
end;

end.
