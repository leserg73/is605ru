unit ScriptClasses_R;

{
  Inno Setup
  Copyright (C) 1997-2020 Jordan Russell
  Portions by Martijn Laan
  For conditions of distribution and use, see LICENSE.TXT.

  Script support classes (run time)
}

interface

{$I VERSION.INC}

uses
  uPSRuntime;

function ScriptClassesLibraryRegister_R(ScriptInterpreter: TPSExec): TPSRuntimeClassImporter;
procedure ScriptClassesLibraryUpdateVars(ScriptInterpreter: TIFPSExec);

implementation

uses
  Windows, Controls, Forms, StdCtrls, Graphics,
  uPSR_std, uPSR_classes, uPSR_graphics, uPSR_controls, uPSR_forms, 
  {$IFNDEF PS_MINIVCL}
    Vcl.Styles.FontAwesome, uPSR_menus, Menus, uPSR_buttons, Buttons, uPSR_dateutils, uPSR_fontawesome, Classes, 
    {$IFNDEF VER200}
      Imaging.pngimage, Imaging.jpeg, 
    {$ELSE}
      pngimage, jpeg, 
    {$ENDIF}
  {$ENDIF}
  uPSR_stdctrls, uPSR_extctrls, uPSR_comobj, {$IFNDEF UNICODE} uPSUtils, {$ENDIF}
  NewStaticText, NewCheckListBox, NewProgressBar, RichEditViewer,
  ExtCtrls, UIStateForm, SetupForm, Main, Wizard, SetupTypes, PasswordEdit,
  FolderTreeView, BitmapImage, NewNotebook, ScriptDlg, BidiCtrls,
  UninstProgressForm;

type
  TWinControlAccess = class(TWinControl);

procedure TWinControlParentBackground_R(Self: TWinControl; var T: Boolean); begin {$IFDEF IS_D7} T := TWinControlAccess(Self).ParentBackground {$ELSE} T := False {$ENDIF}; end;
procedure TWinControlParentBackground_W(Self: TWinControl; const T: Boolean); begin {$IFDEF IS_D7} TWinControlAccess(Self).ParentBackground := T; {$ENDIF} end;

procedure RegisterWinControl_R(Cl: TPSRuntimeClassImporter);
begin
  RIRegisterTWinControl(Cl);

  with Cl.FindClass(AnsiString(TWinControl.ClassName)) do
  begin
    RegisterPropertyHelper(@TWinControlParentBackground_R, @TWinControlParentBackground_W, 'ParentBackground');
  end;
end;

procedure RegisterNewStaticText_R(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TNewStaticText) do
  begin
    RegisterMethod(@TNewStaticText.AdjustHeight, 'AdjustHeight');
  end;
end;

