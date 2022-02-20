unit ModernColors;

{
  Inno Setup
  Copyright (C) 1997-2019 Jordan Russell
  Portions by Martijn Laan
  For conditions of distribution and use, see LICENSE.TXT.

  Colors for modern dark and light themes, with classic theme support
}

interface

uses
  Graphics;

type
  TThemeType = (ttModernLight, ttModernDark, ttClassic);
  TThemeColor = (tcFore, tcBack, tcToolBack, tcSelBack, tcMarginFore, tcMarginBack, tcSplitterBack,
                 tcBraceBack, tcIdentGuideFore, tcCaretLineBack, tcBorderLineEnd, tcBackWCCTabWrap,
                 tcRed, tcGreen, tcBlue, tcOrange, tcPurple, tcYellow, tcTeal, tcGray);

  TTheme = class
  private
    FType: TThemeType;
    function FGetDark: Boolean;
    function FGetModern: Boolean;
    function FGetColor(Color: TThemeColor): TColor;
  public
    property Colors[Color: TThemeColor]: TCOlor read FGetColor;
    property Dark: Boolean read FGetDark;
    property Modern: Boolean read FGetModern;
    property Typ: TThemeType read FType write FType;
  end;

implementation

function TTheme.FGetColor(Color: TThemeColor): TColor;
const
  { D = Dark, L = Light, M = Modern, C = Classic }

  DFore = $D4D4D4;
  DBack = $2E2A2D;           { Monokai Pro }
  DToolBack = $413E40;       { Monokai Pro }
  DSelBack = $633F13;        { Monokai Pro }
  DMarginFore = $716F71;     { Monokai Pro }
  DMarginBack = $413E40;     { Monokai Pro }
  DSplitterBack = $413E40;   { Monokai Pro }
  DBraceBack = $716F71;      { Monokai Pro }
  DIdentGuideFore = $716F71; { Monokai Pro }
  DCaretLineBack = $1B3434;  { Monokai Pro }
  DBorderLineEnd = $635F60;  { Monokai Pro }
  DBackWCCTabWrap = $000040FF;
  //Monokai Pro's dark control color: $221F22

  LFore = clBlack;
  LBack = clWhite;
  LToolBack = clBtnFace;
  LSelBack = $C0C0C0;        { Scintilla }
  LMarginFore = $716F71;     { Monokai Pro }
  LMarginBack = $F9FBFB;     { Monokai Pro }
  LSplitterBack = clBtnFace;
  LBraceBack = $E0E0E0;      { Inno Setup 5 }
  LIdentGuideFore = clSilver;
  LCaretLineBack = $E6FFFA;
  LBorderLineEnd = $FEFECC;
  LBackWCCTabWrap = $00559BFB;

  CFore = clBlack;
  CBack = clWhite;
  CToolBack = clBtnFace;
  CSelBack = $C0C0C0;        { Scintilla }
  CMarginFore = clWindowText;
  CMarginBack = clBtnFace;
  CSplitterBack = clBtnFace;
  CBraceBack = $E0E0E0;      { Inno Setup 5 }
  CIdentGuideFore = clSilver;
  CCaretLineBack = $D0FFFF;
  CBorderLineEnd = $FEFE7F;
  CBackWCCTabWrap = $003A80FF;

  { The Microsoft Azure DevOps work well as foreground colors on both dark and light backgrounds.
    Its red and blue also fit well with the colors used by Microsoft's VS Image Library. }

  MRed = $6353D6;            { Azure DevOps, 2 tints lightened using color-hex.com }
  MGreen = $339933;          { Azure DevOps }
  MBlue = $D47800;           { Azure DevOps }   
  MOrange = $5E88E5;         { Azure DevOps }
  MPurple = $A86292;         { Azure DevOps, 2 tints lightened using color-hex.com }
  MYellow = $1DCBF2;         { Azure DevOps }
  MTeal = $B0C94E;           { Visual Studio 2017 }
  MGray = $707070;           { Inno Setup 5 }

  CRed = clRed;
  CGreen = clGreen;
  CBlue = clBlue;
  COrange = clOlive;
  CPurple = $C00080;         { Inno Setup 5 }
  CYellow = clYellow;
  CTeal = clTeal;
  CGray = $707070;           { Inno Setup 5 }

  Colors: array [TThemeType, TThemeColor] of TColor = (
    (LFore, LBack, LToolBack, LSelBack, LMarginFore, LMarginBack, LSplitterBack, LBraceBack, LIdentGuideFore, LCaretLineBack, LBorderLineEnd, LBackWCCTabWrap, MRed, MGreen, MBlue, MOrange, MPurple, MYellow, MTeal, MGray),
    (DFore, DBack, DToolBack, DSelBack, DMarginFore, DMarginBack, DSplitterBack, DBraceBack, DIdentGuideFore, DCaretLineBack, DBorderLineEnd, DBackWCCTabWrap, MRed, MGreen, MBlue, MOrange, MPurple, MYellow, MTeal, MGray),
    (CFore, CBack, CToolBack, CSelBack, CMarginFore, CMarginBack, CSplitterBack, CBraceBack, CIdentGuideFore, CCaretLineBack, CBorderLineEnd, CBackWCCTabWrap, CRed, CGreen, CBlue, COrange, CPurple, CYellow, CTeal, CGray)
  );
  
begin
  Result := Colors[FType, Color];
end;

function TTheme.FGetDark: Boolean;
begin
  Result := FType = ttModernDark;
end;

function TTheme.FGetModern: Boolean;
begin
  Result := FType <> ttClassic;
end;

end.
