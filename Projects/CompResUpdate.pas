unit CompResUpdate;

{
  Inno Setup
  Copyright (C) 1997-2020 Jordan Russell
  Portions by Martijn Laan
  For conditions of distribution and use, see LICENSE.TXT.

  Resource update functions used by the compiler only
}

interface

uses
  Windows{$IFNDEF PS_MINIVCL}, Types{$ENDIF}, SysUtils, FileClass, VerInfo, Classes, Vcl.Themes, Vcl.Styles;

{$I VERSION.INC}

procedure UpdateIcons(const FileName, IcoFileName: String);
{$IFNDEF PS_MINIVCL}
  procedure UpdateIconsRaw(const FileName, IcoFileName, IcoResName: String);
{$ENDIF}
procedure UpdateResRaw(const FileName, ResRawFileName, ResRawName: String; ResTypeID: Integer);
procedure UpdateVersionInfo(const F: TFile;
  const NewBinaryFileVersion, NewBinaryProductVersion: TFileVersionNumbers;
  const {$IFNDEF PS_MINIVCL}NewComments, {$ENDIF}NewCompanyName, NewFileDescription, NewTextFileVersion, NewLegalCopyright,
  NewProductName, NewTextProductVersion, NewOriginalFileName: String;
  const SetFileVersionAndDescription: Boolean);

implementation

uses
  ResUpdate{$IFDEF UNICODE}, Math{$ENDIF};

{ BEGIN Insert code Author: SMO, DelphiPraxis.net, 2015 ---------------------- }
{$IFNDEF PS_MINIVCL}
const
  ICON_HEADER_RESERVED = 0;
  ICON_HEADER_TYPE_ICO = 1;
  ICON_HEADER_TYPE_CUR = 2;

type
  PGroupIconRsrcEntry = ^TGroupIconRsrcEntry;
  TGroupIconRsrcEntry = packed record
    bWidth, bHeight: Byte; // 0 means 256, which is the maximum
    bColorCount: Byte; // number of colors in image (0 if wBitCount > 8)
    bReserved: Byte; // 0
    wPlanes: Word; // 1
    wBitCount: Word; // number of bits per pixel
    dwSize: DWORD; // size of the icon data, in bytes
    wID: Word; // resource ID of the icon (for RT_ICON entry)
  end;

  PGroupIconRsrcHeader = ^TGroupIconRsrcHeader;
  TGroupIconRsrcHeader = packed record
    wReserved: Word; // 0
    wType: Word; // 1 for icons
    wCount: Word; // number of icons in this group, each has a following TGroupIconRsrcEntry
    // Entries: array [0..idType - 1] of TGroupIconRsrcEntry;
  end;


  TSmoGroupIcon = record
    Header: TGroupIconRsrcHeader;
    Entries: array of TGroupIconRsrcEntry;
    IconData: array of array of Byte;
  end;

function GetGroupIconFromIcoFile(const FileName: string; out GroupIcon: TSmoGroupIcon): Boolean;
var
  hFile: THandle;
  i, Size: Integer;
  Offsets: array of DWORD;
begin
  // clear the output record
  Finalize(GroupIcon);
  FillChar(GroupIcon.Header, SizeOf(GroupIcon.Header), 0);

  hFile := FileOpen(FileName, fmOpenRead or fmShareDenyNone);
  Result := hFile <> INVALID_HANDLE_VALUE;
  if Result then
  try
    // read header
    Size := SizeOf(GroupIcon.Header);
    Result := FileRead(hFile, GroupIcon.Header, Size) = Size;
    if not Result then Exit;
    with GroupIcon.Header do
      if (wReserved <> ICON_HEADER_RESERVED) or (wType <> ICON_HEADER_TYPE_ICO) then
      begin
        SetLastError(ERROR_BAD_FORMAT);
        Exit(False); // invalid data in header
      end;
    // read entries...
    // ico file entries are almost identical to TGroupIconRsrcEntry, with one small difference
    SetLength(GroupIcon.Entries, GroupIcon.Header.wCount);
    SetLength(Offsets, GroupIcon.Header.wCount);
    Size := SizeOf(GroupIcon.Entries[0]) - 2;
    for i := 0 to High(GroupIcon.Entries) do
    begin
      // read a TGroupIconRsrcEntry but without the last "wID" field
      Result := Result and (FileRead(hFile, GroupIcon.Entries[i], Size) = Size);
      // ico files have a dwFileOffset field there instead, read it separately
      Result := Result and (FileRead(hFile, Offsets[i], 4) = 4);
      GroupIcon.Entries[i].wID := i + 1;
    end;
    if not Result then Exit;
    // read icon image data
    SetLength(GroupIcon.IconData, GroupIcon.Header.wCount);
    for i := 0 to High(GroupIcon.IconData) do
    begin
      Size := GroupIcon.Entries[i].dwSize;
      SetLength(GroupIcon.IconData[i], Size);
      FileSeek(hFile, Offsets[i], FILE_BEGIN);
      Result := FileRead(hFile, GroupIcon.IconData[i, 0], Size) = Size;
      if not Result then Exit;
    end;
  finally
    FileClose(hFile);
    if not Result then
    begin
      // clear the output record
      Finalize(GroupIcon);
      FillChar(GroupIcon.Header, SizeOf(GroupIcon.Header), 0);
    end;
  end;