procedure TNewCheckListBoxChecked_R(Self: TNewCheckListBox; var T: Boolean; t1: Integer); begin T := Self.Checked[t1]; end;
procedure TNewCheckListBoxChecked_W(Self: TNewCheckListBox; const T: Boolean; t1: Integer); begin Self.Checked[t1] := T; end;
procedure TNewCheckListBoxState_R(Self: TNewCheckListBox; var T: TCheckBoxState; t1: Integer); begin T := Self.State[t1]; end;
procedure TNewCheckListBoxItemCaption_R(Self: TNewCheckListBox; var T: String; t1: Integer); begin T := Self.ItemCaption[t1]; end;
procedure TNewCheckListBoxItemCaption_W(Self: TNewCheckListBox; const T: String; t1: Integer); begin Self.ItemCaption[t1] := T; end;
procedure TNewCheckListBoxItemEnabled_R(Self: TNewCheckListBox; var T: Boolean; t1: Integer); begin T := Self.ItemEnabled[t1]; end;
procedure TNewCheckListBoxItemEnabled_W(Self: TNewCheckListBox; const T: Boolean; t1: Integer); begin Self.ItemEnabled[t1] := T; end;
procedure TNewCheckListBoxItemLevel_R(Self: TNewCheckListBox; var T: Byte; t1: Integer); begin T := Self.ItemLevel[t1]; end;
procedure TNewCheckListBoxItemObject_R(Self: TNewCheckListBox; var T: TObject; t1: Integer); begin T := Self.ItemObject[t1]; end;
procedure TNewCheckListBoxItemObject_W(Self: TNewCheckListBox; const T: TObject; t1: Integer); begin Self.ItemObject[t1] := T; end;
procedure TNewCheckListBoxItemSubItem_R(Self: TNewCheckListBox; var T: String; t1: Integer); begin T := Self.ItemSubItem[t1]; end;
procedure TNewCheckListBoxItemSubItem_W(Self: TNewCheckListBox; const T: String; t1: Integer); begin Self.ItemSubItem[t1] := T; end;
procedure TNewCheckListBoxItemFontColor_R(Self: TNewCheckListBox; var T: TColor; const t1: Integer); begin T := Self.ItemFontColor[t1]; end;
procedure TNewCheckListBoxItemFontColor_W(Self: TNewCheckListBox; const T: TColor; const t1: Integer); begin Self.ItemFontColor[t1] := T; end;
procedure TNewCheckListBoxItemFontStyle_R(Self: TNewCheckListBox; var T: TFontStyles; const t1: Integer); begin T := Self.ItemFontStyle[t1]; end;
procedure TNewCheckListBoxItemFontStyle_W(Self: TNewCheckListBox; const T: TFontStyles; const t1: Integer); begin Self.ItemFontStyle[t1] := T; end;
procedure TNewCheckListBoxSubItemFontColor_R(Self: TNewCheckListBox; var T: TColor; const t1: Integer); begin T := Self.SubItemFontColor[t1]; end;
procedure TNewCheckListBoxSubItemFontColor_W(Self: TNewCheckListBox; const T: TColor; const t1: Integer); begin Self.SubItemFontColor[t1] := T; end;
procedure TNewCheckListBoxSubItemFontStyle_R(Self: TNewCheckListBox; var T: TFontStyles; const t1: Integer); begin T := Self.SubItemFontStyle[t1]; end;
procedure TNewCheckListBoxSubItemFontStyle_W(Self: TNewCheckListBox; const T: TFontStyles; const t1: Integer); begin Self.SubItemFontStyle[t1] := T; end;

procedure RegisterNewCheckListBox_R(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TNewCheckListBox) do
  begin
    RegisterMethod(@TNewCheckListBox.AddCheckBox, 'AddCheckBox');
    RegisterMethod(@TNewCheckListBox.AddGroup, 'AddGroup');
    RegisterMethod(@TNewCheckListBox.AddRadioButton, 'AddRadioButton');
    RegisterMethod(@TNewCheckListBox.CheckItem, 'CheckItem');
    RegisterPropertyHelper(@TNewCheckListBoxChecked_R, @TNewCheckListBoxChecked_W, 'Checked');
    RegisterPropertyHelper(@TNewCheckListBoxState_R, nil, 'State');
    RegisterPropertyHelper(@TNewCheckListBoxItemCaption_R, @TNewCheckListBoxItemCaption_W, 'ItemCaption');
    RegisterPropertyHelper(@TNewCheckListBoxItemEnabled_R, @TNewCheckListBoxItemEnabled_W, 'ItemEnabled');
    RegisterPropertyHelper(@TNewCheckListBoxItemLevel_R, nil, 'ItemLevel');
    RegisterPropertyHelper(@TNewCheckListBoxItemObject_R, @TNewCheckListBoxItemObject_W, 'ItemObject');
    RegisterPropertyHelper(@TNewCheckListBoxItemSubItem_R, @TNewCheckListBoxItemSubItem_W, 'ItemSubItem');
    RegisterPropertyHelper(@TNewCheckListBoxItemFontColor_R, @TNewCheckListBoxItemFontColor_W, 'ItemFontColor');
    RegisterPropertyHelper(@TNewCheckListBoxItemFontStyle_R, @TNewCheckListBoxItemFontStyle_W, 'ItemFontStyle');
    RegisterPropertyHelper(@TNewCheckListBoxSubItemFontColor_R, @TNewCheckListBoxSubItemFontColor_W, 'SubItemFontColor');
    RegisterPropertyHelper(@TNewCheckListBoxSubItemFontStyle_R, @TNewCheckListBoxSubItemFontStyle_W, 'SubItemFontStyle');
  end;
