unit NewStaticText;

{
  TNewStaticText - similar to TStaticText on D3+ but with multi-line AutoSize
  support and a WordWrap property
}

interface

{$IFNDEF VER90}
  {$IFNDEF VER100}
    {$IFNDEF VER120}
      {$IFNDEF VER130}
        {$DEFINE Delphi6OrHigher}
      {$ENDIF}
    {$ENDIF}
  {$ENDIF}
{$ENDIF}

uses
  Windows, Messages, SysUtils, Classes, Controls, Forms, Menus, Graphics, CommCtrl, ImgList, Themes;

type
  TStaticBorderStyle = (sbsNone, sbsSingle, sbsSunken);

  TNewStaticText = class(TWinControl)
  private
    FAlignment: TAlignment;
    FAutoSize: Boolean;
    FBorderStyle: TStaticBorderStyle;
    FFocusControl: TWinControl;
    FForceLTRReading: Boolean;
    FLastAdjustBoundsRTL: Boolean;
    FShowAccelChar: Boolean;
    FWordWrap: Boolean;
    class constructor Create;
    class destructor Destroy;
    procedure CNCtlColorStatic(var Message: TWMCtlColorStatic); message CN_CTLCOLORSTATIC;
    procedure CMDialogChar(var Message: TCMDialogChar); message CM_DIALOGCHAR;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure CMParentFontChanged(var Message: TMessage); message CM_PARENTFONTCHANGED;
    procedure CMTextChanged(var Message: TMessage); message CM_TEXTCHANGED;
    procedure AdjustBounds;
    function CalcBounds: TPoint;
    function GetDrawTextFlags: UINT;
    procedure SetAlignment(Value: TAlignment);
    procedure SetBorderStyle(Value: TStaticBorderStyle);
    procedure SetFocusControl(Value: TWinControl);
    procedure SetForceLTRReading(Value: Boolean);
    procedure SetShowAccelChar(Value: Boolean);
    procedure SetTransparent(const Value: Boolean);
    function GetTransparent: Boolean;
    procedure SetWordWrap(Value: Boolean);
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure Loaded; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure SetAutoSize(Value: Boolean); override;
  public
    constructor Create(AOwner: TComponent); override;
    function AdjustHeight: Integer;
  published
    property Align;
    property Alignment: TAlignment read FAlignment write SetAlignment default taLeftJustify;
    property Anchors;
    property AutoSize: Boolean read FAutoSize write SetAutoSize default True;
    property BorderStyle: TStaticBorderStyle read FBorderStyle write SetBorderStyle default sbsNone;
    property Caption;
    property Color;
    property DragCursor;
    property DragMode;
    property Enabled;
    property FocusControl: TWinControl read FFocusControl write SetFocusControl;
    property Font;
    property ForceLTRReading: Boolean read FForceLTRReading write SetForceLTRReading default False;
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowAccelChar: Boolean read FShowAccelChar write SetShowAccelChar default True;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Transparent: Boolean read GetTransparent write SetTransparent default True;
    property Visible;
    property WordWrap: Boolean read FWordWrap write SetWordWrap default False;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
  end;


  TStaticText = class(TNewStaticText)
  strict private
    class constructor Create;
    class destructor Destroy;
  published
    property Align;
    property Alignment;
    property Anchors;
    property AutoSize;
    property BevelEdges;
    property BevelInner;
    property BevelKind default bkNone;
    property BevelOuter;
    property BiDiMode;
    property BorderStyle;
    property Caption;
    property Color nodefault;
    property Constraints;
    property DoubleBuffered;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property FocusControl;
    property Font;
    property ParentBiDiMode;
    property ParentColor;
    property ParentDoubleBuffered;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowAccelChar;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Touch;
    property Transparent;
    property Visible;
    property StyleElements;
    property OnClick;
    property OnContextPopup;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnGesture;
    property OnMouseActivate;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDock;
    property OnStartDrag;
  end;

  TStaticTextStyleHook = class(TStyleHook)
  strict protected
    procedure Paint(Canvas: TCanvas); override;
    procedure PaintNC(Canvas: TCanvas); override;
    procedure WndProc(var Message: TMessage); override;
  public
    constructor Create(AControl: TWinControl); override;
  end;