end;


// GetRsrcPointer: get pointer to the specified resource
// Returns nil on error
function GetRsrcPointer(hModule: HMODULE; lpName, lpType: PChar): Pointer;
var
  hResInfo: HRSRC;
  hResData: HGLOBAL;
begin
  Result := nil;
  hResInfo := FindResource(hModule, lpName, lpType);
  if hResInfo <> 0 then
  begin
    hResData := LoadResource(hModule, hResInfo);
    if hResData <> 0 then
      Result := LockResource(hResData);
    // UnlockResource & FreeResource are not necessary in 32 & 64 bit Windows
  end;
end;


// GetGroupIcon: get the complete data from the specified RT_GROUP_ICON resource.
// Returns true on success and false on error.
function GetGroupIcon(const FileName: string; GroupName: PChar; out GroupIcon: TSmoGroupIcon): Boolean;
var
  hLib: HMODULE;
  PData: Pointer;
  PEntry: PGroupIconRsrcEntry;
  LastError: DWORD;
  i: Integer;
begin
  // clear the output record
  Finalize(GroupIcon);
  FillChar(GroupIcon.Header, SizeOf(GroupIcon.Header), 0);

  hLib := LoadLibraryEx(PChar(FileName), 0, LOAD_LIBRARY_AS_DATAFILE);
  Result := hLib <> 0;
  if Result then
  try
    PData := GetRsrcPointer(hLib, PChar(GroupName), RT_GROUP_ICON);

    if not Assigned(PData) then Exit(False); // resource not found
    with PGroupIconRsrcHeader(PData)^ do
      if (wReserved <> ICON_HEADER_RESERVED) or (wType <> ICON_HEADER_TYPE_ICO) then
      begin
        SetLastError(ERROR_BAD_FORMAT);
        Exit(False); // invalid data in header
      end;
    // copy header
    GroupIcon.Header := PGroupIconRsrcHeader(PData)^;
    i := GroupIcon.Header.wCount;
    SetLength(GroupIcon.Entries, i);
    SetLength(GroupIcon.IconData, i);
    // copy entries & icon data
    PEntry := PGroupIconRsrcEntry(UIntPtr(PData) + SizeOf(TGroupIconRsrcHeader));
    for i := 0 to i - 1 do
    begin
      GroupIcon.Entries[i] := PEntry^;
      // load icon data (bitmap or PNG)
      PData := GetRsrcPointer(hLib, MakeIntResource(PEntry^.wID), RT_ICON);
      if Assigned(PData) then
      begin
        SetLength(GroupIcon.IconData[i], PEntry^.dwSize);
        Move(PData^, GroupIcon.IconData[i, 0], PEntry^.dwSize);
      end
      else // icon data wasn't found... wrong ID? Should not happen...
        GroupIcon.Entries[i].dwSize := 0;
      Inc(PEntry);
    end;
  finally
    LastError := GetLastError;
    FreeLibrary(hLib);
    if LastError <> ERROR_SUCCESS then SetLastError(LastError);
  end;
end;


function EnumResLangProc(hModule: HMODULE; lpszType, lpszName: PChar; wIDLanguage: Word;
  var LangArray: TWordDynArray): BOOL; stdcall;
var
  i: Integer;
begin
  i := Length(LangArray);
  SetLength(LangArray, i + 1);
  LangArray[i] := wIDLanguage;
  Result := True;
end;