end;

procedure RegisterNewProgressBar_R(Cl: TPSRuntimeClassImporter);
begin
  Cl.Add(TNewProgressBar);
end;

procedure TRichEditViewerRTFText_W(Self: TRichEditViewer; const T: AnsiString); begin Self.RTFText := T; end;

procedure RegisterRichEditViewer_R(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TRichEditViewer) do
  begin
    RegisterPropertyHelper(nil, @TRichEditViewerRTFText_W, 'RTFText');
  end;
end;

procedure RegisterPasswordEdit_R(Cl: TPSRuntimeClassImporter);
begin
  Cl.Add(TPasswordEdit);
end;

procedure TCustomFolderTreeViewDirectory_W(Self: TCustomFolderTreeView; const T: String); begin Self.Directory := T; end;
procedure TCustomFolderTreeViewDirectory_R(Self: TCustomFolderTreeView; var T: String); begin T := Self.Directory; end;

procedure RegisterCustomFolderTreeView_R(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TCustomFolderTreeView) do
  begin
    RegisterMethod(@TCustomFolderTreeView.ChangeDirectory, 'ChangeDirectory');
    RegisterMethod(@TCustomFolderTreeView.CreateNewDirectory, 'CreateNewDirectory');
    RegisterPropertyHelper(@TCustomFolderTreeViewDirectory_R,@TCustomFolderTreeViewDirectory_W,'Directory');
  end;
end;

procedure RegisterStartMenuFolderTreeView_R(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TStartMenuFolderTreeView) do
  begin
    RegisterMethod(@TStartMenuFolderTreeView.SetPaths, 'SetPaths');
  end;
end;

procedure RegisterFolderTreeView_R(Cl: TPSRuntimeClassImporter);
begin
  Cl.Add(TFolderTreeView);
end;

procedure TBitmapAlphaFormat_W(Self: TBitmap; const T: TAlphaFormat); begin Self.AlphaFormat := T; end;
procedure TBitmapAlphaFormat_R(Self: TBitmap; var T: TAlphaFormat); begin T := Self.AlphaFormat; end;

procedure RegisterBitmapImage_R(Cl: TPSRuntimeClassImporter);
begin
  with Cl.FindClass('TBitmap') do
  begin
    RegisterPropertyHelper(@TBitmapAlphaFormat_R, @TBitmapAlphaFormat_W, 'AlphaFormat');
  end;
  Cl.Add(TBitmapImage);
end;

{$IFNDEF PS_MINIVCL}
  procedure TNewMonthCalendarOnChange_W(Self: TNewMonthCalendar; const T: TNotifyEvent); begin Self.OnChange := T; end;
  procedure TNewMonthCalendarOnChange_R(Self: TNewMonthCalendar; var T: TNotifyEvent); begin T := Self.OnChange; end;
{$ENDIF}

