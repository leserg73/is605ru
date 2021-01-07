unit TaskDialog;

{
  Inno Setup
  Copyright (C) 1997-2018 Jordan Russell
  Portions by Martijn Laan
  For conditions of distribution and use, see LICENSE.TXT.

  TaskDialogMsgBox function integrating with CmnFunc's MsgBox functions
}

interface

uses
  CmnFunc;

function TaskDialogMsgBox(const Icon, Instruction, Text, Caption: String; const Typ: TMsgBoxType; const Buttons: Cardinal; const ButtonLabels: array of String; const ShieldButton: Integer): Integer;

implementation

uses
  Windows, Classes, StrUtils, Math, Forms, Dialogs, SysUtils, Commctrl, CmnFunc2, InstFunc, PathFunc{$IFDEF IS_WINXP}, SynTaskDialog{$ENDIF};

var
  TaskDialogIndirectFunc: function(const pTaskConfig: TTaskDialogConfig;
    pnButton: PInteger; pnRadioButton: PInteger;
    pfVerificationFlagChecked: PBOOL): HRESULT; stdcall;

function ShieldButtonCallback(hwnd: HWND; msg: UINT; wParam: WPARAM; lParam: LPARAM; lpRefData: LONG_PTR): HResult; stdcall;
begin
  if (msg = TDN_CREATED) and (lpRefData <> 0) then
    SendMessage(hwnd, TDM_SET_BUTTON_ELEVATION_REQUIRED_STATE, lpRefData, 1);
  Result := S_OK;
end;

function DoTaskDialog(const hWnd: HWND; const Instruction, Text, Caption, Icon: PWideChar; const CommonButtons: Cardinal; const ButtonLabels: array of String; const ButtonIDs: array of Integer; const ShieldButton: Integer; const RightToLeft: Boolean; const TriggerMessageBoxCallbackFuncFlags: LongInt; var ModalResult: Integer): Boolean;
var
  Config: TTaskDialogConfig;
  NButtonLabelsAvailable: Integer;
  ButtonItems: TTaskDialogButtons;
  ButtonItem: TTaskDialogButtonItem;
  I: Integer;
  ActiveWindow: Windows.HWND;
  WindowList: Pointer;