function GetResourceLangIDs(hModule: HMODULE; lpType, lpName: PChar): TWordDynArray;
begin
  Result := nil;
  if not EnumResourceLanguages(hModule, lpType, lpName, @EnumResLangProc, IntPtr(@Result)) then
    Result := nil;
end;


// DeleteIconGroup: deletes the specified RT_GROUP_ICON resource and the referenecd RT_ICON
// resources. Deletes ALL language versions, if several exist.
// Returns true if the resource does not exist or was deleted successfully.
// Returns false if an error occured.
function DeleteGroupIcon(const FileName: string; GroupName: PChar): Boolean;
var
  GroupIcon: TSmoGroupIcon;
  hUpdate: THandle;
  hLib: HMODULE;
  LastError: DWORD;
  i, n: Integer;
  LangArray: TWordDynArray;
begin
  Result := GetGroupIcon(FileName, GroupName, GroupIcon);
  if not Result then
  begin
    case GetLastError of
      ERROR_RESOURCE_DATA_NOT_FOUND,
      ERROR_RESOURCE_TYPE_NOT_FOUND,
      ERROR_RESOURCE_NAME_NOT_FOUND,
      ERROR_RESOURCE_LANG_NOT_FOUND: Result := True;
    end;
    Exit;
  end;
  Assert(GroupIcon.Header.wCount = Length(GroupIcon.Entries));

  hLib := 0;
  hUpdate := 0;
  try
    hUpdate := BeginUpdateResource(PChar(FileName), False);
    if hUpdate <> 0 then
      hLib := LoadLibraryEx(PChar(FileName), 0, LOAD_LIBRARY_AS_DATAFILE);
    Result := (hUpdate <> 0) and (hLib <> 0);
    if not Result then Exit;

    // delete the RT_GROUP_ICON, all languages
    LangArray := GetResourceLangIDs(hLib, RT_GROUP_ICON, PChar(GroupName));
    for n := 0 to High(LangArray) do
      Result := Result and UpdateResource(hUpdate, RT_GROUP_ICON, PChar(GroupName),
        LangArray[n], nil, 0);
    // delete the actual icon data (RT_ICON), all languages
    // TODO: check if we're actually allowed to do that... other RT_GROUP_ICON could still
    // be referencing some of these RT_ICON we're about to delete!
    for i := 0 to High(GroupIcon.Entries) do
    begin
      if not Result then Break;
      LangArray := GetResourceLangIDs(hLib, RT_ICON, MakeIntResource(GroupIcon.Entries[i].wID));
      for n := 0 to High(LangArray) do
        Result := Result and UpdateResource(hUpdate, RT_ICON,
          MakeIntResource(GroupIcon.Entries[i].wID), LangArray[n], nil, 0);
    end;
  finally
    LastError := GetLastError;
    if hLib <> 0 then FreeLibrary(hLib);
    if hUpdate <> 0 then EndUpdateResource(hUpdate, not Result);
    if LastError <> ERROR_SUCCESS then SetLastError(LastError);
  end;
end;

// FindUnusedIconID: returns the first unused RT_ICON resource ID in the specified module.
// A return value of 0 means that no unused ID could be found.
function FindUnusedIconID(const hModule: HMODULE; const StartID: Word = 0): Word;
var
  hResInfo: HRSRC;
begin
  Result := StartID;
  if Result = 0 then Inc(Result);
  while Result > 0 do
  begin
    hResInfo := FindResource(hModule, MakeIntResource(Result), RT_ICON);
    if hResInfo = 0 then Break;
    Inc(Result);
  end;
end;


// SetGroupIcon: set the complete data of the specified RT_GROUP_ICON resource, and add the
// referenced RT_ICON resources. If a RT_GROUP_ICON of the same name exists, it'll be deleted
// first, including all RT_ICON resources it references.
// Returns true on success and false on error.
function SetGroupIcon(const FileName: string; GroupName: PChar; var GroupIcon: TSmoGroupIcon): Boolean;
var
  hLib: HMODULE;
  hUpdate: THandle;
  PData: Pointer;
  LastError: DWORD;
  i, SizeOfEntries: Integer;
  wLanguage, IconID: Word;