procedure RegisterBidiCtrls_R(Cl: TPSRuntimeClassImporter);
begin
  Cl.Add(TNewEdit);
  {$IFNDEF PS_MINIVCL}
    Cl.Add(TNewGroupBox);
    Cl.Add(TNewMonthCalColors);
    Cl.Add(TNewCommonCalendar);
    with Cl.Add(TNewMonthCalendar) do
      RegisterPropertyHelper(@TNewMonthCalendarOnChange_R,@TNewMonthCalendarOnChange_W,'OnChange');
    Cl.Add(TNewDateTimePicker);
  {$ENDIF}
  Cl.Add(TNewMemo);
  Cl.Add(TNewComboBox);
  Cl.Add(TNewListBox);
  Cl.Add(TNewButton);
  Cl.Add(TNewCheckBox);
  Cl.Add(TNewRadioButton);
end;

procedure TNewNotebookPages_R(Self: TNewNotebook; var T: TNewNotebookPage; const t1: Integer); begin T := Self.Pages[t1]; end;
procedure TNewNotebookPageCount_R(Self: TNewNotebook; var T: Integer); begin T := Self.PageCount; end;

procedure RegisterNewNotebook_R(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TNewNotebook) do
  begin
    RegisterMethod(@TNewNotebook.FindNextPage, 'FindNextPage');
    RegisterPropertyHelper(@TNewNotebookPageCount_R,nil,'PageCount');
    RegisterPropertyHelper(@TNewNotebookPages_R,nil,'Pages');
  end;
end;

procedure TNewNotebookPageNotebook_W(Self: TNewNotebookPage; const T: TNewNotebook); begin Self.Notebook := T; end;
procedure TNewNotebookPageNotebook_R(Self: TNewNotebookPage; var T: TNewNotebook); begin T := Self.Notebook; end;

procedure RegisterNewNotebookPage_R(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TNewNotebookPage) do
  begin
    RegisterPropertyHelper(@TNewNotebookPageNotebook_R,@TNewNotebookPageNotebook_W,'Notebook');
  end;
end;

procedure RegisterUIStateForm_R(Cl: TPSRuntimeClassImporter);
begin
  Cl.Add(TUIStateForm);
end;

procedure RegisterSetupForm_R(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TSetupForm) do
  begin
    RegisterMethod(@TSetupForm.CalculateButtonWidth, 'CalculateButtonWidth');
    RegisterMethod(@TSetupForm.ShouldSizeX, 'ShouldSizeX');
    RegisterMethod(@TSetupForm.ShouldSizeY, 'ShouldSizeY');
    RegisterMethod(@TSetupForm.FlipSizeAndCenterIfNeeded, 'FlipSizeAndCenterIfNeeded');
  end;
end;

procedure RegisterMainForm_R(Cl: TPSRuntimeClassImporter);
begin
  with CL.Add(TMainForm) do
  begin
    RegisterMethod(@TMainForm.ShowAboutBox, 'ShowAboutBox');
  end;
end;

procedure RegisterWizardForm_R(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TWizardForm) do
  begin

    RegisterMethod(@TWizardForm.AdjustLabelHeight, 'AdjustLabelHeight');
    RegisterMethod(@TWizardForm.IncTopDecHeight, 'IncTopDecHeight');
  end;
end;

procedure RegisterUninstallProgressForm_R(Cl: TPSRuntimeClassImporter);
begin
  Cl.Add(TUninstallProgressForm);
end;

procedure RegisterWizardPage_R(Cl: TIFPSRuntimeClassImporter);
begin
  Cl.Add(TWizardPage);
end;

procedure TInputQueryWizardPageEdits_R(Self: TInputQueryWizardPage; var T: TPasswordEdit; const t1: Integer); begin T := Self.Edits[t1]; end;
procedure TInputQueryWizardPagePromptLabels_R(Self: TInputQueryWizardPage; var T: TNewStaticText; const t1: Integer); begin T := Self.PromptLabels[t1]; end;
procedure TInputQueryWizardPageValues_R(Self: TInputQueryWizardPage; var T: String; const t1: Integer); begin T := Self.Values[t1]; end;
procedure TInputQueryWizardPageValues_W(Self: TInputQueryWizardPage; const T: String; const t1: Integer); begin Self.Values[t1] := T; end;

