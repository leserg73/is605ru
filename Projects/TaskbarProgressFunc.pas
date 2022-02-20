unit TaskbarProgressFunc;

{
  Inno Setup
  Copyright (C) 1997-2010 Jordan Russell
  Portions by Martijn Laan
  For conditions of distribution and use, see LICENSE.TXT.

  Wrappers for ITaskbarList3.SetProgressState & SetProgressValue

  $jrsoftware: issrc/Projects/TaskbarProgressFunc.pas,v 1.1 2010/10/29 01:48:45 jr Exp $
}

interface

type
  TTaskbarProgressState = (tpsNoProgress, tpsIndeterminate, tpsNormal,
    tpsError, tpsPaused);

procedure SetAppTaskbarProgressState(const State: TTaskbarProgressState);
procedure SetAppTaskbarProgressValue(const Completed, Total: Cardinal);
{$IFNDEF PS_MINIVCL}
  procedure SetAppTaskbarThumbnailTooltip(const ToolTipStr: String);
  procedure SetAppTaskbarOverlayIconRes(const ResOvIcon: String);
  procedure SetAppTaskbarOverlayIconFile(const FileIcon: String);
{
  procedure SetAppTaskbarRegisterTab(const hwndTab, hwndMDI: THandle);
  procedure SetAppTaskbarTabActive(const hwndTab, hwndMDI: THandle);
  procedure SetAppTaskbarTabOrder(const hwndTab, hwndInsertBefore: THandle);
  procedure SetAppTaskbarUnregisterTab(const hwndTab: THandle);
  procedure SetAppTaskbarThumbnailClip(const hwnd: THandle; var prcClip: TRect);
}
{$ENDIF}

implementation

uses
  Windows, {$IFDEF VER90} OLE2 {$ELSE} ActiveX {$ENDIF}, Forms,
   {$IFNDEF PS_MINIVCL}Graphics, SysUtils,{$ENDIF} dwTaskbarList;

var
  TaskbarListInitialized: Boolean;
  TaskbarListInterface: ITaskbarList3;

function InitializeTaskbarList: Boolean;
var
  WinVer: Word;
  Intf: ITaskbarList3;
begin
  if not TaskbarListInitialized then begin
    WinVer := Swap(Word(GetVersion()));
    if WinVer >= $0601 then
      if CoCreateInstance(CLSID_TaskbarList, nil, CLSCTX_INPROC_SERVER, IID_TaskbarList3, Intf) = S_OK then
        if Intf.HrInit = S_OK then begin
          {$IFNDEF VER90}
          { Safety: don't allow the instance to be destroyed at shutdown }
          Intf._AddRef;
          {$ENDIF}
          TaskbarListInterface := Intf;
        end;
    TaskbarListInitialized := True;
  end;
  Result := Assigned(TaskbarListInterface);
end;

procedure SetAppTaskbarProgressState(const State: TTaskbarProgressState);
const
  StateFlags: array[TTaskbarProgressState] of Integer = (
    TBPF_NOPROGRESS, TBPF_INDETERMINATE, TBPF_NORMAL, TBPF_ERROR, TBPF_PAUSED);
begin
  if InitializeTaskbarList then
    TaskbarListInterface.SetProgressState(Application.Handle, StateFlags[State]);
end;

procedure SetAppTaskbarProgressValue(const Completed, Total: Cardinal);
var
  Completed64, Total64: dwInteger64;
begin
  if InitializeTaskbarList then begin
    Completed64.Lo := Completed;
    Completed64.Hi := 0;
    Total64.Lo := Total;
    Total64.Hi := 0;
    TaskbarListInterface.SetProgressValue(Application.Handle, Completed64, Total64);
  end;
end;

{$IFNDEF PS_MINIVCL}
  procedure SetAppTaskbarThumbnailTooltip(const ToolTipStr: String);
  begin
    if InitializeTaskbarList then
      TaskbarListInterface.SetThumbnailTooltip(Application.Handle, PWideChar(WideString(ToolTipStr)));
  end;

{
  procedure SetAppTaskbarRegisterTab(const hwndTab, hwndMDI: THandle);
  begin
    if InitializeTaskbarList then
      TaskbarListInterface.RegisterTab(hwndTab, hwndMDI);
  end;

  procedure SetAppTaskbarTabActive(const hwndTab, hwndMDI: THandle);
  begin
    if InitializeTaskbarList then
      TaskbarListInterface.SetTabActive(hwndTab, hwndMDI, 0);
  end;

  procedure SetAppTaskbarTabOrder(const hwndTab, hwndInsertBefore: THandle);
  begin
    if InitializeTaskbarList then
      TaskbarListInterface.SetTabOrder(hwndTab, hwndInsertBefore);
  end;

  procedure SetAppTaskbarUnregisterTab(const hwndTab: THandle);
  begin
    if InitializeTaskbarList then
      TaskbarListInterface.UnregisterTab(hwndTab);
  end;

  procedure SetAppTaskbarThumbnailClip(const hwnd: THandle; var prcClip: TRect);
  begin
    if InitializeTaskbarList then
      TaskbarListInterface.SetThumbnailClip(hwnd, prcClip);
  end;
}

  procedure SetAppTaskbarOverlayIconRes(const ResOvIcon: String);
  var
    Icon: TIcon;
  begin
    Icon := TIcon.Create;
    Icon.SetSize(16,16);
    if ResOvIcon <> '' then
      begin
        try
          Icon.LoadFromResourceName(HInstance, ResOvIcon);
          if InitializeTaskbarList then
            TaskbarListInterface.SetOverlayIcon(Application.Handle, Icon.Handle, PWideChar(WideString(ResOvIcon)));
        finally
          Icon.Free;
        end;
      end
    else
      begin
        try
          if InitializeTaskbarList then
            TaskbarListInterface.SetOverlayIcon(Application.Handle, Icon.Handle, nil);
        finally
          Icon.Free;
        end;
      end;
  end;

  procedure SetAppTaskbarOverlayIconFile(const FileIcon: String);
  var
    Icon: TIcon;
    IconFile: String;
  begin
    Icon := TIcon.Create;
    Icon.SetSize(16,16);
    if FileIcon <> '' then
      begin
        try
          Icon.LoadFromFile(FileIcon);
          IconFile := ExtractFileName(FileIcon);
          if InitializeTaskbarList then
            TaskbarListInterface.SetOverlayIcon(Application.Handle, Icon.Handle, PWideChar(WideString(IconFile)));
        finally
          Icon.Free;
        end;
      end
    else
      begin
        try
          if InitializeTaskbarList then
            TaskbarListInterface.SetOverlayIcon(Application.Handle, Icon.Handle, nil);
        finally
          Icon.Free;
        end;
      end;
  end;
{$ENDIF}

end.