begin
  Assert(GroupIcon.Header.wCount = Length(GroupIcon.Entries));
  Assert(Length(GroupIcon.Entries) = Length(GroupIcon.IconData));
  // if the group already exists, then delete it first
  Result := DeleteGroupIcon(FileName, GroupName);
  hLib := 0;
  hUpdate := 0;
  PData := nil;
  if Result then
  try
    hUpdate := BeginUpdateResource(PChar(FileName), False);
    if hUpdate <> 0 then
      hLib := LoadLibraryEx(PChar(FileName), 0, LOAD_LIBRARY_AS_DATAFILE);
    Result := (hUpdate <> 0) and (hLib <> 0);
    if not Result then Exit;

    wLanguage := MAKELANGID(LANG_NEUTRAL, SUBLANG_NEUTRAL);
    IconID := 0;
    // add the RT_ICON data
    for i := 0 to High(GroupIcon.Entries) do
    begin
      // find the next unused ID
      IconID := FindUnusedIconID(hLib, IconID + 1);
      Result := Result and (IconID > 0) and
        UpdateResource(hUpdate, RT_ICON, MakeIntResource(IconID), wLanguage,
        @GroupIcon.IconData[i, 0], Length(GroupIcon.IconData[i]));
      // update the entry's ID with the new value
      GroupIcon.Entries[i].wID := IconID;
    end;
    // add the RT_GROUP_ICON data
    if Result then
    begin
      // copy data from the GroupIcon structure to a contiguous block of memory
      i := SizeOf(GroupIcon.Header);
      SizeOfEntries := GroupIcon.Header.wCount * SizeOf(GroupIcon.Entries[0]);
      GetMem(PData, i + SizeOfEntries);
      PGroupIconRsrcHeader(PData)^ := GroupIcon.Header;
      Move(GroupIcon.Entries[0], Pointer(IntPtr(PData) + i)^, SizeOfEntries);
      Result := UpdateResource(hUpdate, RT_GROUP_ICON, PChar(GroupName), wLanguage,
        PData, i + SizeOfEntries);
    end;
  finally
    LastError := GetLastError;
    if Assigned(PData) then FreeMem(PData);
    if hLib <> 0 then FreeLibrary(hLib);
    if hUpdate <> 0 then EndUpdateResource(hUpdate, not Result);
    if LastError <> ERROR_SUCCESS then SetLastError(LastError);
  end;
end;
{$ENDIF}
{ ----------------------- END Insert code Author: SMO, DelphiPraxis.net, 2015 }

procedure Error(const Msg: String);
begin
  raise Exception.Create('Resource update error: ' + Msg);
end;

procedure ErrorWithLastError(const Msg: String);
begin
  Error(Msg + ' (' + IntToStr(GetLastError) + ')');
end;