procedure RegisterInputQueryWizardPage_R(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TInputQueryWizardPage) do
  begin
    RegisterMethod(@TInputQueryWizardPage.Add, 'Add');
    RegisterPropertyHelper(@TInputQueryWizardPageEdits_R,nil,'Edits');
    RegisterPropertyHelper(@TInputQueryWizardPagePromptLabels_R,nil,'PromptLabels');
    RegisterPropertyHelper(@TInputQueryWizardPageValues_R,@TInputQueryWizardPageValues_W,'Values');
  end;
end;

procedure TInputOptionWizardPageSelectedValueIndex_R(Self: TInputOptionWizardPage; var T: Integer); begin T := Self.SelectedValueIndex; end;
procedure TInputOptionWizardPageSelectedValueIndex_W(Self: TInputOptionWizardPage; const T: Integer); begin Self.SelectedValueIndex := T; end;
procedure TInputOptionWizardPageValues_W(Self: TInputOptionWizardPage; const T: Boolean; const t1: Integer); begin Self.Values[t1] := T; end;
procedure TInputOptionWizardPageValues_R(Self: TInputOptionWizardPage; var T: Boolean; const t1: Integer); begin T := Self.Values[t1]; end;

procedure RegisterInputOptionWizardPage_R(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TInputOptionWizardPage) do
  begin
    RegisterMethod(@TInputOptionWizardPage.Add, 'Add');
    RegisterMethod(@TInputOptionWizardPage.AddEx, 'AddEx');
    RegisterPropertyHelper(@TInputOptionWizardPageSelectedValueIndex_R,@TInputOptionWizardPageSelectedValueIndex_W,'SelectedValueIndex');
    RegisterPropertyHelper(@TInputOptionWizardPageValues_R,@TInputOptionWizardPageValues_W,'Values');
  end;
end;

procedure TInputDirWizardPageButtons_R(Self: TInputDirWizardPage; var T: TNewButton; const t1: Integer); begin T := Self.Buttons[t1]; end;
procedure TInputDirWizardPageEdits_R(Self: TInputDirWizardPage; var T: TNewEdit; const t1: Integer); begin T := Self.Edits[t1]; end;
procedure TInputDirWizardPagePromptLabels_R(Self: TInputDirWizardPage; var T: TNewStaticText; const t1: Integer); begin T := Self.PromptLabels[t1]; end;
procedure TInputDirWizardPageValues_W(Self: TInputDirWizardPage; const T: String; const t1: Integer); begin Self.Values[t1] := T; end;
procedure TInputDirWizardPageValues_R(Self: TInputDirWizardPage; var T: String; const t1: Integer); begin T := Self.Values[t1]; end;

procedure RegisterInputDirWizardPage_R(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TInputDirWizardPage) do
  begin
    RegisterMethod(@TInputDirWizardPage.Add, 'Add');
    RegisterPropertyHelper(@TInputDirWizardPageButtons_R,nil,'Buttons');
    RegisterPropertyHelper(@TInputDirWizardPageEdits_R,nil,'Edits');
    RegisterPropertyHelper(@TInputDirWizardPagePromptLabels_R,nil,'PromptLabels');
    RegisterPropertyHelper(@TInputDirWizardPageValues_R,@TInputDirWizardPageValues_W,'Values');
  end;
end;

