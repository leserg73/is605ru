unit BidiCtrls;

{
  Inno Setup
  Copyright (C) 1997-2024 Jordan Russell
  Portions by Martijn Laan
  For conditions of distribution and use, see LICENSE.TXT.

  RTL-capable versions of standard controls
}

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls{$IFNDEF PS_MINIVCL}, ComCtrls{$ENDIF};

type
  TNewEdit = class(TEdit)
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  end;

  {$IFNDEF PS_MINIVCL}
  TNewGroupBox = class(TGroupBox)
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  end;

  TNewCommonCalendar = class(TCommonCalendar);
  TNewMonthCalColors = class(TMonthCalColors);

  TNewMonthCalendar = class(TMonthCalendar)
  private
    FOnChange:TNotifyEvent;
    procedure CNNotify(var Message: TWMNotify); message CN_NOTIFY;
    procedure WMGetDlgCode(var Msg:TWMGetDlgCode); message WM_GETDLGCODE;
    procedure WMLButtonDown(var Msg: TWMLButtonDown); message WM_LBUTTONDOWN;
    procedure DoChange;
  published
    property OnChange:TNotifyEvent read FOnChange write FOnChange;
  end;

  TNewDateTimePicker = class(TDateTimePicker);
  {$ENDIF}

  TNewMemo = class(TMemo)
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  end;

  TNewComboBox = class(TComboBox)
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  end;

  TNewListBox = class(TListBox)
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  end;

  TNewButton = class(TButton)
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  end;

  TNewCheckBox = class(TCheckBox)
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  end;

  TNewRadioButton = class(TRadioButton)
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  end;

  TNewLinkLabel = class(TLinkLabel)
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  public
    function AdjustHeight: Integer;
  end;

procedure Register;
  
implementation

uses
  CommCtrl, BidiUtils;

procedure Register;
begin
  RegisterComponents('JR', [TNewEdit, TNewMemo, TNewComboBox, TNewListBox,
    TNewButton, TNewCheckBox, TNewRadioButton]);
end;

{ TNewEdit }

procedure TNewEdit.CreateParams(var Params: TCreateParams);
begin
  inherited;
  SetBiDiStyles(Self, Params);
end;

{$IFNDEF PS_MINIVCL}
{ TNewGroupBox }
procedure TNewGroupBox.CreateParams(var Params: TCreateParams);
begin
  inherited;
  SetBiDiStyles(Self, Params);
end;

{ TNewMonthCalendar }
procedure TNewMonthCalendar.CNNotify(var Message:TWMNotify);
 var
  bChanged:boolean;
  dDate,dEndDate:TDateTime;
 begin
  with Message, NMHdr^ do
   if (code=MCN_SELECT) or (Code=MCN_SELCHANGE) then
    begin
     dDate:=Date;
     dEndDate:=EndDate;
     inherited;
     bChanged:=Date<>dDate;
     if MultiSelect and (dEndDate<>EndDate) then bChanged:=true;
     if bChanged then DoChange;
     exit;
    end;
  inherited;
end;

procedure TNewMonthCalendar.WMGetDlgCode(var Msg:TWMGetDlgCode);
 begin
  Msg.Result:=DLGC_WANTARROWS;
 end;

procedure TNewMonthCalendar.WMLButtonDown(var Msg:TWMLButtonDown);
 begin
  SetFocus;
  inherited;
 end;

procedure TNewMonthCalendar.DoChange;
 begin
  if Assigned(FOnChange) then FOnChange(Self);
 end;
{$ENDIF}

{ TNewMemo }

procedure TNewMemo.CreateParams(var Params: TCreateParams);
begin
  inherited;
  SetBiDiStyles(Self, Params);
end;

{ TNewComboBox }

procedure TNewComboBox.CreateParams(var Params: TCreateParams);
begin
  inherited;
  SetBiDiStyles(Self, Params);
end;

{ TNewListBox }

procedure TNewListBox.CreateParams(var Params: TCreateParams);
begin
  inherited;
  SetBiDiStyles(Self, Params);
end;

{ TNewButton }

procedure TNewButton.CreateParams(var Params: TCreateParams); 
begin
  inherited;
  SetBiDiStyles(Self, Params);
  Params.ExStyle := Params.ExStyle and not WS_EX_RIGHT;
end;

{ TNewCheckBox }

procedure TNewCheckBox.CreateParams(var Params: TCreateParams);
begin
  inherited;
  SetBiDiStyles(Self, Params);
end;

{ TNewRadioButton }

procedure TNewRadioButton.CreateParams(var Params: TCreateParams);
begin
  inherited;
  SetBiDiStyles(Self, Params);
end;

{ TNewLinkLabel }

procedure TNewLinkLabel.CreateParams(var Params: TCreateParams);
begin
  inherited;
  SetBiDiStyles(Self, Params);
end;

function TNewLinkLabel.AdjustHeight: Integer;
begin
  var OldHeight := Height;
  var IdealSize: TSize;
  SendMessage(Handle, LM_GETIDEALSIZE, Width, LPARAM(@IdealSize));
  Height := IdealSize.cy;
  Result := Height - OldHeight;
end;

end.