procedure Register;

implementation

uses
{$IF DEFINED(CLR)}
  System.Runtime.InteropServices, System.Security, System.Security.Permissions, Types,
{$ENDIF}
  Vcl.Consts, System.RTLConsts, Vcl.ActnList, Winapi.UxTheme, Winapi.DwmApi,
  System.Types, System.UITypes, System.StrUtils, Vcl.ExtCtrls, BidiUtils;

procedure Register;
begin
  RegisterComponents('JR', [TNewStaticText]);
end;

procedure DrawTextACP(const DC: HDC; const S: String; var R: TRect;
  const AFormat: UINT);
{ Draws an ANSI string using the system's code page (CP_ACP), unlike DrawTextA
  which uses the code page defined by the selected font. }
{$IFDEF UNICODE}
begin
  DrawText(DC, PChar(S), Length(S), R, AFormat);
end;
{$ELSE}
var
  SLen, WideLen: Integer;
  WideStr: PWideChar;
begin
  SLen := Length(S);
  if SLen = 0 then
    Exit;
  if Win32Platform = VER_PLATFORM_WIN32_NT then begin
    if SLen > High(Integer) div SizeOf(WideChar) then
      Exit;
    GetMem(WideStr, SLen * SizeOf(WideChar));
    try
      WideLen := MultiByteToWideChar(CP_ACP, 0, PChar(S), SLen, WideStr, SLen);
      DrawTextW(DC, WideStr, WideLen, R, AFormat);
    finally
      FreeMem(WideStr);
    end;
  end
  else
    DrawText(DC, PChar(S), SLen, R, AFormat);
end;
{$ENDIF}

{ TNewStaticText }

class constructor TNewStaticText.Create;
begin
  TCustomStyleEngine.RegisterStyleHook(TNewStaticText, TStaticTextStyleHook);
end;

constructor TNewStaticText.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := [csCaptureMouse, csClickEvents, csSetCaption,
    csReplicatable, csDoubleClicks];
  Width := 65;
  Height := 17;
  FAutoSize := True;
  FShowAccelChar := True;
  AdjustBounds;
end;

class destructor TNewStaticText.Destroy;
begin
  TCustomStyleEngine.UnRegisterStyleHook(TNewStaticText, TStaticTextStyleHook);
end;

procedure TNewStaticText.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  CreateSubClass(Params, 'STATIC');
  with Params do
  begin
    Style := Style or SS_NOTIFY;
    if not SetBiDiStyles(Self, Params) then begin
      { Quirk: No style is set for WordWrap=False in RTL mode; WS_EX_RIGHT
        overrides SS_LEFTNOWORDWRAP, and there is no SS_RIGHTNOWORDWRAP style.
        WordWrap=False still affects AdjustBounds, though. }
      if not FWordWrap then Style := Style or SS_LEFTNOWORDWRAP;
    end;
    if not FShowAccelChar then Style := Style or SS_NOPREFIX;
    if FForceLTRReading then ExStyle := ExStyle and not WS_EX_RTLREADING;
  end;
end;

procedure TNewStaticText.CMDialogChar(var Message: TCMDialogChar);
begin
  if (FFocusControl <> nil) and Enabled and ShowAccelChar and
    IsAccel(Message.CharCode, Caption) then
    with FFocusControl do
      if CanFocus then
      begin
        SetFocus;
        Message.Result := 1;
      end;
end;

procedure TNewStaticText.CMFontChanged(var Message: TMessage);
begin
  inherited;
  AdjustBounds;
end;