procedure TInputFileWizardPageButtons_R(Self: TInputFileWizardPage; var T: TNewButton; const t1: Integer); begin T := Self.Buttons[t1]; end;
procedure TInputFileWizardPagePromptLabels_R(Self: TInputFileWizardPage; var T: TNewStaticText; const t1: Integer); begin T := Self.PromptLabels[t1]; end;
procedure TInputFileWizardPageEdits_R(Self: TInputFileWizardPage; var T: TNewEdit; const t1: Integer); begin T := Self.Edits[t1]; end;
procedure TInputFileWizardPageValues_W(Self: TInputFileWizardPage; const T: String; const t1: Integer); begin Self.Values[t1] := T; end;
procedure TInputFileWizardPageValues_R(Self: TInputFileWizardPage; var T: String; const t1: Integer); begin T := Self.Values[t1]; end;
procedure TInputFileWizardPageIsSaveButton_W(Self: TInputFileWizardPage; const T: Boolean; const t1: Integer); begin Self.IsSaveButton[t1] := T; end;
procedure TInputFileWizardPageIsSaveButton_R(Self: TInputFileWizardPage; var T: Boolean; const t1: Integer); begin T := Self.IsSaveButton[t1]; end;

procedure RegisterInputFileWizardPage_R(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TInputFileWizardPage) do
  begin
    RegisterMethod(@TInputFileWizardPage.Add, 'Add');
    RegisterPropertyHelper(@TInputFileWizardPageButtons_R,nil,'Buttons');
    RegisterPropertyHelper(@TInputFileWizardPageEdits_R,nil,'Edits');
    RegisterPropertyHelper(@TInputFileWizardPagePromptLabels_R,nil,'PromptLabels');
    RegisterPropertyHelper(@TInputFileWizardPageValues_R,@TInputFileWizardPageValues_W,'Values');
    RegisterPropertyHelper(@TInputFileWizardPageIsSaveButton_R,@TInputFileWizardPageIsSaveButton_W,'IsSaveButton');
  end;
end;

procedure RegisterOutputMsgWizardPage_R(CL: TPSRuntimeClassImporter);
begin
  CL.Add(TOutputMsgWizardPage);
end;

procedure RegisterOutputMsgMemoWizardPage_R(CL: TPSRuntimeClassImporter);
begin
  CL.Add(TOutputMsgMemoWizardPage);
end;

procedure RegisterOutputProgressWizardPage_R(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TOutputProgressWizardPage) do
  begin
    RegisterMethod(@TOutputProgressWizardPage.Hide, 'Hide');
    RegisterMethod(@TOutputProgressWizardPage.SetProgress, 'SetProgress');
    RegisterMethod(@TOutputProgressWizardPage.SetText, 'SetText');
    RegisterMethod(@TOutputProgressWizardPage.Show, 'Show');
  end;
end;

procedure RegisterHandCursor_R(Cl: TPSRuntimeClassImporter);
const
  IDC_HAND = MakeIntResource(32649);
begin
  Screen.Cursors[crHand] := LoadCursor(0, IDC_HAND);
end;

function ScriptClassesLibraryRegister_R(ScriptInterpreter: TPSExec): TPSRuntimeClassImporter;
var
  Cl: TPSRuntimeClassImporter;