begin
  if Assigned(TaskDialogIndirectFunc) then begin
    ZeroMemory(@Config, Sizeof(Config));
    Config.cbSize := SizeOf(Config);
    if RightToLeft then
      Config.dwFlags := Config.dwFlags or TDF_RTL_LAYOUT;
    { If the application window isn't currently visible, show the task dialog
      with no owner window so it'll get a taskbar button } 
    Config.hInstance := HInstance;
    if IsIconic(Application.Handle) or
       (GetWindowLong(Application.Handle, GWL_STYLE) and WS_VISIBLE = 0) or
       (GetWindowLong(Application.Handle, GWL_EXSTYLE) and WS_EX_TOOLWINDOW <> 0) then
      Config.hWndParent := 0
    else
      Config.hwndParent := hWnd;
    Config.dwCommonButtons := CommonButtons;
    Config.pszWindowTitle := Caption;
    Config.pszMainIcon := Icon;
    Config.pszMainInstruction := Instruction;
    Config.pszContent := Text;
    if ShieldButton <> 0 then begin
      Config.pfCallback := ShieldButtonCallback;
      Config.lpCallbackData := ShieldButton;
    end;
    ButtonItems := nil;
    try
      NButtonLabelsAvailable := Length(ButtonLabels);
      if NButtonLabelsAvailable <> 0 then begin
        ButtonItems := TTaskDialogButtons.Create(nil, TTaskDialogButtonItem);
        Config.dwFlags := Config.dwFlags or TDF_USE_COMMAND_LINKS;
        for I := 0 to NButtonLabelsAvailable-1 do begin
          ButtonItem := TTaskDialogButtonItem(ButtonItems.Add);
          ButtonItem.Caption := ButtonLabels[I];
          ButtonItem.ModalResult := ButtonIDs[I];
        end;
        Config.pButtons := ButtonItems.Buttons;
        Config.cButtons := ButtonItems.Count;
      end;
      TriggerMessageBoxCallbackFunc(TriggerMessageBoxCallbackFuncFlags, False);
      ActiveWindow := GetActiveWindow;
      WindowList := DisableTaskWindows(0);
      try
        Result := TaskDialogIndirectFunc(Config, @ModalResult, nil, nil) = S_OK;
      finally
        EnableTaskWindows(WindowList);
        SetActiveWindow(ActiveWindow);
        TriggerMessageBoxCallbackFunc(TriggerMessageBoxCallbackFuncFlags, True);
      end;
    finally
      ButtonItems.Free;
    end;
  end else
    Result := False;
end;

function TaskDialogMsgBox(const Icon, Instruction, Text, Caption: String; const Typ: TMsgBoxType; const Buttons: Cardinal; const ButtonLabels: array of String; const ShieldButton: Integer): Integer;
{$IFDEF IS_WINXP}
  function JoinStrings(const StringArray : array of String{; const Separator : String}): String;
  var
    i : Integer;
  begin
    Result := '';
    for i := low(StringArray) to high(StringArray) do
      Result := Result + StringReplace(StringArray[i],#13#10,'\n',[rfReplaceAll, rfIgnoreCase]) + #13#10;
    Delete(Result, Length(Result), 1);
  end;
{$ENDIF}
var
  IconP: PChar;
  TDCommonButtons: Cardinal;
  NButtonLabelsAvailable: Integer;
  ButtonIDs, A: array of Integer;
{$IFDEF IS_WINXP}
  Task: TTaskDialog;
  BTNs: TCommonButtons;
  BTNStr: String;
  IconDialog: TTaskDialogIcon;
  Ret: Integer;
  WinVer: Word;
{$ENDIF}
begin
  if Icon <> '' then begin
    IconP := PChar(Icon);
    {$IFDEF IS_WINXP}IconDialog := tiNotUsed;{$ENDIF} end
  else begin
    case Typ of
      mbInformation: begin IconP := TD_INFORMATION_ICON; {$IFDEF IS_WINXP}IconDialog := tiInformation;{$ENDIF} end;
      mbError: begin IconP := TD_WARNING_ICON; {$IFDEF IS_WINXP}IconDialog := tiWarning;{$ENDIF} end;
      mbCriticalError: begin IconP := TD_ERROR_ICON; {$IFDEF IS_WINXP}IconDialog := tiError;{$ENDIF} end;
    else begin
      IconP := nil; { No other TD_ constant available, MS recommends to use no icon for questions now and the old icon should only be used for help entries }
      {$IFDEF IS_WINXP}IconDialog := tiNotUsed;{$ENDIF} end;
    end;
  end;
  NButtonLabelsAvailable := Length(ButtonLabels);
{$IFDEF IS_WINXP}
  BTNs := [];
  BTNStr := JoinStrings(ButtonLabels);
{$ENDIF}
  case Buttons of
    MB_OK, MB_OKCANCEL:
      begin
        if NButtonLabelsAvailable = 0 then begin
          TDCommonButtons := TDCBF_OK_BUTTON;
          {$IFDEF IS_WINXP}BTNs := [cbOK];{$ENDIF} end
        else begin
          TDCommonButtons := 0;
          SetLength(A,1);
          A[0] := IDOK;
          ButtonIDs := A;
          {$IFDEF IS_WINXP}BTNs := [];{$ENDIF}
        end;
        if Buttons = MB_OKCANCEL then begin
          TDCommonButtons := TDCommonButtons or TDCBF_CANCEL_BUTTON;
          {$IFDEF IS_WINXP}BTNs := [cbCancel];{$ENDIF} end;
      end;
    MB_YESNO, MB_YESNOCANCEL:
      begin
        if NButtonLabelsAvailable = 0 then begin
          TDCommonButtons := TDCBF_YES_BUTTON or TDCBF_NO_BUTTON;
          {$IFDEF IS_WINXP}BTNs := [cbYes, cbNo];{$ENDIF} end
        else begin
          TDCommonButtons := 0;
          SetLength(A,2);
          A[0] := IDYES;
          A[1] := IDNO;
          ButtonIDs := A;
          {$IFDEF IS_WINXP}BTNs := [];{$ENDIF}
        end;
        if Buttons = MB_YESNOCANCEL then begin
          TDCommonButtons := TDCommonButtons or TDCBF_CANCEL_BUTTON;
          {$IFDEF IS_WINXP}BTNs := [cbCancel];{$ENDIF} end;
      end;
    MB_RETRYCANCEL:
      begin
        if NButtonLabelsAvailable = 0 then begin
          TDCommonButtons := TDCBF_RETRY_BUTTON;
          {$IFDEF IS_WINXP}BTNs := [cbRetry];{$ENDIF} end
        else begin
          TDCommonButtons := 0;
          SetLength(A,1);
          A[0] := IDRETRY;
          ButtonIDs := A;
          {$IFDEF IS_WINXP}BTNs := [];{$ENDIF}
        end;
        TDCommonButtons := TDCommonButtons or TDCBF_CANCEL_BUTTON;
        {$IFDEF IS_WINXP}BTNs := [cbCancel];{$ENDIF}
      end;
    MB_ABORTRETRYIGNORE:
      begin
        if NButtonLabelsAvailable = 0 then
          InternalError('TaskDialogMsgBox: Invalid ButtonLabels')
        else begin
          SetLength(A,3);
          A[0] := IDRETRY;
          A[1] := IDIGNORE;
          A[2] := IDABORT;
          ButtonIDs := A;
        end;
        TDCommonButtons := 0;
        {$IFDEF IS_WINXP}BTNs := [];{$ENDIF}
      end;
    else
      begin
        InternalError('TaskDialogMsgBox: Invalid Buttons');
        TDCommonButtons := 0; { Silence compiler }
      end;
  end;
  if Length(ButtonIDs) <> NButtonLabelsAvailable then
    InternalError('TaskDialogMsgBox: Invalid ButtonLabels');

{$IFDEF IS_WINXP}
  WinVer := Swap(Word(GetVersion()));
  if WinVer = $0501 then
  begin
    Ret := 0;
    Task.Title := Caption;
    Task.Inst := Instruction;
    Task.Content := Text;
    Task.Buttons := BTNStr;

    if GetMessageBoxRightToLeft and (Buttons = MB_ABORTRETRYIGNORE) then
       Ret:= Task.Execute(BTNs,0,[tdfUseCommandLinks, tdfRtlLayout],IconDialog,tfiBlank)
    else if GetMessageBoxRightToLeft then
       Ret:= Task.Execute(BTNs,0,[tdfUseCommandLinks, tdfAllowDialogCancellation, tdfRtlLayout],IconDialog,tfiBlank)
    else 
      begin
        if Buttons = MB_ABORTRETRYIGNORE then
           Ret:= Task.Execute(BTNs,0,[tdfUseCommandLinks],IconDialog,tfiBlank)
        else
           Ret:= Task.Execute(BTNs,0,[tdfUseCommandLinks, tdfAllowDialogCancellation],IconDialog,tfiBlank);
      end;

    case Ret of
      100: begin
             if (Buttons = MB_OK) or (Buttons = MB_OKCANCEL) then Result := IDOK;
             if (Buttons = MB_YESNO) or (Buttons = MB_YESNOCANCEL) then Result := IDYES;
             if Buttons = MB_RETRYCANCEL then Result := IDRETRY;
             if Buttons = MB_ABORTRETRYIGNORE then Result := IDRETRY;
           end;

      101: begin
             if Buttons = MB_OKCANCEL then Result := IDCANCEL;
             if (Buttons = MB_YESNO) or (Buttons = MB_YESNOCANCEL) then Result := IDNO;
             if Buttons = MB_RETRYCANCEL then Result := IDCANCEL;
             if Buttons = MB_ABORTRETRYIGNORE then Result := IDIGNORE;
           end;

      102: begin
             if Buttons = MB_YESNOCANCEL then Result := IDCANCEL;
             if Buttons = MB_ABORTRETRYIGNORE then Result := IDABORT;
           end;
    else
      Result := Ret;
    end;

  end else
{$ENDIF}
  if not DoTaskDialog(Application.Handle, PChar(Instruction), PChar(Text),
           GetMessageBoxCaption(PChar(Caption), Typ), IconP, TDCommonButtons, ButtonLabels, ButtonIDs, ShieldButton,
           GetMessageBoxRightToLeft, IfThen(Typ in [mbError, mbCriticalError], MB_ICONSTOP, 0), Result) then //note that MB_ICONEXCLAMATION (used by mbError) includes MB_ICONSTOP (used by mbCriticalError)
   Result := 0;
end;

procedure InitCommonControls; external comctl32 name 'InitCommonControls';

initialization
  InitCommonControls;
  TaskDialogIndirectFunc := GetProcAddress(GetModuleHandle(comctl32), 'TaskDialogIndirect');

end.