procedure TNewStaticText.CMParentFontChanged(var Message: TMessage);
begin
  inherited;
  { What we're really trapping here is changes to Parent. Recalculate size
    if the new Parent's RTL setting is different. }
  if IsParentRightToLeft(Self) <> FLastAdjustBoundsRTL then
    AdjustBounds;
end;

procedure TNewStaticText.CMTextChanged(var Message: TMessage);
begin
  inherited;
  Invalidate;
  AdjustBounds;
end;

procedure TNewStaticText.Loaded;
begin
  inherited Loaded;
  AdjustBounds;
end;

function TNewStaticText.GetDrawTextFlags: UINT;
begin
  Result := DT_EXPANDTABS or DT_NOCLIP;
  if FWordWrap then Result := Result or DT_WORDBREAK;
  if not FShowAccelChar then Result := Result or DT_NOPREFIX;
  if IsParentRightToLeft(Self) then begin
    { Note: DT_RTLREADING must be included even when just calculating the
      size, since on certain fonts it can affect the width of characters.
      (Consider the Hebrew string: 'a '#$F9' b'. On 2000 with Lucida Console
      as the font, the spaces aren't drawn as wide with RTLREADING.) }
    Result := Result or DT_RIGHT;
    if not FForceLTRReading then
      Result := Result or DT_RTLREADING;
  end;
end;

function TNewStaticText.CalcBounds: TPoint;
var
  R: TRect;
  S: String;
  DC: HDC;
begin
  { Note: The calculated width/height is actually one pixel wider/taller
    than the size of the text, so that when Enabled=False the white shadow
    does not get clipped }
  R := Rect(0, 0, Width, 0);
  if R.Right > 0 then Dec(R.Right);

  S := Caption;
  if (S = '') or (FShowAccelChar and (S[1] = '&') and (S[2] = #0)) then
    S := S + ' ';

  DC := GetDC(0);
  try
    SelectObject(DC, Font.Handle);
    { On NT platforms, static controls are Unicode-based internally; when
      ANSI text is assigned to them, it is converted to Unicode using the
      system code page (ACP). We must be sure to use the ACP here, too,
      otherwise the calculated size could be incorrect. The code page used
      by DrawTextA is defined by the font, and not necessarily equal to the
      ACP, so we can't use it. (To reproduce: with the ACP set to Hebrew
      (1255), try passing Hebrew text to DrawTextA with the font set to
      "Lucida Console". It appears to use CP 1252, not 1255.) }
    DrawTextACP(DC, S, R, DT_CALCRECT or GetDrawTextFlags);
  finally
    ReleaseDC(0, DC);
  end;

  Result.X := R.Right + 1;
  Result.Y := R.Bottom + 1;
end;

procedure TNewStaticText.AdjustBounds;
var
  NewBounds: TPoint;
  NewLeft, NewWidth: Integer;
begin
  if not (csLoading in ComponentState) and FAutoSize then
  begin
    FLastAdjustBoundsRTL := IsParentRightToLeft(Self);

    NewBounds := CalcBounds;

    NewLeft := Left;
    NewWidth := Width;
    if not FWordWrap then begin
      NewWidth := NewBounds.X;
      if IsParentFlipped(Self) then
        Inc(NewLeft, Width - NewWidth);
    end;
    SetBounds(NewLeft, Top, NewWidth, NewBounds.Y);
  end;
end;

function TNewStaticText.AdjustHeight: Integer;
var
  OldHeight: Integer;
begin
  OldHeight := Height;
  Height := CalcBounds.Y;
  Result := Height - OldHeight;
end;

procedure TNewStaticText.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = FFocusControl) then
    FFocusControl := nil;
end;

procedure TNewStaticText.SetAlignment(Value: TAlignment);
begin
  if FAlignment <> Value then
  begin
    FAlignment := Value;
    RecreateWnd;
  end;
end;

procedure TNewStaticText.SetBorderStyle(Value: TStaticBorderStyle);
begin
  if FBorderStyle <> Value then
  begin
    FBorderStyle := Value;
    RecreateWnd;
  end;
end;

procedure TNewStaticText.SetAutoSize(Value: Boolean);
begin
  if FAutoSize <> Value then
  begin
    FAutoSize := Value;
    if Value then AdjustBounds;
  end;
end;

procedure TNewStaticText.SetFocusControl(Value: TWinControl);
begin
  FFocusControl := Value;
  if Value <> nil then Value.FreeNotification(Self);
end;

procedure TNewStaticText.SetForceLTRReading(Value: Boolean);
begin
  if FForceLTRReading <> Value then begin
    FForceLTRReading := Value;
    RecreateWnd;
    AdjustBounds;
  end;
end;

procedure TNewStaticText.SetShowAccelChar(Value: Boolean);
begin
  if FShowAccelChar <> Value then
  begin
    FShowAccelChar := Value;
    RecreateWnd;
    AdjustBounds;
  end;
end;

procedure TNewStaticText.CNCtlColorStatic(var Message: TWMCtlColorStatic);
begin
  if StyleServices.Enabled and Transparent then
  begin
    SetBkMode(Message.ChildDC, Windows.TRANSPARENT);
    StyleServices.DrawParentBackground(Handle, Message.ChildDC, nil, False);
    { Return an empty brush to prevent Windows from overpainting what we just have created. }
    Message.Result := GetStockObject(NULL_BRUSH);
  end
  else
    inherited;
end;

procedure TNewStaticText.SetTransparent(const Value: Boolean);
begin
  if Transparent <> Value then
  begin
    if Value then
      ControlStyle := ControlStyle - [csOpaque]
    else
      ControlStyle := ControlStyle + [csOpaque];
    Invalidate;
  end;
end;

function TNewStaticText.GetTransparent: Boolean;
begin
  Result := not (csOpaque in ControlStyle);
end;

procedure TNewStaticText.SetWordWrap(Value: Boolean);
begin
  if FWordWrap <> Value then
  begin
    FWordWrap := Value;
    RecreateWnd;
    AdjustBounds;
  end;
end;

{ TStaticTextStyleHook }

constructor TStaticTextStyleHook.Create(AControl: TWinControl);
begin
  inherited;
  OverridePaint := True;
  OverridePaintNC := True;
  OverrideEraseBkgnd := True;
  PaintOnEraseBkgnd := True;
  DoubleBuffered := True;
end;

procedure TStaticTextStyleHook.Paint(Canvas: TCanvas);
const
  Alignments: array[TAlignment] of Word = (DT_LEFT, DT_RIGHT, DT_CENTER);
  States: array[Boolean] of TThemedTextLabel = (ttlTextLabelDisabled, ttlTextLabelNormal);
var
  Details: TThemedElementDetails;
  R: TRect;
  S: String;
begin
  if StyleServices.Available then
  begin
    R := Control.ClientRect;
    if TStaticText(Control).Transparent then
    begin
      Details := StyleServices.GetElementDetails(tbCheckBoxUncheckedNormal);
      StyleServices.DrawParentBackground(Handle, Canvas.Handle, Details, False);
      Canvas.Brush.Style := bsClear;
    end
    else
    begin
      Canvas.Brush.Color := StyleServices.GetStyleColor(scWindow);
      Canvas.FillRect(R);
    end;
    Details := StyleServices.GetElementDetails(States[Control.Enabled]);
    if Control is TNewStaticText then
      S := TNewStaticText(Control).Caption
    else
      S := Text;
    DrawControlText(Canvas, Details, S, R,
      Alignments[TNewStaticText(Control).Alignment] or DT_WORDBREAK);
  end;
end;

procedure TStaticTextStyleHook.PaintNC(Canvas: TCanvas);
var
  R: TRect;
  Buffer: TBitmap;
  C1, C2: TColor;
begin
  if not StyleServices.Available then Exit;
  R := Rect(0, 0, Control.Width, Control.Height);
  if (R.Width = 0) or (R.Height = 0) then Exit;
  if TNewStaticText(Control).BorderStyle = sbsNone then
    Exit;
  Buffer := TBitMap.Create;
  try
    Buffer.Width := R.Width;
    Buffer.Height := R.Height;
                                                                       
    C1 := StyleServices.ColorToRGB(clBtnShadow);
    if TNewStaticText(Control).BorderStyle = sbsSunken then
      C2 := StyleServices.ColorToRGB(clBtnHighLight)
    else
      C2 := C1;
    Frame3D(Buffer.Canvas, R, C1, C2, 1);
    ExcludeClipRect(Canvas.Handle, 1, 1, Control.Width - 1, Control.Height - 1);
    Canvas.Draw(0, 0, Buffer);
  finally
    Buffer.Free;
  end;
end;

procedure TStaticTextStyleHook.WndProc(var Message: TMessage);
begin
  // Reserved for potential updates
  inherited;
end;

{ TStaticText }

class constructor TStaticText.Create;
begin
  TCustomStyleEngine.RegisterStyleHook(TStaticText, TStaticTextStyleHook);
end;

class destructor TStaticText.Destroy;
begin
  TCustomStyleEngine.UnRegisterStyleHook(TStaticText, TStaticTextStyleHook);
end;

end.