begin
  Cl := TPSRuntimeClassImporter.Create();
  try
    { Std }
    RIRegisterTObject(Cl);
    RIRegisterTPersistent(Cl);
    RIRegisterTComponent(Cl);

    { Classes }
    RIRegisterTStream(Cl);
    RIRegisterTStrings(Cl, True);
    RIRegisterTStringList(Cl);
    RIRegisterTHandleStream(Cl);
    RIRegisterTFileStream(Cl);
    {$IFDEF UNICODE}
      RIRegisterTStringStream(Cl);
    {$ENDIF}
    {$IFNDEF PS_MINIVCL}
      RIRegisterTCustomMemoryStream(Cl);
      RIRegisterTMemoryStream(Cl);
      RIRegisterTResourceStream(Cl);
      RIRegisterTParser(Cl);
      RIRegisterTCollectionItem(Cl);
      RIRegisterTCollection(Cl);
    {$ENDIF}

    { Graphics }
    RIRegisterTGraphicsObject(Cl);
    RIRegisterTFont(Cl);
    RIRegisterTPen(Cl);
    RIRegisterTBrush(Cl);
    {$IFNDEF PS_MINIVCL}
      RIRegisterTCustomCanvas(CL);
    {$ENDIF}
    RIRegisterTCanvas(Cl);
    RIRegisterTGraphic(Cl, True);
    RIRegisterTBitmap(Cl, True);
    {$IFNDEF PS_MINIVCL}
      RIRegisterTIcon(Cl, True);
      RIRegisterTMetafile(CL);
      RIRegisterTMetafileCanvas(CL);
      RIRegisterTPicture(Cl, True);
      RIRegisterTPngImage(Cl, True);
    {$ENDIF}

    { Controls }
    RIRegister_TDragObject(Cl);
    RIRegisterTSizeConstraints(Cl);
    {$IFNDEF PS_MINIVCL}
      RIRegister_TMargins(Cl);
      RIRegister_TPadding(Cl);
    {$ENDIF}
    RIRegisterTControl(Cl);
    RegisterWinControl_R(Cl);
    RIRegisterTGraphicControl(Cl);
    RIRegisterTCustomControl(Cl);
    {$IFNDEF PS_MINIVCL}
      RIRegister_THintWindow(Cl);
      RIRegister_TCustomImageList(Cl);
      RIRegister_TImageList(Cl);
      RIRegister_TCustomHintWindow(Cl);
      RIRegister_TCustomHint(Cl);
      RIRegister_TBalloonHint(Cl);
    {$ENDIF}

    { Forms }
    {$IFNDEF PS_MINIVCL}
      RIRegisterTControlScrollBar(Cl);
    {$ENDIF}
    RIRegisterTScrollingWinControl(Cl);
    {$IFNDEF PS_MINIVCL}
      RIRegisterTScrollBox(Cl);
      RIRegisterTCustomForm(Cl);
    {$ENDIF}
    RIRegisterTForm(Cl);
    {$IFNDEF PS_MINIVCL}
      RIRegisterTScreen(Cl);
      RIRegisterTApplication(Cl);
    {$ENDIF}

    { StdCtrls }
    {$IFNDEF PS_MINIVCL}
      RIRegisterTCustomGroupBox(Cl);
      RIRegisterTGroupBox(Cl);
    {$ENDIF}
    RIRegisterTCustomLabel(Cl);
    RIRegisterTLabel(Cl);
    RIRegisterTCustomEdit(Cl);
    RIRegisterTCustomMaskEdit(Cl);
    RIRegisterTEdit(Cl);
    RIRegisterTCustomMemo(Cl);
    RIRegisterTMemo(Cl);
    RIRegisterTCustomComboBox(Cl);
    RIRegisterTComboBox(Cl);
    RIRegisterTButtonControl(Cl);
    {$IFNDEF PS_MINIVCL}
      RIRegisterTImageMargins(Cl);
      RIRegisterTCustomButton(Cl);
    {$ENDIF}
    RIRegisterTButton(Cl);
    RIRegisterTCustomCheckBox(Cl);
    RIRegisterTCheckBox(Cl);
    RIRegisterTRadioButton(Cl);
    RIRegisterTCustomListBox(Cl);
    RIRegisterTListBox(Cl);
    {$IFNDEF PS_MINIVCL}
      RIRegisterTScrollBar(Cl);
    {$ENDIF}

    { ComCtrls }
    {$IFNDEF PS_MINIVCL}
      RIRegisterTTrackBar(Cl);
      RIRegisterTCustomUpDown(Cl);
      RIRegisterTUpDown(Cl);
      RIRegisterTCustomHotKey(Cl);
      RIRegisterTHotKey(Cl);
      RIRegisterTTStatusBar(Cl);
      RIRegisterTListView(Cl);
      RIRegisterTTreeView(Cl);
      RIRegisterTTab(Cl);
      RIRegisterTHeaderControl(Cl);
      { Date&Time }
      RIRegister_DateTime(CL);
    {$ENDIF}

    { ExtCtrls }
    {$IFNDEF PS_MINIVCL}
      RIRegisterTShape(Cl);
      RIRegisterTImage(Cl);
      RIRegisterTPaintBox(Cl);
      RIRegisterTHeader(Cl);
      RIRegister_TCustomColorBox(CL);
      RIRegister_TColorBox(CL);
    {$ENDIF}
    RIRegisterTBevel(Cl);
    {$IFNDEF PS_MINIVCL}
      RIRegisterTTimer(Cl);
    {$ENDIF}
    RIRegisterTCustomPanel(Cl);
    RIRegisterTPanel(Cl);

    { ComObj }
    RIRegister_ComObj(ScriptInterpreter);

    { Buttons }
    {$IFNDEF PS_MINIVCL}
      RIRegisterTSpeedButton(Cl);
      RIRegisterTBitBtn(Cl);
    {$ENDIF}

    { Menu }
    {$IFNDEF PS_MINIVCL}
      RIRegister_Menus(CL);
      RIRegister_Menus_Routines(ScriptInterpreter);
    {$ENDIF}

    { Date and Time }
    {$IFNDEF PS_MINIVCL}
      RegisterDateTimeLibrary_R(ScriptInterpreter);
      RIRegister_FontAwesome(Cl);
    {$ENDIF}

    RegisterNewStaticText_R(Cl);
    RegisterNewCheckListBox_R(Cl);
    RegisterNewProgressBar_R(Cl);
    RegisterRichEditViewer_R(Cl);
    RegisterPasswordEdit_R(Cl);
    RegisterCustomFolderTreeView_R(Cl);
    RegisterFolderTreeView_R(Cl);
    RegisterStartMenuFolderTreeView_R(Cl);
    RegisterBitmapImage_R(Cl);
    RegisterBidiCtrls_R(Cl);

    RegisterNewNotebook_R(Cl);
    RegisterNewNotebookPage_R(Cl);

    RegisterUIStateForm_R(Cl);
    RegisterSetupForm_R(Cl);
    RegisterMainForm_R(Cl);
    RegisterWizardForm_R(Cl);
    RegisterUninstallProgressForm_R(Cl);

    RegisterWizardPage_R(Cl);
    RegisterInputQueryWizardPage_R(Cl);
    RegisterInputOptionWizardPage_R(Cl);
    RegisterInputDirWizardPage_R(Cl);
    RegisterInputFileWizardPage_R(Cl);
    RegisterOutputMsgWizardPage_R(Cl);
    RegisterOutputMsgMemoWizardPage_R(Cl);
    RegisterOutputProgressWizardPage_R(Cl);

    RegisterHandCursor_R(Cl);

    RegisterClassLibraryRuntime(ScriptInterpreter, Cl);
  except
    Cl.Free;
    raise;
  end;

  Result := Cl;
end;

procedure ScriptClassesLibraryUpdateVars(ScriptInterpreter: TIFPSExec);
begin
  {$IFNDEF PS_MINIVCL}
    SetVariantToClass(ScriptInterpreter.GetVarNo(ScriptInterpreter.GetVar('APPLICATION')), Application);
    SetVariantToClass(ScriptInterpreter.GetVarNo(ScriptInterpreter.GetVar('SCREEN')), Screen);
    SetVariantToClass(ScriptInterpreter.GetVarNo(ScriptInterpreter.GetVar('FONTAWESOME')), FontAwesome);
  {$ENDIF}
  SetVariantToClass(ScriptInterpreter.GetVarNo(ScriptInterpreter.GetVar('WIZARDFORM')), WizardForm);
  SetVariantToClass(ScriptInterpreter.GetVarNo(ScriptInterpreter.GetVar('MAINFORM')), MainForm);
  SetVariantToClass(ScriptInterpreter.GetVarNo(ScriptInterpreter.GetVar('UNINSTALLPROGRESSFORM')), UninstallProgressForm);
end;

end.
