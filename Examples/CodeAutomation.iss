; -- CodeAutomation.iss --
;
; ������������� ������������� IDispatch �� ������ �������� COM Automation.

; ���������� � ���������� ������������, ����� ������������ ��� ����������� INNO SETUP!

[Setup]
AppName=My Program
AppVersion=1.5
WizardStyle=modern
DisableWelcomePage=no
CreateAppDir=no
DisableProgramGroupPage=yes
DefaultGroupName=My Program
UninstallDisplayIcon={app}\MyProg.exe
OutputDir=userdocs:Inno Setup Examples Output

; ���������� ����� � �������� ������������/��������������
; ("SetupStyleFile=" ���������� ���� � ���� ����� *.vsf)
SetupStyleFile="compiler:Examples\Glow.vsf"

[Languages]
Name: ru; MessagesFile: "compiler:Languages\Russian.isl"

[Code]

{--- SQLDMO ---}

const
  SQLServerName = 'localhost';
  SQLDMOGrowth_MB = 0;

procedure SQLDMOButtonOnClick(Sender: TObject);
var
  SQLServer, Database, DBFile, LogFile: Variant;
  IDColumn, NameColumn, Table: Variant;
begin
  if MsgBox('��������� ��������� �������� ����������� � ������� Microsoft SQL ''' + SQLServerName + ''' � ������� ���� ������. �� ������ ����������?', mbInformation, mb_YesNo) = idNo then
    Exit;

  { �������� �������� ������� SQLDMO COM Automation }

  try
    SQLServer := CreateOleObject('SQLDMO.SQLServer');
  except
    RaiseException('������� ���������� ������ Microsoft SQL.'#13#13'(��������� ������ ''' + GetExceptionMessage + ''')');
  end;

  { ����������� � ������� Microsoft SQL }

  SQLServer.LoginSecure := True;
  SQLServer.Connect(SQLServerName);
  
  MsgBox('��������� ����������� � ������� Microsoft SQL ''' + SQLServerName + '''.', mbInformation, mb_Ok);

  { ��������� ���� ������ }

  Database := CreateOleObject('SQLDMO.Database');
  Database.Name := 'Inno Setup';
  
  DBFile := CreateOleObject('SQLDMO.DBFile');
  DBFile.Name := 'ISData1';
  DBFile.PhysicalName := 'c:\program files\microsoft sql server\mssql\data\IS.mdf';
  DBFile.PrimaryFile := True;
  DBFile.FileGrowthType := SQLDMOGrowth_MB;
  DBFile.FileGrowth := 1;

  Database.FileGroups.Item('PRIMARY').DBFiles.Add(DBFile);

  LogFile := CreateOleObject('SQLDMO.LogFile');
  LogFile.Name := 'ISLog1';
  LogFile.PhysicalName := 'c:\program files\microsoft sql server\mssql\data\IS.ldf';

  Database.TransactionLog.LogFiles.Add(LogFile);
  
  { ���������� � ���� ������ }

  SQLServer.Databases.Add(Database);

  MsgBox('Added database ''' + Database.Name + '''.', mbInformation, mb_Ok);

  { ��������� ��������� ����� }

  IDColumn := CreateOleObject('SQLDMO.Column');
  IDColumn.Name := 'id';
  IDColumn.Datatype := 'int';
  IDColumn.Identity := True;
  IDColumn.IdentityIncrement := 1;
  IDColumn.IdentitySeed := 1;
  IDColumn.AllowNulls := False;

  NameColumn := CreateOleObject('SQLDMO.Column');
  NameColumn.Name := 'name';
  NameColumn.Datatype := 'varchar';
  NameColumn.Length := '64';
  NameColumn.AllowNulls := False;
  
  { ��������� ������� }

  Table := CreateOleObject('SQLDMO.Table');
  Table.Name := 'authors';
  Table.FileGroup := 'PRIMARY';
  
  { ���������� ������� � ������� }
  
  Table.Columns.Add(IDColumn);
  Table.Columns.Add(NameColumn);

  Database.Tables.Add(Table);

  MsgBox('��������� ������� ''' + Table.Name + '''.', mbInformation, mb_Ok);
end;

{--- IIS ---}

const
  IISServerName = 'localhost';
  IISServerNumber = '1';
  IISURL = 'http://127.0.0.1';

procedure IISButtonOnClick(Sender: TObject);
var
  IIS, WebSite, WebServer, WebRoot, VDir: Variant;
  ErrorCode: Integer;
begin
  if MsgBox('��������� ��������� �������� ����������� � ������� Microsoft IIS ''' + IISServerName + ''' � ������� ����������� �������. �� ������ ����������?', mbInformation, mb_YesNo) = idNo then
    Exit;

  { �������� �������� ������� IIS COM Automation }

  try
    IIS := CreateOleObject('IISNamespace');
  except
    RaiseException('������� ���������� Microsoft IIS.'#13#13'(��������� ������ ''' + GetExceptionMessage + ''')');
  end;

  { ����������� � ������� IIS }

  WebSite := IIS.GetObject('IIsWebService', IISServerName + '/w3svc');
  WebServer := WebSite.GetObject('IIsWebServer', IISServerNumber);
  WebRoot := WebServer.GetObject('IIsWebVirtualDir', 'Root');

  { (����)�������� ������������ �������� }

  try
    WebRoot.Delete('IIsWebVirtualDir', 'innosetup');
    WebRoot.SetInfo();
  except
  end;

  VDir := WebRoot.Create('IIsWebVirtualDir', 'innosetup');
  VDir.AccessRead := True;
  VDir.AppFriendlyName := 'Inno Setup';
  VDir.Path := 'C:\inetpub\innosetup';
  VDir.AppCreate(True);
  VDir.SetInfo();

  MsgBox('������ ����������� ������� ''' + VDir.Path + '''.', mbInformation, mb_Ok);

  { ������ HTML-���� � ��� ����������� }

  if MsgBox('��������� ��������� ������� HTML-��� � ������� ����������� �������. �� ������ ����������?', mbInformation, mb_YesNo) = idNo then
    Exit;

  ForceDirectories(VDir.Path);
  SaveStringToFile(VDir.Path + '/index.htm', '<html><body>Inno Setup rocks!</body></html>', False);
  if not ShellExecAsOriginalUser('open', IISURL + '/innosetup/index.htm', '', '', SW_SHOWNORMAL, ewNoWait, ErrorCode) then
    MsgBox('�� ������� ���������� ��������� ����������� �������: ''' + SysErrorMessage(ErrorCode) + '''.', mbError, mb_Ok);
end;

{--- MSXML ---}

const
  XMLURL = 'http://jrsoftware.github.io/issrc/ISHelp/isxfunc.xml';
  XMLFileName = 'isxfunc.xml';
  XMLFileName2 = 'isxfuncmodified.xml';

procedure MSXMLButtonOnClick(Sender: TObject);
var
  XMLHTTP, XMLDoc, NewNode, RootNode: Variant;
  Path: String;
begin
  if MsgBox('��������� ��������� ����� ������������ MSXML ��� �������� XML ����� ''' + XMLURL + ''' � ������ ��� �� ����.'#13#13'����������� ���� XML ����� ������� � ��������. �� ������ ����������?', mbInformation, mb_YesNo) = idNo then
    Exit;
    
  { �������� �������� ������� MSXML COM Automation }

  try
    XMLHTTP := CreateOleObject('MSXML2.ServerXMLHTTP');
  except
    RaiseException('������� ���������� MSXML.'#13#13'(��������� ������ ''' + GetExceptionMessage + ''')');
  end;
  
  { �������� ����� XML }

  XMLHTTP.Open('GET', XMLURL, False);
  XMLHTTP.Send();

  Path := ExpandConstant('{src}\');
  XMLHTTP.responseXML.Save(Path + XMLFileName);

  MsgBox('����������� ���� XML ������� ��� ''' + XMLFileName + '''.', mbInformation, mb_Ok);

  { �������� XML ����� }

  XMLDoc := CreateOleObject('MSXML2.DOMDocument');
  XMLDoc.async := False;
  XMLDoc.resolveExternals := False;
  XMLDoc.load(Path + XMLFileName);
  if XMLDoc.parseError.errorCode <> 0 then
    RaiseException('������ � ������ ' + IntToStr(XMLDoc.parseError.line) + ', ������� ' + IntToStr(XMLDoc.parseError.linepos) + ': ' + XMLDoc.parseError.reason);
  
  MsgBox('�������� XML ����.', mbInformation, mb_Ok);

  { ����������� ��������� XML }
  
  NewNode := XMLDoc.createElement('isxdemo');
  RootNode := XMLDoc.documentElement;
  RootNode.appendChild(NewNode);
  RootNode.lastChild.text := 'Hello, World';

  { ������ ��������� XML }

  XMLDoc.Save(Path + XMLFileName2);

  MsgBox('��������� XML �������� ��� ''' + XMLFileName2 + '''.', mbInformation, mb_Ok);
end;


{--- Word ---}

procedure WordButtonOnClick(Sender: TObject);
var
  Word: Variant;
begin
  if MsgBox('��������� ��������� �������� ���������� ������� Microsoft Word. �� ������ ����������?', mbInformation, mb_YesNo) = idNo then
    Exit;

  { ������� ��������� ��������� ������� Word COM Automation }
  
  try
    Word := GetActiveOleObject('Word.Application');
  except
  end;
  
  if VarIsEmpty(Word) then
    MsgBox('Microsoft Word �� �������.', mbInformation, mb_Ok)
  else
    MsgBox('Microsoft Word �������.', mbInformation, mb_Ok)
end;

{--- Windows Firewall ---}

const
   NET_FW_IP_VERSION_ANY = 2;
   NET_FW_SCOPE_ALL = 0;

procedure FirewallButtonOnClick(Sender: TObject);
var
  Firewall, Application: Variant;
begin
  if MsgBox('��������� ��������� ������� ���� � Windows Firewall � �������� ��������������� ���������� ��� �������� ������� (' + GetUserNameString + '). �� ������ ����������?', mbInformation, mb_YesNo) = idNo then
    Exit;

  { �������� �������� ������� Windows Firewall COM Automation }

  try
    Firewall := CreateOleObject('HNetCfg.FwMgr');
  except
    RaiseException('������� ���������� Windows Firewall.'#13#13'(��������� ������ ''' + GetExceptionMessage + ''')');
  end;

  { ���������� ����������� }

  Application := CreateOleObject('HNetCfg.FwAuthorizedApplication');
  Application.Name := 'Setup';
  Application.IPVersion := NET_FW_IP_VERSION_ANY;
  Application.ProcessImageFileName := ExpandConstant('{srcexe}');
  Application.Scope := NET_FW_SCOPE_ALL;
  Application.Enabled := True;

  Firewall.LocalPolicy.CurrentProfile.AuthorizedApplications.Add(Application);

  MsgBox('��������� ��������� ������ �������� �������������� ����������� ��� �������� �������.', mbInformation, mb_Ok);
end;

{---}

procedure CreateButton(ALeft, ATop: Integer; ACaption: String; ANotifyEvent: TNotifyEvent);
begin
  with TButton.Create(WizardForm) do begin
    Left := ALeft;
    Top := ATop;
    Width := WizardForm.CancelButton.Width;
    Height := WizardForm.CancelButton.Height;
    Caption := ACaption;
    OnClick := ANotifyEvent;
    Parent := WizardForm.WelcomePage;
  end;
end;

procedure InitializeWizard();
var
  Left, LeftInc, Top, TopInc: Integer;
begin
  Left := WizardForm.WelcomeLabel2.Left;
  LeftInc := WizardForm.CancelButton.Width + ScaleX(8);
  TopInc := WizardForm.CancelButton.Height + ScaleY(8);
  Top := WizardForm.WelcomeLabel2.Top + WizardForm.WelcomeLabel2.Height - 4*TopInc;

  CreateButton(Left, Top, '&SQLDMO...', @SQLDMOButtonOnClick);
  Top := Top + TopInc;
  CreateButton(Left + LeftInc, Top, '&Firewall...', @FirewallButtonOnClick);
  Top := Top + TopInc;
  CreateButton(Left, Top, '&IIS...', @IISButtonOnClick);
  Top := Top + TopInc;
  CreateButton(Left, Top, '&MSXML...', @MSXMLButtonOnClick);
  Top := Top + TopInc;
  CreateButton(Left, Top, '&Word...', @WordButtonOnClick);
end;