procedure UpdateVersionInfo(const F: TFile;
  const NewBinaryFileVersion, NewBinaryProductVersion: TFileVersionNumbers;
  const {$IFNDEF PS_MINIVCL}NewComments, {$ENDIF}NewCompanyName, NewFileDescription, NewTextFileVersion, NewLegalCopyright,
  NewProductName, NewTextProductVersion, NewOriginalFileName: String;
  const SetFileVersionAndDescription: Boolean);

  function WideStrsEqual(P1, P2: PWideChar): Boolean;

    function WideUpCase(C: WideChar): WideChar;
    begin
      Result := C;
      if (Result >= 'a') and (Result <= 'z') then
        Dec(Result, Ord('a') - Ord('A'));
    end;

  begin
    while True do begin
      if WideUpCase(P1^) <> WideUpCase(P2^) then begin
        Result := False;
        Exit;
      end;
      if P1^ = #0 then
        Break;
      Inc(P1);
      Inc(P2);
    end;
    Result := True;
  end;

  procedure BumpToDWordBoundary(var P: Pointer);
  begin
    if Cardinal(P) and 3 <> 0 then
      Cardinal(P) := (Cardinal(P) or 3) + 1;
  end;

  function QueryValue(P: Pointer; Path: PWideChar; var Buf: Pointer;
    var BufLen: Cardinal): Boolean;
  var
    EndP: Pointer;
    ValueLength: Cardinal;
  begin
    Result := False;
    Cardinal(EndP) := Cardinal(P) + PWord(P)^;
    Inc(PWord(P));
    ValueLength := PWord(P)^;
    Inc(PWord(P));
    Inc(PWord(P));
    if WideStrsEqual(PWideChar(P), Path) then begin
      Inc(PWideChar(P), lstrlenW(P) + 1);
      BumpToDWordBoundary(P);
      Inc(Path, lstrlenW(Path) + 1);
      if Path^ = #0 then begin
        { Found the requested value }
        Buf := P;
        BufLen := ValueLength;
        Result := True;
      end
      else begin
        { Handle children.
          Note: Like VerQueryValue, we always treat ValueLength as a byte count
          when looking for child nodes. Many resource compilers, including
          Borland's, wrongly set ValueLength to a *character* count on string
          nodes. But since we never try to query for a child of a string node,
          that doesn't matter here. }
        Inc(Cardinal(P), ValueLength);
        BumpToDWordBoundary(P);
        while Cardinal(P) < Cardinal(EndP) do begin
          Result := QueryValue(P, Path, Buf, BufLen);
          if Result then
            Exit;
          Inc(Cardinal(P), PWord(P)^);
          BumpToDWordBoundary(P);
        end;
      end;
    end;
  end;

  procedure ReplaceWithRealCopyrightSymbols(const Value: PWideChar);
  var
    Len, I, J: Integer;
  begin
    Len := lstrlenW(Value);
    for I := 0 to Len-3 do begin
      if (Value[I] = '(') and (Value[I+1] = 'C') and (Value[I+2] = ')') then begin
        Value[I] := WideChar($00A9);
        { Shift back two characters }
        for J := I+1 to Len-3 do
          Value[J] := Value[J+2];
        Value[Len-2] := ' ';
        Value[Len-1] := ' ';
      end;
    end;
  end;

  procedure UpdateStringValue(P: Pointer; const Path: PWideChar; NewValue: String);
  var
    Value: PWideChar;
    ValueLen: Cardinal;
  begin
    if not QueryValue(P, Path, Pointer(Value), ValueLen) then
      Error('Unexpected version resource format (1)');
{$IFDEF UNICODE}
    Move(Pointer(NewValue)^, Value^, (Min(Length(NewValue), lstrlenW(Value)))*SizeOf(Char));
{$ELSE}
    MultiByteToWideChar(CP_ACP, 0, PChar(NewValue), Length(NewValue), Value, lstrlenW(Value));
{$ENDIF}
    ReplaceWithRealCopyrightSymbols(Value);
  end;

  procedure UpdateFixedFileInfo(P: Pointer; const Path: PWideChar;
    const NewFileVersion, NewProductVersion: TFileVersionNumbers;
    const SetFileVersion: Boolean);
  var
    FixedFileInfo: PVSFixedFileInfo;
    ValueLen: Cardinal;
  begin
    if not QueryValue(P, Path, Pointer(FixedFileInfo), ValueLen) then
      Error('Unexpected version resource format (2)');
    if FixedFileInfo.dwSignature <> $FEEF04BD then
      Error('Unexpected version resource format (3)');
    if SetFileVersion then begin
    FixedFileInfo.dwFileVersionLS := NewFileVersion.LS;
    FixedFileInfo.dwFileVersionMS := NewFileVersion.MS;
    end;
    FixedFileInfo.dwProductVersionLS := NewProductVersion.LS;
    FixedFileInfo.dwProductVersionMS := NewProductVersion.MS;
  end;

var
  ResOffset, ResSize: Cardinal;
  VersRes: Pointer;
begin
  { Locate the resource }
  ResSize := SeekToResourceData(F, Cardinal(RT_VERSION), 1);
  ResOffset := F.Position.Lo;

  GetMem(VersRes, ResSize);
  try
    { Read the resource }
    F.ReadBuffer(VersRes^, ResSize);

    { Update the resource }
    {$IFNDEF PS_MINIVCL}
      UpdateStringValue(VersRes, 'VS_VERSION_INFO'#0'StringFileInfo'#0'000004b0'#0'Comments'#0, '                                            ');
      UpdateStringValue(VersRes, 'VS_VERSION_INFO'#0'StringFileInfo'#0'000004b0'#0'Comments'#0, NewComments);
    {$ENDIF}
    UpdateStringValue(VersRes, 'VS_VERSION_INFO'#0'StringFileInfo'#0'000004b0'#0'CompanyName'#0, NewCompanyName);
    if SetFileVersionAndDescription then begin
    UpdateStringValue(VersRes, 'VS_VERSION_INFO'#0'StringFileInfo'#0'000004b0'#0'FileDescription'#0, NewFileDescription);
    UpdateStringValue(VersRes, 'VS_VERSION_INFO'#0'StringFileInfo'#0'000004b0'#0'FileVersion'#0, NewTextFileVersion);
    end;
    UpdateStringValue(VersRes, 'VS_VERSION_INFO'#0'StringFileInfo'#0'000004b0'#0'LegalCopyright'#0, NewLegalCopyright);
    UpdateStringValue(VersRes, 'VS_VERSION_INFO'#0'StringFileInfo'#0'000004b0'#0'ProductName'#0, NewProductName);
    UpdateStringValue(VersRes, 'VS_VERSION_INFO'#0'StringFileInfo'#0'000004b0'#0'OriginalFileName'#0, NewOriginalFileName);
    UpdateStringValue(VersRes, 'VS_VERSION_INFO'#0'StringFileInfo'#0'000004b0'#0'ProductVersion'#0, NewTextProductVersion);
    UpdateFixedFileInfo(VersRes, 'VS_VERSION_INFO'#0, NewBinaryFileVersion, NewBinaryProductVersion, SetFileVersionAndDescription);

    { Write the updated resource }
    F.Seek(ResOffset);
    F.WriteBuffer(VersRes^, ResSize);
  finally
    FreeMem(VersRes);
  end;
end;

function EnumLangsFunc(hModule: Cardinal; lpType, lpName: PAnsiChar; wLanguage: Word; lParam: Integer): BOOL; stdcall;
begin
  PWord(lParam)^ := wLanguage;
  Result := False;
end;

function GetResourceLanguage(hModule: Cardinal; lpType, lpName: PChar; var wLanguage: Word): Boolean;
begin
  wLanguage := 0;
  EnumResourceLanguages(hModule, lpType, lpName, @EnumLangsFunc, Integer(@wLanguage));
  Result := True;
end;

procedure UpdateIcons(const FileName, IcoFileName: String);
type
  PIcoItemHeader = ^TIcoItemHeader;
  TIcoItemHeader = packed record
    Width: Byte;
    Height: Byte;
    Colors: Byte;
    Reserved: Byte;
    Planes: Word;
    BitCount: Word;
    ImageSize: DWORD;
  end;
  PIcoItem = ^TIcoItem;
  TIcoItem = packed record
    Header: TIcoItemHeader;
    Offset: DWORD;
  end;
  PIcoHeader = ^TIcoHeader;
  TIcoHeader = packed record
    Reserved: Word;
    Typ: Word;
    ItemCount: Word;
    Items: array [0..MaxInt shr 4 - 1] of TIcoItem;
  end;
  PGroupIconDirItem = ^TGroupIconDirItem;
  TGroupIconDirItem = packed record
    Header: TIcoItemHeader;
    Id: Word;
  end;
  PGroupIconDir = ^TGroupIconDir;
  TGroupIconDir = packed record
    Reserved: Word;
    Typ: Word;
    ItemCount: Word;
    Items: array [0..MaxInt shr 4 - 1] of TGroupIconDirItem;
  end;

  function IsValidIcon(P: Pointer; Size: Cardinal): Boolean;
  var
    ItemCount: Cardinal;
  begin
    Result := False;
    if Size < Cardinal(SizeOf(Word) * 3) then
      Exit;
    if (PChar(P)[0] = 'M') and (PChar(P)[1] = 'Z') then
      Exit;
    ItemCount := PIcoHeader(P).ItemCount;
    if Size < Cardinal((SizeOf(Word) * 3) + (ItemCount * SizeOf(TIcoItem))) then
      Exit;
    P := @PIcoHeader(P).Items;
    while ItemCount > Cardinal(0) do begin
      if (Cardinal(PIcoItem(P).Offset + PIcoItem(P).Header.ImageSize) < Cardinal(PIcoItem(P).Offset)) or
         (Cardinal(PIcoItem(P).Offset + PIcoItem(P).Header.ImageSize) > Cardinal(Size)) then
        Exit;
      Inc(PIcoItem(P));
      Dec(ItemCount);
    end;
    Result := True;
  end;

var
  H: THandle;
  M: HMODULE;
  R: HRSRC;
  Res: HGLOBAL;
  GroupIconDir, NewGroupIconDir: PGroupIconDir;
  I: Integer;
  wLanguage: Word;
  F: TFile;
  Ico: PIcoHeader;
  N: Cardinal;
  NewGroupIconDirSize: LongInt;
begin
  if Win32Platform <> VER_PLATFORM_WIN32_NT then
    Error('Only supported on Windows NT and above');

  Ico := nil;

  try
    { Load the icons }
    F := TFile.Create(IcoFileName, fdOpenExisting, faRead, fsRead);
    try
      N := F.CappedSize;
      if Cardinal(N) > Cardinal($100000) then  { sanity check }
        Error('Icon file is too large');
      GetMem(Ico, N);
      F.ReadBuffer(Ico^, N);
    finally
      F.Free;
    end;

    { Ensure the icon is valid }
    if not IsValidIcon(Ico, N) then
      Error('Icon file is invalid');

    { Update the resources }
    H := BeginUpdateResource(PChar(FileName), False);
    if H = 0 then
      ErrorWithLastError('BeginUpdateResource failed (1)');
    try
      M := LoadLibraryEx(PChar(FileName), 0, LOAD_LIBRARY_AS_DATAFILE);
      if M = 0 then
        ErrorWithLastError('LoadLibraryEx failed (1)');
      try
      	{ Load the 'MAINICON' group icon resource }
        R := FindResource(M, 'MAINICON', RT_GROUP_ICON);
        if R = 0 then
          ErrorWithLastError('FindResource failed (1)');
        Res := LoadResource(M, R);
        if Res = 0 then
          ErrorWithLastError('LoadResource failed (1)');
        GroupIconDir := LockResource(Res);
        if GroupIconDir = nil then
          ErrorWithLastError('LockResource failed (1)');

        { Delete 'MAINICON' }
        if not GetResourceLanguage(M, RT_GROUP_ICON, 'MAINICON', wLanguage) then
          Error('GetResourceLanguage failed (1)');
        if not UpdateResource(H, RT_GROUP_ICON, 'MAINICON', wLanguage, nil, 0) then
          ErrorWithLastError('UpdateResource failed (1)');

        { Delete the RT_ICON icon resources that belonged to 'MAINICON' }
        for I := 0 to GroupIconDir.ItemCount-1 do begin
          if not GetResourceLanguage(M, RT_ICON, MakeIntResource(GroupIconDir.Items[I].Id), wLanguage) then
            Error('GetResourceLanguage failed (2)');
          if not UpdateResource(H, RT_ICON, MakeIntResource(GroupIconDir.Items[I].Id), wLanguage, nil, 0) then
            ErrorWithLastError('UpdateResource failed (2)');
        end;

        { Build the new group icon resource }
        NewGroupIconDirSize := 3*SizeOf(Word)+Ico.ItemCount*SizeOf(TGroupIconDirItem);
        GetMem(NewGroupIconDir, NewGroupIconDirSize);
        try
          { Build the new group icon resource }
          NewGroupIconDir.Reserved := GroupIconDir.Reserved;
          NewGroupIconDir.Typ := GroupIconDir.Typ;
          NewGroupIconDir.ItemCount := Ico.ItemCount;
          for I := 0 to NewGroupIconDir.ItemCount-1 do begin
            NewGroupIconDir.Items[I].Header := Ico.Items[I].Header;
            NewGroupIconDir.Items[I].Id := I+1; //assumes that there aren't any icons left
          end;

          { Update 'MAINICON' }
          for I := 0 to NewGroupIconDir.ItemCount-1 do
            if not UpdateResource(H, RT_ICON, MakeIntResource(NewGroupIconDir.Items[I].Id), 1033, Pointer(DWORD(Ico) + Ico.Items[I].Offset), Ico.Items[I].Header.ImageSize) then
              ErrorWithLastError('UpdateResource failed (3)');

          { Update the icons }
          if not UpdateResource(H, RT_GROUP_ICON, 'MAINICON', 1033, NewGroupIconDir, NewGroupIconDirSize) then
            ErrorWithLastError('UpdateResource failed (4)');
        finally
          FreeMem(NewGroupIconDir);
        end;
      finally
        FreeLibrary(M);
      end;
    except
      EndUpdateResource(H, True);  { discard changes }
      raise;
    end;
    if not EndUpdateResource(H, False) then
      ErrorWithLastError('EndUpdateResource failed');
  finally
    FreeMem(Ico);
  end;
end;

{$IFNDEF PS_MINIVCL}
procedure UpdateIconsRaw(const FileName, IcoFileName, IcoResName: String);
var
  IconA: TSmoGroupIcon;
begin
  if not GetGroupIconFromIcoFile(IcoFileName, IconA) then
      ErrorWithLastError('GetGroupIconFromIcoFile failed');
  if not SetGroupIcon(FileName, PChar(IcoResName), IconA) then
      ErrorWithLastError('SetGroupIcon failed');
end;
{$ENDIF}

{ Add Resource files to setup.exe }
procedure UpdateResRaw(const FileName, ResRawFileName, ResRawName: String; ResTypeID: Integer);

  function AddResource(FileName, ResName: String; ResType: Integer; Buf: Pointer; Size: Integer): Integer;
  {* Write resource to the section VCLSTYLE in a file:
     FileName - Name of file,
     ResName  - Name of resource,
     ResType  - Type of resource
     Buf      - Pointer to data block,
     Size     - Size of data block }
  { Predefined Resource Types
    RT_CURSOR       = MakeIntResource(1);
    RT_BITMAP       = MakeIntResource(2);
    RT_ICON         = MakeIntResource(3);
    RT_MENU         = MakeIntResource(4);
    RT_DIALOG       = MakeIntResource(5);
    RT_STRING       = MakeIntResource(6);
    RT_FONTDIR      = MakeIntResource(7);
    RT_FONT         = MakeIntResource(8);
    RT_ACCELERATOR  = MakeIntResource(9);
    RT_RCDATA       = MakeIntResource(10);
    RT_MESSAGETABLE = MakeIntResource(11);
    RT_GROUP_CURSOR = MakeIntResource(DWORD(RT_CURSOR) + 11);
    RT_GROUP_ICON   = MakeIntResource(DWORD(RT_ICON) + 11);
    RT_VERSION      = MakeIntResource(16);
    RT_DLGINCLUDE   = MakeIntResource(17);
    RT_PLUGPLAY     = MakeIntResource(19);
    RT_VXD          = MakeIntResource(20);
    RT_ANICURSOR    = MakeIntResource(21);
    RT_ANIICON      = MakeIntResource(22);
    RT_HTML         = MakeIntResource(23);
    RT_MANIFEST     = MakeIntResource(24); }
  var
    H: THandle;
  begin
    H := BeginUpdateResource(PChar(FileName), false);
    if H = 0 then begin
      ErrorWithLastError('BeginUpdateResource failed (1)');
      Exit;
    end;
    { VCLSTYLE, RT_RCDATA(MAKEINTRESOURCE(10)) or   RT_RCDATA = PChar(10); }
    case ResType of
    50:  if not UpdateResource(H, 'VCLSTYLE', PChar(ResName), 1033, Buf, Size) then
           ErrorWithLastError('UpdateResource failed (1)');
    else
      if not UpdateResource(H, MakeIntResource(ResType), PChar(ResName), 1033, Buf, Size) then
        ErrorWithLastError('UpdateResource failed (1)');
    end;
    //else result := 0;

    if not EndUpdateResource(H, False) then
      ErrorWithLastError('EndUpdateResource failed');
  end;

  function AddFileToExe(ExeName, FileName, ResName: String; ResType: Integer): Boolean;
  {* Add any file to resource:
     ExeName  - Path to the file,
     FileName - Path to the resource file,
     ResName  - Name of resource for write
     ResType  - Type of resource }
  var
    F: TFileStream;
    Buf:  pointer;
    c1: dword;
  begin
    try
      F := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
      F.Position := 0;
      if ResType = 2 then begin // RT_BITMAP
        c1 := GetFileSize(F.Handle, nil) - sizeOf(TBitmapFileHeader);
        GetMem(Buf, c1);
        SetFilePointer(F.Handle, sizeOf(TBitmapFileHeader), nil, FILE_BEGIN);
        F.Read(Buf^, c1);
        result := AddResource(ExeName, ResName, ResType, Buf, c1) = 0;
      end else begin // RT_RCDATA, VCLSTYLE
        GetMem(Buf, F.Size);
        F.Read(Buf^, F.Size);
        result := AddResource(ExeName, ResName, ResType, Buf, F.Size) = 0;
      end;

      F.Free;
      FreeMem(Buf);
    except
      result := false;
    end;
  end;

var
  StyleInfo: TStyleInfo;

begin
  if ResTypeID = 50 then
    { Ensure the style file is valid }
    if not TStyleManager.IsValidStyle(ResRawFileName, StyleInfo) then
      Error('Style file is invalid');
  AddFileToExe(FileName, ResRawFileName, ResRawName, ResTypeID);
end;

end.
